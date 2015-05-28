<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ByType.ascx.cs" Inherits="ParseCSVToDB.ByType" %>

<h2>Expenses by Type</h2>
<h3><asp:Literal ID="litTitle" runat="server" /></h3>

<asp:GridView ID="GridView1" runat="server"
    OnRowDataBound="OnRowDataBound_GridView1"
    AutoGenerateColumns="false" 
    ShowFooter="true" GridLines="None" AllowSorting="false"
    ShowHeaderWhenEmpty="true" CssClass="HeaderStyle"
    DataSourceID="SqlDataSource1">
    <AlternatingRowStyle BackColor="lightgrey" />
    <PagerStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
    <HeaderStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" />
    <FooterStyle Height="30px" BackColor="#6DC2FF" Font-Size="15px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Right" Font-Bold="true" />
    <RowStyle Height="20px" Font-Size="13px" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
    <Columns>
        <asp:TemplateField HeaderText="#" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="Total" DataFormatString="${0:n}" HeaderText="B. Total Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="15%" SortExpression="Total" />
        <asp:BoundField DataField="Type" HeaderText="C. Type of Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="15%" SortExpression="Name" />
        <asp:BoundField DataField="Ministry" HeaderText="D. Ministry" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="40%" SortExpression="Ministry" />       
        <asp:BoundField DataField="Cnt" DataFormatString="{0:n0}" HeaderText="E. # of Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="15%" SortExpression="Cnt" />
        <asp:BoundField DataField="Average" DataFormatString="${0:n}" HeaderText="F. Average amount<br> per Expense (D/E)" HtmlEncode="false" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" HeaderStyle-Width="15%" SortExpression="Average" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" />
<asp:Label ID="lblSQL" runat="server" Visible="true" ForeColor="White" />
<h3>Legends and Analysis Summary</h3>
<table cellspacing="0" cellpadding="4" border="1" width="100%">
    <tr bgcolor="cornsilk">
        <td width="50%" align="center"><b>Legend</b></td>
        <td width="50%" align="center"><b>Analysis Summary</b></td>
    </tr>
    <tr>
        <td>
            <ul>
                <li><b>B. Total Expenses</b> -- total amount of expenses filed by this ministries.</li>
                <li><b>C. Official</b> -- Name of official.</li>
                <li><b>D. Ministry</b> -- ministry this official works in.</li>             
                <li><b>E. # of Expenses</b> -- total number of expenses filed by this ministries.</li>
                <li><b>F. Average amount per Expense (D/E)</b> -- division of column D over E.</li>
            </ul>
        </td>
        <td valign="top">
            <ul>

                <li>Top 50 expense types with the higest <b>amount</b> or <b>number</b> or <b>average per expense</b> by clicking on the headers</li>
                <!--
                <li><b>Human Services</b> has expensed the <b>most by amount</b> of all ministries-- <b>$2,900,134.89</b> with <b>590 distinct officials submitting expenses.</b></li>
                <li><b>Human Services</b> has expensed the <b>most by number</b> of all ministries-- <b>48,099</b></li>
                <li><b>International and Intergovernmental Relations</b> has the <b>higest average per expense</b> of all ministries-- <b>$149.69</b></li>
                <li><b>International and Intergovernmental Relations</b> has the <b>higest average expenses per official</b> of all ministries-- <b>$22,123.05</b></li>
                <li><b>Engergy</b> has the <b>higest # of expenses per official</b> of all ministries-- <b>166.59</b></li>
                -->
            </ul>
        </td>
    </tr>
</table>

<h3>Additional Options</h3>
<asp:Literal ID="litError" runat="server" />
<h4>Change number of records to report: </h4>
See : <asp:DropDownList ID="ddlTopN" runat="server" AutoPostBack="true">
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>75</asp:ListItem>
        <asp:ListItem>100</asp:ListItem>
      </asp:DropDownList>