<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employees.aspx.cs" Inherits="Employees" Debug="true" %>
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
        <header id="header" class="header header-light">
            <div class="container header-inner">

                <!-- Logo -->
                <div class="logo">
                    <a href="index.html">
                       <img class="logo-light" src="Images/Yieyecarelogo2.png" alt="Yi Eyecare" />
                        <img class="logo-dark" src="Images/Yieyecarelogo1.png" alt="Yi Eyecare" />
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

        <!-- CONTENT --------------------------------------------------------------------------------->
        <!-- Intro Section -->
        <form runat="server">
        <section class="inner-intro bg-image overlay-light parallax parallax-background1" data-background-img="images/employeesbanner.jpg">
            <div class="container">
                <div class="row title">
                    <h2 class="h2">Yi Eyecare</h2>
                    <h3>Employee's Page</h3>
                    <br />
                    <div class="page-breadcrumb">
                        <asp:Label ID="WelcomeLabel" runat="server" Text=""></asp:Label>
                        <br />
                        
                      
                    </div>
                    <br />
                    <asp:Button ID="LogoutButton" runat="server" Text="LogOut" OnClick="LogoutButton_Click" />
                </div>
            </div>
        </section>
        <!-- End Intro Section -->
        
        <!-- Work Section -->
        <section class="ptb ptb-sm-80">
            <div class="container">
                <!-- work Filter
                <div class="row">
                    <ul class="container-filter categories-filter">
                        <li><a class="categories active" data-filter="*">All</a></li>
                        <li><a class="categories" data-filter=".branding">Branding</a></li>
                        <li><a class="categories" data-filter=".design">Design</a></li>
                        <li><a class="categories" data-filter=".photo">Photo</a></li>
                        <li><a class="categories" data-filter=".coffee">coffee</a></li>
                    </ul>
                </div>
                End work Filter -->
                <div class="row container-grid nf-col-3">
                    
                    <div class="nf-item branding coffee spacing">
                        <div class="item-box">
                            <a href="EmpRecords.aspx">
                                <asp:ImageButton ID="ImageButton1" runat="server" alt="1" src="Images/EmpRecord.jpg" class="item-container" style="height: 217px; width: 340px;"></asp:ImageButton>
                             
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h1 class="white">Employees Details</h1>
                                      
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
              

                    <div class="nf-item photo spacing" >
                        <div class="item-box">
                            <a href="CustRecords.aspx">
                                 <asp:ImageButton ID="ImageButton2" runat="server" alt="1" src="Images/CustRecords.jpg" class="item-container" style="height: 217px; width: 340px;"></asp:ImageButton>
                            
                                <div class=" item-mask">
                                    <div class="item-caption">
                                        <h1 class="white">Customers Details</h1>
                                     
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                   
                    <div class="nf-item branding coffee spacing">
                        <div class="item-box">
                            <a href="approveapptnew.aspx">
                                 <asp:ImageButton ID="ImageButton3" runat="server" alt="1" src="Images/ApptBooking.png" class="item-container" style="height: 217px; width: 340px;"></asp:ImageButton>
              
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h2 class="white">Approve Appointment Bookings</h2>
                                      
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                       

                    <div class="nf-item design spacing">
                        <div class="item-box">
                            <a href="SupRecords.aspx">
                                 <asp:ImageButton ID="ImageButton4" runat="server" alt="1" src="Images/Supplier.jpg" class="item-container" style="height: 217px; width: 340px;"></asp:ImageButton>
              
                         
                                <div class=" item-mask">
                                    <div class="item-caption">
                                        <h1 class="white">Suppliers Details</h1>
                                        
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                        
                    <div class="nf-item branding spacing">
                        <div class="item-box">
                            <a href="ProdDetails.aspx">
                                 <asp:ImageButton ID="ImageButton5" runat="server" alt="1" src="Images/ProdDetails.jpg" class="item-container" style="height: 217px; width: 340px;"></asp:ImageButton>
 
      
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h1 class="white">Product Details</h1>
                                       
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                      
                    <div class="nf-item photo spacing">
                        <div class="item-box">
                            <a href="UpdateDeliveryStatus.aspx">
                                 <asp:ImageButton ID="ImageButton6" runat="server" alt="1" src="Images/UpdateDelStatus.jpg" class="item-container" style="height: 217px; width: 340px;"></asp:ImageButton>
                            
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h2 class="white">Update Delivery Status</h2>
                                      
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                      
                     <div class="nf-item photo spacing">
                        <div class="item-box">
                            <a href="Analysis.aspx">
                                 <asp:ImageButton ID="ImageButton7" runat="server" alt="1" src="Images/Analytics.jpg" class="item-container" style="height: 217px; width: 340px;"></asp:ImageButton>
                            
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h2 class="white">Business Analysis</h2>
                                      
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                      
                   
             
                </div>

            </div>

        </section>
                   </form>
        <!-- End Work Section -->


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


</body>
</html>
