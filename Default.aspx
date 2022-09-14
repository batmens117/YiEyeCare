<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="home" %>

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

                <!-- Rightside Menu (Search, Cart, Bart icon) -->
                <div class="side-menu-btn">
                    <ul>
                      

                    

                        <!--welcomeuser-->
                       
                        <!-- End welcomeuser-->
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
        <section id="intro" class="dark-bg">

            <!-- Hero Slider Section -->
            <div class="owl-carousel fullwidth-slider white o-flow-hidden">
                <!--Slide-->
                <form runat="server">
                <div class="item bg-img slide-bg-image parallax parallax-section1" data-background-img="img/full/a1.jpg">
                    <!-- Content -->
                    <div class="full-cap-wraper overlay-dark50 light-color">
                        <div class="content-caption light-color">
                            <div class="container">
                                <h5></h5>
                                <br />
                                <h1 class="h1">Welcome To Yi Eyecare</h1>
                                <br>
                                <div>

                                    <!-- class="btn btn-md btn-white-line xs-hidden" -->
                                    <asp:Button class="btn btn-md btn-white-line" ID="loginbutton" runat="server" Text="Login" OnClick="loginbutton_Click" PostBackUrl="~/Login.aspx" />
                                    <span class="btn-space-10"></span>
                                    <!-- "btn-space-10 xs-hidden" -->
                                    <asp:Button class="btn btn-md btn-white" ID="registerbutton" runat="server" Text="Register" OnClick="registerbutton_Click" PostBackUrl="~/Signup.aspx" />
                                     <asp:Button class="btn btn-md btn-white" ID="updatedetailsbutton" runat="server" Text="Update Details"  PostBackUrl="~/UpdateDetails.aspx" Visible="False" />
                                   

                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Content -->
                </div>
                </form>
                <!--Slide-->
                
                <div class="item bg-img slide-bg-image parallax parallax-section1" data-background-img="Images/banner.png">
                    
                    <div class="full-cap-wraper overlay-dark50 light-color">
                        <div class="content-caption light-color">
                            
                        </div>
                    </div>
                    <!-- End Content -->
                </div> 

        </div>
             <!-- End Hero Slider Section -->
        </section>
        <!-- End Intro Section -->
        <div class="clearfix"></div>
        <!--About Section-->
        <section id="about" class="wow fadeIn ptb ptb-sm-80">
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-8 col-md-offset-2">
                        <h3 class="h4">About Yi Eyecare</h3>
                        <div class="spacer-15"></div>
                        <p class="lead">An opticle shop that provides eye check up consultation and services. Other than this
                            , we sell spectacles and contact lenses too. All our employees are well-trained and professional in opticianry.
                        </p>
                        
                    </div>
                </div>
                 </div>
        </section>

       <!-- end section-->

        <!-- Service Section --> <!--
        <section id="service" class="gray-bg ptb ptb-sm-80">
            <div class="wow fadeInLeft container text-left">

                <div class="row">
                    <div class="col-md-4 col-sm-6 mb-45">
                        <div class="page-icon-top"><i class="ion ion-ios-compose-outline"></i></div>
                        <h5>Web Design</h5>
                        <p>Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-45">
                        <div class="page-icon-top"><i class="ion ion-ios-gear-outline"></i></div>
                        <h5>Development</h5>
                        <p>Donec sodales sagittis magna. hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus, augue velit cursus nunc.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-45">
                        <div class="page-icon-top"><i class="ion ion-social-apple-outline"></i></div>
                        <h5>Branding</h5>
                        <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Service Section -->


        <!-- Work Section -->
        <section id="work" class="wow fadeInUp ptb ptb-sm-80 text-center" style="padding-top:10px;">
            <div class="container">
                <h3>Our Products</h3>
                <div class="spacer-60"></div>
                <!-- work Filter -->
                <div class="row">
                    <ul class="container-filter categories-filter mb-0">
                        <li><a class="categories active" data-filter="*">All</a></li>
                        <li><a class="categories" data-filter=".spectacles">Spectacles</a></li>
                        <li><a class="categories" data-filter=".sunglasses">Sunglasses</a></li>
                        <li><a class="categories" data-filter=".contacts">Contact Lens</a></li>
                        <li><a class="categories" data-filter=".solution">Solutions</a></li>
                    </ul>
                </div>
                <!-- End work Filter -->
            </div>
            <!-- Work Gallary -->
            <div class="container">
                <div class="row container-grid nf-col-3">
                  

                    <div class="nf-item spectacles spacing">
                        <div class="item-box">
                            <a class="cbox-gallary1" href="Products.aspx#Specs" title="New Spectacles">
                                <img class="item-container" src="img/portfolio/h2.jpg" alt="1" />
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h5 class="white">New Spectacles</h5>
                                        <p class="white">Our latest designs</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                      <div class="nf-item spectacles spacing">
                        <div class="item-box">
                            <a class="cbox-gallary1" href="Products.aspx#Specs" title="Shop Spectacles">
                                <img class="item-container" src="img/portfolio/h1.jpg" alt="2" />
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h5 class="white">Shop Spectacles</h5>
                                        <p class="white">Check out the latest arrivals</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="nf-item solution spacing">
                        <div class="item-box">
                            <a class="cbox-gallary1" href="Products.aspx#Solution" title="Solution">
                                <img class="item-container" src="img/portfolio/h3.jpg" alt="3" />
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h5 class="white">Shop solution</h5>
                                        <p class="white">Inclusive of cases</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="nf-item sunglasses spacing">
                        <div class="item-box">
                            <a class="cbox-gallary1" href="Products.aspx#Sunglasses" title="Shop Sunglasses">
                                <img class="item-container" src="img/portfolio/h4.jpg" alt="4" />
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h5 class="white">Shop Sunglasses</h5>
                                        <p class="white">Trendy designs</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="nf-item contacts spacing">
                        <div class="item-box">
                            <a class="cbox-gallary1" href="Products.aspx#ContactLens" title="contacts">
                                <img class="item-container" src="img/portfolio/h5.jpg" alt="5" />
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h5 class="white">Shop Contact Lens</h5>
                                        <p class="white">Different colors and degrees</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="nf-item contacts spacing">
                        <div class="item-box">
                            <a class="cbox-gallary1" href="Products.aspx#ContactLens" title="brownlens">
                                <img class="item-container" src="img/portfolio/h6.jpg" alt="6" />
                                <div class="item-mask">
                                    <div class="item-caption">
                                        <h5 class="white">Honey Brown Lens</h5>
                                        <p class="white">Suitable for Asian Skin Tone</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
            <!-- End Work Gallary -->
        </section>
        <!-- End Work Section -->

      
  <!-- Testimonials -->
        <section id="testimonial" class="overlay-dark80 dark-bg ptb ptb-sm-80" style="background-image: url('img/full/bg22.jpg');" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="owl-carousel testimonial-carousel nf-carousel-theme white">
                    <div class="item">
                        <div class="testimonial text-center dark-color">
                            <div class="container-icon"><i class="fa fa-quote-right"></i></div>
                            <p class="lead">" I love my spectacles from Yi Eyecare! Will definitely patronise again in the future."</p>
                            <h6 class="quote-author">Rebecca <span style="font-weight: 400;">( Customer )</span></h6>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial text-center dark-color">
                            <div class="container-icon"><i class="fa fa-quote-right"></i></div>
                            <p class="lead">" Yi EyeCare provides QUALITY glasses and they look brilliant! Can't wait till they break and I require new ones! "</p>
                            <h6 class="quote-author">Alexander<span style="font-weight: 400;">( Customer )</span></h6>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial text-center dark-color">
                            <div class="container-icon"><i class="fa fa-quote-right"></i></div>
                            <p class="lead">" It was a pleasure and joy shopping at Yi Eyecare. Got my glasses real quick and at an affordable price!"</p>
                            <h6 class="quote-author">Adam <span style="font-weight: 400;">( Customer )</span></h6>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Testimonials -->
     
       
        <!-- Social Section -->
        <section id="social" class="gray-bg ptb ptb-sm-80">
            <div class="container text-center">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h3>Get Connect With Us</h3>
                    </div>
                </div>
                <div class="spacer-60"></div>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="row">
                            <div class="col-md-3 col-sm-4 col-xs-6">
                                <div class="page-icon-top">
                                    <i class="ion ion-social-twitter"></i>
                                </div>
                                <h6><a class="link" target="_blank" href="https://www.twitter.com/">Twitter</a></h6>
                            </div>
                            <div class="col-md-3 col-sm-4 col-xs-6">
                                <div class="page-icon-top">
                                    <i class="ion ion-social-facebook"></i>
                                </div>
                                <h6><a class="link" target="_blank" href="https://www.facebook.com/">Facebook</a></h6>
                            </div>
                            <div class="col-md-3 col-sm-4 col-xs-6">
                                <div class="page-icon-top">
                                    <i class="ion ion-social-instagram"></i>
                                </div>
                                <h6><a class="link" target="_blank" href="https://www.instagram.com/">Instagram</a></h6>
                            </div>
                          
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Social Section -->

        
        <hr />

      
       

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

                    

                   
                </div>
                <!--Footer Info -->
                <div class="row footer-info mb-60">
                    <div class="col-md-3 col-sm-12 col-xs-12 mb-sm-30">
                        <p class="mb-xs-0">Established in 2001. Our qualified and experience staff is dedicated to providing a professional eyecare solutions to our customers and also good after-sales service.</p>
                        <a class="btn-link-a" href="aboutus.aspx">Read More</a>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 mb-sm-30 mb-xs-0">
                        <ul class="link"> 
                            <li><a href="Login.aspx">Login</a></li>
                             <li><a href="Signup.aspx">Register</a></li>
                            <li><a href="location.aspx">Location</a></li>                                                  
                            <li><a href="faq.aspx">FAQ</a></li>
                            <li><a href="aboutus.aspx">About</a></li>
                            <li><a href="Services.aspx">Service</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-12 mb-sm-30">
                        <ul class="link">
                            <li><a href="contactus.aspx">Contact Us</a></li>
                            <li><a href="Products.aspx">Products</a></li>
                            <li><a href="shoppingcart.aspx">Shopping Cart</a></li>
                            <li><a href="privacypolicy.aspx">Privacy Policy</a></li>
                            <li><a href="Termsncondition.aspx">Terms & Conditions</a></li>
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

    <script id="setmore_script" type="text/javascript" src="https://my.setmore.com/js/iframe/setmore_iframe.js"></script><a id="Setmore_button_iframe" style="float:none" href="https://my.setmore.com/bookingpage/54654ba8-81fe-4b94-96ee-7e982a840f77">
      
    <!-- JS -->
    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.easing.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script>
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
    <script src="js/contact-form.js" type="text/javascript"></script>

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
