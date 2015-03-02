<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Analyze1.aspx.cs" Inherits="ParseCSVToDB.Analyze1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Ranking of Ministries with most expenses</h2>

    <h3>Expenses by Ministries</h3>

    <asp:GridView ID="GridView1" runat="server"                   
                  OnRowDataBound="OnRowDataBound_GridView1" 
                  AutoGenerateColumns="false"
                  ShowFooter="true"
                  ShowHeaderWhenEmpty="true" 
                  DataSourceID="SqlDataSource1"> 
        <AlternatingRowStyle BackColor="lightgrey" /> 
        <PagerStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
        <HeaderStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
        <FooterStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
        <RowStyle Height="20px" Font-Size="13px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />      
        <Columns>
            <asp:TemplateField HeaderText="#" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField DataField="Ministry" HeaderText="A. Ministry (Order by highest total expenses)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="35%"/>
            <asp:BoundField DataField="Total" DataFormatString="${0:n}" HeaderText="B. Total Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
            <asp:BoundField DataField="Cnt" DataFormatString="{0:n0}" HeaderText="C. # of Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
            <asp:BoundField HeaderText="D. Average amount<br> per Expense (B/C)" HtmlEncode="false" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%"/>
            <asp:BoundField DataFormatString="{0:n0}" HeaderText="E. # of distinct officials submitting expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
            <asp:BoundField DataFormatString="{0:n0}" HeaderText="F. Average expenses per distinct official (B/E)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
            <asp:BoundField DataFormatString="{0:n0}" HeaderText="G. Average # expenses per distinct official (C/E)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" />
    <asp:Literal ID="litError" runat="server" />
</asp:Content>
