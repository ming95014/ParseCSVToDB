using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace ParseCSVToDB
{
    public partial class ByExpenses : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var strTop = Request.QueryString["top"] != null ? Request.QueryString["top"].ToString() : "25";
                try
                {
                    ddlTopN.SelectedValue = litTopN.Text = strTop;
                }
                catch
                {
                    ddlTopN.SelectedIndex = 0;
                }

                var strSQL = "SELECT TOP " + strTop + " Ministry,Position,Name,Category,Type,DateIncurred,Amount,decAmount,Description,Receipt" +
                                " FROM [dbo].[goa_expenses]" +
                                " ORDER BY decamount DESC";
                SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                SqlDataSource1.SelectCommand = strSQL;
                GridView1.DataBind();
            }
        }
        
        int _cnt1 = 0;
        decimal dTotal1 = 0;
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
                String strAmount = row[7].ToString();
                dTotal1 += Convert.ToDecimal(strAmount);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = "Total";
                e.Row.Cells[7].Text = "$" + dTotal1.ToString("N2");
            }
        }
        
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("/Analyze1?v=2&top=" + ddlTopN.SelectedValue);
        }
    }
}