/* Solution: .NET-asp.net-web-applications
 * Project: a5p1
 * File/Module: insertj.aspx.cs
 * Author: Christopher Anzalone
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace a5p1
{
    public partial class insertj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertJ(object sender, EventArgs e)
        {
            int n;
            string jnums = jnum.Text;

            try
            {
                n = SqlDataSource1.Insert();
            }

            catch (Exception ex) { n = 0; }

            if (n > 0) 
            {
                Response.Write("<h1>insert for " + jnums + " complete</h1>");
            }
            else 
            {
                Response.Write("<h1>insert for " + jnums + " failed</h1>"); 
            }

            Response.Write("<h1>insert additional record below, if you wish</h1>");
            Response.Write("<a href=\"mainmenup1.html\">Return to the Main Menu</a>");
            jnum.Text = null;
            jname.Text = null;
            city.Text = null;
        }
    }
}