<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uMinistryChartByType.ascx.cs" Inherits="ParseCSVToDB.uMinistryChartByType" %>

<div style="text-align:center">
    <h3>Expenses by Type of a Ministry</h3>
    Select a ministry : <asp:DropDownList ID="ddlMinistry" runat="server" AutoPostBack="true" />
    <br />
    <table border="1">
        <tr>
            <td width="50%" align="center" valign="middle">
                <asp:Literal ID="litTable" runat="server" />
            </td>
            <td width="50%" align="center" valign="middle">
                <asp:Panel ID="pnlRight" runat="server" />
            </td>
        </tr>
    </table>
    <h4><asp:Literal ID="litTitle" runat="server" /></h4>
</div>