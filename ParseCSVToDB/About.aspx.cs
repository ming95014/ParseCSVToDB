using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParseCSVToDB
{
	public partial class About : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            var strSQL1 = "SELECT MIN([DTDateIncurred]) As 'From Date', MAX([DTDateIncurred]) As 'To Date' from [dbo].[goa_expenses]";
            lblDateRange.Text = Common.CommonLib.ShowSQLData(strSQL1, false, false).Replace(" 12:00:00 AM", "");

            var strSQL2 = "SELECT Ministry, Count(Distinct Name) As '# of Distinct Officials' " +
                         "FROM [dbo].[goa_expenses] " +
                         "GROUP BY Ministry " +
                         "ORDER BY Count(Distinct Name) DESC;";
            lblMinistries.Text = Common.CommonLib.ShowSQLData(strSQL2, false, false);

            var strSQL3 = "SELECT DISTINCT Category, Type FROM [dbo].[goa_expenses] ORDER BY Category, Type";
            lblCategories.Text = Common.CommonLib.ShowSQLData(strSQL3, false, false);
		}
	}
}