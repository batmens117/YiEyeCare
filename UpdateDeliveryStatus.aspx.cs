using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class UpdateDeliveryStatus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        SqlConnection sqlCon = new
          SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

        string Query = string.Empty;
        sqlCon.Open();

        if (Session["OrderRecordsCategory"] != null)
        {
            //DropDownList1.SelectedValue = Session["OrderRecordsCategory"].ToString();
            Query = "SELECT * FROM Orders WHERE " + Session["OrderRecordsCategory"].ToString() + " Like '" + txtSearchName.Text + "%'";

            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();
        }

        else
        {
            Query = "SELECT * FROM Orders";
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


    protected void btnSearch_Click(object sender, EventArgs e)
    {
       
    }
    protected void btnSearch_Click1(object sender, EventArgs e)
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
            if (DropDownList1.SelectedValue.ToString() == "orderID")
            {
                Query = "SELECT * FROM Orders WHERE orderID Like '" + txtSearchName.Text + "%'";
                Session["OrderRecordsCategory"] = "orderID";
            }
            else if (DropDownList1.SelectedValue.ToString() == "orderUserName")
            {
                Query = "SELECT * FROM Orders WHERE orderUserName Like '" + txtSearchName.Text + "%'";
                Session["OrderRecordsCategory"] = "orderUserName";
            }
            else if (DropDownList1.SelectedValue.ToString() == "orderDate")
            {
                Query = "SELECT * FROM Orders WHERE orderDate Like '" + txtSearchName.Text + "%'";
                Session["OrderRecordsCategory"] = "orderDate";
            }
            else if (DropDownList1.SelectedValue.ToString() == "orderDeliveryMode")
            {
                Query = "SELECT * FROM Orders WHERE orderDeliveryMode Like '" + txtSearchName.Text + "%'";
                Session["OrderRecordsCategory"] = "orderDeliveryMode";
            }
            else if (DropDownList1.SelectedValue.ToString() == "orderTotalCost")
            {
                Query = "SELECT * FROM Orders WHERE orderTotalCost Like '" + txtSearchName.Text + "%'";
                Session["OrderRecordsCategory"] = "orderTotalCost";
            }
            else if (DropDownList1.SelectedValue.ToString() == "orderStatus")
            {
                Query = "SELECT * FROM Orders WHERE orderStatus Like '" + txtSearchName.Text + "%'";
                Session["OrderRecordsCategory"] = "orderStatus";
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