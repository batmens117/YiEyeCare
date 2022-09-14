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



public partial class Login : System.Web.UI.Page
{
        List<string> timeslotList = new List<string>();
    readonly SqlConnection bookcon = new SqlConnection
    {
        ConnectionString =
        "Data Source=yec.database.windows.net; Initial Catalog=YEC;Integrated Security=False;User ID=yi;Password=Hello999;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False"
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["sCustFlag"] != "T")
        {
            Session["sUserName"] = "";
            Session["bookingLogin"] = "Y";
            Response.Redirect("Login.aspx");
        }
    }


    protected void checkdatebtn_Click(object sender, EventArgs e)
    {
        if (Datetb.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Choose a date.')</script>");
        }

        else
        {
        string date = Datetb.Text;
        var varDate = DateTime.Parse(date);
        var varToday = DateTime.Today;

        if (varDate < varToday)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Date selected is before today. You cannot book for a day that has already past. You are not Marty McFly.')</script>");
        }
        else
        {
            //Initialize booking handler
            BookingHandler bh = new BookingHandler();
            bool BookingFlag;
            BookingFlag = bh.CheckBookings(date);

            //If date doesn't exist in table
            if (!BookingFlag)
            {
                //Create bookings with time
                //Add timeslots
                timeslotList.Add("9:00AM - 10:00AM");
                timeslotList.Add("10:00AM - 11:00AM");
                timeslotList.Add("11:00AM - 12:00PM");
                timeslotList.Add("2:00PM - 3:00PM");
                timeslotList.Add("3:00PM - 4:00PM");
                timeslotList.Add("4:00PM - 5:00PM");
                timeslotList.Add("5:00PM - 6:00PM");
                timeslotList.Add("6:00PM - 7:00PM");
                timeslotList.Add("8:00PM - 9:00PM");
                timeslotList.Add("9:00PM - 10:00PM");

                int timeslotCount = timeslotList.Count;
                //Populate table with timeslots
                string username = (string)Session["sUserName"];

                for (int i = 0; i < timeslotCount; i++)
                {
                    bh.AddDates(username, date, timeslotList[i]);
                }
                //Populate Gridview with timings
                bookcon.Open();
                const string query =
                    "SELECT bookingDate, bookingTime, bookingStatus FROM BookingsTable WHERE @date = bookingDate";
                var cmd = new SqlCommand(query, bookcon);
                cmd.Parameters.AddWithValue("@date", date);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                bookcon.Close();
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.UseAccessibleHeader = true;
                //GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

                //Bound Dropdown list
                bookcon.Open();
                const string query2 =
                    "SELECT bookingTime FROM BookingsTable WHERE @date = bookingDate AND @status = bookingStatus";
                var cmd2 = new SqlCommand(query2, bookcon);
                cmd2.Parameters.AddWithValue("@date", date);
                cmd2.Parameters.AddWithValue("@status", "Available");
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);
                bookcon.Close();
                timeddl.DataSource = dt2;
                timeddl.DataBind();
                timeddl.DataTextField = "bookingTime";
                timeddl.DataValueField = "bookingTime";
                timeddl.DataBind();
            }

            else
            {
                bookcon.Open();
                const string query =
                    "SELECT bookingDate, bookingTime, bookingStatus FROM BookingsTable WHERE @date = bookingDate";
                var cmd = new SqlCommand(query, bookcon);
                cmd.Parameters.AddWithValue("@date", date);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                bookcon.Close();
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.UseAccessibleHeader = true;
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

                //Bind Dropdown list
                bookcon.Open();
                const string query2 =
                    "SELECT bookingTime FROM BookingsTable WHERE @date = bookingDate AND @status = bookingStatus";
                var cmd2 = new SqlCommand(query2, bookcon);
                cmd2.Parameters.AddWithValue("@date", date);
                cmd2.Parameters.AddWithValue("@status", "Available");
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);
                bookcon.Close();
                timeddl.DataSource = dt2;
                timeddl.DataBind();
                timeddl.DataTextField = "bookingTime";
                timeddl.DataValueField = "bookingTime";
                timeddl.DataBind();
            }

        }

        }
    }
    protected void bookapptbtn_Click(object sender, EventArgs e)
    {
        if (Datetb.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Choose a date.')</script>");
        }
        if (timeddl.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Choose a time.')</script>");
        }

        else
        {
        string timeslot = timeddl.SelectedItem.Text;
/*        var varTimeslot = DateTime.Parse(timeslot);
        var varNow = DateTime.Now;

        if (varTimeslot < varNow)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Time selected is before now. You cannot book a slot that is already past. H.G. Wells did not write this.')</script>");
        }

        else
        {
        }
*/
            string date = Datetb.Text;
            if (msgtb.Text == "")
            {
                msgtb.Text = "null";
            }
            string message = msgtb.Text;

            //Confirm bookings
            bookcon.Open();
            const string addProduct =
            "INSERT INTO Bookings(bookingDate, bookingTime, UserName, Remarks, email, bookingStatus) VALUES(@date, @time, @username, @message, @email, @status)";
            var cmd = new SqlCommand(addProduct, bookcon);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@time", timeslot);
            cmd.Parameters.AddWithValue("@username", (string)Session["sUserName"]);
            cmd.Parameters.AddWithValue("@message", message);
            cmd.Parameters.AddWithValue("@email", (string)Session["sEmail"]);
            cmd.Parameters.AddWithValue("@status", "Pending");
            cmd.ExecuteNonQuery();
            bookcon.Close();

            //Change Status in unavailable
            bookcon.Open();
            const string UpdateAvailability =
            "UPDATE BookingsTable SET bookingStatus = @status WHERE bookingDate = @date AND bookingTime = @time";
            var cmd4 = new SqlCommand(UpdateAvailability, bookcon);
            cmd4.Parameters.AddWithValue("@status", "Unavailable");
            cmd4.Parameters.AddWithValue("@date", date);
            cmd4.Parameters.AddWithValue("@time", timeslot);
            cmd4.ExecuteNonQuery();
            bookcon.Close();

            //send da emailllll yoooo

            MailMessage mm = new MailMessage("belle_chua97@hotmail.com", (string)Session["sEmail"]);
            mm.Subject = "Booking Success";
            mm.Body = string.Format("Hi {0}, <br /><br />You have booked an appointment on {1}, at {2}, <br /><br />Thank You.", (string)Session["sUserName"], date, timeslot);
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

            //popup
            //        Response.Write("  <script language='javascript'> window.open('ConfirmedBooking.aspx','','width=1020,Height=720,fullscreen=1,location=0,scrollbars=1,menubar=1,toolbar=1'); </script>");
            //redirect
            Response.Redirect("ConfirmedBooking.aspx");


        }
    }
}