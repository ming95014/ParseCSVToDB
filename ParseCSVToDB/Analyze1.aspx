<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Analyze1.aspx.cs" Inherits="ParseCSVToDB.Analyze1" %>

<%@ Register TagPrefix="uc1" TagName="ByMinistry" Src="~/ByMinistry.ascx" %>
<%@ Register TagPrefix="uc2" TagName="ByOfficial" Src="~/ByOfficial.ascx" %>
<%@ Register TagPrefix="uc3" TagName="ByExpenses" Src="~/ByExpenses.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="divToExport" runat="server">
        <h2 style="text-align: center">Reports and Analysis</h2>
        <h3>Date Range</h3>
        <asp:Label ID="lblDateRange" runat="server" />
  
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
        </asp:MultiView>
    </div>
    <hr />

    <h3>Export Report</h3>
    <asp:DropDownList ID="ddlExpFileType" runat="server">
        <asp:ListItem Text="ms-msword" Value=".doc" />
        <asp:ListItem Text="ms-excel" Value=".xls" />
    </asp:DropDownList>
    <asp:TextBox ID="txReport" runat="server" Text="ReportName" Width="300px" />
    <asp:RequiredFieldValidator ControlToValidate="txReport" ErrorMessage="Required" runat="server" />
    <asp:Button ID="btnReport" runat="server" Text="Export" OnClick="btnExport_Click" />
    <hr />

    <h3>Explore Other Reports : </h3>

    <a runat="server" href="~/About">Back to Objectives and Context Data</a><br />

    Or Jump to other reports below :

        <asp:DropDownList ID="ddl1" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Text="By Ministries" Value="0" />
            <asp:ListItem Text="By Officials" Value="1" />
            <asp:ListItem Text="By Expenses" Value="2" />
        </asp:DropDownList>

</asp:Content>
