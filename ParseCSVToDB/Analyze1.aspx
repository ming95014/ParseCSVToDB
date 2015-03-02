﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Analyze1.aspx.cs" Inherits="ParseCSVToDB.Analyze1" %>
<%@ Register TagPrefix="uc1" TagName="ByMinistry" Src="~/ByMinistry.ascx" %>
<%@ Register TagPrefix="uc2" TagName="ByOfficial" Src="~/ByOfficial.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2 style="text-align:center">Reports and Analysis</h2>
    <h3>Date Range</h3>
    <asp:Label ID="lblDateRange" runat="server" />

    <asp:MultiView ID="mv" runat="server">
        <asp:View ID="view0" runat="server">
            <uc1:ByMinistry runat="server" />
        </asp:View>
        <asp:View ID="view1" runat="server">
            <uc2:ByOfficial runat="server" />
        </asp:View>
    </asp:MultiView>

    <h3>Explore Other Reports : </h3>

    <a runat="server" href="~/About">Back to Objectives and Context Data</a><br />

    Or Jump to other reports below :

    <asp:DropDownList ID="ddl1" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Text="By Ministries" Value="0" />
        <asp:ListItem Text="By Officials" Value="1" />
    </asp:DropDownList>
</asp:Content>
