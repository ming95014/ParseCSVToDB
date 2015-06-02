using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace ParseCSVToDB
{
    public partial class ByOfficial : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var strSQL = lblSQL.Text = "SELECT TOP " + ddlTopN.SelectedValue + " Ministry, SUM(decAmount) AS Total, COUNT(*) As Cnt, Name, SUM(decAmount)/COUNT(*) As Average " +
                                        "FROM [dbo].[goa_expenses] " +
                                        "WHERE decAmount > 0 AND " + (this.Page as dynamic).selectedDateRangeValue +
                                        "GROUP BY Name, Ministry " +
                                        "ORDER BY SUM(decamount) DESC ";
            SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource1.SelectCommand = strSQL;
            GridView1.DataBind();

            litTitle.Text = "Top " + ddlTopN.Text + " officials with the higest total expenses (" + (this.Page as dynamic).selectedDateRangeText + ")";
        }

        int _cnt1 = 0;
        decimal dTotal1 = 0;
        int iNumExpenses1 = 0;
        protected void OnRowDataBound_GridView1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                _cnt1 = 0;
                dTotal1 = 0;
                iNumExpenses1 = 0;
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = (++_cnt1).ToString() + ".";
                DataRow row = ((DataRowView)e.Row.DataItem).Row;
                e.Row.Cells[1].Text = "<a title='Click to pop-open a new browser to view the details' target='_blank' href='Analyze1?v=2&d=" + (this.Page as dynamic).selectedDateIndex + 
                                                                                                            "&name=" + Server.UrlEncode(row[3].ToString()) + "'>" + row[3].ToString() + "</a>";
                String strTotal = row[1].ToString();
                String strCnt = row[2].ToString();
                //e.Row.Cells[5].Text = "$" + (Convert.ToDecimal(strTotal) / Convert.ToInt32(strCnt)).ToString("N2");

                // for footer
                dTotal1 += Convert.ToDecimal(strTotal);
                iNumExpenses1 += Convert.ToInt32(strCnt);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Summary Information";
                e.Row.Cells[3].Text = "$" + dTotal1.ToString("N2");
                e.Row.Cells[4].Text = iNumExpenses1.ToString("N0");
                e.Row.Cells[5].Text = "$" + (dTotal1 / iNumExpenses1).ToString("N2");
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Redirect("Analyze1?v=1&top=" + ddlTopN.SelectedValue);
        }
    }
}