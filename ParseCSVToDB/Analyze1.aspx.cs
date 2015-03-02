using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using System.Configuration;
using System.Data;

namespace ParseCSVToDB
{
    public partial class Analyze1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var strSQL = "SELECT Ministry, SUM(decAmount) AS Total, COUNT(*) As Cnt " +
                            "FROM [dbo].[goa_expenses] " +
                            "WHERE decAmount > 0" +
                            "GROUP BY Ministry " +
                            "ORDER BY SUM(decamount) DESC ";
            SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource1.SelectCommand = strSQL;
            GridView1.DataBind();
            //litError.Text = Common.CommonLib.ShowSQLData(strSQL);
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
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = (++_cnt1).ToString() + ".";
                DataRow row = ((DataRowView)e.Row.DataItem).Row;
                String strTotal = row[1].ToString();
                String strCnt = row[2].ToString();
                e.Row.Cells[4].Text = "$" + (Convert.ToDecimal(strTotal) / Convert.ToInt32(strCnt)).ToString("N2");
                string strSQL = "Select count(distinct(Name)) from [dbo].[goa_expenses] where Ministry=" + Common.CommonLib.Quote(row[0].ToString());
                int iCnt = Common.CommonLib.GetCount(strSQL);
                e.Row.Cells[5].Text = iCnt.ToString();
                e.Row.Cells[6].Text = "$" + (Convert.ToDecimal(strTotal) / iCnt).ToString("N2");
                e.Row.Cells[7].Text = (Convert.ToDecimal(strCnt) / iCnt).ToString("N2");

                // for footer
                dTotal1 += Convert.ToDecimal(strTotal);
                iNumExpenses1 += Convert.ToInt32(strCnt);
                iOfficials1 += iCnt;
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "$" + dTotal1.ToString("N2");
                e.Row.Cells[3].Text = iNumExpenses1.ToString("N2");
                e.Row.Cells[4].Text = "$" + (dTotal1/iNumExpenses1).ToString("N2");
                e.Row.Cells[5].Text = iOfficials1.ToString("N2");
                e.Row.Cells[6].Text = "$" + (dTotal1 / iOfficials1).ToString("N2");
                e.Row.Cells[7].Text = (iNumExpenses1 / iOfficials1).ToString("N2");
            }
        }      
    }
}