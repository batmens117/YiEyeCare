using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;



public partial class EmpLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["sEmpFlag"] == "F") // sFlag == "F" means emp logged out.
        {

            MessageLabel.Text = "Thank you, see you in office.";
           
        }

       

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        if (PassTextBox.Text == "")
        {
            MessageLabel.Text = "Password is empty";
            PassTextBox.Focus();
        }
        else if (IDTextBox.Text == "")
        {
            MessageLabel.Text = "ID is empty";
            IDTextBox.Focus();
        }
        else
        {
            SqlConnection con = new
            SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

            con.Open();

            SqlCommand loginAdmin = new SqlCommand("Select * from Employees where EmpID=@ID and EmpPass=@Pw ", con);
            loginAdmin.Parameters.AddWithValue("@ID", IDTextBox.Text);
            loginAdmin.Parameters.AddWithValue("@Pw", PassTextBox.Text);
            SqlDataReader dr = loginAdmin.ExecuteReader();

      
            
            while (dr.Read() == true)
            {
                if (IDTextBox.Text == dr["EmpID"].ToString() &&
                   PassTextBox.Text == dr["EmpPass"].ToString())
                {
                    Session["sEmpFlag"] = "T"; // sFlag = "T" means user has logged in
                    Session["sEmpID"] = dr["EmpID"];
                    Session["sEmpAccessLevel"] = dr["EmpAccessLevel"];
                    Session["sEmpFirstName"] = dr["EmpFirstName"];
                    /*                    TheTopLabel = "Welcome " + Session["sSal"] + " " + Session["sFName"] + " " + Session["sLName"];
                                        LogInButton.Visible = false;
                                        SignUpButton.Visible = false;
                                        LogOutButton.Visible = true;
                                        UpdateDetailsButton.Visible = true;
                    */
                    con.Close();
                    Response.Redirect("Employees.aspx");
                } //end of if
            } //end of while loop
            // userid and password not matched, hence login unsuccessful
            MessageLabel.Text = "Login Error. Username & Password do not match";
            /*            LogInButton.Text = "Log In";
                        SignUpButton.Text = "Sign Up"; //to remove this?
            */
            Session["sEmpFlag"] = "F";
            Session["sEmpID"] = "";
            Session["sEmpFirstName"] = "";
            Session["sEmpAccessLevel"] = "";
            con.Close();

        } 

    }
}