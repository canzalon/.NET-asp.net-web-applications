<!-- Solution: .NET-asp.net-web-applications -->
<!-- Project: a5p1 -->
<!-- File/Module: printj.aspx -->
<!-- Author: Christopher Anzalone -->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="printj.aspx.cs" Inherits="a5p1.printj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="j#" DataSourceID="SqlDataSource1" EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="j#" HeaderText="j#" ReadOnly="True" 
                SortExpression="j#" />
            <asp:BoundField DataField="jname" HeaderText="jname" SortExpression="jname" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=dbw.cse.fau.edu;Initial Catalog=canzalon_spjdatabase;Persist Security Info=True;User ID=canzalon;Password=spiritedaway;Pooling=False" 
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [J]">
    </asp:SqlDataSource>
    </form>
</body>
</html>
