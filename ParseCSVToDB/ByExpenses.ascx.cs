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
        private string strTop = "25";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                strTop = Request.QueryString["top"] != null ? Request.QueryString["top"].ToString() : "25";
                try
                {
                    ddlTopN.SelectedValue = litTopN.Text = strTop;
                }
                catch
                {
                    ddlTopN.SelectedIndex = 0;
                }

                BindGrid("decamount DESC");
                sortImage.ImageUrl = "../images/view_sort_descending.png";
                GridView1.HeaderRow.Cells[7].Controls.Add(sortImage);
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
                //e.Row.Cells[10].Text = "<a title='Click to pop-open a new browser to view the receipt' target='_blank' href='" + row[10].ToString() + "'>receipt</a>";
                String strAmount = row[8].ToString();
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
       
        private void BindGrid(string strOrderBy)
        {
            strOrderBy = (strOrderBy == string.Empty) ? "decAmount DESC" : strOrderBy.Replace("Amount", "decAmount").Replace("DateIncurred", "DTDateIncurred");
            var strSQL = "SELECT TOP " + ddlTopN.SelectedValue + " Ministry,Position,Name,Category,Type,DateIncurred,DTDateIncurred,Amount,decAmount,Description,Receipt" +
                               " FROM [dbo].[goa_expenses] ORDER BY " + strOrderBy;
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
            {
                if (headerCell.ContainingField.SortExpression == e.SortExpression)
                {
                    columnIndex = GridView1.HeaderRow.Cells.GetCellIndex(headerCell);
                }
            }

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