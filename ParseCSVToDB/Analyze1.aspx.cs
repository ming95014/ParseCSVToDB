using System;

namespace ParseCSVToDB
{
    public partial class Analyze1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var strSQL = "Select MIN([DTDateIncurred]) As 'From Date', MAX([DTDateIncurred]) As 'To Date' from [dbo].[goa_expenses];";
            lblDateRange.Text = Common.CommonLib.ShowSQLData(strSQL, false, false).Replace(" 12:00:00 AM", "");
        }
    }
}