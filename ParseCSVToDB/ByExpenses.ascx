<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ByExpenses.ascx.cs" Inherits="ParseCSVToDB.ByExpenses" %>

<h2>Expenses by Amount</h2>

<h3><asp:Literal ID="litTitle" runat="server" /></h3>

<asp:GridView ID="GridView1" runat="server" 
                OnRowDataBound="OnRowDataBound_GridView1"
                AllowSorting="true"
                OnSorting="GridView1_Sorting"
                AutoGenerateColumns="false" 
                ShowFooter="true" 
                GridLines="None" 
                ShowHeaderWhenEmpty="true">
    <AlternatingRowStyle BackColor="lightgrey" />
    <PagerStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
    <HeaderStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
    <FooterStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" Font-Bold="true" />
    <RowStyle Height="20px" Font-Size="13px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
    <Columns>
        <asp:TemplateField HeaderText="#" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="1%"/>
        <asp:BoundField DataField="Name" HeaderText="A. Official (Order by highest total expenses)" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Position" HeaderText="B. Position" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Ministry" HeaderText="C. Ministry" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Category" HeaderText="D. Category " ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Type"     HeaderText="E. Type" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="DateIncurred" HeaderText="F. Date Incurred" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" SortExpression="DateIncurred" />
        <asp:BoundField DataField="Amount" HeaderText="G. Amount " ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" SortExpression="Amount" />
        <asp:BoundField DataField="Description" HeaderText="H. Description" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Receipt" HeaderText="I. Receipt pdf link" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" />
<asp:Literal ID="litSQL" runat="server" Visible="true" />
<hr />
<h3>Additional Options</h3>
<asp:Literal ID="litError" runat="server" />
<h4>Change number of expenses in the report: </h4>
See : <asp:DropDownList ID="ddlTopN" runat="server" AutoPostBack="true">
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>75</asp:ListItem>
        <asp:ListItem>100</asp:ListItem>
      </asp:DropDownList>

<h4>Change date ranges in the report: </h4>
See : <asp:DropDownList ID="ddlDateRange" runat="server" AutoPostBack="true">
    <asp:ListItem Text="All Avaialbe Data" Value="1=1" />
        <asp:ListItem Text="1/10/2015 to 1/29/2015" Value="DTDateIncurred Between '1/1/2015' AND '12/31/2015'"/>
        <asp:ListItem Text="1/10/2014 to 12/31/2014" Value="DTDateIncurred Between '1/1/2014' AND '12/31/2014'"/>
        <asp:ListItem Text="1/1/2013 to 12/31/2013" Value="DTDateIncurred Between '1/1/2013' AND '12/31/2013'"/>
        <asp:ListItem Text="1/10/2012 to 12/31/2012" Value="DTDateIncurred Between '1/10/2012' AND '12/31/2012'"/>  
    </asp:DropDownList>