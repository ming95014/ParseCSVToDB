<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uMinistryChartByType.ascx.cs" Inherits="ParseCSVToDB.uMinistryChartByType" %>

<div style="text-align:center">
    <h3><asp:Literal ID="litTitle" runat="server" /></h3>   
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
    <br />
    <div style="text-align:left">
        <h3>Select a ministry : </h3>
        <asp:DropDownList ID="ddlMinistry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged_ddlMinistry" />
        <br />
        <h3>Select an official : </h3>
        <asp:DropDownList ID="ddlOfficial" runat="server" AutoPostBack="true" AppendDataBoundItems="true" OnSelectedIndexChanged="OnSelectedIndexChanged_ddlOfficial">
            <asp:ListItem Text="--Select an Official--" Value="" />
        </asp:DropDownList>
        <asp:Label ID="lblSQL" runat="server" Visible="true" ForeColor="white" />
    </div>
</div>