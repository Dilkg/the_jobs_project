<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="com.example.consultapp.model.Consultant"%>

<!DOCTYPE html>
<html>
<head>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap-social.css" rel="stylesheet">
    <title>Job Appointment</title>


    <title>JobAppointment</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Infirmary Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="css/jquery-ui.css" />
    <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- js -->
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="js/numscroller-1.0.js"></script>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.autocomplete.min.js"></script>
    <script type="text/javascript" src="js/currency-autocomplete.js"></script>

    <!-- //js -->


    <!-- fonts -->
    <link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Viga' rel='stylesheet' type='text/css'>

    <!-- start-smoth-scrolling -->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!-- start-smoth-scrolling -->

    <!--start-date-piker-->
    <script src="js/jquery-ui.js"></script>
    <script>
        $(function() {
            $( "#datepicker,#datepicker1" ).datepicker();
        });
    </script>
    <!--/End-date-piker-->
    <script src="js/responsiveslides.min.js"></script>
    <!--animate-->
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
</head>
<body>
<div class="header wow zoomIn">
    <div class="container">
        <div class="header_right">
            <div class="login">
                <ul>
                    <li><a href="#"><span aria-hidden="true"><img src="icon/user.png" width="30px" height="40px">
                    <% Consultant pat = (Consultant) session.getAttribute("currentSessionUser");%>

             <%= pat.getName()  %></span></a></li>
                    <li><a href="logout"><span aria-hidden="true" >Logout</span></a></li>

                </ul>
            </div>

        </div>
    </div>
</div>
<div class="header-bottom ">
    <div class="container">
        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="logo grid">
                    <div class="grid__item color-3">
                        <h1><a class="link link--nukun" href="index.jsp">The<span>Jobs</span></a></h1>
                    </div>
                </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                <nav class="menu menu--horatio">
                    <ul class="nav navbar-nav menu__list">
                        <%--							<li class="menu__item"><a href="jobseeker.jsp" class="menu__link">Book</a></li>--%>
                        <%--							<li class="menu__item"><a href="#myModal5" class="menu__link">--%>
                        <%--                                Register Consultant/Job Seeker--%>
                        <%--                            </a></li>--%>

                        <%--							--%>
                        <%--							<li class="menu__item menu__item--current"><a href="mydetails.jsp" class="menu__link">My Details</a></li>--%>

                    </ul>
                </nav>
            </div>
        </nav>
    </div>
</div>
<p style="padding:40px;"></p>
<div class="Container">
    <div class="row row-content">
        <div class="col-xs-12 col-sm-4 col-sm-offset-5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=icon/patient.png width="100px" height="100px">
        </div>
    </div>
</div>
<p style="padding:20px;"></p>
<div class="Container">
    <div class="row row-content">
        <div class="col-xs-12  col-sm-4 col-sm-offset-5">
            <% Consultant pat2 = (Consultant) session.getAttribute("currentSessionUser");%>
            <h4><strong><span><%= pat2.getName()  %></span> </strong></h4>
        </div>
    </div>
</div>
<p style="padding:00px;">

</p>
<div class="Container">
    <div class="row row-content">
        <div class="col-xs-12 col-sm-8 col-sm-offset-5">UserName:<span> <%= pat2.getUserName()  %></span>
        </div>
    </div>
</div>
<p style="padding:5px;"></p>
<div class="Container">
    <div class="row row-content">
        <div class="col-xs-12 col-sm-8 col-sm-offset-5">Role:<span> <%= pat2.getRole()  %></span>
        </div>
    </div>
</div>
<p style="padding:20px;"></p>
<div class="Container">
    <div class="row row-content">

        <div class="col-xs-12 col-sm-4">&nbsp;
        </div>
        <div class="col-xs-12 col-sm-3"><input type="button" class="button btn-info" value="change password" >
        </div>
        <div class="col-xs-12 col-sm-3"><input type="button" class="button btn-info" value="Edit Account" >
        </div>
    </div>
</div><div class="modal fade" id="myModal5" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-info">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body modal-spa">
                <div class="login-grids">
                    <div class="login-bottom">
                        <h3>Sign up for free</h3>
                        <form action="PatSignupServlet" method="post">
                            <div class="sign-up">
                                <h4>UserName :</h4>
                                <input type="text" name="id" value="UserName" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
                            </div>
                            <div class="sign-up">
                                <h4>Name :</h4>
                                <input type="text" name="name" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
                            </div>
                            <div class="sign-up">
                                <h4>Gender :</h4>
                                <input type="radio" name="gender" value="male" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">	Male &nbsp;
                                <input type="radio" name="gender" value="female" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">	Female &nbsp;
                            </div><br><br>
                            <div class="sign-up">

                                <h4>Age :</h4>
                                <input type="number" min="15" max="150" name="age" value="age" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'date';}" required=""><br><br>
                            </div>

                            <div class="sign-up">
                                <h4>Email  :</h4>
                                <input type="email" name="email_id" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}" required=""><br><br>
                            </div>

                            <div class="sign-up">
                                <h4>Phone  :</h4>
                                <input type="text" name="phone_no"  value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
                            </div>
                            <div class="sign-up">
                                <h4>Address  :</h4>
                                <input type="text" name="address" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
                            </div>

                            <div class="sign-up">
                                <h4>Password :</h4>
                                <input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">

                            </div>
                            <div class="sign-up">
                                <h4>Re-type Password :</h4>
                                <input type="password" name="confirm_password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">

                            </div>
                            <%
                                String signup_msg1=(String)request.getAttribute("error");
                                if(signup_msg1!=null)
                                    out.println("<font color=red size=4px>"+signup_msg1+"</font>");
                            %><br>
                            <div class="sign-up">
                                <input type="submit" value="REGISTER NOW" >
                            </div>

                        </form>
                    </div>
                    <p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<p style="padding:80px;"></p>

</body>
</html>