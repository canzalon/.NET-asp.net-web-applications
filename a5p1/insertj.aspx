<!-- Solution: .NET-asp.net-web-applications -->
<!-- Project: a5p1 -->
<!-- File/Module: insertj.aspx -->
<!-- Author: Christopher Anzalone -->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insertj.aspx.cs" Inherits="a5p1.insertj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1> Enter Project's J# : </h1>
        <asp:TextBox ID="jnum" size="35" runat="server"></asp:TextBox>
        <br />
        <h1> Enter Projects's Name : </h1>
        <asp:TextBox ID="jname" size="35" runat="server"></asp:TextBox>
        <br />
        <h1> Enter Projects's City : </h1>
        <asp:TextBox ID="city" size="35" runat="server"></asp:TextBox>
        <br />
        
        <asp:Button ID="Button1"  OnClick="InsertJ" runat="server" Text="Submit Insert" />
        <br />
        <br />

    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=dbw.cse.fau.edu;Initial Catalog=canzalon_spjdatabase;Persist Security Info=True;User ID=canzalon;Password=spiritedaway;Pooling=False" 
        DeleteCommand="DELETE FROM [J] WHERE [j#] = @jnum" 
        InsertCommand="INSERT INTO [J] ([j#], [jname], [city]) VALUES (@jnum, @jname, @city)" 
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [J]" 
        UpdateCommand="UPDATE [J] SET [jname] = @jname, [city] = @city WHERE [j#] = @jnum">
        <DeleteParameters>
            <asp:Parameter Name="jnum" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:FormParameter Name="jnum" FormField="jnum" />
            <asp:FormParameter Name="jname" FormField="jname" />
            <asp:FormParameter Name="city" FormField="city" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="jname" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="jnum" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
