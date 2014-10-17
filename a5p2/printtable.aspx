<!-- Solution: .NET-asp.net-web-applications -->
<!-- Project: a5p2 -->
<!-- File/Module: printtable.aspx -->
<!-- Author: Christopher Anzalone -->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printtable.aspx.cs" Inherits="a5p2.printtable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>
        <asp:GridView ID="GridView1" runat="server" PageSize="50" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        </asp:GridView>
        </p>
        <h1>
            Enter Database Name:
        </h1>
        <asp:TextBox ID="database" size="35" runat="server" />
        <br />
        <h1>
            Enter Username:
        </h1>
        <asp:TextBox ID="username" size="35" runat="server" />
        <br />
        <h1>
            Enter Password:
        </h1>
        <asp:TextBox ID="password" size="35" runat="server" />
        <br />
        <h1>
            Enter Table Name:
        </h1>
        <asp:TextBox ID="tablename" size="35" runat="server" />
        <br />
        <p>
            <asp:Button ID="Button1" OnClick="GeneralR" Text="Submit Retreival" runat="server" />
        </p>
    </div>
    </form>
</body>
</html>
