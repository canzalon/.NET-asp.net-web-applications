<!-- Solution: .NET-asp.net-web-applications -->
<!-- Project: a5p2 -->
<!-- File/Module: loadtable.aspx -->
<!-- Author: Christopher Anzalone -->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loadtable.aspx.cs" Inherits="a5p2.loadtable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LOAD TABLE</title>
</head>
<body>
    <h2> Load Table Record </h2>
    <form id="form1" runat="server">
        <div>
        <asp:Repeater ID="InputRepeater" runat="server">
        <HeaderTemplate>
            <table>
            <tr>
            <%# header2 %>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <td>
            <input type="text" name="<%# Container.DataItem %>" size="35"/>
            </td>
        </ItemTemplate>
        <FooterTemplate>
          </table>
        </FooterTemplate>
        </asp:Repeater>
        <p>
        <asp:Button ID="Button1" OnClick="ButtonHandler" Text="Submit Insert" runat="server"/>
        </p>
        </div>
    </form>
</body>
</html>
