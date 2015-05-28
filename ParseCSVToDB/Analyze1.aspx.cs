using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace ParseCSVToDB
{
    public partial class Analyze1 : System.Web.UI.Page
    {
        public string selectedDateRangeText
        {
            get { return ddlDateRange.SelectedItem.Text; }
        }
        public string selectedDateRangeValue
        {
            get { return ddlDateRange.SelectedValue; }
        }
        public int selectedDateIndex
        {
            get { return ddlDateRange.SelectedIndex; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
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
                var datePassedIn = Request.QueryString["d"] != null ? Request.QueryString["v"].ToString() : "0";
                ddlDateRange.SelectedIndex = Convert.ToInt16(datePassedIn);
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