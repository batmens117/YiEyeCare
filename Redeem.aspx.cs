using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;

public partial class Redeem : System.Web.UI.Page
{
    decimal RewardPoints;



    protected void Page_Load(object sender, EventArgs e)
    {

        if ((string)Session["sCustFlag"] != "T")
        {
            Session["sUserName"] = "";
            Session["Redeemlogin"] = "Y";
            Response.Redirect("Login.aspx");

        }
        else
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd;
            decimal CurrentRP;
            string strUsername = (string)Session["sUsername"];
            String strSQLCurrentRewards = "SELECT CustRewardPoints FROM Customers WHERE CustUserName = @CustUser";
            cmd = new SqlCommand(strSQLCurrentRewards, con);
            cmd.Parameters.Add("@CustUser", SqlDbType.VarChar).Value = strUsername;
            object oCurrentRP = cmd.ExecuteScalar();
            CurrentRP = (decimal)oCurrentRP;
            RPLabel.Text = CurrentRP.ToString();
            RewardPoints = CurrentRP;
            con.Close();
        }

    }


    protected void RedeemButton_Click(object sender, EventArgs e)
    {
        if (RewardPoints >= 500)
        {
//            MessageLabel.Text = "REDEEMED! COME TO OFFICE TO COLLECT! Please print this page as proof of purchase.";
            MessageLabel.Text = "REDEEMED! You will receive this on your next purchase (Either delivery or in store!)";
 
            decimal NewRewardPoints;
            NewRewardPoints = RewardPoints - 500;
            //Set new reward points.
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd;
            string strUsername = (string)Session["sUsername"];
            String strSQLUpdateRP = "UPDATE Customers SET CustRewardPoints = @NewRP WHERE CustUserName = @CustUser";
            cmd = new SqlCommand(strSQLUpdateRP, con);
            cmd.Parameters.Add("@NewRP", SqlDbType.Money).Value = NewRewardPoints;
            cmd.Parameters.Add("@CustUser", SqlDbType.VarChar).Value = strUsername;
            cmd.ExecuteNonQuery();
            RPLabel.Text = NewRewardPoints.ToString();

            //send da emailllll yoooo
/*            var dateAndTime = DateTime.Now;
            var date = dateAndTime.Date;
           
            var varToday = DateTime.Today.Date;
            string strToday = varToday.ToString();
 */
            var dateTimeNow = DateTime.Now; // Return 00/00/0000 00:00:00
            var dateOnlyString = dateTimeNow.ToShortDateString(); //Return 00/00/0000

            MailMessage mm = new MailMessage("yieyecare@gmail.com", "trevorlouislim@gmail.com");
            mm.Subject = "Redemption of gift";
            mm.Body = string.Format("Hi, <br /><br />{0} has redeemed a bear on {1}. Pls manage.<br /><br />Thank You.", strUsername, dateOnlyString);
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "bellechuazhiqing@gmail.com";
            NetworkCred.Password = "whaawhmdcbhwnjtq";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);

        }
        if (RewardPoints < 500)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('You do not have enough points.')</script>");
        }
    }
}