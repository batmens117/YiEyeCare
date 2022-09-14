using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["LoginLa"] == "Y")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login required to see product details.')</script>");
            Session["LoginLa"] = "";
        }

        if ((string)Session["PurchaseLogin"] == "Y")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login required to view/add items to shopping cart.')</script>");
            Session["PurchaseLogin"] = "";
        }

        if ((string)Session["bookingLogin"] == "Y")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login required to make booking.')</script>");
            Session["bookingLogin"] = "";
        }
        if ((string)Session["Redeemlogin"] == "Y")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login required to redeem free gift.')</script>");
            Session["Redeemlogin"] = "";
        }
        if ((string)Session["Tracklogin"] == "Y")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login required to track order history.')</script>");
            Session["Tracklogin"] = "";
        }
        if ((string)Session["Accountlogin"] == "Y")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login required to view account page.')</script>");
            Session["Accountlogin"] = "";
        }

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


    protected void signinbtn_Click(object sender, EventArgs e)
    {
        if ( (liuserid.Text == "") && (lipassword.Text == "") )
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Username and password fields are empty.')</script>");
            liuserid.Focus();
        }
        else if (liuserid.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Username field is empty.')</script>");
            liuserid.Focus();
        }
        else if (lipassword.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Password field is empty.')</script>");
            lipassword.Focus();
        }

        else
        {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);
        con.Open();
        

        SqlCommand login = new SqlCommand("Select * from Customers where CustUserName=@Userid and CustPassword=@Pw ", con);
        login.Parameters.AddWithValue("@Userid", liuserid.Text);
        login.Parameters.AddWithValue("@Pw", lipassword.Text);

        SqlDataReader dr = login.ExecuteReader();

        while (dr.Read() == true)
        {
            if (liuserid.Text == dr["CustUserName"].ToString() &&
                lipassword.Text == dr["CustPassword"].ToString())
            {
                Session["sCustFlag"] = "T"; // sFlag = "T" means user has logged in
                Session["sFirstName"] = dr["CustFirstName"];
                Session["sPassword"] = dr["CustPassword"]; ;
                Session["sUserName"] = dr["CustUserName"];
                Session["sLastName"] = dr["CustLastName"];
                Session["sAddress"] = dr["CustAddress"];
                Session["sEmail"] = dr["CustEmail"];
                Session["sTelephone"] = dr["CustPhoneNo"];
                Session["sRightEyeDegree"] = dr["CustEyeDegreeRight"];
                Session["sLeftEyeDegree"] = dr["CustEyeDegreeLeft"];
                Session["sMedicalCondition"] = dr["CustMedicalCon"];
                Session["sRewardPoints"] = dr["CustRewardPoints"];

                con.Close();
                String strUsername = (string)Session["sUsername"];
                DataRoutines DRObject = new DataRoutines();
                DRObject.CreateRecs(strUsername);
                Response.Redirect("Default.aspx");

            }
        }
//        displaylbl.Text = "Error in Log in - Please try again"; 
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Error in Log in - Please enter correct Username and Password.')</script>");

        }
    }
    protected void RegisterBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signup.aspx");
    }
}