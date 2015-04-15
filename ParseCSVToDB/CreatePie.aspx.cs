using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace ParseCSVToDB
{
    public partial class CreatePie : System.Web.UI.Page
    {
        public int[] yValues = { 21786, 14690, 2891, 1146 };
        public string[] xValues = { "A great deal", "Somewhat", "Not very much", "Not at all" };

        private Color[] colors = { Color.Green, Color.Yellow, Color.Orange, Color.Blue, Color.Red, Color.Violet };
        protected void Page_Load(object sender, EventArgs e)
        {
            drawPie();
        }

        protected void drawPie()
        {
            Chart1.Series[0].Points.DataBindXY(xValues, yValues);
            Chart1.Series[0].ChartType = GetChartType(ddlChartType.SelectedValue);
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            Chart1.Legends[0].Enabled = true;
            for(int i=0;i<yValues.Count(); i++)
                Chart1.Series["Default"].Points[i].Color = colors[i];
        }

        private SeriesChartType GetChartType(string strSelectedValue)
        {
            switch (strSelectedValue)
            {
                case "Area":
                    return SeriesChartType.Area;
                case "Bar":
                    return SeriesChartType.Bar;
                case "BoxPlot":
                    return SeriesChartType.BoxPlot;
                case "Bubble":
                    return SeriesChartType.Bubble;
                case "Candlestick":
                    return SeriesChartType.Candlestick;
                case "Column":
                    return SeriesChartType.Column;
                case "Doughnut":
                    return SeriesChartType.Doughnut;
                case "ErrorBar":
                    return SeriesChartType.ErrorBar;
                case "FastLine":
                    return SeriesChartType.FastLine;
                case "FastPoint":
                    return SeriesChartType.FastPoint;
                case "Funnel":
                    return SeriesChartType.Funnel;
                case "Kagi":
                    return SeriesChartType.Kagi;
                case "Line":
                    return SeriesChartType.Line;
                case "Pie":
                    return SeriesChartType.Pie;
                case "Point":
                    return SeriesChartType.Point;
                case "PointAndFigure":
                    return SeriesChartType.PointAndFigure;
                case "Polar":
                    return SeriesChartType.Polar;
                case "Pyramid":
                    return SeriesChartType.Pyramid;
                case "Radar":
                    return SeriesChartType.Radar;
                case "Range":
                    return SeriesChartType.Range;
                case "RangeBar":
                    return SeriesChartType.RangeBar;
                case "RangeColumn":
                    return SeriesChartType.RangeColumn;
                case "Renko":
                    return SeriesChartType.Renko;
                case "Spline":
                    return SeriesChartType.Spline;
                case "SplineArea":
                    return SeriesChartType.SplineArea;
                case "SplineRange":
                    return SeriesChartType.SplineRange;
                case "StackedArea":
                    return SeriesChartType.StackedArea;
                case "StackedArea100":
                    return SeriesChartType.StackedArea100;
                case "StackedBar":
                    return SeriesChartType.StackedBar;
                case "StackedBar100":
                    return SeriesChartType.StackedBar100;
                case "StackedColumn":
                    return SeriesChartType.StackedColumn;
                case "StackedColumn100":
                    return SeriesChartType.StackedColumn100;
                case "StepLine":
                    return SeriesChartType.StepLine;
                case "Stock":
                    return SeriesChartType.Stock;
                case "ThreeLineBreak":
                    return SeriesChartType.ThreeLineBreak;
            }
            return SeriesChartType.Bar;
        }
    }
}