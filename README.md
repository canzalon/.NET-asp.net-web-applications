.NET-asp.net-web-applications
=============================
This assignment from my .NET course has me utilizing the ASP.NET web application framework in order to create three dynamic web application projects and one web service. The web apps are comprised of aspx files for the front-end events and controls with code-behind files of C# code that carries out the server-side computing. This is similar to the web service, with an asmx file and code-behind file, though differs in that it is less concerned with the GUI than its web app counterpart.

The first web application project consists of the previous J Table Functions from the .NET-transact-sql-database and .NET-ado.net-linq-database solutions, re-interpreted using the ASP.NET framework. Specifically, the routines/procedures insertj, printj, and jsp are reconstructed as an ASP.NET web application with an html interface. Each of these functions is comprised of a markup file (.aspx) and a code-behind file (aspx.cs); thus, this problem uses the code-behind page model. The code-behind file contains programming code that compliments the functionality in the aspx files. 

The second project transforms the general purpose load utility C# ADO.NET program from the .NET-ado.net-linq-database solution into an ASP.NET web application. 

The third project is a web service (.asmx/asmx.cs) which defines two web methods: insertj and selectj. Insertj allows the user to input a J record (jnum, jname and city) into the J table. Selectj returns the jnum, jname, and city associated with the jnum that is entered by the user. 

The fourth project is an ASP.NET AJAX Web Form/Application that asynchronously displays the contents and changes of the J table. The user has the ability to insert, delete, and update the table. 

For more specific, technical details about each project in the solution, see assig5.doc. 