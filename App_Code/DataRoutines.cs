using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for DataRoutines
/// </summary>
public class DataRoutines : System.Web.UI.Page
{
    public void CustLogout()
    {
        Session["sFirstName"] = "";
        Session["sPassword"] = "";
        Session["sUserName"] = "";
        Session["sLastName"] = "";
        Session["sAddress"] = "";
        Session["sEmail"] = "";
        Session["sTelephone"] = "";
        Session["sRightEyeDegree"] = "";
        Session["sLeftEyeDegree"] = "";
        Session["sMedicalCondition"] = "";
        Session["sRewardPoints"] = "";
        Session["sCustFlag"] = "L";
        Session["sOrderNo"] = "";
        Session["Amount"] = "";
        Session["GST"] = "";
        Session["remarks"] = "";
        Session["DelCost"] = "";
        Session["Cash"] = "";
        Session["PP"] = "";
        Session["DiscAmt"] = "";
        Session["AlmostTotal"] = "";
        Session["GrandTotal"] = "";
        Session["HotCode"] = "";
        Session["LoveCode"] = "";
        Session["paid"] = "";
        Session["WillBook"] = "";
    }

    public DataRoutines()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void CreateRecs(string strUsername)
    {
        SqlConnection con = new
           SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

        SqlCommand cmd;
        SqlDataReader rdr;
        string strSql;
        string strOFlag = "F";

        // check to see if there is an active order record
        strSql = "SELECT orderStatus FROM Orders WHERE orderUserName = @Username "
            + "ORDER BY orderID DESC;";
        cmd = new SqlCommand(strSql, con);
        cmd.Parameters.Add("@Username", SqlDbType.VarChar).Value = strUsername;
        con.Open();
        rdr = cmd.ExecuteReader();
        Boolean booRows = rdr.HasRows;
        if (booRows)  // when booRows is true, there are order records for the user 
        {
            rdr.Read();
            if ((string)rdr["orderStatus"] != "Ordering") //status of an active order is "Ordering"
            {
                strOFlag = "T"; // "T" means there is a need to create a new Orders record
            }
        }
        else { strOFlag = "T"; }
        con.Close();
        if (strOFlag == "T")
        {
            DateTime now = DateTime.Today;

            // insert a new order record
            String strStatus = "Ordering";
            strSql = "INSERT INTO Orders (orderUserName, orderStatus, orderDate) VALUES (@Username, @Status, @orderDate)";
            cmd = new SqlCommand(strSql, con);
            cmd.Parameters.Add("@Username", SqlDbType.VarChar).Value = strUsername;
            cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = strStatus;
            cmd.Parameters.Add("@orderDate", SqlDbType.DateTime).Value = now;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        // retrieve order No - this order No is needed when the user buys an item
        strSql = "SELECT orderID FROM Orders WHERE orderUserName = @Username "
            + "ORDER BY orderID DESC;";
        cmd = new SqlCommand(strSql, con);
        cmd.Parameters.Add("@Username", SqlDbType.VarChar).Value = strUsername;
        con.Open();
        rdr = cmd.ExecuteReader();
        rdr.Read();
        Session["sOrderNo"] = rdr["orderID"];
        // store the active order no in sOrderNo
        con.Close();
        return;
    } //end of CreateRecs method
}