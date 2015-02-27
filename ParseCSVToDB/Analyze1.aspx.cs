using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common;
using System.Configuration;

namespace ParseCSVToDB
{
    public partial class Analyze1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var strSQL = "SELECT Ministry, SUM(decAmount) AS Total " +
                            "FROM [dbo].[goa_expenses] " +
                            "WHERE decAmount > 0" +
                            "GROUP BY Ministry " +
                            "ORDER BY SUM(decamount) DESC ";
            SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlDataSource1.SelectCommand = strSQL;
            GridView1.DataBind();
            //litError.Text = Common.CommonLib.ShowSQLData(strSQL);
        }
    }
}