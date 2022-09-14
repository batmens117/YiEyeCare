using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


/// <summary>
/// Summary description for BookingHandler
/// </summary>
public class BookingHandler
{
    readonly SqlConnection bookcon = new SqlConnection
    {
        ConnectionString =
        "Data Source=yec.database.windows.net; Initial Catalog=YEC;Integrated Security=False;User ID=yi;Password=Hello999;Connect Timeout=60;Encrypt=False;TrustServerCertificate=False"
    };

    public bool CheckBookings(string date)
    {
        bool BookingFlag = false;
        bookcon.Open();
        const string query =
            "SELECT * FROM BookingsTable WHERE @date = bookingDate";
        var cmd = new SqlCommand(query, bookcon);
        cmd.Parameters.AddWithValue("@date", date);

        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            BookingFlag = true;
        }
        bookcon.Close();
        return BookingFlag;
    }

    public void DeleteBooking(int BookingId)
    {
        bookcon.Open();
        const string query =
            "INSERT INTO Bookings WHERE bookingID = @original_myBookingID)";
        var cmd = new SqlCommand(query, bookcon);
        cmd.Parameters.AddWithValue("@original_myBookingID", BookingId);
        cmd.ExecuteNonQuery();
        bookcon.Close();
    }

    public string GetEmpFirstName(int EmpID)
    {
        string EmpName = "";
        bookcon.Open();
        const string query =
            "SELECT EmpFirstName FROM Employees WHERE @employeeId = EmpID";
        var cmd = new SqlCommand(query, bookcon);
        cmd.Parameters.AddWithValue("@employeeId", EmpID);

        var rdr = cmd.ExecuteReader();
        if (rdr.HasRows)
        {
            rdr.Read();
            EmpName = (string)rdr["EmpFirstName"];
        }
        bookcon.Close();
        return EmpName;
    }

    public void AddDates(string username, string date, string time)
    {
        
        bookcon.Open();
        const string query =
            "INSERT INTO BookingsTable(bookingDate, bookingTime, bookingStatus) VALUES(@date, @time, @status)";
        var cmd = new SqlCommand(query, bookcon);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@time", time);
        cmd.Parameters.AddWithValue("@status", "Available");
        cmd.ExecuteNonQuery();
        bookcon.Close();
    }

    public void CancelBooking(string name, string time, string date)
    {
        bookcon.Open();
        const string query =
            "DELETE Bookings WHERE UserName = @name AND bookingDate = @date AND bookingTime = @time";
        var cmd = new SqlCommand(query, bookcon);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@employee", time);
        cmd.ExecuteNonQuery();
        bookcon.Close();
    }






	public BookingHandler()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}