using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class approveapptnew : System.Web.UI.Page
{

    private string EmpID, EmpName, Name, Date, Time, Address;
    string Email;
    readonly SqlConnection bookcon = new SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void finalizebtn_OnClick(object sender, EventArgs e)
    {
        int INTEmpID = (int)Session["sEmpID"];
        EmpID = INTEmpID.ToString();
        EmpName = (string)Session["sEmpFirstName"];


        var ddl = (Button)sender;
        var row = (GridViewRow)ddl.NamingContainer;
        Date = row.Cells[2].Text;
        Time = row.Cells[4].Text;
        Email = row.Cells[5].Text;
//        UpdateChanges();
        bookcon.Open();
        const string UpdateAvailability =
            "UPDATE Bookings SET EmpID = @EmpID, EmpName = @EmpName, bookingStatus = @status WHERE bookingDate = @date AND bookingTime = @time";
        var cmd4 = new SqlCommand(UpdateAvailability, bookcon);
        cmd4.Parameters.AddWithValue("@EmpID", EmpID);
        cmd4.Parameters.AddWithValue("@EmpName", EmpName);
        cmd4.Parameters.AddWithValue("@status", "Finalised");
        cmd4.Parameters.AddWithValue("@date", Date);
        cmd4.Parameters.AddWithValue("@time", Time);
        cmd4.ExecuteNonQuery();
        bookcon.Close();
        
        GridView2.DataBind();
//        Response.Redirect("approveapptnew");
    }

 /*   public void UpdateChanges()
    {
        
        bookcon.Open();
        const string UpdateAvailability =
            "UPDATE Bookings SET EmpID = @EmpID, EmpName = @EmpName, bookingStatus = @status WHERE bookingDate = @date AND bookingTime = @time";
        var cmd4 = new SqlCommand(UpdateAvailability, bookcon);
        cmd4.Parameters.AddWithValue("@EmpID", (int)Session["EmpID"]);
        cmd4.Parameters.AddWithValue("@EmpName", (string)Session["EmpFirstName"]);
        cmd4.Parameters.AddWithValue("@status", "Finalised");
        cmd4.Parameters.AddWithValue("@date", Date);
        cmd4.Parameters.AddWithValue("@time", Time);
        cmd4.ExecuteNonQuery();
        bookcon.Close();
    }
    */




    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Employees.aspx");

    }
}