using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;
using System.Data;

public partial class myaccount : System.Web.UI.Page
{
    public string UFlag = "F";
    public string strUserName;
  

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

        if ((string)Session["sCustFlag"] != "T")
        {
            Session["sUserName"] = "";
            Session["Accountlogin"] = "Y";
            Response.Redirect("Login.aspx");
          
       
        }
        unlbl.Text = (string)Session["sUserName"];
        fnlbl.Text = (string)Session["sFirstName"];
        fnlbl.Text = (string)Session["sFirstName"];
        lnlbl.Text = (string)Session["sLastName"];
        pwlbl.Text = (string)Session["sPassword"];
        phonelbl.Text = (string)Session["sTelephone"];
        addresslbl.Text = (string)Session["sAddress"];
        emaillbl.Text = (string)Session["sEmail"];
        redlbl.Text = Session["sRightEyeDegree"].ToString();
        ledlbl.Text = Session["sLeftEyeDegree"].ToString();
        mclbl.Text = Session["sMedicalCondition"].ToString();
        rplbl.Text = Session["sRewardPoints"].ToString();

    }



   


    }