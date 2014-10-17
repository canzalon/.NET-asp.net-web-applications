/* Solution: .NET-asp.net-web-applications
 * Project: a5p1
 * File/Module: jsp.aspx.cs
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
    public partial class jsp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit1(object sender, EventArgs e)
        {
            Response.Write("<a href=\"mainmenup1.html\">Return to the Main Menu</a>");
        }
    }
}