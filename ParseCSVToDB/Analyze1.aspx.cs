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

        int _cnt = 0;
        protected void OnRowDataBound_GridView1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                _cnt = 0;
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Text = (++_cnt).ToString() + ".";
                DataRow row = ((DataRowView)e.Row.DataItem).Row;
                String strTotal = row[1].ToString();
                String strCnt = row[2].ToString();
                e.Row.Cells[4].Text = "$" + (Convert.ToDecimal(strTotal) / Convert.ToInt32(strCnt)).ToString("N2");
                string strSQL = "Select count(distinct(Name)) from [dbo].[goa_expenses] where Ministry=" + Common.CommonLib.Quote(row[0].ToString());
                int iCnt = Common.CommonLib.GetCount(strSQL);
                e.Row.Cells[5].Text = iCnt.ToString();
                e.Row.Cells[6].Text = "$" + (Convert.ToDecimal(strTotal) / iCnt).ToString("N2");
            }
        }

        
    }
}