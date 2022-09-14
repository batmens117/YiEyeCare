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

public partial class UpdateDetails : System.Web.UI.Page
{
    public string UFlag = "F";
    public string strUserName;
    static readonly string scriptSuccessUpdate = "<script language=\"javascript\">\n" +
        "alert (\"Update Successful - Please refresh for it to take effect\");\n </script>";


    protected void Page_Load(object sender, EventArgs e)
    {
        wclbl.Text = (string)Session["sFirstName"];
        fnlbl.Text = (string)Session["sFirstName"];
        lnlbl.Text = (string)Session["sLastName"];
        pwlbl.Text = (string)Session["sPassword"];
        phonelbl.Text = (string)Session["sTelephone"];
        addresslbl.Text = (string)Session["sAddress"];
        emaillbl.Text = (string)Session["sEmail"];

    }



    protected void updatebtn_Click(object sender, EventArgs e)
    {
         strUserName = (string)Session["sUserName"];

         if (fntb.Text != "")
         {
             String strFName = "CustFirstName";
             String strFValue = fntb.Text;
             UpdateCustomer(strFName, strFValue);
             Session["sFirstName"] = fntb.Text;
         }

         if (lntb.Text != "")
         {
             String strFName = "CustLastName";
             String strFValue = lntb.Text;
             UpdateCustomer(strFName, strFValue);
             Session["sLastName"] = lntb.Text;
         }

        if (pwtb.Text != "")
        {
            String strFName = "CustPassword";
            String strFValue = pwtb.Text;
            UpdateCustomer(strFName, strFValue);
            Session["sPassword"] = pwtb.Text;
        }

        if (phonetb.Text != "")
        {
            String strFName = "CustPhoneNo";
            String strFValue = phonetb.Text;
            UpdateCustomer(strFName, strFValue);
            Session["sTelephone"] = phonetb.Text;
        }
        if (addresstb.Text != "")
        {
            String strFName = "CustAddress";
            String strFValue = addresstb.Text;
            UpdateCustomer(strFName, strFValue);
            Session["sAddress"] = addresstb.Text;
        }
        if (emailtb.Text != "")
        {
            String strFName = "CustEmail";
            String strFValue = emailtb.Text;
            UpdateCustomer(strFName, strFValue);
            Session["sEmail"] = emailtb.Text;
        }
        if (UFlag == "T")
        {
            Type strType = this.GetType();
            ClientScript.RegisterStartupScript(strType, "Success", scriptSuccessUpdate);
        }
    }

    public void UpdateCustomer(string strFName, string strFValue)
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);
        con.Open();

        SqlCommand login;
        String strSQL = "UPDATE Customers  SET " + strFName + " = @newValue WHERE CustUserName = @CustUserName";
        login = new SqlCommand(strSQL, con);


        login.Parameters.Add("@newValue", SqlDbType.VarChar).Value = strFValue;
        login.Parameters.Add("@CustUserName", SqlDbType.VarChar).Value = strUserName;
        login.ExecuteNonQuery();

        UFlag = "T";
        con.Close();

    }
    protected void refreshbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("UpdateDetails.aspx");
    }
}