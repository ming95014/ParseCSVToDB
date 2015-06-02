<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Analyze1.aspx.cs" Inherits="ParseCSVToDB.Analyze1" %>

<%@ Register TagPrefix="uc1" TagName="ByMinistry" Src="~/ByMinistry.ascx" %>
<%@ Register TagPrefix="uc2" TagName="ByOfficial" Src="~/ByOfficial.ascx" %>
<%@ Register TagPrefix="uc3" TagName="ByExpenses" Src="~/ByExpenses.ascx" %>
<%@ Register TagPrefix="uc4" TagName="ByTypes" Src="~/ByType.ascx" %>
<%@ Register TagPrefix="uc5" TagName="Adhoc" Src="~/AdhocOfficial.ascx" %>
<%@ Register TagPrefix="uc6" TagName="MinistryChartTotal" Src="~/uMinistryChartTotal.ascx" %>
<%@ Register TagPrefix="uc7" TagName="MinistryChartByType" Src="~/uMinistryChartByType.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .HeaderStyle th {text-align:right}
    </style>

    <div id="divToExport" runat="server">
        <h2 style="text-align: center">Reports and Analysis</h2>

        <asp:MultiView ID="mv" runat="server">
            <asp:View ID="view0" runat="server">
                <uc1:ByMinistry runat="server" />
            </asp:View>
            <asp:View ID="view1" runat="server">
                <uc2:ByOfficial runat="server" />
            </asp:View>
            <asp:View ID="view2" runat="server">
                <uc3:ByExpenses runat="server" />
            </asp:View>
            <asp:View ID="view3" runat="server">
                <uc4:ByTypes runat="server" />
            </asp:View>
            <asp:View ID="view4" runat="server">
                <uc5:Adhoc runat="server" />
            </asp:View>
            <asp:View ID="view5" runat="server">
                <uc6:MinistryChartTotal runat="server" />
            </asp:View>
            <asp:View ID="view6" runat="server">
                <uc7:MinistryChartByType runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
    <hr />
    <div id="divOptions" runat="server">
        <!-- Date Range -->
        <h3>Change date ranges in the report: </h3>
        See : <asp:DropDownList ID="ddlDateRange" runat="server" AutoPostBack="true">
        <asp:ListItem Text="All Available Data" Value="1=1" />
            <asp:ListItem Text="1/01/2015 to  1/29/2015" Value="DTDateIncurred Between '1/01/2015' AND '1/29/2015'"/>
            <asp:ListItem Text="2014" Value="DTDateIncurred Between '1/01/2014' AND '12/31/2014'"/>
            <asp:ListItem Text="2013" Value="DTDateIncurred Between '1/01/2013' AND '12/31/2013'"/>
            <asp:ListItem Text="2012" Value="DTDateIncurred Between '1/10/2012' AND '12/31/2012'"/>
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
    </div>
    <!-- Ohter Reports -->
    <h3>Explore Other Reports: </h3>
    <a runat="server" href="~/About">Back to Objectives and Context Data</a><br />
    Or Jump to other reports :
    <asp:DropDownList ID="ddl1" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Text="Start from Ministries" Value="0" />
        <asp:ListItem Text="Start from Officials with high expenses" Value="1" />
        <asp:ListItem Text="Start from all high Expenses" Value="2" />
        <asp:ListItem Text="Start from Expense types in each ministry" Value="3" />
        <asp:ListItem Text="Search for a particular Official" Value="4" />
        <asp:ListItem Text="Chart of all Ministries by total expenses" Value="5" />
        <asp:ListItem Text="Chart by Expense Type of a Ministry or an Official" Value="6" />
    </asp:DropDownList>   
    <script>
        $('a').filter(function () {
            return this.innerHTML == "Reports and Analysis";
        }).css({ color: "#FFFF00" });
    </script>
</asp:Content>
