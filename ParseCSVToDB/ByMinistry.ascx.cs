using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace ParseCSVToDB
{
    public partial class ByMinistry : System.Web.UI.UserControl
    {
        private Boolean boolSmallTable = false;
        public Boolean SmallTable { set { boolSmallTable = value; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            var strSQL = lblSQL.Text = "SELECT Ministry, SUM(decAmount) AS Total, COUNT(*) As Cnt " +
                                        "FROM [dbo].[goa_expenses] " +
                                        "WHERE decAmount > 0 AND " + (this.Page as dynamic).selectedDateRangeValue +
                                        "GROUP BY Ministry " +
                                        "ORDER BY SUM(decamount) DESC ";
            SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource1.SelectCommand = strSQL;
            GridView1.DataBind();

            litTitle.Text = "Ranking of Ministries with highest expenses (" + (this.Page as dynamic).selectedDateRangeText + ")";
            /*
            foreach (string var in Request.ServerVariables)
            {
                lblSQL.Text += "<li>" + var + "=|" + Request[var] + "|</li>";
            }
            */
        }

        int _cnt1 = 0;
        decimal dTotal1 = 0;
        int iNumExpenses1 = 0;
        int iOfficials1 = 0;
        protected void OnRowDataBound_GridView1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                _cnt1 = 0;
                if (boolSmallTable)
                {
                    pnlSummary.Visible = false;
                    for (var i = 3; i < GridView1.Columns.Count; i++ )
                        GridView1.Columns[i].Visible = false;
                }
                    
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = (++_cnt1).ToString() + ".";
                DataRow row = ((DataRowView)e.Row.DataItem).Row;
                String strTotal = row[1].ToString();
                String strCnt = row[2].ToString();
                e.Row.Cells[1].Text = "<a title='Click to pop-open a new browser to view the details' target='_blank' href='Analyze1?v=2&d=" + (this.Page as dynamic).selectedDateIndex +
                                                                                                    "&ministry=" + Server.UrlEncode(row[0].ToString()) + "'>" + row[0].ToString() + "</a>";
                int iCnt = 0;
                if (!boolSmallTable)
                {
                    e.Row.Cells[4].Text = "$" + (Convert.ToDecimal(strTotal) / Convert.ToInt32(strCnt)).ToString("N2");
                    string strSQL = "SELECT COUNT(distinct(Name)) FROM [dbo].[goa_expenses] WHERE Ministry=" + 
                                        Common.CommonLib.Quote(row[0].ToString()) + " AND " + (this.Page as dynamic).selectedDateRangeValue;
                    iCnt = Common.CommonLib.GetCount(strSQL);
                    e.Row.Cells[5].Text = iCnt.ToString();
                    e.Row.Cells[6].Text = "$" + (Convert.ToDecimal(strTotal) / iCnt).ToString("N2");
                    e.Row.Cells[7].Text = (Convert.ToDecimal(strCnt) / iCnt).ToString("N2");
                }
                // for footer
                dTotal1 += Convert.ToDecimal(strTotal);
                iNumExpenses1 += Convert.ToInt32(strCnt);
                iOfficials1 += iCnt;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[1].Text = "Total ";
                e.Row.Cells[2].Text = "$" + dTotal1.ToString("N2");
                if (!boolSmallTable)
                {
                    e.Row.Cells[3].Text = iNumExpenses1.ToString("N2");
                    e.Row.Cells[4].Text = "$" + (dTotal1 / iNumExpenses1).ToString("N2");
                    e.Row.Cells[5].Text = iOfficials1.ToString("N0");
                    e.Row.Cells[6].Text = "$" + (dTotal1 / iOfficials1).ToString("N2");
                    e.Row.Cells[7].Text = (iNumExpenses1 / iOfficials1).ToString("N2");
                }
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (this.GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}