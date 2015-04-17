<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdhocOfficial.ascx.cs" Inherits="ParseCSVToDB.AdhocOfficial" %>

<h2>Search for a particular Official</h2>

<h3><asp:Literal ID="litTitle" runat="server" /></h3>

From a particular Ministry to an official

<asp:DropDownList ID="ddlMinistry" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="OnSelectedIndexChanged_Ministry" runat="server">
    <asp:ListItem>Select a Ministry</asp:ListItem>
</asp:DropDownList>

<asp:DropDownList ID="ddlOfficial" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="OnSelectedIndexChanged_Official" runat="server" Enabled="false">
    <asp:ListItem>Select an Official</asp:ListItem>
</asp:DropDownList>

<hr />
OR Search for an Official by part of his/her name :
<asp:TextBox ID="tbName" runat="server" />
<!--<asp:Button ID="btnSearch" OnClick="OnClick_btnSearch" Text="Report with Name Like" runat="server" />-->
<asp:Button ID="btnFilter" OnClick="OnClick_btnFilter" Text="Show Me Name Like First" runat="server" />
<br />
<asp:ListBox ID="ddlOfficial2" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="OnSelectedIndexChanged_Official2" Rows="20" runat="server" Visible="false">
    <asp:ListItem>Select an Official</asp:ListItem>
</asp:ListBox>