<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Analyze1.aspx.cs" Inherits="ParseCSVToDB.Analyze1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Ranking of Ministries with most expenses</h2>

    <h3>Ministries with Highest Expenses</h3>

    <asp:GridView ID="GridView1" runat="server" 
                  AutoGenerateColumns ="false" 
                  ShowHeader="true" ShowHeaderWhenEmpty="true" 
                  DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Ministry" />
            <asp:BoundField DataField="Total" DataFormatString="${0:n}" ItemStyle-HorizontalAlign="Right" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" />
    <asp:Literal ID="litError" runat="server" />
</asp:Content>
