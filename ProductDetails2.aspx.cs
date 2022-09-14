using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;



public partial class ProductDetails2 : System.Web.UI.Page
{
    static readonly string scriptStockOut = "<script language=\"javascript\">\n" +
 "alert (\"Sorry Stock Out!  Please choose a smaller quantity or another product \");\n" +
 "</script>";
    int LeftDegree;
    int RightDegree;

    public string Details, Name, Price, Colour, Material, Image;
    protected void Page_Load(object sender, EventArgs e)
    {

      /*  DetailsViewRow row = DetailsView1.Rows[0];
        Details = row.Cells[1].Text;


        DetailsViewRow row1 = DetailsView1.Rows[1];
        Name = row1.Cells[1].Text;

        DetailsViewRow row2 = DetailsView1.Rows[2];
        Price = row2.Cells[1].Text;

        DetailsViewRow row3 = DetailsView1.Rows[3];
        Colour = row3.Cells[1].Text;

        DetailsViewRow row4 = DetailsView1.Rows[4];
        Material = row4.Cells[1].Text;

        DetailsViewRow row5 = DetailsView1.Rows[5];
        Image = row5.Cells[1].Text; */

        /*pricelabel.InnerHtml = "SGD " + "$" + Price;
        detailslabel.InnerHtml = Details;
        namelabel.InnerHtml = Name;
        Image2.ImageUrl = Image;
        colourlabel.InnerHtml = Colour;
        materiallabel.InnerHtml = Material;*/

        
        DetailsViewRow row3 = DetailsView3.Rows[3];
        if (row3.Cells[1].Text == "Frame")
        {
            if ((Session["sUserName"] == null) || (Session["sUserName"] == ""))
            {
                Session["LoginLa"] = "Y";
                Response.Redirect("Login.aspx");

            }
            else
            {
                string CustUserName = Session["sUserName"].ToString();

//          PastEyesightCheckBox.Visible = true;
//          NoPowerCheckBox.Visible = true;
            RadioButtonList1.Visible = true;


        SqlConnection con = new
           SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

           SqlCommand getDegree;
                String strGetAmount = "SELECT CustEyeDegreeLeft FROM Customers WHERE CustUserName = '" + CustUserName + "'";
                getDegree = new SqlCommand(strGetAmount, con);
                con.Open();
                object readLeftDegree = getDegree.ExecuteScalar();
                con.Close();

                //if value is null, recognise it.
                if (readLeftDegree == DBNull.Value)
                {
                    Label1.Text = "You do not have existing records. Please book an appointment after purchasing or tick no power.";
//                    PastEyesightCheckBox.Visible = false;
//                    NoPowerCheckBox.Visible = true;
                      RadioButtonList1.Items[1].Enabled = false;
                      Session["Remarks"] = "No existing eye test records.";
                }

                else {
                LeftDegree = (int)readLeftDegree;
                Label1.Text = "L: " + LeftDegree.ToString();
                strGetAmount = "SELECT CustEyeDegreeRight FROM Customers WHERE CustUserName = '" + CustUserName + "'";
                getDegree = new SqlCommand(strGetAmount, con);
                con.Open();
                object readRightDegree = getDegree.ExecuteScalar();
                con.Close();
                RightDegree = (int)readRightDegree;
                Label1.Text = Label1.Text + ", R: " + RightDegree.ToString();
                Session["Remarks"] = Label1.Text;
                }
        }
     }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //declare variables
        string strProdID, strProdName, strSQLSelect, strSQL, remarks;
        int intQuantityOnHand, intBuyQuantity, newQty, intOrderNo;
        decimal decUnitPrice;
        remarks = null;
        
        if ((string)Session["sCustFlag"] != "T")
        {
            Session["sUserName"] = "";
            Session["PurchaseLogin"] = "Y";
            Response.Redirect("Login.aspx");
        }

        if (RadioButtonList1.Visible == true)
        {
            if (RadioButtonList1.SelectedValue == "Get frame with no power")
            {
                remarks = "No degree lens";
            }
            else if (RadioButtonList1.SelectedValue == "Use past eyesight record with YiEyeCare")
            {
                remarks = Label1.Text;
            }
            else if (RadioButtonList1.SelectedValue == "Book eye test appt")
            {
                remarks = "Will book eyetest appt";
                Session["WillBook"] = "Y";
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Choose degree option radio button below.')</script>");
                return;
            }
        }

        else if (RadioButtonList1.Visible == false)
        {
            remarks = null;
        }
        

        // connect to database and then check stock quantity
        SqlConnection con = new
       SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);
        con.Open();


