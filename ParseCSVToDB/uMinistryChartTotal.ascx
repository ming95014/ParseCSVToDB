<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uMinistryChartTotal.ascx.cs" Inherits="ParseCSVToDB.uMinistryChartTotal" %>
<%@ Register TagPrefix="uc1" TagName="ByMinistry" Src="~/ByMinistry.ascx" %>

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
