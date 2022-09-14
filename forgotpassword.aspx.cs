using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void fpbtn_Click(object sender, EventArgs e)
    {
        string username = string.Empty;
    string password = string.Empty;
    string constr = ConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString;
    using (SqlConnection con = new SqlConnection(constr))
    {
        using (SqlCommand cmd = new SqlCommand("SELECT CustUserName, [CustPassword] FROM Customers WHERE CustEmail = @Email"))
        {
            cmd.Parameters.AddWithValue("@Email", fpuseremail.Text.Trim());
            cmd.Connection = con;
            con.Open();
            using (SqlDataReader sdr = cmd.ExecuteReader())
            {
                if (sdr.Read())
                {
                    username = sdr["CustUserName"].ToString();
                    password = sdr["CustPassword"].ToString();
                }
            }
            con.Close();
        }
    }
    if (!string.IsNullOrEmpty(password))
    {
        MailMessage mm = new MailMessage("belle_chua97@hotmail.com", fpuseremail.Text.Trim());
        mm.Subject = "Password Recovery";
        mm.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", username, password);
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
        displaylbl.ForeColor = Color.Green;
        displaylbl.Text = "Password has been sent to your email address.";
    }
    else
    {
        displaylbl.ForeColor = Color.Red;
        displaylbl.Text = "This email address does not match our records.";
    }
}
    }

        