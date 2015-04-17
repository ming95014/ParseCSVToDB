using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ParseCSVToDB
{
    public partial class AdhocOfficial : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadddlMinistry();
        }

        private void LoadddlMinistry()
        {
            var subjects = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT DISTINCT Ministry FROM [Alberta3].[dbo].[goa_expenses] ORDER BY Ministry;", con);
                    adapter.Fill(subjects);
                    ddlMinistry.DataSource = subjects;
                    ddlMinistry.DataTextField = "Ministry";
                    ddlMinistry.DataValueField = "Ministry";
                    ddlMinistry.DataBind();
                }
                catch (Exception ex)
                {
                    // Handle the error
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void OnSelectedIndexChanged_Ministry(object sender, EventArgs e)
        {
            var subjects = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT DISTINCT Name FROM [Alberta3].[dbo].[goa_expenses] WHERE Ministry='" + ddlMinistry.SelectedValue + "' ORDER BY Name;", con);
                    adapter.Fill(subjects);
                    ddlOfficial.DataSource = subjects;
                    ddlOfficial.DataTextField = "Name";
                    ddlOfficial.DataValueField = "Name";
                    ddlOfficial.DataBind();
                    ddlOfficial.Enabled = true;
                }
                catch (Exception ex)
                {
                    // Handle the error
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void OnSelectedIndexChanged_Official(object sender, EventArgs e)
        {
            Response.Redirect("Analyze1.aspx?v=2&name=" + Server.UrlEncode(ddlOfficial.SelectedValue));
        }

        protected void OnSelectedIndexChanged_Official2(object sender, EventArgs e)
        {
            Response.Redirect("Analyze1.aspx?v=2&name=" + Server.UrlEncode(ddlOfficial2.SelectedValue));
        }

        protected void OnClick_btnSearch(object sender, EventArgs e)
        {
            Response.Redirect("Analyze1.aspx?v=2&namelike=" + Server.UrlEncode(tbName.Text));
        }

        protected void OnClick_btnFilter(object sender, EventArgs e)
        {
            var subjects = new DataTable();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
            {
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter("SELECT DISTINCT Name, Name + '; ' + Position + '; ' + Ministry As Text  FROM [Alberta3].[dbo].[goa_expenses] WHERE Name LIKE '%" + tbName.Text + "%' ORDER BY Name;", con);
                    adapter.Fill(subjects);
                    ddlOfficial2.DataSource = subjects;
                    ddlOfficial2.DataTextField = "Text";
                    ddlOfficial2.DataValueField = "Name";
                    ddlOfficial2.DataBind();
                    ddlOfficial2.Visible = true;
                }
                catch (Exception ex)
                {
                    // Handle the error
                }
                finally
                {
                    con.Close();
                }
            }
        } 
    }
}