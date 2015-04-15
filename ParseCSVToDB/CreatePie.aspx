<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePie.aspx.cs" Inherits="AlbertaSurvey.CreatePie" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Chart ID="Chart1" runat="server" Height="300px" Width="400px">
            <Titles>
                <asp:Title ShadowOffset="3" Name="Items" />
            </Titles>
            <Legends>
                <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="true" Name="Default" LegendStyle="Row" />
            </Legends>
            <Series>
                <asp:Series Name="Default" />
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
            </ChartAreas>
        </asp:Chart>
        Chart Type : <asp:DropDownList ID="ddlChartType" runat="server" AutoPostBack="true">
            <asp:ListItem Value="Area" Text="Area chart type." />
            <asp:ListItem Value="Bar" Text="Bar chart type." Selected="True" />
            <asp:ListItem Value="BoxPlot" Text="Box plot chart type." />
            <asp:ListItem Value="Bubble" Text="Bubble chart type." />
            <asp:ListItem Value="Candlestick" Text="Candlestick chart type." />
            <asp:ListItem Value="Column" Text="Column chart type." />
            <asp:ListItem Value="Doughnut" Text="Doughnut chart type." />
            <asp:ListItem Value="ErrorBar" Text="Error bar chart type." />
            <asp:ListItem Value="FastLine" Text="FastLine chart type." />
            <asp:ListItem Value="FastPoint" Text="FastPoint chart type." />
            <asp:ListItem Value="Funnel" Text="Funnel chart type." />
            <asp:ListItem Value="Kagi" Text="Kagi chart type." />
            <asp:ListItem Value="Line" Text="Line chart type." />
            <asp:ListItem Value="Pie" Text="Pie chart type." />
            <asp:ListItem Value="Point" Text="Point chart type." />
            <asp:ListItem Value="PointAndFigure" Text="PointAndFigure chart type." />
            <asp:ListItem Value="Polar" Text="Polar chart type." />
            <asp:ListItem Value="Pyramid" Text="Pyramid chart type." />
            <asp:ListItem Value="Radar" Text="Radar chart type." />
            <asp:ListItem Value="Range" Text="Range chart type." />
            <asp:ListItem Value="RangeBar" Text="RangeBar chart type." />
            <asp:ListItem Value="RangeColumn" Text="Range column chart type." />
            <asp:ListItem Value="Renko" Text="Renko chart type." />
            <asp:ListItem Value="Spline" Text="Spline chart type." />
            <asp:ListItem Value="SplineArea" Text="Spline area chart type." />
            <asp:ListItem Value="SplineRange" Text="Spline range chart type." />
            <asp:ListItem Value="StackedArea" Text="Stacked area chart type." />
            <asp:ListItem Value="StackedArea100" Text="Hundred-percent stacked area chart type." />
            <asp:ListItem Value="StackedBar" Text="Stacked bar chart type." />
            <asp:ListItem Value="StackedBar100" Text="Hundred-percent stacked bar chart type." />
            <asp:ListItem Value="StackedColumn" Text="Stacked column chart type." />
            <asp:ListItem Value="StackedColumn100" Text="Hundred-percent stacked column chart type." />
            <asp:ListItem Value="StepLine" Text="StepLine chart type." />
            <asp:ListItem Value="Stock" Text="Stock chart type." />
            <asp:ListItem Value="ThreeLineBreak" Text="ThreeLineBreak chart type." />
        </asp:DropDownList>       
        
        
    </form>
</body>
</html>
