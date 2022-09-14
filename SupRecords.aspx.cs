using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class SupRecords : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sqlCon = new
           SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

        string Query = string.Empty;
        sqlCon.Open();

        if (Session["SupRecordsCategory"] != null)
        {
            //DropDownList1.SelectedValue = Session["SupRecordsCategory"].ToString();
            Query = "SELECT * FROM Suppliers WHERE " + Session["SupRecordsCategory"].ToString() + " Like '" + txtSearchName.Text + "%'";

            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();
        }

        else
        {
            Query = "SELECT * FROM Suppliers";
            //            Query = "SELECT * FROM Employees WHERE " + Session["Category"].ToString() + " Like '" + txtSearchName.Text + "%'";

            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();

        }
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
    protected void btnButton_Click(object sender, EventArgs e)
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
            if (DropDownList1.SelectedValue.ToString() == "SupID")
            {
                Query = "SELECT * FROM Suppliers WHERE SupID Like '" + txtSearchName.Text + "%'";
                Session["SupRecordsCategory"] = "SupID";
            }
            else if (DropDownList1.SelectedValue.ToString() == "SupName")
            {
                Query = "SELECT * FROM Suppliers WHERE SupName Like '" + txtSearchName.Text + "%'";
                Session["SupRecordsCategory"] = "SupName";
            }
            else if (DropDownList1.SelectedValue.ToString() == "SupPhoneNumber")
            {
                Query = "SELECT * FROM Suppliers WHERE SupPhoneNumber Like '" + txtSearchName.Text + "%'";
                Session["SupRecordsCategory"] = "SupPhoneNumber";
            }
            else if (DropDownList1.SelectedValue.ToString() == "SupEmail")
            {
                Query = "SELECT * FROM Suppliers WHERE SupEmail Like '" + txtSearchName.Text + "%'";
                Session["SupRecordsCategory"] = "SupEmail";
            }
            else if (DropDownList1.SelectedValue.ToString() == "SupItem")
            {
                Query = "SELECT * FROM Employees WHERE SupItem Like '" + txtSearchName.Text + "%'";
                Session["SupRecordsCategory"] = "SupItem";
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