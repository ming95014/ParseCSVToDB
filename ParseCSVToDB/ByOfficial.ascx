<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ByOfficial.ascx.cs" Inherits="ParseCSVToDB.ByOfficial" %>

<h2>Expenses by Officials</h2>

<h3>Top <asp:Literal ID="litTopN" runat="server" /> officials with the higest total expenses</h3>

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
        <asp:BoundField DataField="Name" HeaderText="A. Official (Order by highest total expenses)" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="35%" />
        <asp:BoundField DataField="Ministry" HeaderText="B. Ministry" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="35%" />
        <asp:BoundField DataField="Total" DataFormatString="${0:n}" HeaderText="C. Total Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField DataField="Cnt" DataFormatString="{0:n0}" HeaderText="D. # of Expenses" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
        <asp:BoundField HeaderText="E. Average amount<br> per Expense (C/D)" HtmlEncode="false" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
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
<h4>Change number of officials in the report: </h4>
See : <asp:DropDownList ID="ddlTopN" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>50</asp:ListItem>
        <asp:ListItem>75</asp:ListItem>
        <asp:ListItem>100</asp:ListItem>
      </asp:DropDownList>