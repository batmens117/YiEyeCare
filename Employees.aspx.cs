using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Employees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int AccessLevel;
        AccessLevel = (int)Session["sEmpAccessLevel"];

        if (AccessLevel == 1)
        {
            ImageButton1.Visible = false;
            ImageButton4.Visible = false;
            ImageButton7.Visible = false;
         
        }
      

        if ((string)Session["sEmpFlag"] == "T")  // sFlag == "T" means user has logged in
        {
            WelcomeLabel.Text = "Welcome " + Session["sEmpFirstName"];
   
            LogoutButton.Visible = true;

        }

     

        else if (((string)Session["sEmpFlag"] != "T") && ((string)Session["sEmpFlag"] != "F"))
        {
            WelcomeLabel.Text = "Please log in.";
            
            LogoutButton.Visible = false;
        }

    }
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        LogoutButton.Visible = false;
        
        Session["sEmpFlag"] = "F"; // L fosr logout
        Session["sEmpID"] = "";
        Session["sEmpAccessLevel"] = "";
        Session["sEmpFirstName"] = "";

        Response.Redirect("EmpLogin.aspx");
    }
}