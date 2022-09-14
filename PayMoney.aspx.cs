using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PayMoney : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        int sOrderNo = (int)Session["sOrderNo"];
        int PayPalOrderNumber = sOrderNo;
        string PPON = PayPalOrderNumber.ToString();
        decimal GrandTotaldec = (decimal)Session["GrandTotal"];

        string GrandTotal = GrandTotaldec.ToString("C");

        string redirect = "";
        redirect += "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=" + "trevorlouislim@gmail.com";
        redirect += "&item_name=" + (string)Session["sFirstName"] + "'s order from Yi Eye Care (OrderID: " +
            PPON + ")";
        redirect += "&amount=" + GrandTotal;
        redirect += "&currency_code=SGD";
        redirect += "&return=" + "OrderDetails.aspx";
        redirect += "cancel_return=" + "ShopppingCart.aspx";
        redirect += "&custom=" + PPON;
        Session["Paid"] = "Y";
        Response.Redirect(redirect);
        
    }
}