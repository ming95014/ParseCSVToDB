<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ByMinistry.ascx.cs" Inherits="ParseCSVToDB.ByMinistry" %>

<h2>Expenses by All Ministries</h2>
<h3><asp:Literal ID="litTitle" runat="server" /></h3>

<asp:GridView ID="GridView1" runat="server"
    OnRowDataBound="OnRowDataBound_GridView1" 
    OnDataBound="GridView1_DataBound"   
    AutoGenerateColumns="false"
    ShowFooter="true" GridLines="None" AllowSorting="false"
    ShowHeaderWhenEmpty="true" CssClass="HeaderStyle"
    DataSourceID="SqlDataSource1">
    <AlternatingRowStyle BackColor="lightgrey" />
    <PagerStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
    <HeaderStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
    <FooterStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" Font-Bold="true" />
    <RowStyle Height="20px" Font-Size="13px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
    <Columns>
        <asp:TemplateField HeaderText="#" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="1%"/>
        <asp:BoundField DataField="Ministry" HeaderText="B. Ministry (Order by highest total expenses)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="35%" />
        <asp:BoundField DataField="Total" DataFormatString="${0:n}" HeaderText="C. Total Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Cnt" DataFormatString="{0:n0}" HeaderText="D. # of Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField HeaderText="E. Average amount<br> per Expense (C/D)" HtmlEncode="false" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataFormatString="{0:n0}" HeaderText="F. # of distinct officials submitting expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataFormatString="{0:n0}" HeaderText="G. Average expenses per distinct official (C/F)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataFormatString="{0:n0}" HeaderText="H. Average # expenses per distinct official (D/F)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" />
<asp:Label ID="lblSQL" runat="server" Visible="true" />

<h3>Legends and Analysis Summary</h3>
<table cellspacing="0" cellpadding="4" border="1" width="100%">
    <tr bgcolor="cornsilk">
        <td width="50%" align="center"><b>Legend</b></td>
        <td width="50%" align="center"><b>Analysis Summary</b></td>
    </tr>
    <tr>
        <td>
            <ul>
                <li><b>B. Ministries</b> -- lists all ministries involved in the data analaysis during the time range.</li>
                <li><b>C. Total Expenses</b> -- total amount of expenses filed by this ministries.</li>
                <li><b>D. # of Expenses</b> -- total number of expenses filed by this ministries.</li>
                <li><b>E. Average amount per Expense (B/C)</b> -- division of column B over C.</li>
                <li><b>F. # of distinct officials submitting expenses</b> -- for this ministry.</li>
                <li><b>G. Average expenses per distinct official (B/E)</b> -- division of column B over E.</li>
                <li><b>H. Average # expenses per distinct official (C/E)</b> -- division of column C over E.</li>
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
