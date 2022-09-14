using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Signup : System.Web.UI.Page
{

    static readonly string scriptErrorUserID =
     "<script language=\"javascript\">\n" +
     "alert (\"Username you keyed in is in use, please key in another username\");\n" +
     "</script>";

    static readonly string scriptSuccessNewAccount =
    "<script language=\"javascript\">\n" +
    "alert (\"Your account has been succesfully created - Thank You! Please log in to continue. \");\n" +
    "</script>";
    protected void Page_Load(object sender, EventArgs e)
    {

        if ((string)Session["sCustFlag"] == "T")  // sFlag == "T" means user has logged in
        {
            trylbl.Visible = true;
            trylbl.Text = "Welcome " + Session["sFirstName"] + "  ";
            logoutlbl.Visible = true;
            subtn.Enabled = false;

            sulabel.Text = "You are already signed in";
            suusername.ReadOnly = true;
            supw.ReadOnly = true;
            sucpw.ReadOnly = true;
            sufn.ReadOnly = true;
            suln.ReadOnly = true;
            suphone.ReadOnly = true;
            suaddress.ReadOnly = true;
            suemail.ReadOnly = true;

            
        }

        if ((string)Session["sCustFlag"] == "L") // sFlag == "L" means user has logged out
        {

            trylbl.Visible = false;
            logoutlbl.Visible = false;
            subtn.Enabled = true;
            sulabel.Text = "";
            suusername.ReadOnly = false;
            supw.ReadOnly = false;
            sucpw.ReadOnly = false;
            sufn.ReadOnly = false;
            suln.ReadOnly = false;
            suphone.ReadOnly = false;
            suaddress.ReadOnly = false;
            suemail.ReadOnly = false;
        }
    }
    protected void subtn_Click(object sender, EventArgs e)
    {

        if (tnc.Checked == false)
        {
            sulabel.Text = "Please accept terms and conditions";
            tnc.Focus();
        }

        else if ((int.Parse(suphone.Text) > 99999999) || (int.Parse(suphone.Text) < 80000000))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Invalid phone number.')</script>");
            suphone.Focus();
        }

        else if ( (int.Parse(ageTB.Text) > 90) && (Session["YesOld"] != "Y") )
        {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Are you sure you are above the age of 90?')</script>");
                Session["YesOld"] = "Y";
                suphone.Focus();
        }

        else {
            Session["YesOld"] = "";
        SqlConnection con = new
      SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);
        con.Open();
        Type cstype = this.GetType();

        SqlCommand login = new SqlCommand("SELECT CustUserName FROM Customers  ORDER BY CustUserName", con);

        SqlDataReader dr = login.ExecuteReader();
        


        while (dr.Read() == true)
        {
            if (suusername.Text == (string)dr["CustUserName"])
            {
                ClientScript.RegisterStartupScript(cstype, "Error", scriptErrorUserID);
                con.Close();
                return;
            }
        }

            dr.Close();
            // insert new record

            if (MedConTB.Text == "")
            {
                MedConTB.Text = "NIL";
            }

            string SQLInsert = "INSERT INTO "
                + " Customers  (CustUserName, CustPassword,CustSalutation, CustFirstName,CustLastName,CustPhoneNo,CustAddress,CustEmail,CustRewardPoints, CustMedicalCon, CustAge)"
                + " VALUES (@uid, @pw,@salut, @Fname,@Lname,@tel,@address ,@em, @RP, @MC, @Age)";

            var cmd = new SqlCommand(SQLInsert, con);

            cmd.Parameters.AddWithValue("@uid", suusername.Text);
            cmd.Parameters.AddWithValue("@pw", supw.Text);
            cmd.Parameters.AddWithValue("@salut", salddl.Text);
            cmd.Parameters.AddWithValue("@Fname", sufn.Text);
            cmd.Parameters.AddWithValue("@Lname", suln.Text);
            cmd.Parameters.AddWithValue("@tel", suphone.Text);
            cmd.Parameters.AddWithValue("@address", suaddress.Text);
            cmd.Parameters.AddWithValue("@em", suemail.Text);
            cmd.Parameters.AddWithValue("@RP", "0");
            cmd.Parameters.AddWithValue("@MC", MedConTB.Text);
            cmd.Parameters.AddWithValue("@Age", ageTB.Text);


            suusername.Text = "";
            sufn.Text = "";
            suln.Text = "";
            suphone.Text = "";
            suaddress.Text = "";
            suemail.Text = "";
            ageTB.Text = "";
            MedConTB.Text = "";

            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(cstype, "Success", scriptSuccessNewAccount);
            Response.Redirect("Login.aspx");

            // prepare Session variables for newly registered customer
            Session["sFlag"] = "T";
            Session["sUserID"] = (string)suusername.Text;
            Session["sFirstName"] = (string)sufn.Text;
            Session["sLastName"] = (string)suln.Text;
            Session["sAddress"] = (string)suaddress.Text;
            Session["sTelephone"] = (string)suphone.Text;
            Session["sEmail"] = (string)suemail.Text;


        }
            
    }
    protected void tncButton_Click(object sender, EventArgs e)
    {
        Response.Write("  <script language='javascript'> window.open('Termsncondition.aspx','','width=1020,Height=720,fullscreen=1,location=0,scrollbars=1,menubar=1,toolbar=1'); </script>");
    }
}
