<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uSimpleTableChart.ascx.cs" Inherits="ParseCSVToDB.uSimpleTableChart" %>
<%@ Register TagPrefix="uc1" TagName="ByMinistry" Src="~/ByMinistry.ascx" %>

<h2>Expenses by All Ministries</h2>
<h3><asp:Literal ID="litTitle" runat="server" /></h3>

<table>
    <tr>
        <td width="50%">
            <uc1:ByMinistry SmallTable="true" runat="server" />
        </td>
        <td width="50%">
            <asp:Panel ID="pnlRight" runat="server" />
        </td>
    </tr>
</table>
