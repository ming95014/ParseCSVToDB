<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uSimpleTableChart.ascx.cs" Inherits="ParseCSVToDB.uSimpleTableChart" %>
<br />
<table>
    <tr>
        <td width="50%">
            <asp:Label ID="lbQuestion" runat="server" Font-Bold="true" />
            <br />
            <table width="300px" border="1" cellspacing="0" cellpadding="4">              
                <asp:Literal ID="litTab" runat="server"/>
            </table>
        </td>
        <td width="50%">
            <asp:Panel ID="pnlRight" runat="server" />
        </td>
    </tr>
</table>
