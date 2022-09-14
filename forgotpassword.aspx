<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" Inherits="Login"  %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Yi Eyecare - Forgot Password</title>
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

    <!-- Sidemenu --><!--
    <section id="pushmenu-right" class="pushmenu pushmenu-right side-menu">
        <a id="menu-sidebar-close-icon" class="menu-close"><i class="ion ion-android-close"></i></a>
        <h5 class="white">Sign In</h5>
        <div class="sign-in">
            <input class="input-sm form-full" type="email" aria-required="true" id="email" name="email" placeholder="Email" value="" />
            <input class="input-sm form-full" type="password" aria-required="true" id="password" name="password" placeholder="Password" value="" />
            <input type="submit" class="btn btn-md btn-color-b form-full" value="Sign In" />
            <a>New Customer?</a>
        </div>
        <ul>
            <li><a class="all-demos-link" target="_blank" href="../demo.html">Main Demo Page</a></li>
            <li><a href="home.html">Home Default</a></li>
            <li><a href="portfolio-grid-2col.html">Portfolio</a></li>
            <li><a href="login-register.html">Login & Signup</a></li>
            <li><a href="faq-1.html">FAQ</a></li>
            <li><a href="about-1.html">About</a></li>
            <li><a href="service-1.html">Service</a></li>
            <li><a href="blog-grid-3col.html">Blog</a></li>
            <li><a href="404-error-1.html">404 Error</a></li>
            <li><a href="shop-checkout.html">Shopping Cart</a></li>
            <li><a href="contact-1.html">Contact Us</a></li>
        </ul>
    </section>
    <!--End Sidemenu -->

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

                <!-- Rightside Menu (Search, Cart, Bart icon) -->
                <div class="side-menu-btn">
                    <ul>
                        <!-- Search Icon -->
                        <li class="">
                            <a class="search-overlay-menu-btn header-icon"><i class="fa fa-search"></i></a>
                        </li>
                        <!-- End Search Icon -->

                      
                                                                   

                     
                    </ul>
                </div>
                <!-- End Rightside Menu -->

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
        <!--<section class="inner-intro">
            <div class="container">
                <div class="row title">
                    <h2 class="h2">Login-Register</h2>
                    <div class="page-breadcrumb">
                        <a>Home</a>/<span>Login-Register</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Intro Section -->
        
        <!-- Login Section -->
        <section id="Pricing" class="ptb ptb-sm-80">
            
            <div class="container">
                
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                        <div class="tabs b-lrb-none">
                            
                            <div class="ui-tab-content">
                                <div id="tabs-1" class="plr-0">
                                    <br />
                                    <h4>Forgetten password?</h4>
                                 <form runat="server">     
                                        <div class="form-field-wrapper">
                                            
                                            <label for="login-email">Please Enter Your Email</label><asp:RequiredFieldValidator ID="RequiredFieldValidatoruserid" runat="server" ErrorMessage="Please Enter User ID" ControlToValidate="fpuseremail">*</asp:RequiredFieldValidator>  
                                            
                                            <asp:TextBox ID="fpuseremail" runat="server" class="input-sm form-full" ></asp:TextBox>
                                            </div>
                                                                               
                                        <asp:Button ID="fpbtn" runat="server" Text="Sends Email" class="btn btn-md btn-black" OnClick="fpbtn_Click" />
                                        <asp:Label ID="displaylbl" runat="server"></asp:Label>
                                        <a class="float-right" href="Default.aspx">Back to Homepage</a>                                  
                          </form> 
                                    </div>
                              
                          
                                            
                        </div>
                    </div>

                </div>
                    
            </div>
                </div>
            
                  
        </section>
        <!-- End Login Section -->

        <!-- End CONTENT ------------------------------------------------------------------------------>

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
    <script src="js/plugin/jquery.validate.min.js" type="text/javascript"></script>
    <script src="js/plugin/sidebar-menu.js" type="text/javascript"></script>
    <script src="js/theme.js" type="text/javascript"></script>
    <script src="js/navigation.js" type="text/javascript"></script>

    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
    var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
    (function(){
    var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
    s1.async=true;
    s1.src='https://embed.tawk.to/5783d4b3c823e1bd608790b7/default';
    s1.charset='UTF-8';
    s1.setAttribute('crossorigin','*');
    s0.parentNode.insertBefore(s1,s0);
    })();
    </script>
    <!--End of Tawk.to Script-->


</body>
</html>
 