        //retrieve the product ID from the first row of the DetailsView
        DetailsViewRow row0 = DetailsView3.Rows[0];
        strProdID = row0.Cells[1].Text;

        //retrieve the product Name from the second row of the DetailsView
        DetailsViewRow row1 = DetailsView3.Rows[1];
        strProdName = row1.Cells[1].Text;

        //extract the QuantityOnHand from the database - based on the product ID
        strSQLSelect = "SELECT QuantityOnHand FROM Products WHERE ProdID = @ProdID";
        var cmd = new SqlCommand(strSQLSelect, con);
        cmd.Parameters.Add("@ProdID", SqlDbType.VarChar).Value = strProdID;
        object oQty = cmd.ExecuteScalar();
        intQuantityOnHand = (int)oQty;

        //extract the Promotion Price from the database - based on the product ID
        strSQLSelect = "SELECT PromotionPrice FROM Products WHERE ProdID = @ProdID";
        cmd = new SqlCommand(strSQLSelect, con);
        cmd.Parameters.Add("@ProdID", SqlDbType.VarChar).Value = strProdID;
        object oUnitPrice = cmd.ExecuteScalar();
        decUnitPrice = (decimal)oUnitPrice;


        //extract the quantity purchased from the dropdown list
        if (OtherButton.Text == "Other Amounts")
        {
            intBuyQuantity = int.Parse(ddlQty.Items[ddlQty.SelectedIndex].ToString());
        }
        else
        {
            intBuyQuantity = int.Parse(QuantityTextBox.Text.ToString());
        }
        


        //checking for out of stock situation
        if (intQuantityOnHand < intBuyQuantity)
        {
            Type csType = this.GetType();
            ClientScript.RegisterStartupScript(csType, "StockOut", scriptStockOut);
            return;
        }

        //calculate the new quantity left
        newQty = intQuantityOnHand - intBuyQuantity;


        // save productID, unitPrice and quantity as Session variables
        Session["sProductId"] = strProdID;
        Session["sUnitPrice"] = decUnitPrice.ToString();
        Session["sQuantity"] = newQty.ToString();

        if (remarks == null)
        {
            remarks = "null";
        }
        // insert product ordered to the orderItems table
        intOrderNo = (int)Session["sOrderNo"];
        strSQL = "INSERT INTO orderItems(iOrderID, iProdID, iQty, iUnitPrice, iTotalPrice, Remarks)"
             + "VALUES (@iOrderID, @iProdID, @iQty, @iUnitPrice, @iTotalPrice, @Remarks)";
        cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.Add("@iOrderID", SqlDbType.Int).Value = intOrderNo;
        cmd.Parameters.Add("@iProdID", SqlDbType.VarChar).Value = strProdID;
        cmd.Parameters.Add("@iQty", SqlDbType.Int).Value = intBuyQuantity;
        cmd.Parameters.Add("@iUnitPrice", SqlDbType.Money).Value = decUnitPrice;
        cmd.Parameters.Add("@iTotalPrice", SqlDbType.Money).Value = (decUnitPrice * intBuyQuantity);
        cmd.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = remarks;
        cmd.ExecuteNonQuery();

        //update the quantity on hand in the products table
        strSQL = "UPDATE Products SET QuantityOnHand = @NewQty WHERE ProdID = @ProdID";
        cmd = new SqlCommand(strSQL, con);
        cmd.Parameters.Add("@NewQty", SqlDbType.Int).Value = newQty;
        cmd.Parameters.Add("@ProdID", SqlDbType.VarChar).Value = strProdID;
        cmd.ExecuteNonQuery();

        con.Close();

        // redirect the user to the Shopping Cart page
        Response.Redirect("ShoppingCart.aspx");
    }//end of btnBuy_Click

    protected void OtherButton_Click(object sender, EventArgs e)
    {
        if (OtherButton.Text == "Other Amounts")
        {
            ddlQty.Visible = false;
            QuantityTextBox.Visible = true;
            OtherButton.Text = "Standard Amounts";
        }
        else
        {
            ddlQty.Visible = true;
            QuantityTextBox.Visible = false;
            OtherButton.Text = "Other Amounts";
        }
    }
    protected void QuantityTextBox_TextChanged(object sender, EventArgs e)
    {

    }
    protected void BackButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");
    }
  
}


