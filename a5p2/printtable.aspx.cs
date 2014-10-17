/* Solution: .NET-asp.net-web-applications
 * Project: a5p2
 * File/Module: printtable.aspx.cs
 * Author: Christopher Anzalone 
 */

using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

namespace a5p2
{
    public partial class printtable : System.Web.UI.Page
    {
        private int n;
        private SqlConnection conn = null;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GeneralR(object sender, EventArgs e)
        {
            try
            {
                GetConn();
                ExecuteRetrieval();
                n = 1;
            }
            catch (Exception ex) { n = 0; Response.Write("for debugging: " + ex); }
            finally { if (conn != null) conn.Close(); }
            if (n > 0)
                Response.Write("<h1>retrieval complete</h1>");
            else Response.Write("<h1>retrieval failed</h1>");
            Response.Write
           ("<h1>Perform additional retrievals below, if you wish</h1>");
            Response.Write("<a href=\"mainmenup2.html\">Return to the Main Menu</a>");

            /* Remove old input box values from form.  Note that the 
            property here is Text, not Value as with HtmlInputText objects.
            */
            database.Text = null;
            username.Text = null;
            password.Text = null;
            tablename.Text = null;
        }

        private void GetConn()
        {
            string connString = @"
            server = dbw.cse.fau.edu;
            integrated security = false;
            database = " + database.Text +
            "; user id  = " + username.Text +
            "; password = " + password.Text +
            "; MultipleActiveResultSets = true;";

            conn = new SqlConnection(connString);
            conn.Open();
        }

        private void ExecuteRetrieval()
        {
            SqlDataReader reader1 = null;

            string query1 = "select * from " + tablename.Text;

            SqlCommand cmd1 = new SqlCommand(query1, conn);

            if (IsPostBack)
            {
                reader1 = cmd1.ExecuteReader();
                GridView1.DataSource = reader1;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}