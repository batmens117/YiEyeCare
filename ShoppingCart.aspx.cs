using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class ShoppingCart : System.Web.UI.Page
{
    decimal Amount, GST, AmountGST, AmountGSTDelivery, CodeDisc, DiscountAmt;

    static readonly string scriptDeleted =
"<script language=\"javascript\">\n" +
"alert(\"Success - Item Successfully removed from Cart.\");\n" +
"</script>";


    protected void Page_Load(object sender, EventArgs e)
    {

        eyeLabel.Visible = false;

        if ((string)Session["sCustFlag"] != "T")
        {
            Session["sUserName"] = "";
            Session["PurchaseLogin"] = "Y";
            Response.Redirect("Login.aspx");

        }
        else
        {
            // check to see if items have been ordered
            SqlConnection con = new
            SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

            SqlCommand cmd;
            SqlDataReader rdr;
            int intOrderNo = (int)Session["sOrderNo"];
            String strSql = "SELECT iProdID FROM OrderItems WHERE iOrderID = " + intOrderNo;
            cmd = new SqlCommand(strSql, con);
            con.Open();
            rdr = cmd.ExecuteReader();
            Boolean booRows = rdr.HasRows;
            con.Close();

            if (booRows)
            {
                lblShoppingCart.Text = "Your Shopping Cart";
                ddlPayment.Visible = true;
                ddlDelivery.Visible = true;
          
                CheckOutButton1.Visible = true;
                SqlCommand getAmount;
                String strGetAmount = "SELECT SUM(iTotalPrice) AS TOTALAMT FROM OrderItems WHERE iOrderID = " + intOrderNo;
                getAmount = new SqlCommand(strGetAmount, con);
                con.Open();
                object readAmount = getAmount.ExecuteScalar();
                con.Close();
               

                Amount = (decimal)readAmount;
                amtLabel.Text = Amount.ToString("C");
                Session["Amount"] = Amount;

                GST = (Amount * 0.07m);
                gstLabel.Text = GST.ToString("C");
                Session["GST"] = GST;

                //            DiscountLabel.Text = totalDisc.ToString("C");
                //            DiscountLabel.Text = DiscountAmt.ToString("C");


                AmountGST = (GST + Amount);
                            AmountGST = (GST + Amount);
                amtwgstLabel.Text = AmountGST.ToString("C");
                //            Session["GrandTotal"] = AmountGST;

                if (Session["remarks"] != null)
                {
                    eyeLabel.Visible = true;
                    eyeLabel.Text = (string)Session["remarks"];
                }
                else if (Session["remarks"] == null)
                {
                    eyeLabel.Text = "";
                    eyeLabel.Visible = false;

                }

            }
            else
            {
                lblShoppingCart.Text = "Your Shopping Cart is empty";
                ddlPayment.Visible = false;
                ddlDelivery.Visible = false;
                DiscountButton.Visible = false;
                EnterDiscountButton.Visible = false;
                DiscountTextBox.Visible = false;
                CheckOutButton1.Visible = false;
            }




        }
/*        if ((Session["HotCode"] == "Y") && (Session["LoveCode"] == "Y"))
        {
            DiscountTextBox.Enabled = false;
            DiscountTextBox.ToolTip = "Max discounts applied";
            DiscountButton.Enabled = false;
            DiscountButton.ToolTip = "Max discounts applied";
            EnterDiscountButton.Enabled = false;
            EnterDiscountButton.ToolTip = "Max discounts applied";
//            Session["DiscountAmt"] = 90.0m;
        }

 */
    }
    
    
    //end of Page_Load method

    
    protected void DiscountButton_Click(object sender, EventArgs e)
    {
        if (DiscountButton.Text == "I have a Discount Code")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('WARNING! Once discounts are applied, no more removing from cart allowed!')</script>");
            DiscountTextBox.Visible = true;
            EnterDiscountButton.Visible = true;
            DiscountButton.Text = "I Don't Have A Discount Code";
        }
        else if (DiscountButton.Text == "I Don't Have A Discount Code")
        {
            DiscountTextBox.Visible = false;
            EnterDiscountButton.Visible = false;
            DiscountButton.Text = "I have a Discount Code";
        }
    }
    protected void ShoppingButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");
    }

    


    protected void CheckOutButton1_Click(object sender, EventArgs e)
    {
        // starts here.
        decimal cashDisc = 0.0m;
//        decimal totalDisc = 0.0m;
        decimal DelCost = 0.0m;

//      validate that payment and delivery methods are chosen


        if ((ddlPayment.Text == "Please Choose a Payment Method") && (ddlDelivery.Text == "Please Choose a Delivery Mode"))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Choose a payment & delivery method.')</script>");
        }

        else if (ddlPayment.Text == "Please Choose a Payment Method")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Choose a payment method.')</script>");
        }

        else if (ddlDelivery.Text == "Please Choose a Delivery Mode")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Choose a delivery method.')</script>");
        }

        
      else
      {
            if (Session["LoveCode"] == "Y")
            {
                CodeDisc = 5.0m;
            }

            if (Session["HotCode"] == "Y")
            {
                CodeDisc = 15.0m;
            }

          DiscountAmt = CodeDisc;

        string strPay = ddlPayment.Items[ddlPayment.SelectedIndex].Text;
        string strDel = ddlDelivery.Items[ddlDelivery.SelectedIndex].Text;
      
        if (strDel == "Express")
        {
            DelCost = 20.0m;
            Session["DelCost"] = DelCost;
            AmountGSTDelivery = AmountGST + DelCost;
        }
        else if (strDel == "Normal")
        {
            DelCost = 10.0m;
            Session["DelCost"] = DelCost;
            AmountGSTDelivery = AmountGST + DelCost;
        }
        else if (strDel == "Self-Collect")
        {
            DelCost = 0.0m;
            Session["DelCost"] = DelCost;
            AmountGSTDelivery = AmountGST + DelCost;
        }

        if (strPay == "Cash")
        {
            Session["Cash"] = "Y";
            Session["PP"] = "N";
            cashDisc = AmountGSTDelivery * 0.05m;
            DiscountAmt = CodeDisc + cashDisc;
        }
        else if (strPay == "PayPal")
        {
            Session["PP"] = "Y";
        }


       

//        DiscountAmt = totalDisc;
            
//      Session["GrandTotal"] = GrandTotal.ToString("C");
        decimal AlmostTotal = AmountGST + DelCost;
        decimal GrandTotal = (AlmostTotal - DiscountAmt);
        Session["DiscAmt"] = DiscountAmt;
        Session["AlmostTotal"] = AlmostTotal;
        Session["GrandTotal"] = GrandTotal;
        DateTime now = DateTime.Now;

        SqlConnection con = new
             SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);
        string strStatus = "CheckedOut";
        int intOrderNo = (int)Session["sOrderNo"];
        String strSqlUpdate = "UPDATE Orders SET orderDate = @Date, orderPayMode = @Pay, "
            + "orderDeliveryMode = @Del, orderDeliveryCost = @DelCost, orderDiscount = @Disc, " +
            "orderStatus = @Status, orderTotalCost = @GrandTotal WHERE orderID = " + intOrderNo;
        SqlCommand cmd;
        cmd = new SqlCommand(strSqlUpdate, con);
        cmd.Parameters.Add("@Date", SqlDbType.DateTime).Value = now;
        cmd.Parameters.Add("@Pay", SqlDbType.VarChar).Value = strPay;
        cmd.Parameters.Add("@Del", SqlDbType.VarChar).Value = strDel;
        cmd.Parameters.Add("@DelCost", SqlDbType.Money).Value = DelCost;
        cmd.Parameters.Add("@Disc", SqlDbType.Money).Value = DiscountAmt;
        cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = strStatus;
        cmd.Parameters.Add("@GrandTotal", SqlDbType.Money).Value = GrandTotal;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();


        string PP = (string)Session["PP"];
        if (PP == "Y")
        {
//            Response.Write("  <script language='javascript'> window.open('PayMoney.aspx','','width=1020,Height=720,fullscreen=1,location=0,scrollbars=1,menubar=1,toolbar=1'); </script>");
            // is it this?
            Response.Redirect("PayMoney.aspx");
            // OR should i redirect instead of open in new window?
        }

        else
        {
            Response.Redirect("OrderDetails.aspx");
        }

      }
    }

    protected void deleteRow_Click(object sender, EventArgs e)
    {
        if ((Session["HotCode"] == "Y") || (Session["LoveCode"] == "Y"))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Discounts have already been applied. No more removing of cart items allowed.')</script>");
        }

        else
        {
        Type csType = this.GetType();
        //Get the button that raised the event
        Button btn = (Button)sender;
        //Get the row that contains this button
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;

       string sval = ((HiddenField)gvr.FindControl("HiddenField1")).Value;


        using (SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString))
        {
            con.Open();

            SqlCommand com = new SqlCommand("DELETE FROM OrderItems where iTransID=@TID", con);
            com.Parameters.AddWithValue("@TID", sval);

            com.ExecuteNonQuery();

            con.Close();

        }
        GridView1.DataBind();
        ClientScript.RegisterStartupScript(csType, "Success", scriptDeleted);
        return;

        }
    }
    protected void EnterDiscountButton_Click(object sender, EventArgs e)
    {
/*        DiscountTextBox.Enabled = false;
        DiscountButton.Enabled = false;
        EnterDiscountButton.Enabled = false;
        */

        if (DiscountTextBox.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Discount Code Field is Empty. Please Enter a Valid Code.')</script>");
        }
        if (DiscountTextBox.Text == "TrevorIsHot")
        {
            if (Session["HotCode"] == "Y")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('HOT TREV discount has already been applied')</script>");
            }

            else if (Amount < 300)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Total has to be above $300 for HOT TREV discount to apply')</script>");
            }
            else if (Amount >= 300)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Success, $15 discount applied.')</script>");
//                CodeDisc = 50.0m;
                DiscountButton.Enabled = false;
                DiscountTextBox.Enabled = false;
                EnterDiscountButton.Enabled = false;
                Session["HotCode"] = "Y";
            }
        }
        if (DiscountTextBox.Text == "ILoveTrev")
        {
            if (Session["LoveCode"] == "Y")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('LOVE TREV discount has already been applied')</script>");
            }

            if (Amount < 100)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Total has to be above $100 for LOVE TREV discount to apply')</script>");
            }
            else if (Amount >= 100)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Success, $5 discount applied.')</script>");
//                CodeDisc = 40.0m;
                DiscountButton.Enabled = false;
                DiscountTextBox.Enabled = false;
                EnterDiscountButton.Enabled = false;
                Session["LoveCode"] = "Y";
            }
        }

        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Invalid Discount Code. Please apply a valid discount code.')</script>");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShoppingCart.aspx");
    }
   
}
//end of ShoppingCart.aspx.cs

    
