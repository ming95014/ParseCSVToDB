<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ByMinistry.ascx.cs" Inherits="ParseCSVToDB.ByMinistry" %>

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
    <FooterStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" Font-Bold="true" />
    <RowStyle Height="20px" Font-Size="13px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
    <Columns>
        <asp:TemplateField HeaderText="#" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="Ministry" HeaderText="A. Ministry (Order by highest total expenses)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="35%" />
        <asp:BoundField DataField="Total" DataFormatString="${0:n}" HeaderText="B. Total Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Cnt" DataFormatString="{0:n0}" HeaderText="C. # of Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField HeaderText="D. Average amount<br> per Expense (B/C)" HtmlEncode="false" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataFormatString="{0:n0}" HeaderText="E. # of distinct officials submitting expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataFormatString="{0:n0}" HeaderText="F. Average expenses per distinct official (B/E)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataFormatString="{0:n0}" HeaderText="G. Average # expenses per distinct official (C/E)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" />

<h3>Legends and Analysis Summary</h3>
<table cellspacing="0" cellpadding="4" border="1" width="100%">
    <tr bgcolor="cornsilk">
        <td width="50%" align="center"><b>Legend</b></td>
        <td width="50%" align="center"><b>Analysis Summary</b></td>
    </tr>
    <tr>
        <td>
            <ul>
                <li><b>A. Ministries</b> -- lists all ministries involved in the data analaysis during the time range.</li>
                <li><b>B. Total Expenses</b> -- total amount of expenses filed by this ministries.</li>
                <li><b>C. # of Expenses</b> -- total number of expenses filed by this ministries.</li>
                <li><b>D. Average amount per Expense (B/C)</b> -- division of column B over C.</li>
                <li><b>E. # of distinct officials submitting expenses</b> -- for this ministry.</li>
                <li><b>F. Average expenses per distinct official (B/E)</b> -- division of column B over E.</li>
                <li><b>G. Average # expenses per distinct official (C/E)</b> -- division of column C over E.</li>
            </ul>
        </td>
        <td valign="top">
            <ul>
                <li><b>Human Services</b> has expensed the <b>most by amount</b> of all ministries-- <b>$2,900,134.89</b> with <b>590 distinct officials submitting expenses.</b></li>
                <li><b>Human Services</b> has expensed the <b>most by number</b> of all ministries-- <b>48,099</b></li>
                <li><b>International and Intergovernmental Relations</b> has the <b>higest average per expense</b> of all ministries-- <b>$149.69</b></li>
                <li><b>International and Intergovernmental Relations</b> has the <b>higest average expenses per official</b> of all ministries-- <b>$22,123.05</b></li>
                <li><b>Engergy</b> has the <b>higest # of expenses per official</b> of all ministries-- <b>166.59</b></li>
            </ul>
        </td>
    </tr>
</table>
<asp:Literal ID="litError" runat="server" />