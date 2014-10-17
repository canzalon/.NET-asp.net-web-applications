<!-- Solution: .NET-asp.net-web-applications -->
<!-- Project: a5p1 -->
<!-- File/Module: jsp.aspx -->
<!-- Author: Christopher Anzalone -->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jsp.aspx.cs" Inherits="a5p1.jsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1> Enter Supplier's S# : </h1>
        <asp:TextBox ID="snum" size="35" runat="server"></asp:TextBox>
        <br />
        <h1> Enter Parts's P# : </h1>
        <asp:TextBox ID="pnum" size="35" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1"  OnClick="Submit1" runat="server" Text="Submit" />
        <br />
        <br />
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="j#" DataSourceID="canzalon_sqldatasource" 
    EnableModelValidation="True">
        <Columns>
            <asp:BoundField DataField="j#" HeaderText="j#" ReadOnly="True" 
                SortExpression="j#" />
            <asp:BoundField DataField="jname" HeaderText="jname" SortExpression="jname" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="canzalon_sqldatasource" runat="server" 
        ConnectionString="Data Source=dbw.cse.fau.edu;Initial Catalog=canzalon_spjdatabase;Persist Security Info=True;User ID=canzalon;Password=spiritedaway;Pooling=False" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="select j.* from j, spj where spj.p# = @pnum and spj.s# = @snum and spj.j# =j.j#">
        <SelectParameters>
           <asp:FormParameter Name="snum" FormField="snum" />
            <asp:FormParameter Name="pnum" FormField="pnum" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
