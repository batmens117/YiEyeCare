using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class aboutus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["sCustFlag"] == "T")  // sFlag == "T" means user has logged in
        {
            trylbl.Visible = true;
            trylbl.Text = "Welcome " + Session["sFirstName"] + "  ";
            logoutlbl.Visible = true;

        }

        if ((string)Session["sCustFlag"] == "L") // sFlag == "L" means user has logged out
        {

            trylbl.Visible = false;
            logoutlbl.Visible = false;
        }
    }
}