using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class CustRecords : System.Web.UI.Page
{

    protected void GridView1_PageIndexChanging(Object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindStuff();
        
    }

    private void bindStuff()
    {
        SqlConnection sqlCon = new
        SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

        string Query = string.Empty;
        sqlCon.Open();

        if (Session["CustRecordsCategory"] != null)
        {
            //DropDownList1.SelectedValue = Session["CustRecordsCategory"].ToString();
            Query = "SELECT * FROM Customers WHERE " + Session["CustRecordsCategory"].ToString() + " Like '" + txtSearchName.Text + "%'";

            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();
        }

        else
        {
            Query = "SELECT * FROM Customers";
            //            Query = "SELECT * FROM Employees WHERE " + Session["Category"].ToString() + " Like '" + txtSearchName.Text + "%'";

            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();

        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        bindStuff();
        
        /*

        SqlConnection sqlCon = new
        SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

        string Query = string.Empty;
        sqlCon.Open();

        if (Session["CustRecordsCategory"] != null)
        {
            //DropDownList1.SelectedValue = Session["CustRecordsCategory"].ToString();
            Query = "SELECT * FROM Customers WHERE " + Session["CustRecordsCategory"].ToString() + " Like '" + txtSearchName.Text + "%'";

            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();
        }

        else
        {
            Query = "SELECT * FROM Customers";
            //            Query = "SELECT * FROM Employees WHERE " + Session["Category"].ToString() + " Like '" + txtSearchName.Text + "%'";

            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();

        }
*/    }

    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        GridView1.DataBind();
        GridView1.SelectRow(-1);
    }
    protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        GridView1.DataBind();
        GridView1.SelectRow(-1);
    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {

        GridView1.DataBind();
        GridView1.SelectRow(-1);
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SqlConnection sqlCon = new
        SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

        string Query = string.Empty;
        try
        {
            //            if (sqlCon.State == ConnectionState.Closed)
            //            {
            sqlCon.Open();
            //            }
            if (DropDownList1.SelectedValue.ToString() == "CustUserName")
            {
                Query = "SELECT * FROM Customers WHERE CustUserName Like '" + txtSearchName.Text + "%'";
                Session["CustRecordsCategory"] = "CustUserName";
            }
            else if (DropDownList1.SelectedValue.ToString() == "CustSalutation")
            {
                Query = "SELECT * FROM Customers WHERE CustSalutation Like '" + txtSearchName.Text + "%'";
                Session["CustRecordsCategory"] = "CustSalutation";
            }
            else if (DropDownList1.SelectedValue.ToString() == "CustFirstName")
            {
                Query = "SELECT * FROM Customers WHERE CustFirstName Like '" + txtSearchName.Text + "%'";
                Session["CustRecordsCategory"] = "CustFirstName";
            }
            else if (DropDownList1.SelectedValue.ToString() == "CustLastName")
            {
                Query = "SELECT * FROM Customers WHERE CustLastName Like '" + txtSearchName.Text + "%'";
                Session["CustRecordsCategory"] = "CustLastName";
            }
            else if (DropDownList1.SelectedValue.ToString() == "CustPhoneNo")
            {
                Query = "SELECT * FROM Customers WHERE CustPhoneNo Like '" + txtSearchName.Text + "%'";
                Session["CustRecordsCategory"] = "CustPhoneNo";
            }
         
            else if (DropDownList1.SelectedValue.ToString() == "CustEmail")
            {
                Query = "SELECT * FROM Customers WHERE CustEmail Like '" + txtSearchName.Text + "%'";
                Session["CustRecordsCategory"] = "CustEmail";
            }

            else if (DropDownList1.SelectedValue.ToString() == "CustAddress")
            {
                Query = "SELECT * FROM Customers WHERE CustAddress Like '" + txtSearchName.Text + "%'";
                Session["CustRecordsCategory"] = "CustAddress";
            }
          
            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("<script>alert('There's been an error')</script>" + ex.Message);
        }

        finally
        {
            sqlCon.Close();
        }
    }
}