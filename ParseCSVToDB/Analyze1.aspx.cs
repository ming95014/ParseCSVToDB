using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;

namespace ParseCSVToDB
{
    public partial class Analyze1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var strSQL = "SELECT ministry, SUM(decAmount) FROM [dbo].[goa_expenses] " +
                            "WHERE decAmount > 0" +
                            "GROUP BY Ministry " +
                            "ORDER BY SUM(decamount) DESC ";

            litResults.Text = Common.CommonLib.ShowSQLData(strSQL);
        }
    }
}