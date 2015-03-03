<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ByExpenses.ascx.cs" Inherits="ParseCSVToDB.ByExpenses" %>

<h2>Expenses by Amount</h2>

<h3>Top <asp:Literal ID="litTopN" runat="server" /> expenses with the higest amount</h3>

<asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRowDataBound_GridView1"
    AutoGenerateColumns="false"
    ShowFooter="true"
    ShowHeaderWhenEmpty="true"
    DataSourceID="SqlDataSource1">
    <AlternatingRowStyle BackColor="lightgrey" />
    <PagerStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
    <HeaderStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
    <FooterStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" Font-Bold="true" />
    <RowStyle Height="20px" Font-Size="13px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
    <Columns>
        <asp:TemplateField HeaderText="#" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="Name" HeaderText="A. Official (Order by highest total expenses)" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Position" HeaderText="B. Position" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Ministry" HeaderText="C. Ministry" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Category" HeaderText="D. Category " ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Type" HeaderText="E. Type" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="DateIncurred" HeaderText="F. Date Incurred" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Amount" HeaderText="G. Amount " ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Description" HeaderText="H. Description" ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Receipt" HeaderText="I. Receipt pdf link" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" />
<!--     Ministry	Position	Name	Category	Type	DateIncurred	Amount	Description	Receipt
<h3>Legends and Analysis Summary</h3>
<table cellspacing="0" cellpadding="4" border="1" width="100%">
    <tr bgcolor="cornsilk">
        <td width="50%" align="center"><b>Legend</b></td>
        <td width="50%" align="center"><b>Analysis Summary</b></td>
    </tr>
    <tr>
        <td>
            <ul>
                <li><b>A. Official</b> -- Name of official.</li>
                <li><b>B. Ministry</b> -- ministry this official works in.</li>
                <li><b>C. Total Expenses</b> -- total amount of expenses filed by this ministries.</li>
                <li><b>D. # of Expenses</b> -- total number of expenses filed by this ministries.</li>
                <li><b>E. Average amount per Expense (C/D)</b> -- division of column C over D.</li>
            </ul>
        </td>
        <td valign="top">
            <ul>
                <li>Top 50 officials with the higest <b>amount</b> or <b>number</b> or <b>average per expense</b> by clicking on the headers</li>
            </ul>
        </td>
    </tr>
</table>
-->
<h3>Additional Options</h3>
<asp:Literal ID="litError" runat="server" />
<h4>Change number of expenses in the report: </h4>
See : <asp:DropDownList ID="ddlTopN" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>75</asp:ListItem>
        <asp:ListItem>100</asp:ListItem>
      </asp:DropDownList>