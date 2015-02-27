﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Analyze1.aspx.cs" Inherits="ParseCSVToDB.Analyze1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Ranking of Ministries with most expenses</h2>

    <h3>Expenses by Ministries</h3>

    <asp:GridView ID="GridView1" runat="server" 
                  AutoGenerateColumns ="false" 
                  OnRowDataBound="OnRowDataBound_GridView1"
                  ShowHeaderWhenEmpty="true" 
                  DataSourceID="SqlDataSource1">        
        <Columns>
            <asp:TemplateField HeaderText="#" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="Ministry" HeaderText="Ministry (Order by highest total expenses)" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="40%"/>
            <asp:BoundField DataField="Total" DataFormatString="${0:n}" HeaderText="Total Expenses" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="20%"/>
            <asp:BoundField DataField="Cnt" DataFormatString="{0:n0}" HeaderText="# of Expenses" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="20%" />
            <asp:BoundField HeaderText="Average amount<br> per Expense" HtmlEncode="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="20%"/>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" />
    <asp:Literal ID="litError" runat="server" />
</asp:Content>
