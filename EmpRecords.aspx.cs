using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
// ^^ For dataset.

public partial class EmpRecords : System.Web.UI.Page
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

        if (Session["EmpRecordsCategory"] != null)
        {
            //DropDownList1.SelectedValue = Session["EmpRecordsCategory"].ToString();
            Query = "SELECT * FROM Employees WHERE " + Session["EmpRecordsCategory"].ToString() + " Like '" + txtSearchName.Text + "%'";

            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();
        }

        else
        {
            Query = "SELECT * FROM Employees";
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
    }

    
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (GridView1.SelectedRow == null)
        {
            DetailsView1.Visible = false;
        }
        else
        {
            DetailsView1.Visible = true;
        }
    }

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

    /*    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeMainPage.aspx");
    }
*/

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
            if (DropDownList1.SelectedValue.ToString() == "EmpID")
            {
                Query = "SELECT * FROM Employees WHERE EmpID Like '" + txtSearchName.Text + "%'";
                Session["EmpRecordsCategory"] = "EmpID";
            }
            else if (DropDownList1.SelectedValue.ToString() == "EmpFirstName")
            {
                Query = "SELECT * FROM Employees WHERE EmpFirstName Like '" + txtSearchName.Text + "%'";
                Session["EmpRecordsCategory"] = "EmpFirstName";
            }
            else if (DropDownList1.SelectedValue.ToString() == "EmpLastName")
            {
                Query = "SELECT * FROM Employees WHERE EmpLastName Like '" + txtSearchName.Text + "%'";
                Session["EmpRecordsCategory"] = "EmpLastName";
            }
            else if (DropDownList1.SelectedValue.ToString() == "EmpAccessLevel")
            {
                Query = "SELECT * FROM Employees WHERE EmpAccessLevel Like '" + txtSearchName.Text + "%'";
                Session["EmpRecordsCategory"] = "EmpAccessLevel";
            }
            else if (DropDownList1.SelectedValue.ToString() == "EmpQualification")
            {
                Query = "SELECT * FROM Employees WHERE EmpQualification Like '" + txtSearchName.Text + "%'";
                Session["EmpRecordsCategory"] = "EmpQualification";
            }
            
            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();
//            Session["Searched"] = "Y";
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("<script>alert('wfrmGrid: 11')</script>" + ex.Message);
        }

        finally
        {
            sqlCon.Close();
        }
    }
}