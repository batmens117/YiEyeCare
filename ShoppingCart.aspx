<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Yi Eyecare</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="nileforest">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    
  <!-- Favicone Icon -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon1.ico">
    <link rel="icon" type="image/png" href="img/favicon1.png">
    <link rel="apple-touch-icon" href="img/favicon1.png">


    <!-- CSS -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="css/ionicons.css" rel="stylesheet" type="text/css" />
    <link href="css/plugin/sidebar-menu.css" rel="stylesheet" type="text/css" />
    <link href="css/plugin/animate.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style2 {
            width: 21%;
        }
        .auto-style3 {
            width: 157px;
            height: 24px;
        }
        .auto-style4 {
            height: 24px;
        }
        .auto-style5 {
            width: 157px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            width: 253px;
        }
        .auto-style8 {
            width: 282px;
        }
        .auto-style9 {
            width: 111px;
        }
    </style>

</head>

<body>

    <!-- Preloader -->
    <section id="preloader">
        <div class="loader" id="loader">
            <div class="loader-img"></div>
        </div>
    </section>
    <!-- End Preloader -->

    <!-- Search Overlay Menu -->
    <div class="search-overlay-menu">
        <span class="search-overlay-close"><i class="ion ion-ios-close-empty"></i></span>
        <form role="search" id="searchform" action="/search" method="get">
            <input value="" name="q" type="search" placeholder="Search..." />
            <button type="submit"><i class="ion ion-ios-search"></i></button>
        </form>
    </div>
    <!-- End Search Overlay Menu -->

   
    <!-- Site Wraper -->
    <div class="wrapper">

        <!-- Header -->
        <header id="header" class="header">
            <div class="container header-inner">

                <!-- Logo -->
                <div class="logo">
                    <a href="index.html">
                       <img class="logo-light" src="img/Yieyecarelogo2.png" alt="Yi Eyecare" />
                        <img class="logo-dark" src="img/Yieyecarelogo1.png" alt="Yi Eyecare" />
                    </a>
                </div>
                <!-- End Logo -->

                

                <!-- Mobile Navbar Icon -->
                <div class="nav-mobile nav-bar-icon">
                    <span></span>
                </div>
                <!-- End Mobile Navbar Icon -->

          <!-- Navbar Navigation -->
                <div class="nav-menu">
                    <ul class="nav-menu-inner">
                        <li>
                            <a href="Default.aspx">Home </a>
                               <!-- End Dropdown -->
                        </li>
                        <li>
                            <a href="aboutus.aspx">About us </a>           
                             </li>                    
                            <!-- End Dropdown -->
                    
                        <li>
                            <a class="menu-has-sub" href="Products.aspx">Products <i class="fa fa-angle-down"></i></a>
                            <!-- Dropdown -->
                            <ul class="sub-dropdown dropdown">
                                  <li><a href="Products.aspx#Specs">Spectacles</a></li>
                                 <li><a href="Products.aspx#ContactLens">Contact lens</a></li>
                                 <li><a href="Products.aspx#Sunglasses">Sun-glasses</a></li>
                                 <li><a href="Products.aspx#Solution">Solutions</a></li>
                                                             
                            </ul>
                            <!-- End Dropdown -->
                        </li>
                        
                        
                        <li>
                            <a href="Services.aspx">Services </a>
                            <!-- Dropdown -->
                       
                            <!-- End Dropdown -->
                        </li>
                        <li>
                            <a class="menu-has-sub">Contact Us <i class="fa fa-angle-down"></i></a>
                            <!-- Dropdown -->
                            <ul class="sub-dropdown dropdown">
                                <li><a href="faq.aspx">FAQs</a></li>
                                <li><a href="location.aspx">Location</a></li>

                            </ul>
                            <!-- End Dropdown -->
                        </li>
                            <li>
                            <a class="menu-has-sub">Account<i class="fa fa-angle-down"></i></a>
                            <!-- Dropdown -->
                            <ul class="sub-dropdown dropdown">
                                  <li>
                                    <a href="myaccount.aspx">Account Details</a>
                                
                                </li>
                                <li>
                                    <a href="ShoppingCart.aspx">Shopping Cart </a>
                                 
                                </li>
                                <li>
                                    <a href="TrackOrders.aspx">Track Order Status </a>
                                
                                </li>
                                <li>
                                    <a href="apptbookingnew.aspx">Book Appointment </a>
                                
                                </li>
                                  <li>
                                    <a href="Redeem.aspx">Redeem a gift </a>
                                
                                </li>

                               
                                  
                               
                            <!-- End Dropdown -->
                                </ul>
                        </li>

