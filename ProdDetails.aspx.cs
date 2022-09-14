using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;



public partial class ProdDetails : System.Web.UI.Page
{
    //ID taken----------
    static readonly string scriptErrorProdID =
     "<script language=\"javascript\">\n" +
     "alert (\"Error - The Product ID you have entered does not exist, please enter a valid ID\");\n" +
     "</script>";

    //Success------------
    static readonly string scriptSuccessNewStock =
    "<script language=\"javascript\">\n" +
    "alert (\"Success! You have just purchased stock. Go back to products details to see changes.\");\n" +
    "</script>";

    
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sqlCon = new
        SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

        string Query = string.Empty;
        sqlCon.Open();

        if (Session["ProdDetailsCategory"] != null)
        {
            //DropDownList1.SelectedValue = Session["ProdDetailsCategory"].ToString();
            Query = "SELECT * FROM Products WHERE " + Session["ProdDetailsCategory"].ToString() + " Like '" + txtSearchName.Text + "%'";

            SqlDataAdapter sqlDa = new SqlDataAdapter(Query, sqlCon);

            DataSet Ds = new DataSet();
            sqlDa.Fill(Ds);
            GridView1.DataSource = Ds;
            GridView1.DataBind();
        }

        else
        {
            Query = "SELECT * FROM Products";
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


    protected void ConfirmPurchaseButton_Click(object sender, EventArgs e)
    {
          /* ClientScript.RegisterStartupScript(csType, "Confirmation", scriptConfirmPurchase);*/

         //declare variables
        string strProductId, strSQLSelect, strSQL;
        int intQuantityOnHand, intConfirmPurchase, newQty;

        // connect to database and then check stock quantity
        
            SqlConnection con = new
            SqlConnection(WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString);

            con.Open();

            strProductId = (IDTextBox.Text).ToString();
/*            string ProductID = "SELECT ProdID FROM Products";
            string ProductType = "SELECT ProdType FROM Products"; //small
            string strSup = SupplierDownList.Items[SupplierDownList.SelectedIndex].Value; //big
*/       


        //retrieve the product ID from the first row of the DetailsView
/*        GridViewRow row1 = GridView1.Rows[1];
        strProductId = row1.Cells[1].Text;
*/
   

        //extract the QuantityOnHand from the database - based on the product ID
         SqlCommand Qty = new SqlCommand("SELECT QuantityOnHand FROM Products WHERE ProdID = @ProductId", con);
      
        Qty.Parameters.Add("@ProductId", SqlDbType.VarChar).Value = strProductId;
        object oQty = Qty.ExecuteScalar();
        intQuantityOnHand = (int)oQty;

        //extract the Promotion Price from the database - based on the product ID
/*        strSQLSelect = "SELECT PromotionPrice FROM Products WHERE ProdId = @ProductId";
        cmd = new OleDbCommand(strSQLSelect, mDB);
        cmd.Parameters.Add("@ProductId", OleDbType.VarChar).Value = strProductId;
        object oUnitPrice = cmd.ExecuteScalar();
        decUnitPrice = (decimal)oUnitPrice;
*/
        //extract the quantity purchased from the dropdown list
  
            intConfirmPurchase = int.Parse(StockTextBox.Text.ToString());
   


        

        //calculate the new quantity (added)
        newQty = intQuantityOnHand + intConfirmPurchase;


        // save productID, unitPrice and quantity as Session variables
/*        Session["sProductId"] = strProductId;
        Session["sUnitPrice"] = decUnitPrice.ToString();
        Session["sQuantity"] = newQty.ToString();
*/
        // save record.
        int EmpID = (int)Session["sEmpID"];

/*        SqlCommand GetSupplier = new SqlCommand("SELECT SupID FROM Suppliers WHERE SupName = @SupName", con);
        GetSupplier.Parameters.Add("@SupName", SqlDbType.VarChar).Value = StockTextBox.ToString();
        object SupID = GetSupplier.ExecuteScalar();
*/
        object SupID = int.Parse(SupplierDownList.SelectedValue);


        strSQL = "INSERT INTO StockOrders(ProdID, StockOrdered, EmpID, SupID)"
             + "VALUES (@ProdId, @StockOrdered, @EmpID, @SupID)";
        Qty = new SqlCommand(strSQL, con);
       
//        Qty.Parameters.Add("@StockID", SqlDbType.Int).Value = halpmehere!;

        Qty.Parameters.Add("@ProdId", SqlDbType.VarChar).Value = strProductId;
        Qty.Parameters.Add("@StockOrdered", SqlDbType.Int).Value = intConfirmPurchase;
        Qty.Parameters.Add("@EmpID", SqlDbType.NChar).Value = EmpID;
        Qty.Parameters.Add("@SupID", SqlDbType.Int).Value = SupID;
//        DateTime.Today();
//        Qty.Parameters.Add("@DateOrdered", SqlDbType.DateTime).Value = DateTime(Int32, Int32, Int32, Int32, Int32, Int32);

       

        Qty.ExecuteNonQuery();

        //update the quantity on hand in the products table
        strSQL = "UPDATE Products SET QuantityOnHand = @NewQty WHERE ProdId = @ProdId";
        Qty = new SqlCommand(strSQL, con);
        Qty.Parameters.Add("@NewQty", SqlDbType.Int).Value = newQty;
        Qty.Parameters.Add("@ProdId", SqlDbType.VarChar).Value = strProductId;
        Qty.ExecuteNonQuery();

        con.Close();
       

        ConfirmationLabel.Text = "Successful! Stocks have been ordered and should arrive in next refresh";
  
            }
    protected void PurchaseStockButton_Click(object sender, EventArgs e)
    {
        if (PurchaseStockButton.Text == "Purchase Stock")
        {

            StockTextBox.Visible = true;
            //ConfirmPurchaseButton.Visible = true;
            NextButton.Visible = true;
            PurchaseStockButton.Text = "Cancel";
            StockLabel.Visible = true;
            IDLabel.Visible = true;
            IDTextBox.Visible = true;
            StockTextBox.Visible = true;
            UpdateButton.Visible = true;


            
            //SupplierLabel.Visible = true;
            //SupplierDownList.Visible = true;
           
        }
        else if (PurchaseStockButton.Text == "Cancel")
        {
            StockTextBox.Visible = false;
            ConfirmPurchaseButton.Visible = false;
            NextButton.Visible = false;
            PurchaseStockButton.Text = "Purchase Stock";
            IDLabel.Visible = false;
            StockLabel.Visible = false;
            IDTextBox.Visible = false;
            StockTextBox.Visible = false;
            SupplierLabel.Visible = false;
            SupplierDownList.Visible = false;
            UpdateButton.Visible = false;

        }
    }
    protected void NextButton_Click(object sender, EventArgs e)
    {


        if ((IDTextBox.Text == "") && (StockTextBox.Text == ""))
        {
            ConfirmationLabel.Text = "Product ID and Stock Amount fields are empty";
            IDTextBox.Focus();
        }

        if (IDTextBox.Text == "")
        {
            ConfirmationLabel.Text = "Product ID field is empty";
            IDTextBox.Focus();
        }

        else if (StockTextBox.Text == "")
        {
            ConfirmationLabel.Text = "Stock Amount field is empty";
            StockTextBox.Focus();
        }

        else
        {
            string InputProdID = IDTextBox.Text.ToString();
            string CS = WebConfigurationManager.ConnectionStrings["YECConnectionString"].ConnectionString;



            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                //ENSURE PRODUCTID IS VALID. 
                Type csType = this.GetType();
                //            SqlCommand EnsureProductIDcmd;
                //            SqlDataReader EnsureProductIDrdr;
                //            string EnsureProductIDstr = "SELECT ProdID FROM Products ORDER BY ProdID";
                //            EnsureProductIDcmd = new SqlCommand(EnsureProductIDstr, con); 
                //, mDb)

                /*            EnsureProductIDrdr = EnsureProductIDcmd.ExecuteReader();

                            while (EnsureProductIDrdr.Read() == true)
                            {
                                using (SqlConnection con2 = new SqlConnection(CS))
                                {
                                    con2.Open();

                 */
                SqlCommand ItemType = new SqlCommand("SELECT ProdType FROM Products WHERE ProdID = @ProdID", con);
                ItemType.Parameters.Add("@ProdID", SqlDbType.VarChar).Value = InputProdID;

                object InputItemType = ItemType.ExecuteScalar();

                if (InputItemType == null)
                {
                    ClientScript.RegisterStartupScript(csType, "Error", scriptErrorProdID);
                    con.Close();
                    IDTextBox.Focus();
                    return;
                }

                else
                {

                    SupplierLabel.Visible = true;
                    SupplierDownList.Visible = true;
                    ConfirmPurchaseButton.Visible = true;

                    SqlCommand cmd = new SqlCommand("SELECT SupName, SupID, SupItem FROM Suppliers WHERE ([SupItem] LIKE '%' + @ItemType + '%');", con);
                    cmd.Parameters.Add("@ItemType", SqlDbType.VarChar).Value = (InputItemType).ToString();
                    SupplierDownList.DataSource = cmd.ExecuteReader();
                    SupplierDownList.DataTextField = "SupName";

                    SupplierDownList.DataValueField = "SupID";
                    SupplierDownList.DataBind();

                }
            }
        }
        
      }

/*            con.Close();
            con.Open();
            
            if (IDTextBox.Text != EnsureProductIDrdr["ProdID"].ToString())
                {
                    ClientScript.RegisterStartupScript(csType, "Error", scriptErrorProdID);
                    con.Close();
                    return;
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
            if (DropDownList1.SelectedValue.ToString() == "ProdID")
            {
                Query = "SELECT * FROM Products WHERE ProdID Like '" + txtSearchName.Text + "%'";
                Session["ProdDetailsCategory"] = "ProdID";
            }
            else if (DropDownList1.SelectedValue.ToString() == "ProdName")
            {
                Query = "SELECT * FROM Products WHERE ProdName Like '" + txtSearchName.Text + "%'";
                Session["ProdDetailsCategory"] = "ProdName";
            }
            else if (DropDownList1.SelectedValue.ToString() == "QuantityOnHand")
            {
                Query = "SELECT * FROM Products WHERE QuantityOnHand Like '" + txtSearchName.Text + "%'";
                Session["ProdDetailsCategory"] = "QuantityOnHand";
            }
            else if (DropDownList1.SelectedValue.ToString() == "PromotionPrice")
            {
                Query = "SELECT * FROM Products WHERE PromotionPrice Like '" + txtSearchName.Text + "%'";
                Session["ProdDetailsCategory"] = "PromotionPrice";
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
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProdDetails.aspx");
    }
}
   

 
