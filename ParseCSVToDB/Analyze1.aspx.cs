using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace ParseCSVToDB
{
    public partial class Analyze1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var strSQL = "Select MIN([DTDateIncurred]) As 'From Date', MAX([DTDateIncurred]) As 'To Date' from [dbo].[goa_expenses];";
            lblDateRange.Text = Common.CommonLib.ShowSQLData(strSQL, false, false).Replace(" 12:00:00 AM", "");
            if (!IsPostBack)
            {
                var viewPassedIn = Request.QueryString["v"] != null ? Request.QueryString["v"].ToString() : "0";
                try
                {
                    ddl1.SelectedValue = viewPassedIn;
                    mv.ActiveViewIndex = Convert.ToInt16(viewPassedIn);
                }
                catch
                {
                    mv.ActiveViewIndex = 0;
                }
            }
            txReport.Text = ddl1.SelectedItem.Text + DateTime.Now.ToString("s").Replace(" ", "-");
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            mv.ActiveViewIndex = Convert.ToInt16(ddl1.SelectedValue);          
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
            HtmlForm form = new HtmlForm();
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", txReport.Text + ddlExpFileType.SelectedValue));
            Response.ContentType = "application/" + ddlExpFileType.SelectedItem.Text;
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            form.Attributes["runat"] = "server";
            form.Controls.Add(divToExport);
            this.Controls.Add(form);
            form.RenderControl(hw);
            string style = @"<!--mce:2-->";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }       
    }
}