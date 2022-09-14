<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmpRecords.aspx.cs" Inherits="EmpRecords" Debug="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
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
        <section class="inner-intro parallax parallax-background1"  Runat="Server" style="background-color: #aad0c2;">
            <div class="container">
                <div class="row title">

                    <h2 class="h2">Employees Details</h2>

                    <div class="page-breadcrumb">
                        <a href="Employees.aspx">Back to Main Page</a>
                        

                    </div>
                </div>
            </div>
        </section>
        <div class="clearfix"><form runat="server">
            <div style="margin:20px 0px 20px 20px">
<asp:Label ID="Label2" runat="server" Text="Search By" 
BorderStyle="None" EnableTheming="True"></asp:Label>
<asp:DropDownList ID="DropDownList1" runat="server" style="margin-left: 27px">
<asp:ListItem>EmpID</asp:ListItem>
<asp:ListItem>EmpFirstName</asp:ListItem>
    <asp:ListItem>EmpLastName</asp:ListItem>
    <asp:ListItem>EmpAccessLevel</asp:ListItem>
    <asp:ListItem>EmpQualification</asp:ListItem>
</asp:DropDownList>
<asp:TextBox ID="txtSearchName" runat="server" style="margin-left:15px"
BorderStyle="Ridge" ForeColor="Black" 
></asp:TextBox>
<asp:Button ID="btnSearch" runat="server" Text="Go" onclick="btnSearch_Click" 
Width="65px" style="margin-left: 18px" />
</div>
 
            <br />
            <br />

            <!--DataSourceID="SqlDataSource1"-->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" datakeynames="EmpID" EnablePersistedSelection="True" HorizontalAlign="Center" Width="80%"> 
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" />
            <asp:BoundField DataField="EmpFirstName" HeaderText="EmpFirstName" SortExpression="EmpFirstName" />
            <asp:BoundField DataField="EmpLastName" HeaderText="EmpLastName" SortExpression="EmpLastName" />
            <asp:BoundField DataField="EmpAccessLevel" HeaderText="EmpAccessLevel" SortExpression="EmpAccessLevel" />
            <asp:BoundField DataField="EmpQualification" HeaderText="EmpQualification" SortExpression="EmpQualification" />
        </Columns>
    </asp:GridView>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="80%" DataSourceID="SqlDataSource2" AutoGenerateRows="False" HorizontalAlign="Center" DataKeyNames="EmpID">
        <Fields>
            <asp:BoundField DataField="EmpID" HeaderText="EmpID" SortExpression="EmpID" ReadOnly="True" />
            <asp:BoundField DataField="EmpFirstName" HeaderText="EmpFirstName" SortExpression="EmpFirstName" />
            <asp:BoundField DataField="EmpLastName" HeaderText="EmpLastName" SortExpression="EmpLastName" />
            <asp:BoundField DataField="EmpAccessLevel" HeaderText="EmpAccessLevel" SortExpression="EmpAccessLevel" />
            <asp:BoundField DataField="EmpQualification" HeaderText="EmpQualification" SortExpression="EmpQualification" />
            <asp:BoundField DataField="EmpAddress" HeaderText="EmpAddress" SortExpression="EmpAddress" />
            <asp:BoundField DataField="EmpEmail" HeaderText="EmpEmail" SortExpression="EmpEmail" />
            <asp:BoundField DataField="EmpPhoneNumber" HeaderText="EmpPhoneNumber" SortExpression="EmpPhoneNumber" />
            <asp:BoundField DataField="EmpPass" HeaderText="EmpPass" SortExpression="EmpPass" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT [EmpID], [EmpFirstName], [EmpLastName], [EmpAccessLevel], [EmpQualification] FROM [Employees]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:YECConnectionString %>" SelectCommand="SELECT * FROM [Employees] WHERE ([EmpID] = @EmpID)" DeleteCommand="DELETE FROM [Employees] WHERE [EmpID] = @EmpID" InsertCommand="INSERT INTO [Employees] ([EmpID], [EmpFirstName], [EmpLastName], [EmpAccessLevel], [EmpQualification], [EmpAddress], [EmpEmail], [EmpPhoneNumber], [EmpPass]) VALUES (@EmpID, @EmpFirstName, @EmpLastName, @EmpAccessLevel, @EmpQualification, @EmpAddress, @EmpEmail, @EmpPhoneNumber, @EmpPass)" UpdateCommand="UPDATE [Employees] SET [EmpFirstName] = @EmpFirstName, [EmpLastName] = @EmpLastName, [EmpAccessLevel] = @EmpAccessLevel, [EmpQualification] = @EmpQualification, [EmpAddress] = @EmpAddress, [EmpEmail] = @EmpEmail, [EmpPhoneNumber] = @EmpPhoneNumber, [EmpPass] = @EmpPass WHERE [EmpID] = @EmpID">
        <DeleteParameters>
            <asp:Parameter Name="EmpID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmpID" Type="Int32" />
            <asp:Parameter Name="EmpFirstName" Type="String" />
            <asp:Parameter Name="EmpLastName" Type="String" />
            <asp:Parameter Name="EmpAccessLevel" Type="Int32" />
            <asp:Parameter Name="EmpQualification" Type="String" />
            <asp:Parameter Name="EmpAddress" Type="String" />
            <asp:Parameter Name="EmpEmail" Type="String" />
            <asp:Parameter Name="EmpPhoneNumber" Type="String" />
            <asp:Parameter Name="EmpPass" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="EmpID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EmpFirstName" Type="String" />
                            <asp:Parameter Name="EmpLastName" Type="String" />
                            <asp:Parameter Name="EmpAccessLevel" Type="Int32" />
                            <asp:Parameter Name="EmpQualification" Type="String" />
                            <asp:Parameter Name="EmpAddress" Type="String" />
                            <asp:Parameter Name="EmpEmail" Type="String" />
                            <asp:Parameter Name="EmpPhoneNumber" Type="String" />
                            <asp:Parameter Name="EmpPass" Type="String" />
                            <asp:Parameter Name="EmpID" Type="Int32" />
        </UpdateParameters>
                        </asp:SqlDataSource>
</form></div>
        <!-- End Intro Section -->



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