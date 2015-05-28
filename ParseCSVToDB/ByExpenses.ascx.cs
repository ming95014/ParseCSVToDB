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
            BindGrid("decamount DESC");
            sortImage.ImageUrl = "../images/view_sort_descending.png";
            GridView1.HeaderRow.Cells[7].Controls.Add(sortImage);
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
                if (Request.QueryString["name"] == null)
                    e.Row.Cells[1].Text = "<a title='Click to pop-open a new browser to view the details' target='_blank' href='Analyze1?v=2&d=" + (this.Page as dynamic).selectedDateIndex +
                                                                                                            "&name=" + Server.UrlEncode(row[2].ToString()) + "'>" + row[2].ToString() + "</a>";
                if (row[10].ToString().Trim().Length > 0) // don't show receipt links if there's no receipt to show
                    e.Row.Cells[9].Text = "<a title='Click to pop-open a new browser to view the receipt' target='_blank' href='" + row[10].ToString() + "'>receipt</a>";
                String strAmount = row[8].ToString();
                dTotal1 += Convert.ToDecimal(strAmount);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[6].Text = "Total";
                e.Row.Cells[7].Text = "$" + dTotal1.ToString("N2");
            }
        }
        
        private void BindGrid(string strOrderBy)
        {
            string strAndClause = string.Empty;
            if (Request.QueryString["name"] != null)
            {
                strAndClause += "AND name=" + Common.CommonLib.Quote(Request.QueryString["name"].ToString());
                litTitle.Text = "Top " + ddlTopN.Text + " expenses by " + Request.QueryString["name"].ToString() + " (" + (this.Page as dynamic).selectedDateRangeText + ")";
            }
                
            else if (Request.QueryString["ministry"] != null)
            {
                string strType = string.Empty;
                if (Request.QueryString["type"] != null)
                {
                    strAndClause += "AND type=" + Common.CommonLib.Quote(Request.QueryString["type"].ToString());
                    strType = " (of Type=" + Request.QueryString["type"].ToString() + ")";
                }
                    

                strAndClause += " AND ministry=" + Common.CommonLib.Quote(Request.QueryString["ministry"].ToString());
                litTitle.Text = " Top " + ddlTopN.Text + strType + " expenses by " + Request.QueryString["ministry"].ToString() + " (" + (this.Page as dynamic).selectedDateRangeText + ")";
            }
            else
                litTitle.Text = "Top " + ddlTopN.Text + " expenses by Amount (" + (this.Page as dynamic).selectedDateRangeText + ")";
                
            //strOrderBy = (strOrderBy == string.Empty) ? "decAmount DESC" : strOrderBy.Replace("Amount", "decAmount").Replace("DateIncurred", "DTDateIncurred");
            var strSQL = lblSQL.Text = "SELECT TOP " + ddlTopN.SelectedValue + " Ministry,Position,Name,Category,Type,DateIncurred,DTDateIncurred,Amount,decAmount,Description,Receipt" +
                                       " FROM [dbo].[goa_expenses] " +
                                       " WHERE " + (this.Page as dynamic).selectedDateRangeValue + strAndClause +
                                       " ORDER BY " + strOrderBy;           
            dataTable = Common.CommonLib.fillDataTable(ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString, strSQL);
            GridView1.DataSource = dataTable;
            GridView1.DataBind();           
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            SetSortDirection(SortDireaction);
            BindGrid(e.SortExpression + " " + _sortDirection);
            
            //Sort the data.
            dataTable.DefaultView.Sort = e.SortExpression + " " + _sortDirection;              
            SortDireaction = _sortDirection;
            int columnIndex = 0;
            foreach (DataControlFieldHeaderCell headerCell in GridView1.HeaderRow.Cells)
                if (headerCell.ContainingField.SortExpression == e.SortExpression)
                    columnIndex = GridView1.HeaderRow.Cells.GetCellIndex(headerCell);

            GridView1.HeaderRow.Cells[columnIndex].Controls.Add(sortImage);         
        }

        private void SetSortDirection(string sortDirection)
        {
            if (sortDirection == "ASC")
            {
                _sortDirection = "DESC";              
                sortImage.ImageUrl = "../images/view_sort_descending.png";
            }
            else
            {
                _sortDirection = "ASC";
                sortImage.ImageUrl = "../images/view_sort_ascending.png";
            }
        }
    }
}