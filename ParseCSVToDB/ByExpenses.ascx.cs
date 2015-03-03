using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace ParseCSVToDB
{
    public partial class ByExpenses : System.Web.UI.UserControl
    {
        Image sortImage = new Image();
        public string SortDireaction
        {
            get
            {
                if (ViewState["SortDireaction"] == null)
                    return string.Empty;
                else
                    return ViewState["SortDireaction"].ToString();
            }
            set
            {
                ViewState["SortDireaction"] = value;
            }
        }
        private string _sortDirection;
        private DataTable dataTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*
                var strTop = Request.QueryString["top"] != null ? Request.QueryString["top"].ToString() : "25";
                try
                {
                    ddlTopN.SelectedValue = litTopN.Text = strTop;
                }
                catch
                {
                    ddlTopN.SelectedIndex = 0;
                }
                */
                //var strSQL = "SELECT TOP " + strTop + " Ministry,Position,Name,Category,Type,DateIncurred,Amount,decAmount,Description,Receipt" +
                //                " FROM [dbo].[goa_expenses]" +
                //                " ORDER BY decamount DESC";
                //SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                //SqlDataSource1.SelectCommand = strSQL;
                BindGrid();
            }
        }

        public DataTable fillDataTable(string strConStr, string strSQL)
        {
            //string query = "SELECT * FROM dstut.dbo." + table;
            SqlConnection sqlConn = new SqlConnection(strConStr);
            sqlConn.Open();
            SqlCommand cmd = new SqlCommand(strSQL, sqlConn);

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            sqlConn.Close();
            return dt;
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
                e.Row.Cells[9].Text = "<a title='Click to pop-open a new browser to view the receipt' target='_blank' href='" + row[9].ToString() + "'>receipt</a>";
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

        protected void BindGrid()
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
            }
            var strSQL = "SELECT TOP " + ddlTopN.SelectedValue + " Ministry,Position,Name,Category,Type,DateIncurred,Amount,decAmount,Description,Receipt" +
                               " FROM [dbo].[goa_expenses]" +
                               " ORDER BY decamount DESC";
            dataTable = fillDataTable(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString, strSQL);
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            SetSortDirection(SortDireaction);
            if (dataTable != null)
            {
                //Sort the data.
                dataTable.DefaultView.Sort = e.SortExpression + " " + _sortDirection;
                BindGrid();
                SortDireaction = _sortDirection;
                int columnIndex = 0;
                foreach (DataControlFieldHeaderCell headerCell in GridView1.HeaderRow.Cells)
                {
                    if (headerCell.ContainingField.SortExpression == e.SortExpression)
                    {
                        columnIndex = GridView1.HeaderRow.Cells.GetCellIndex(headerCell);
                    }
                }

                GridView1.HeaderRow.Cells[columnIndex].Controls.Add(sortImage);
            }
        }

        protected void SetSortDirection(string sortDirection)
        {
            if (sortDirection == "ASC")
            {
                _sortDirection = "DESC";
                sortImage.ImageUrl = "view_sort_ascending.png";

            }
            else
            {
                _sortDirection = "ASC";
                sortImage.ImageUrl = "view_sort_descending.png";
            }
        }
        /*
        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (this.GridView1.Rows.Count > 0)
            {
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
                GridView1.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            //Get GridViewRows
            var rows = GridView1.Rows.Cast<GridViewRow>().Select(a => new
            {
                Number = Convert.ToInt32(GridView1.DataKeys[a.RowIndex].Value),
                NumberText = ((Label)a.FindControl("Label1")).Text
            });
            //Get Sort Direction accordingly
            SortDirection sortDirection = ViewState["SortOrder"] == null ? SortDirection.Descending :
                                                        (SortDirection)Enum.Parse(typeof(SortDirection), ViewState["SortOrder"].ToString()) == SortDirection.Ascending ?
                                                                                                    SortDirection.Descending : SortDirection.Ascending;
            ViewState["SortOrder"] = sortDirection;
            if (sortDirection == SortDirection.Ascending)
                rows = rows.OrderBy(a => a.NumberText);
            else
                rows = rows.OrderByDescending(a => a.NumberText);
            GridView1.DataSource = rows.ToList();
            GridView1.DataBind();
        }
        */
    }
}