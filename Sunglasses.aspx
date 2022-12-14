<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sunglasses.aspx.cs" Inherits="Sunglasses" %>

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
                            <a class="menu-has-sub">Account<i class="fa fa-angle-down"></i></a>
                            <!-- Dropdown -->
                            <ul class="sub-dropdown dropdown">
                                <li>
                                    <a href="ShoppingCart.aspx">Shopping Cart </a>
                                 
                                </li>
                                <li>
                                    <a href="TrackOrders.aspx">Track Order Status </a>
                                
                                </li>
                                <li>
                                    <a href="ApptBooking.aspx">Book Appointment </a>
                                
                                </li>
                               
                              
                               
                            <!-- End Dropdown -->
                                </ul>
                        </li>
                        <li>
                            <a class="menu-has-sub">Products <i class="fa fa-angle-down"></i></a>
                            <!-- Dropdown -->
                            <ul class="sub-dropdown dropdown">
                                 <li><a href="spectacles.aspx">Spectacles</a></li>
                                 <li><a href="contactlens.aspx">Contact lens</a></li>
                                 <li><a href="sunglasses.aspx">Sun-glasses</a></li>

                                <li>
                                    <a class="menu-has-sub">Others <i class="fa fa-angle-right"></i></a>
                                    <ul class="sub-dropdown">
                                        <li><a href="solution.aspx">Solution</a></li>
                                        <li><a href="cases.aspx">Cases</a></li>
                                        
                                    </ul>
                                </li>
                               
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
                            <asp:Label ID="trylbl" runat="server" Text="Label" Visible="False" ForeColor="#009999"></asp:Label>&nbsp;&nbsp;&nbsp;
                    
                        </li>
                              <li>
                                    <asp:Label ID="logoutlbl" runat="server" Text="Log Out" Visible="False" ForeColor="white"><a href="logout.aspx">Log out</a></asp:Label>

                        </li>
                    </ul>
                </div>
                <!-- End Navbar Navigation -->


            </div>
        </header>
        <!-- End Header -->

        <!-- CONTENT --------------------------------------------------------------------------------->
        <!-- Intro Section -->
        <section class="inner-intro bg-image overlay-light parallax parallax-background1" data-background-img="img/SunglassesImage.jpg">
            <div class="container">
                <div class="row title">
                    <h2 class="h2">Sunglasses</h2>
                    
                </div>
            </div>
        </section>
        <!-- End Intro Section -->
        
        <!-- Shop Item Section -->
        <section id="shop-item" class="ptb ptb-sm-80">
            <div class="container">
                <!-- Sort List -->
                <div class="row ">
                    <div class="col-md-12">
                        <div class="shop-filter mb-15">
                            <div class="float-right float-none-xs">
                                <p>1–9 of 10 results</p>
                            </div>
                            <div class="float-left float-none-xs">
                                <form>
                                    <label>Sort By</label>
                                    <select class="input-md round">
                                        <option>Default Sorting</option>
                                        <option>Popular</option>
                                        <option>Latest</option>
                                        <option>Average Price</option>
                                        <option>High Price</option>
                                        <option>Low Price</option>
                                    </select>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Sort List -->

<section>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT ProdName, ProdPrice, ProdUrl, ProdID FROM Products WHERE ProdType='Sunglasses';"></asp:SqlDataSource>
<asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
<AlternatingItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
<EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
<FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
<HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
<ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
                    <ItemTemplate>
                    <!--shop item--> 
                            <div class="item-box">
                            <div class="shop-item">
                        <!-- Shop item images -->
                                <div class="item-img">
                                     <asp:HyperLink ID="HyperLink2" runat="server" ImageUrl='<%# Eval("ProdUrl") %>' NavigateUrl='<%# Eval("ProdUrl", "~/ProductDetails2.aspx?ProdUrl={0}") %>' Text='<%# Bind("ProdName") %>' ImageHeight="215px" ImageWidth="240px"></asp:HyperLink>
                            </div>
                            
                                </div>
                         <!--End shop item images-->               
                         <!--Shop item info-->
                            <div class="shop-item-info">
                              
                                    <h6 class="shop-item-name">
                                    <asp:HyperLink ID="Hyperlink3" runat="server" Text='<%# Eval("ProdName") %>' NavigateUrl='<%# Eval("ProdID", "~/ProductDetails2.aspx?ProdID={0} ") %>' Font-Bold="True"> </asp:HyperLink>
                                      </h6>
                                    </a>
                                <div class="shop-item-price">
                                    <span>
                                        <asp:Label ID="ProdPriceLabel" runat="server" Text='<%# Eval("ProdPrice", "{0:C}") %>' Font-Bold="True" /><br />
                                    </span>
                                 </div>
                             </div>
                         <!--End shop item info-->
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </section>
             <!--End shop item-->          
                    
                
                    

                <!-- Pagination Nav -->
                <div class="pagination-nav mtb-30" style="visibility:hidden;">
                    <ul>
                        <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>
                <!-- End Pagination Nav -->
            </div>
        </section>
        <!-- End Shop Item Section -->

        <hr />

        <!-- Client Logos Section -->
        <section id="client-logos" class="wow fadeIn ptb ptb-sm-80">
            <div class="container">
                <div class="owl-carousel client-carousel nf-carousel-theme ">
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/01.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/02.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/03.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/04.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/05.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/06.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/08.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/01.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/02.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="img/logos/03.png" alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Client Logos Section -->

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
            <section class="copyright ptb-60">
                <div class="container">
                    <p class="">
                        © 2015 <a><b>Mazel Template</b></a>. All Rights Reserved.
                        <br />
                        Template  by <a target="_blank" href="http://nileforest.com/"><b>nileforest</b></a>
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
