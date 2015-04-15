<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePie.aspx.cs" Inherits="ParseCSVToDB.CreatePie" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <asp:Literal ID="litTable" runat="server" />
                </td>
                 <td>
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
                </td>
            </tr>
        </table>
        
        <!-- Date Range -->
        <h3>Change date ranges in the report: </h3>
        See : <asp:DropDownList ID="ddlDateRange" runat="server" AutoPostBack="true">
        <asp:ListItem Text="All Avaialbe Data" Value="1=1" />
            <asp:ListItem Text="1/01/2015 to  1/29/2015" Value="DTDateIncurred Between '1/01/2015' AND '12/31/2015'"/>
            <asp:ListItem Text="1/01/2014 to 12/31/2014" Value="DTDateIncurred Between '1/01/2014' AND '12/31/2014'"/>
            <asp:ListItem Text="1/01/2013 to 12/31/2013" Value="DTDateIncurred Between '1/01/2013' AND '12/31/2013'"/>
            <asp:ListItem Text="1/10/2012 to 12/31/2012" Value="DTDateIncurred Between '1/10/2012' AND '12/31/2012'"/>  
        </asp:DropDownList>
        <hr />
        <!-- Export Reports -->
        <h3>Export Report</h3>
        <asp:DropDownList ID="ddlExpFileType" runat="server">
            <asp:ListItem Text="ms-excel" Value=".xls" />
            <asp:ListItem Text="ms-msword" Value=".doc" />     
        </asp:DropDownList>
        <asp:TextBox ID="txReport" runat="server" Text="ReportName" Width="300px" />
        <asp:RequiredFieldValidator ControlToValidate="txReport" ErrorMessage="Required" runat="server" />
        <asp:Button ID="btnReport" runat="server" Text="Export" OnClick="btnExport_Click" />
        <hr />
        <!-- Ohter Reports -->
        <h3>Explore Other Reports : </h3>
        <a runat="server" href="~/About">Back to Objectives and Context Data</a><br />
        Or Jump to other reports :
        <asp:DropDownList ID="ddl1" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Text="By Ministries" Value="0" />
            <asp:ListItem Text="By Officials" Value="1" />
            <asp:ListItem Text="By Expenses" Value="2" />
            <asp:ListItem Text="By Types" Value="3" />
        </asp:DropDownList>
        
        
    </form>
</body>
</html>
