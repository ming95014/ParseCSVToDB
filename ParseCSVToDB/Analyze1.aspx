<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Analyze1.aspx.cs" Inherits="ParseCSVToDB.Analyze1" %>
<%@ Register TagPrefix="uc1" TagName="ByMinistry" Src="~/ByMinistry.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Date Range</h2>
    <asp:Label ID="lblDateRange" runat="server" />
    <uc1:ByMinistry runat="server" />
    
</asp:Content>