<li>
                            <asp:Label ID="trylbl" runat="server" Text="Label" Visible="False" ForeColor="#99d6d6"></asp:Label>&nbsp;&nbsp;&nbsp;
                    
                        </li>
                              <li>
                                    <asp:Label ID="logoutlbl" runat="server" Text="Log Out" Visible="False" ForeColor="#009999"><a href="logout.aspx">Log out</a></asp:Label>

                        </li>

                    </ul>
                </div>
                <!-- End Navbar Navigation -->
            </div>
        </header>
        <!-- End Header -->
        <!-- CONTENT --------------------------------------------------------------------------------->
        <!-- Intro Section -->
        <section class="inner-intro dark-bg bg-image overlay-dark parallax parallax-background1" data-background-img="images/shoppingcart.jpg">
            <div class="container">
                <div class="row title">
                    <h2 class="h2">Shopping Cart</h2>
                     <h3>Check Out</h3>
                    <div class="page-breadcrumb">
                        <a href="Default.aspx">Back to Home</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Intro Section -->

        <section>
            <form runat="server">
                <br />
                 <div style="align-content:center; align-items:center; margin: 0px auto; text-align:center;" >
                <asp:Label ID="lblShoppingCart" runat="server" Text="Your Shopping Cart" ></asp:Label>
                     <br />
                     <br />
                     <br />

            &nbsp;&nbsp;

            <asp:DetailsView ID="DetailsView1" runat="server" style="margin-left: 190px;" Height="50px" Width="50%" AutoGenerateRows="False" DataKeyNames="orderID" DataSourceID="SqlDataSource1" HorizontalAlign="Left" CssClass="mb-0"> 
                <Fields>
                    <asp:BoundField DataField="orderID" HeaderText="Order ID" ReadOnly="True" SortExpression="orderID" >
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="orderDate" HeaderText="Order Date" SortExpression="orderDate" >
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                </Fields>
            </asp:DetailsView>
                     <br />
                     <br />
                     <br />
                <br />
             
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="iTransID" DataSourceID="SqlDataSource2" HorizontalAlign="Center" Width="90%">
                <Columns>
                    <asp:BoundField DataField="iOrderID" HeaderText="Order ID" SortExpression="iOrderID" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="iTransID" HeaderText="Transaction No." ReadOnly="True" SortExpression="iTransID" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="iProdID" HeaderText="Product ID" SortExpression="iProdID" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ProdName" HeaderText="Product Name" SortExpression="ProdName" />

                    <asp:BoundField DataField="iQty" HeaderText="Quantity" SortExpression="iQty" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                     <asp:TemplateField HeaderText="Price">

                        <ItemTemplate><%#Eval("iUnitPrice")%>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("iTransID") %>' />
                        </ItemTemplate>

                        <FooterTemplate>
                            <div style="padding:0 0 5px 0"><asp:Label Text="Page Total" runat="server" /></div>
                            <div><asp:Label Text="Grand Total" runat="server" /></div>
                        </FooterTemplate>

                    </asp:TemplateField>

                         <asp:TemplateField HeaderText="Sub Total Price ($)">
                        <ItemTemplate><asp:Label ID="lblTotalPrice" runat="server" Text='<%#Eval("SubTotal")%>'>
                            </asp:Label></ItemTemplate>

                        <FooterTemplate>
                            <div style="padding:0 0 5px 0"><asp:Label ID="lblPageTotal" runat="server" /></div>
                            <div><asp:Label ID="lblGrandTotal" runat="server" /></div>
                        </FooterTemplate>

                    </asp:TemplateField>
                  
         
                    <asp:ImageField  AlternateText="Product Image Cannot be Displayed" DataImageUrlField="ProdUrl" HeaderText="Product Image" NullDisplayText="No Image Found" ItemStyle-Width="25%">
                    </asp:ImageField>
                    

                       <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                          <asp:Button ID="deleteBtn" class="form-control" runat="server" Text="X" OnClick="deleteRow_Click" OnClientClick="return confirm('Are you sure you want to delete this item?');" Width="10%" />
                        </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" Width="10%" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                     <asp:Label ID="eyeLabel" runat="server"></asp:Label>
                     <br />
                     <asp:Button ID="UpdateButton" class="btn btn-default" runat="server" Text="Update Cart" OnClick="Button1_Click" />
                     <br />
                     <br />
                <br />
              
               
                <table class="auto-style2" style="align-content:center; align-items:center;margin: 0px auto; ">
                    <tr>
                        <td class="auto-style3" style="font-weight: bold">
                            <asp:Label ID="Label1" runat="server" Text="Amount: "></asp:Label>
                        </td>
                        <td class="auto-style4">
                            <asp:Label ID="amtLabel" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3" style="font-weight: bold">
                            <asp:Label ID="Label2" runat="server" Text="GST:"></asp:Label>
