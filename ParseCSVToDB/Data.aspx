<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Data.aspx.cs" Inherits="ParseCSVToDB.Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <h3>Context of the Available Data</h3>

        <h4>Date Range</h4>
        <asp:Label ID="lblDateRange" runat="server" />
        <hr />
        <h4>Ministries and number of officials in each ministry</h4>
        <asp:Label ID="lblMinistries" runat="server" />
        <hr />
        <h4>Categories and Types of Expenses</h4>
        <asp:Label ID="lblCategories" runat="server" />
        <hr />
        <h4>Officials Positions filing expenses</h4>
        <asp:Label ID="lblPositions" runat="server" />
        <hr />
</asp:Content>
