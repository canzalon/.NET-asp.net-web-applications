/* Solution: .NET-asp.net-web-applications
 * Project: a5p3
 * File/Module: canzalon.asmx.cs
 * Author: Christopher Anzalone
 */

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

namespace a5p3
{
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Name= "Web Service", Description="Inserts and selects J records.")] 
    //[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    //[System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Service1 : System.Web.Services.WebService
    {
        private SqlCommand cmd;
        private SqlConnection conn;

        public Service1()//public void _SupplierService()
        {

            //Uncomment the following line if using designed components 
            InitializeComponent();
        }

        [WebMethod(Description = "Inserts a project record")]
        public string Insertj(string jnum, string jname, string city)
        {
            try
            {
                if (conn == null) return "null";
                conn.Open();
                if (Exists(jnum)) return "failed";
                string stmt = @"insert into j values 
                   ('" + jnum + "','" + jname + "','" +
                                 city + "')";
                cmd.CommandText = stmt;
                int n = cmd.ExecuteNonQuery();
                if (n > 0) return "worked";
                else return "failed";
            }
            catch (Exception ex) { return ex + " failed"; }
            finally { if (conn != null) conn.Close(); }
        }

        [WebMethod(Description = "Selects a project record")]
        public string Selectj(string jnum)
        {
            try
            {
                conn.Open();
                if (!Exists(jnum)) return "failed";
                string stmt = @"select * from j where 
                     j# = '" + jnum + "'";
                cmd.CommandText = stmt;

                SqlDataReader reader = null;
                reader = cmd.ExecuteReader();
                string jname = null;
                string city = null;
                while (reader.Read())
                {
                    jname = reader["jname"].ToString();
                    city = reader["city"].ToString();
                }
                int fieldcount = reader.FieldCount;
                reader.Close();
                string jrecord = jnum + " " + jname + " " + city;
                int n = cmd.ExecuteNonQuery();
                if (fieldcount != 0) return jrecord;
                else return "failed";
            }
            catch (Exception e) { return e + "failed"; }
            finally { conn.Close(); }
        }
        bool Exists(string jnum)
        {
            string stmt = @"select count(*) from j where j# = '" + jnum + "'";
            SqlCommand cmd = new SqlCommand(stmt, conn);
            int n = (int)cmd.ExecuteScalar();
            return n > 0;
        }

        private void InitializeComponent()
        {
            this.cmd = new System.Data.SqlClient.SqlCommand();
            this.conn = new System.Data.SqlClient.SqlConnection();
            // 
            // cmd
            // 
            this.cmd.Connection = this.conn;
            // 
            // conn
            // 
            this.conn.ConnectionString = "Data Source=dbw.cse.fau.edu;Initial Catalog=canzalon_spjdatabase;Persist Security" +
    " Info=True;User ID=canzalon;Password=spiritedaway";
            this.conn.FireInfoMessageEventOnUserErrors = false;
            
        }
    }
}