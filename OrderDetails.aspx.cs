using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class OrderDetails : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Remarks"] != null){
            eyeLabel.Text = (string)Session["Remarks"];
        }
        else
        {
            eyeLabel.Visible = false;
        }

        decimal GrandTotal = (decimal)Session["GrandTotal"];

        SqlConnection con = new
        SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

        decimal CurrentRP;
        string strUsername = (string)Session["sUserName"];
        String strSQLCurrentRewards = "SELECT CustRewardPoints FROM Customers WHERE CustUserName = @CustUser";
        SqlCommand cmd;
        cmd = new SqlCommand(strSQLCurrentRewards, con);
        cmd.Parameters.Add("@CustUser", SqlDbType.VarChar).Value = strUsername;
        con.Open();
        object oCurrentRP = cmd.ExecuteScalar();
        CurrentRP = (decimal)oCurrentRP;
        con.Close();

        decimal NewRP;
        NewRP = CurrentRP + GrandTotal;
        String strSQLUpdate = "UPDATE Customers SET CustRewardPoints = @NewRPOINTS WHERE CustUserName = @CustUser";
        cmd = new SqlCommand(strSQLUpdate, con);
        cmd.Parameters.Add("@NewRPOINTS", SqlDbType.Money).Value = NewRP;
        cmd.Parameters.Add("@CustUser", SqlDbType.VarChar).Value = strUsername;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        string strNewRP;
        strNewRP = NewRP.ToString();
        RPLabel.Text = strNewRP;

        string PP = (string)Session["PP"];
//        string Paid = (string)Session["Paid"];

        if ( ( (PP == "Y") && ((Session["paid"] == null) || (Session["paid"] == "") ) ))
        {
            Response.Write("  <script language='javascript'> window.open('PayMoney.aspx','','width=1020,Height=720,fullscreen=1,location=0,scrollbars=1,menubar=1,toolbar=1'); </script>");
// is it this?            Response.Redirect("OrderDetails.aspx");

            // OR should i redirect instead of open in new window?
        }

        else
        {
            //have the paid method tag.
            decimal Amount = (decimal)Session["Amount"];
            SubtotalLabel.Text = Amount.ToString("C");
            decimal GST = (decimal)Session["GST"];
            GSTLabel.Text = GST.ToString("C");
            decimal DelCost = (decimal)Session["DelCost"];
            DelCostLabel.Text = DelCost.ToString("C");
            decimal AlmostTotal = (decimal)Session["AlmostTotal"];
            TotalLabel.Text = AlmostTotal.ToString("C");
            decimal Disc = (decimal)Session["DiscAmt"];
            DiscLabel.Text = Disc.ToString("C");
            GrandTotalLabel.Text = GrandTotal.ToString("C");
        }
    }
    protected void DoneButton_Click(object sender, EventArgs e)
    {
        string WillBook = (string)Session["WillBook"];
        if (WillBook == "Y")
        {
            Response.Redirect("apptbookingnew.aspx");
        }
        else
        {
/*            Session["sCustFlag"] = "L"; // L fosr logout
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
}