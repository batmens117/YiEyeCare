using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;


public partial class Location : System.Web.UI.Page
{
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
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
    }

    protected void SendButton_Click2(object sender, EventArgs e)
    {
        MailMessage mm = new MailMessage("valchowder@gmail.com", "valchowder@gmail.com");
        mm.Subject = SubjectTextBox.Text;
        mm.Body = "Name: " + NameTextBox.Text + "<br /><br />Email: " + EmailTextBox.Text + "<br /><br/>" + MessageTextBox.Text;
        mm.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        System.Net.NetworkCredential NetworkCred = new System.Net.NetworkCredential();
        NetworkCred.UserName = "valchowder@gmail.com";
        NetworkCred.Password = "vcyx1997";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mm);
        lblMessage.Text = "Email Sent SucessFully!";

        NameTextBox.Text = "";
        EmailTextBox.Text = "";
        SubjectTextBox.Text = "";
        MessageTextBox.Text = "";


    }
   
    
}