&nbsp;</td>
                        <td class="auto-style4">
                            <asp:Label ID="gstLabel" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5" style="font-weight: bold">
                            <asp:Label ID="Label3" runat="server" Text="Amount with GST: "></asp:Label>
                        </td>
                        <td class="auto-style6">
                            <asp:Label ID="amtwgstLabel" runat="server" ToolTip="Before Discounts"></asp:Label>
                        </td>
                    </tr>
                   
                </table>
                     <br />
                     <br />
                     <table style="margin: 0px auto 0px auto">
                         <tr>
                             
                             <td class="auto-style7">
                                 <asp:Label ID="Label4" runat="server" Text="Payment Method:"></asp:Label>
                             </td>
                             
                             <td class="auto-style8">
                           
                         <asp:DropDownList ID="ddlPayment" runat="server" ToolTip="Pay Cash for 5% discount!" >
                             <asp:ListItem>Please Choose a Payment Method</asp:ListItem>
                             <asp:ListItem>Cash</asp:ListItem>
                             <asp:ListItem>PayPal</asp:ListItem>
                         </asp:DropDownList>
                                   <!--  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlPayment" ErrorMessage="You have to select a payment method" ForeColor="Red" Operator="NotEqual" ValueToCompare="Please Choose a Payment Method"></asp:CompareValidator>-->
                                 
                             </td>
                            
                         </tr>
                         <tr>
                             <td class="auto-style7">
                                 <asp:Label ID="Label5" runat="server" Text="Delivery Method:"></asp:Label>
                             </td>
                             <td class="auto-style8">
                                 
                    <asp:DropDownList ID="ddlDelivery"  runat="server" ToolTip="Express guarantees faster delivery for at a cheap price of $20!" >
                        <asp:ListItem>Please Choose a Delivery Mode</asp:ListItem>
                        <asp:ListItem>Normal</asp:ListItem>
                        <asp:ListItem>Express</asp:ListItem>
                        <asp:ListItem>Self-Collect</asp:ListItem>
                    </asp:DropDownList>
                           <!--        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlDelivery" ErrorMessage="You have to select a delivery mode" ForeColor="#FF3300" Operator="NotEqual" ValidationGroup="Please Choose a Delivery Mode"></asp:CompareValidator>-->
                                    
                             </td>
                             <td class="auto-style9">
                          
                             </td>
                         </tr>
                     </table>
                    <br />
                     <div>
                         &nbsp;</div>
                   
                  <asp:Button ID="ShoppingButton" class="btn btn-default" runat="server" Text="Continue Shopping" align="center" OnClick="ShoppingButton_Click"/> &nbsp;&nbsp;&nbsp;<asp:Button ID="CheckOutButton1" runat="server"  class="btn btn-default" Text="Check Out" OnClick="CheckOutButton1_Click" />
                     &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="DiscountButton"  class="btn btn-default" runat="server" Text="I have a Discount Code" align="cener" OnClick="DiscountButton_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:TextBox ID="DiscountTextBox" runat="server" Visible="False"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Button ID="EnterDiscountButton" class="btn btn-default" runat="server" Text="Enter Discount" Visible="False" OnClick="EnterDiscountButton_Click" ToolTip="Hint: TrevorIsHot &amp; ILoveTrev" />
                     
                     <br />
                     <br />
                     <br />
                    </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT [orderID], [orderDate] FROM [Orders] WHERE ([orderID] = @orderID)">
                <SelectParameters>
                    <asp:SessionParameter Name="orderID" SessionField="sOrderNo" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT a.iTransID, a.iOrderID, a.iProdID, b.ProdName, b.ProdUrl, a.iQty, a.iUnitPrice, a.iUnitPrice * a.iQty AS SubTotal FROM OrderItems
