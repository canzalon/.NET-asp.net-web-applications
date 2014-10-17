<!-- Solution: .NET-asp.net-web-applications -->
<!-- Project: a5p4 -->
<!-- File/Module: prob4.aspx -->
<!-- Author: Christopher Anzalone -->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prob4.aspx.cs" Inherits="a5p4.prob4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Problem 4 (AJAX): </title>
</head>
<body>
    <h1>AJAX J PAGE</h1>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="10">
            <ProgressTemplate>
                <h3>Submission is in progress, please do not submit another transaction yet.</h3>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table>
                    <tr>
                        <th>J#</th>
                        <th>JNAME</th>
                        <th style="width: 158px">CITY</th>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="jnum1" runat="server" /></td>
                        <td><asp:TextBox ID="jname" runat="server" /></td>
                        <td><asp:TextBox ID="city" runat="server" /></td>
                    </tr>
                </table>
                <asp:Label ID="Label1" runat="server" Width="500px"></asp:Label>
                <br />                
                <asp:Button ID="Button2" OnClick="InsertS" Text="Submit Insert" runat="server" />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                 ConnectionString="server=dbw.cse.fau.edu;database=canzalon_spjdatabase;Integrated Security=false;user id=canzalon;password=spiritedaway" 
                 InsertCommand="INSERT INTO [J] ([j#], [jname], [city]) VALUES (@column1, @jname, @city)" 
                 ProviderName="System.Data.SqlClient" >
                   <InsertParameters>
                        <asp:FormParameter FormField="jnum1" Name="column1" Type="String" />
                        <asp:FormParameter FormField="jname" Name="jname" Type="String" />
                        <asp:FormParameter FormField="city" Name="city" Type="String" />
                   </InsertParameters>
                </asp:SqlDataSource>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div>
        <asp:UpdateProgress ID="UpdateProgress3" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel3" DisplayAfter="10">
            <ProgressTemplate>
                <h3>Delete is in progress, please do not submit another transaction yet.</h3>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>

    <div>
        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table>
                    <tr>
                        <th>J#</th>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="jnum3" runat="server" /></td>
                    </tr>
                </table>
                <asp:Label ID="Label3" runat="server" Width="500px"></asp:Label>
                <br />                
                <asp:Button ID="Button1" OnClick="DeleteJ" Text="Submit Deletion" runat="server" />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="server=dbw.cse.fau.edu;database=canzalon_spjdatabase;Integrated Security=false;user id=canzalon;password=spiritedaway" 
                 DeleteCommand="DELETE FROM [J] WHERE ([j#] = @column3)" 
                 ProviderName="System.Data.SqlClient" >
                   <DeleteParameters>
                        <asp:FormParameter FormField="jnum3" Name="column3" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div>
        <asp:UpdateProgress ID="UpdateProgress4" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel4" DisplayAfter="10">
            <ProgressTemplate>
                <h3>Update is in progress, please do not submit another transaction yet.</h3>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>

    <div>
        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table>
                    <tr>
                        <th>J#</th>
                        <th>NEW CITY</th>
                    </tr>
                    <tr>
                        <td><asp:TextBox ID="jnum4" runat="server" /></td>
                        <td><asp:TextBox ID="newcity" runat="server" /></td>
                    </tr>
                </table>
                <asp:Label ID="Label4" runat="server" Width="500px"></asp:Label>
                <br />                
                <asp:Button ID="Button4" OnClick="UpdateJ" Text="Submit Update" runat="server" />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                 ConnectionString="server=dbw.cse.fau.edu;database=canzalon_spjdatabase;Integrated Security=false;user id=canzalon;password=spiritedaway" 
                 UpdateCommand="UPDATE [J] SET [city] = @newcity WHERE [j#] = @column4" 
                 ProviderName="System.Data.SqlClient" >
                   <UpdateParameters>
                        <asp:FormParameter FormField="jnum4" Name="column4" Type="String" />
                        <asp:FormParameter FormField="newcity" Name="newcity" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div>
        <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
            AssociatedUpdatePanelID="UpdatePanel2" DisplayAfter="10">
            <ProgressTemplate>
                <h3>Print is in progress, please do not submit another transaction yet.</h3>
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>

    <div>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:TextBox ID="jnum2" runat="server"></asp:TextBox>&nbsp;
                <br />
                <asp:Button ID="Button3" runat="server" OnClick="ajaxselect" Text="Submit AJAX Select" />
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="j#" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="j#" HeaderText="j#" ReadOnly="True" 
                            SortExpression="j#" />
                        <asp:BoundField DataField="jname" HeaderText="jname" SortExpression="jname" />
                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                          ConnectionString="server=dbw.cse.fau.edu;database=canzalon_spjdatabase;Integrated Security=false;user id=canzalon;password=spiritedaway" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT * FROM [J] WHERE ([j#] = @column1)">
                    <SelectParameters>
                        <asp:FormParameter FormField="jnum2" Name="column1" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="Label2" runat="server" Width="500px"></asp:Label>
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    </form>
</body>
</html>
