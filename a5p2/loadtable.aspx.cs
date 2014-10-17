/* Solution: .NET-asp.net-web-applications
 * Project: a5p2
 * File/Module: loadtable.aspx.cs
 * Author: Christopher Anzalone
 */

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace a5p2
{
    public partial class loadtable : System.Web.UI.Page
    {
        private SqlConnection conn = null;
        public string header2;
        private int n;

        protected void Page_Load(object src, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetConn();

                /* names will hold the names of the fields of the table being 
                queried. */
                /* types will hold the SQL types of the fields of the table being 
                queried. */
                List<string> fieldnames = new List<string>(),
                  typenames = new List<string>();
                SqlDataReader reader1 = null;

                ArrayList inputs = new ArrayList();

                NameValueCollection c = Request.Params;
                string tablename = c.Get("tablename");
                string query1 = "select * from " + tablename;

                SqlCommand cmd1 = new SqlCommand(query1, conn);
                reader1 = cmd1.ExecuteReader();
                int fieldcount = reader1.FieldCount;

                for (int i = 0; i < fieldcount; i++)
                {
                    fieldnames.Add(reader1.GetName(i));
                    typenames.Add(reader1.GetDataTypeName(i));
                }

                for (int i = 0; i < fieldcount; i++)
                {
                    header2 += "<th>" + fieldnames[i] + "</th>";
                }

                Session["conn"] = conn;
                Session["fieldcount"] = fieldcount;
                Session["fieldnames"] = fieldnames;
                Session["typenames"] = typenames;
                Session["tablename"] = tablename;

                InputRepeater.DataSource = fieldnames;
                InputRepeater.DataBind();

                /* Bind the InputRepeater repeater to the inputs array as its data 
                source.
                */
            }
        }
        private void GetConn()
        {
            /* NOTE : You need to update your connection string
            * based on the database name you created in SQLExpress  */

            NameValueCollection c = Request.Params;
            string database = c.Get("database");
            string username = c.Get("username");
            string password = c.Get("password");

            string connString = @"
            server = dbw.cse.fau.edu;
            integrated security = false;
            database = " + database +
            "; user id  = " + username +
            "; password = " + password +
            "; MultipleActiveResultSets = true;";
            conn = new SqlConnection(connString);
            conn.Open();
        }
        protected void ButtonHandler(object sender, EventArgs e)
        {
            List<string> fieldnames = new List<string>(),
                 typenames = new List<string>();
            string tablename;
            int fieldcount;

            fieldnames = (List<string>)Session["fieldnames"];
            typenames = (List<string>)Session["typenames"];
            conn = (SqlConnection)Session["conn"];
            tablename = (string)Session["tablename"];
            fieldcount = (int)Session["fieldcount"];

            string insert = @"insert into " + tablename + " values(";
            try
            {
                n = 1;
                for (int i = 0; i < fieldcount; i++)
                {
                    insert += "@inputs" + i;
                    if (i + 1 < fieldcount)
                    {
                        insert += ",";
                    }
                }

                insert += ")";

                SqlCommand cmd2 = new SqlCommand(insert, conn);
                for (int i = 0; i < fieldcount; i++)
                {
                    /* Add the @fieldvalue parameter, appropriately setting its 
                    type. */
                    if (typenames[i] == "int")
                    {
                        cmd2.Parameters.Add("@inputs" + i, SqlDbType.Int);
                    }
                    else if (typenames[i] == "float")
                    {
                        cmd2.Parameters.Add("@inputs" + i, SqlDbType.Float);
                    }
                    else
                    {
                        cmd2.Parameters.Add("@inputs" + i, SqlDbType.VarChar, 20); //
                    }
                }
                cmd2.Prepare();

                NameValueCollection c = Request.Params;
                for (int j = 0; j < fieldcount; j++)
                {
                    string input = c.Get(fieldnames[j]);
                    cmd2.Parameters[j].Value = input;
                }

                cmd2.ExecuteNonQuery();
            }
            catch (Exception ex) { n = 0; Response.Write("for debugging: " + ex); }
            finally
            {
                if (conn != null) conn.Close();
                Response.Write("<a href=\"mainmenup2.html\">Return to the Main Menu</a>");
            }
            if (n > 0)
                Response.Write("<h1>insert complete</h1>");
            else Response.Write("<h1>insert failed</h1>");
            Response.Write
           ("<h1>Perform additional inserts below, if you wish</h1>");

        }
    }
}