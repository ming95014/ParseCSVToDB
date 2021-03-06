﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace ParseCSVToDB
{
    public partial class uCreateChart : System.Web.UI.UserControl
    {
        private string[] arrResponses; // = { "A great deal", "Somewhat", "Not very much", "Not at all" };
        public string[] Responses { set { arrResponses = value; } }

        private int[] arrRespValues; // = { 21786, 14690, 2891, 1146 };
        public int[] RespValues { set { arrRespValues = value; } }

        private string strChartName = "TotalMinistry.png";
        public string ChartName
        {
            set { strChartName = value; }
        }

        private Color[] colors = { Color.Green,
                                   Color.Yellow,
                                   Color.Orange,
                                   Color.Blue,
                                   Color.Red,
                                   Color.Violet,
                                   Color.Gold,
                                   Color.Pink,
                                   Color.PowderBlue,
                                   Color.LightGreen,
                                   Color.Gray,
                                   Color.LightGoldenrodYellow,
                                   Color.OrangeRed,
                                   Color.CadetBlue,
                                   Color.MediumVioletRed,
                                   Color.PaleVioletRed,
                                   Color.PaleGoldenrod,
                                   Color.HotPink,
                                   Color.Honeydew,
                                   Color.Indigo,
                                   Color.DarkOliveGreen,
                                   Color.DeepSkyBlue,
                                   Color.IndianRed,
                                   Color.MediumVioletRed };
        protected void Page_Load(object sender, EventArgs e)
        {
            drawChart();
        }

        protected void drawChart()
        {
            Array.Reverse(arrResponses);
            Array.Reverse(arrRespValues);
            Chart1.Series[0].Points.DataBindXY(arrResponses, arrRespValues);
            Chart1.Series[0].ChartType = GetChartType(ddlChartType.SelectedValue);
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            if (Chart1.Series[0].ChartType == SeriesChartType.Doughnut ||
                Chart1.Series[0].ChartType == SeriesChartType.Funnel ||
                Chart1.Series[0].ChartType == SeriesChartType.Pie ||
                Chart1.Series[0].ChartType == SeriesChartType.Pyramid)
                Chart1.Legends[0].Enabled = true;  // only show Legend for these 4 types of chart; otherwise, they just showed 'default' for no good purpose

            Chart1.Height = arrResponses.Count() > 11 ? Unit.Pixel(800) : Unit.Pixel(500);
            // label everyone, not default interval of 5
            Chart1.ChartAreas[0].AxisX.Interval = 1;
            for (int i = 0; i < arrRespValues.Count(); i++)
                Chart1.Series["Default"].Points[i].Color = colors[i];

            // In order to be able to display in Exported files (MSWord/Excel), need it as image file
            string imgPath = HttpContext.Current.Request.PhysicalApplicationPath + "\\TempChartImages\\" + strChartName;
            Chart1.SaveImage(imgPath);
            aspImage.ImageUrl = Request.Url.GetLeftPart(UriPartial.Authority) + System.Web.VirtualPathUtility.ToAbsolute("~/TempChartImages/" + strChartName);
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