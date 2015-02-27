<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PopulateDB.aspx.cs" Inherits="ParseCSVToDB.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Parse data file and store into DB</h3>
    <p>Use this area to provide additional information.</p>

    <asp:Literal ID="LitInfo" runat="server" />
    <asp:Literal ID="litError" runat="server" />
</asp:Content>
