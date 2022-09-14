using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfirmedBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
    }

    protected void DoneButton_Click(object sender, EventArgs e)
    {
/*        Session["sCustFlag"] = "L"; // L fosr logout
        Session["sFirstName"] = "";
        Session["sUserName"] = "";
        Session["sOrderNo"] = "";
        Session["sAddress"] = "";
        Session["sEmail"] = "";
        Session["sTelephone"] = "";
*/
        DataRoutines logout = new DataRoutines();
        logout.CustLogout();

        Response.Redirect("Default.aspx");
    }
}