AS a
LEFT OUTER JOIN Products
AS b
ON a.iProdID = b.ProdID
WHERE (a.iOrderID = @iOrderID)
GROUP BY a.iTransID, a.iOrderID, a.iProdID, b.ProdName, a.iQty, a.iUnitPrice, b.ProdUrl;">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="iOrderID" SessionField="sOrderNo" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

                  
                                       
                                   
                                

        </form>
             </section>

       

        <!-- END CONTENT ---------------------------------------------------------------------------->

      <!-- FOOTER -->
        <footer class="footer pt-80">
            <div class="container">
                <div class="row mb-60">
                    <!-- Logo -->
                    <div class="col-md-3 col-sm-3 col-xs-12 mb-xs-30">
                        <a class="footer-logo" href="Default.aspx">
                            <img src="img/Yieyecarelogo1.png" /></a>
                    </div>
                    <!-- Logo -->

                    <!-- Newsletter -->
                    <div class="col-md-4 col-sm-5 col-xs-12 mb-xs-30">
                        <div class="newsletter">
                            <form>
                                <input type="email" class="newsletter-input input-md newsletter-input mb-0" placeholder="Enter Your Email for Newsletter">
                                <button class="newsletter-btn btn btn-xs btn-white" type="submit" value=""><i class="fa fa-angle-right mr-0"></i></button>
                            </form>
                        </div>
                    </div>
                    <!-- End Newsletter -->

                    <!-- Social -->
                    <div class="col-md-3 col-md-offset-2 col-sm-4 col-xs-12">
                        <ul class="social">
                            <li><a target="_blank" href="https://www.twitter.com/yieyecare"><i class="fa fa-twitter"></i></a></li>
                            <li><a target="_blank" href="https://instagram.com/yieyecare"><i class="fa fa-instagram"></i></a></li>
                            <li><a target="_blank" href="https://www.facebook.com/yieyecare"><i class="fa fa-facebook"></i></a></li>
                     
                        </ul>
                    </div>
                    <!-- End Social -->
                </div>
                <!--Footer Info -->
                <div class="row footer-info mb-60">
                    <div class="col-md-3 col-sm-12 col-xs-12 mb-sm-30">
                        <p class="mb-xs-0">Established in 2001. Our qualified and experience staff is dedicated to providing a professional eyecare solutions to our customers and also good after-sales service.</p>
                        <a class="btn-link-a" href="aboutus.aspx">Read More</a>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 mb-sm-30 mb-xs-0">
                        <ul class="link"> 
                            <li><a href="Login.aspx">Login & Signup</a></li>
                            <li><a href="location.aspx">Location</a></li>                                                  
                            <li><a href="faq.aspx">FAQ</a></li>
                            <li><a href="aboutus.aspx">About</a></li>
                            <li><a href="Services.aspx">Service</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 mb-sm-30">
                        <ul class="link">
                            <li><a href="contactus.aspx">Contact Us</a></li>
                            <li><a href="shoppingcart.aspx">Shopping Cart</a></li>
                            <li><a href="Default.aspx">Home</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <p>Yew Tee Shopping Center #01-236 S(680624)</p>
                        <ul class="link-small">
                            <li><a href="mailto:Caroline@sop-association.sg"><i class="fa fa-envelope-o left"></i>Caroline@sop-association.sg</a></li>
                            <li><a><i class="fa fa-phone left"></i>+(65) 6762 4961</a></li>
                        </ul>
                    </div>
                </div>
                <!-- End Footer Info -->
            </div>

            <hr />

            <!-- Copyright Bar -->
           <section class="copyright ptb-60" style="background-color: #aad0c2;">
                <div class="container">
                    <p class="">
                        © 2016 <a><b>Yi Eyecare</b></a>. All Rights Reserved.
                        <br />
                    </p>
                </div>
            </section>
            <!-- End Copyright Bar -->

        </footer>
        <!-- END FOOTER -->

        <!-- Scroll Top -->
        <a class="scroll-top">
            <i class="fa fa-angle-double-up"></i>
        </a>
        <!-- End Scroll Top -->

    </div>
    <!-- Site Wraper End -->


    <!-- JS -->

    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.easing.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.flexslider.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.fitvids.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.viewportchecker.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.stellar.min.js" type="text/javascript"></script>
    <script src="js/plugin/wow.min.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.colorbox-min.js" type="text/javascript"></script>
    <script src="js/plugin/owl.carousel.min.js" type="text/javascript"></script>
    <script src="js/plugin/isotope.pkgd.min.js" type="text/javascript"></script>
    <script src="js/plugin/masonry.pkgd.min.js" type="text/javascript"></script>
    <script src="js/plugin/imagesloaded.pkgd.min.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.fs.tipper.min.js" type="text/javascript"></script>
    <script src="js/plugin/mediaelement-and-player.min.js"></script>
    <script src="js/plugin/sidebar-menu.js" type="text/javascript"></script>
    <script src="js/theme.js" type="text/javascript"></script>
    <script src="js/navigation.js" type="text/javascript"></script>

    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
        (function () {
            var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
            s1.async = true;
            s1.src = 'https://embed.tawk.to/5783d4b3c823e1bd608790b7/default';
            s1.charset = 'UTF-8';
            s1.setAttribute('crossorigin', '*');
            s0.parentNode.insertBefore(s1, s0);
        })();
    </script>
    <!--End of Tawk.to Script-->

</body>
</html>
