<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>

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
        .auto-style1 {
            width: 80%;
        }
        .auto-style2 {
            height: 24px;
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
            <input value="" name="q" type="search" placeholder="Search..." />
            <button type="submit"><i class="ion ion-ios-search"></i></button>
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

             

            </div>
        </header>
        <!-- End Header -->
         <form id="form1" runat="server" style="text-align:center">
        <!-- CONTENT --------------------------------------------------------------------------------->
        <!-- Intro Section -->
                <section class="inner-intro dark-bg bg-image overlay-dark parallax parallax-background1" data-background-img="images/orderdetails.jpg">

            <div class="container">
                <div class="row title">
                    <h2 class="h2">Order Details</h2>
                    <div class="page-breadcrumb">
                         <a href="Default.aspx">Back to Home</a>
                    </div>
                </div>
            </div>
        </section>
        <div class="clearfix"></div>
        <!-- End Intro Section -->


        <!-- Blank Section -->
        <section >

           <div>

               <table class="auto-style1" style="font-size: small">
                   <tr>
                       <td id="OrderTable" colspan="2" style="font-size: large" >
                           <br />
                           You have ordered the following items:&nbsp;<br />
                           <br />
                       </td>
                   </tr>
                   <tr>
                       <td>
                           <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="orderID" DataSourceID="SqlDataSource1" Height="100px" Width="78%" HorizontalAlign="Right">
                               <Fields>
                                   <asp:BoundField DataField="orderID" HeaderText="Order ID:" InsertVisible="False" ReadOnly="True" SortExpression="orderID" />
                                   <asp:BoundField DataField="orderDate" HeaderText="Order Date:" SortExpression="orderDate" />
                               </Fields>
                           </asp:DetailsView>
                       </td>
                       <td>
                           <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Height="100px" Width="80%" HorizontalAlign="Center">
                               <Fields>
                                   <asp:BoundField DataField="orderPayMode" HeaderText="Payment Mode:" SortExpression="orderPayMode" />
                                   <asp:BoundField DataField="orderDeliveryMode" HeaderText="Delivery Mode:" SortExpression="orderDeliveryMode" />
                                   <asp:BoundField DataField="orderDeliveryCost" HeaderText="Delivery Cost:" SortExpression="orderDeliveryCost" />
                               </Fields>
                           </asp:DetailsView>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="2">
                           <br />
                           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" HorizontalAlign="Center" Width="80%">
                               <Columns>
                                   <asp:BoundField DataField="iOrderID" HeaderText="Order ID" SortExpression="iOrderID" />
                                   <asp:BoundField DataField="iProdID" HeaderText="Product ID" SortExpression="iProdID" />
                                   <asp:BoundField DataField="ProdName" HeaderText="Product Name" SortExpression="ProdName" />
                                   <asp:BoundField DataField="iQty" HeaderText="Quantity" SortExpression="iQty" />
                                   <asp:BoundField DataField="iUnitPrice" HeaderText="Unit Price" SortExpression="iUnitPrice" />
                                   <asp:BoundField DataField="iTotalPrice" HeaderText="Total Price" SortExpression="iTotalPrice" />
                               </Columns>
                           </asp:GridView>
                           <br />
                           <table style="align-content:center; align-items:center;margin: 0px auto; ">
                               <tr>
                                   <td style="font-weight: bold">Subtotal:</td>
                                   <td>
                                       <asp:Label ID="SubtotalLabel" runat="server"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td class="auto-style2" style="font-weight: bold">GST:</td>
                                   <td class="auto-style2">
                                       <asp:Label ID="GSTLabel" runat="server"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td style="font-weight: bold">Delivery Cost:</td>
                                   <td>
                                       <asp:Label ID="DelCostLabel" runat="server"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td style="font-weight: bold">Total:</td>
                                   <td>
                                       <asp:Label ID="TotalLabel" runat="server"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td style="font-weight: bold">Discount:</td>
                                   <td>
                                       <asp:Label ID="DiscLabel" runat="server"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td style="font-weight: bold">Grand Total:</td>
                                   <td>
                                       <asp:Label ID="GrandTotalLabel" runat="server"></asp:Label>
                                   </td>
                               </tr>
                               <tr>
                                   <td style="font-weight: bold">Total Reward Points:</td>
                                   <td>
                                       <asp:Label ID="RPLabel" runat="server"></asp:Label>
                                   </td>
                               </tr>
                           </table>
                     <asp:Label ID="eyeLabel" runat="server"></asp:Label>
                           <br />
                       </td>
                   </tr>
                   <tr>
                       <td colspan="2">
                           <asp:Button ID="DoneButton" class="btn btn-default" runat="server" OnClick="DoneButton_Click" Text="Done" />
                       </td>
                   </tr>
                   <tr>
                       <td colspan="2"><span lang="EN-US">Thank you. Please print this page for your own record<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT [orderID], [orderDate] FROM Orders WHERE ([orderID] = @orderID)">
                           <SelectParameters>
                               <asp:SessionParameter Name="orderID" SessionField="sOrderNo" />
                           </SelectParameters>
                           </asp:SqlDataSource>
                           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT [orderPayMode], [orderDeliveryMode], [orderDeliveryCost] FROM Orders WHERE ([orderID] = @orderID)">
                               <SelectParameters>
                                   <asp:SessionParameter Name="orderID" SessionField="sOrderNo" />
                               </SelectParameters>
                           </asp:SqlDataSource>
                           <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT a.iOrderID, a.iProdID, a.iQty, a.iUnitPrice, a.iTotalPrice, b.ProdName FROM OrderItems AS a LEFT OUTER JOIN Products AS b ON a.iProdID = b.ProdID WHERE (a.iOrderID = @iOrderID)">
                               <SelectParameters>
                                   <asp:SessionParameter Name="iOrderID" SessionField="sOrderNo" Type="Int32" />
                               </SelectParameters>
                           </asp:SqlDataSource>
                           <br />
                           </span></td>
                   </tr>
                   <tr>
                       <td colspan="2">&nbsp;</td>
                   </tr>
               </table>

           </div>

        </section>
        <!-- End Blank Section -->

        <!-- End CONTENT ------------------------------------------------------------------------------>
  </form>
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


  


</body>
</html>
