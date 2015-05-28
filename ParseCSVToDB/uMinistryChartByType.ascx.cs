using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace ParseCSVToDB
{
    public partial class uMinistryChartByType : System.Web.UI.UserControl
    {
        private string[] arrResponses; // = { "A great deal", "Somewhat", "Not very much", "Not at all" };
        private int[] arrRespValues; // = { 21786, 14690, 2891, 1146 };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ddlMinistry.Items.Count == 0)
            {
                LoadddlMinistry();
                LoadddlOfficial();
                RebindData();
            }    
        }

        protected void OnSelectedIndexChanged_ddlMinistry(object sender, EventArgs e)
        {
            ddlOfficial.Items.Clear();
            LoadddlOfficial();
            RebindData();
        }

        protected void OnSelectedIndexChanged_ddlOfficial(object sender, EventArgs e)
        {
            RebindData();
        }

        private void LoadddlMinistry()
        {
            var subjects = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT DISTINCT Ministry FROM [dbo].[goa_expenses] ORDER BY Ministry;", con);
                    adapter.Fill(subjects);
                    ddlMinistry.DataSource = subjects;
                    ddlMinistry.DataTextField = "Ministry";
                    ddlMinistry.DataValueField = "Ministry";
                    ddlMinistry.SelectedIndex = 0;
                    ddlMinistry.DataBind();
                }
                catch (Exception ex)
                {
                    // Handle the error
                }
                finally
                {
                    con.Close();
                }
            }
        }

        private void LoadddlOfficial()
        {
            var subjects = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT DISTINCT Name FROM [dbo].[goa_expenses] WHERE Ministry='" + ddlMinistry.SelectedValue + "' ORDER BY Name;", con);
                    adapter.Fill(subjects);
                    ddlOfficial.DataSource = subjects;
                    ddlOfficial.DataTextField = "Name";
                    ddlOfficial.DataValueField = "Name";
                    ddlOfficial.SelectedIndex = 0;
                    ddlOfficial.DataBind();
                }
                catch (Exception ex)
                {
                    // Handle the error
                }
                finally
                {
                    con.Close();
                }
            }
        }

        private void RebindData()
        {
            string strSQL = "SELECT Type, SUM(decAmount) AS Total" +
                            " FROM [dbo].[goa_expenses]" +
                            " WHERE decAmount > 0" +
                            " AND Ministry='" + ddlMinistry.SelectedValue + "'";
            strSQL += (ddlOfficial.SelectedValue == string.Empty) ? "" : " AND NAME='" + ddlOfficial.SelectedValue + "'";
            strSQL += " AND " + (this.Page as dynamic).selectedDateRangeValue +
                            " GROUP BY Type " +
                            " ORDER BY SUM(decamount) DESC; ";
            lblSQL.Text = strSQL;
            litTitle.Text = "Expenses by Type of ";
            litTitle.Text += (ddlOfficial.SelectedValue == string.Empty) ? ddlMinistry.SelectedValue : ddlOfficial.SelectedValue;
            litTitle.Text += ". Data Range (" + (this.Page as dynamic).selectedDateRangeText + ")";

            arrResponses = new string[10];
            arrRespValues = new int[10];
            litTable.Text = GetTableHeader();

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
            {
                litTable.Text += ExecuteSQL(connection, strSQL);
            }
            // Add the chart
            uCreateChart uCreateChart = LoadControl("~/uCreateChart.ascx") as uCreateChart;
            uCreateChart.Responses = arrResponses;
            uCreateChart.RespValues = arrRespValues;
            uCreateChart.ChartName = litTitle.Text.Replace("/","_").Replace(" ","") + ".png";
            pnlRight.Controls.Add(uCreateChart);
        }

        private string GetTableHeader()
        {
            var sb = new StringBuilder();

            sb.Append("<table cellspacing='0' cellpadding='4'>");
            sb.Append("<tr bgcolor='cornsilk'>");
            sb.Append("<td>#</td>");
            sb.Append("<td>Expense Type</td>");
            sb.Append("<td>Expense Amount</td>");
            //sb.Append("<td>Percent</td>");
            sb.Append("</tr>");

            return sb.ToString();
        }

        private string ExecuteSQL(SqlConnection connection, string strSQL)
        {
            int iNum = 0;
            var strRet = string.Empty;
            using (SqlCommand cmd = new SqlCommand(strSQL, connection))
            {
                connection.Open();
                try
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        // Check is the reader has any rows at all before starting to read.
                        if (!reader.HasRows)
                            strRet = "<tr><td>No data found.</td></tr>";
                        else
                        {
                            while (reader.Read())
                            {
                                strRet += "<tr><td>" + (iNum + 1).ToString() + "</td>";
                                for (int i = 0; i < reader.FieldCount; i++)
                                {
                                    //string str = reader.GetValue(i).ToString();
                                    strRet += "<td>" + String.Format("{0:N0}", reader.GetValue(i)) + "</td>";
                                    if (i == 0)
                                        arrResponses[iNum] = reader.GetValue(0).ToString();
                                    else if (i == 1)
                                        arrRespValues[iNum] = Convert.ToInt32(reader.GetValue(1));
                                }
                                iNum++;
                                strRet += "</tr>";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    //sb.Append(ex.Message);
                }
                finally
                {
                    connection.Close();
                    strRet += "</table>";
                }
            }
            return strRet;
        }
    }
}