<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TrackOrders.aspx.cs" Inherits="TrackOrders" Debug="true" %>

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
    <link rel="shortcut icon" type="image/x-icon" href="Images/favicon.ico">
    <link rel="icon" type="image/png" href="Images/favicon.png">
    <link rel="apple-touch-icon" href="Images/favicon.png">

    <!-- CSS -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="css/ionicons.css" rel="stylesheet" type="text/css" />
    <link href="css/plugin/sidebar-menu.css" rel="stylesheet" type="text/css" />
    <link href="css/plugin/animate.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
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
                       <img class="logo-light" src="images/Yieyecarelogo2.png" alt="Yi Eyecare" />
                        <img class="logo-dark" src="images/Yieyecarelogo1.png" alt="Yi Eyecare" />
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
        <section class="inner-intro dark-bg bg-image overlay-dark parallax parallax-background1" data-background-img="images/OrderTracking.png">

            <div class="container">
                <div class="row title">
                    <h2 class="h2">Track Order Status</h2>
                    <div class="page-breadcrumb">
                        <a href="Default.aspx">Back to Home</a>
                    </div>
                </div>
            </div>
        </section>
        <div class="clearfix"></div>
        <!-- End Intro Section -->


        <!-- Blank Section -->
        <section class="ptb ptb-sm-80">

         <form runat="server" style="text-align:center;">
             <asp:Label ID="TrackLabel" runat="server" Font-Size="X-Large">My Order History:</asp:Label>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="orderID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="80%" AllowPaging="True" AllowSorting="True">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="orderID" HeaderText="Order ID" ReadOnly="True" SortExpression="orderID" />
                                    <asp:BoundField DataField="orderDate" HeaderText="Order Date" SortExpression="orderDate" />
                                    <asp:BoundField DataField="orderDeliveryMode" HeaderText="DeliveryMode" SortExpression="orderDeliveryMode" />
                                    <asp:BoundField DataField="orderStatus" HeaderText="Order Status" SortExpression="orderStatus" />
                                </Columns>
                            </asp:GridView>
                            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="iTransID" HorizontalAlign="Center" Width="80%">
                                <Columns>
                                    <asp:BoundField DataField="iTransID" HeaderText="Transaction ID" InsertVisible="False" ReadOnly="True" SortExpression="iTransID" />
                                    <asp:BoundField DataField="iProdID" HeaderText="Product ID" SortExpression="iProdID" />
                                    <asp:BoundField DataField="iQty" HeaderText="Quantity" SortExpression="iQty" />
                                    <asp:BoundField DataField="iTotalPrice" HeaderText="Total Price" SortExpression="iTotalPrice" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT orderID, orderDate, orderDeliveryMode, orderStatus FROM Orders WHERE (orderUserName = @orderUserName)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="orderUserName" SessionField="sUserName" />
                                </SelectParameters>
                               
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT iTransID, iProdID, iQty, iUnitPrice, iTotalPrice FROM [OrderItems] WHERE ([iOrderID] = @iOrderID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" Name="iOrderID" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
             </form>

        </section>
        <!-- End Blank Section -->

        <!-- End CONTENT ------------------------------------------------------------------------------>
 <!-- FOOTER -->
        <footer class="footer pt-80">
            <div class="container">
                <div class="row mb-60">
                    <!-- Logo -->
                    <div class="col-md-3 col-sm-3 col-xs-12 mb-xs-30">
                        <a class="footer-logo" href="Default.aspx">
                            <img src="Images/Yieyecarelogo1.png" /></a>
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
