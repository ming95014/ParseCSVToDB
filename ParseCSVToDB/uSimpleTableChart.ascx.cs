using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace ParseCSVToDB
{
    public partial class uSimpleTableChart : System.Web.UI.UserControl
    {
        private string[] arrResponses; // = { "A great deal", "Somewhat", "Not very much", "Not at all" };
        private int[] arrRespValues; // = { 21786, 14690, 2891, 1146 };

        protected void Page_Load(object sender, EventArgs e)
        {
            //litTitle.Text = "Ranking of Ministries with highest expenses (" + (this.Page as dynamic).selectedDateRangeText + ")";

            string strSQL = "SELECT Ministry, SUM(decAmount) AS Total" +
                                        " FROM [dbo].[goa_expenses]" +
                                        " WHERE decAmount > 0 AND " + (this.Page as dynamic).selectedDateRangeValue +
                                        " GROUP BY Ministry " +
                                        " ORDER BY SUM(decamount) DESC ";

            //litTab.Text = GetTableHeader();
            arrResponses = new string[23];
            arrRespValues = new int[23];
            using (SqlConnection connection = new SqlConnection(@"user id=sa;password=ming12;server=MINGHPDESKTOP\SQLEXPRESS;Trusted_Connection=yes;database=Alberta3;connection timeout=30"))
            {
                ExecuteSQL(connection, strSQL);         
            }
            // Add the chart
            uCreateChart uCreateChart = LoadControl("~/uCreateChart.ascx") as uCreateChart;
            uCreateChart.Responses = arrResponses;
            uCreateChart.RespValues = arrRespValues;
            pnlRight.Controls.Add(uCreateChart);
        }

        private string GetTableHeader()
        {
            var sb = new StringBuilder();

            sb.Append("<tr bgcolor='cornsilk'>");
            sb.Append("<td>#</td>");
            sb.Append("<td>Ministry</td>");
            sb.Append("<td>Number</td>");
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
                        if (reader.HasRows)
                        {             
                            while (reader.Read())
                            {
                                strRet += "<tr><td>" + (iNum+1).ToString() + "</td>";
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
                }
            }
            return strRet;
        }
    }
}