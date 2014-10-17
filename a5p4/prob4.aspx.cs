/* Solution: .NET-asp.net-web-applications
 * Project: a5p4
 * File/Module: prob4.aspx.cs
 * Author: Christopher Anzalone
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace a5p4
{
    public partial class prob4 : System.Web.UI.Page
    {
        protected int n;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ajaxselect(object sender, EventArgs e)
        {
            Label2.Text = "Okay to submit another transaction.";
            jnum2.Text = null;
        }

        protected void InsertS(object sender, EventArgs e)
        {
            try
            {
                Thread.Sleep(10000);
                n = SqlDataSource3.Insert();
                Label1.Text = null;

            }
            catch (Exception ex)
            {
                n = 0;
                Label1.Text = ex.Message;
            }

            if (n > 0)
            {
                Label1.Text = "Insert Accepted.";
            }
            else
            {
                Label1.Text += "Insert Rejected.";
            }
            Label1.Text = Label1.Text + " Okay to submit another Transaction.";

            /* Remove old input box values from form.  Note that the 
                property here is Text, not Value as with HtmlInputText objects.
            */
            jnum1.Text = null;
            jname.Text = null;
            city.Text = null;

        }

        protected void DeleteJ(object sender, EventArgs e)
        {
            try
            {
                Thread.Sleep(10000);
                n = SqlDataSource1.Delete();
                Label3.Text = null;
            }
            catch (Exception ex)
            {
                n = 0;
                Label3.Text = ex.Message;
            }

            if (n > 0)
            {
                Label3.Text = "Delete Accepted.";
            }
            else
            {
                Label3.Text += "Delete Rejected.";
            }
            Label3.Text = Label3.Text + " Okay to submit another Transaction.";

            /* Remove old input box values from form.  Note that the 
                property here is Text, not Value as with HtmlInputText objects.
            */
            jnum3.Text = null;
        }

        protected void UpdateJ(object sender, EventArgs e)
        {
            try
            {
                Thread.Sleep(10000);
                n = SqlDataSource4.Update();
                Label4.Text = null;
            }
            catch (Exception ex)
            {
                n = 0;
                Label4.Text = ex.Message;
            }

            if (n > 0)
            {
                Label4.Text = "Update Accepted.";
            }
            else
            {
                Label4.Text += "Update Rejected.";
            }
            Label4.Text = Label4.Text + " Okay to submit another Transaction.";

            /* Remove old input box values from form.  Note that the 
                property here is Text, not Value as with HtmlInputText objects.
            */
            jnum4.Text = null;
            newcity.Text = null;
        }
    }
}