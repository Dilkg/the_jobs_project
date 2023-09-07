
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="com.example.consultapp.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        #b{

            border:1px solid;
            background: blue;
            color: aliceblue;
        }
    </style>
    <style>
        .form-control.time-slot {
            padding: 10px; /* You can adjust the padding value as needed */
        }
        .b
    </style>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        function Ser(val)
        {
            var doctor = ["gynacologist", "dentist", "eye", "ear-nose-Throat", "homeopathey", "ayurvedic","dr. ramesh kumar","dr. monika nagar","dr bathra "]
            var link   = ["gynacologist", "dentist.html", "eye", "ear-nose-Throat", "homeopathey", "ayurvedic","dr. ramesh kumar","dr. monika nagar","dr bathra "]

            console.log(val);
            var doctorDisplay = new Array(9);
            var doctorLink = new Array(9);
            var j=0;

            //var HTML = "<table  class=\"table table-hover\">";
            HTML = "<div class=\"list-group\" >"
            for (var i = 0; i < 9; i++)
            {
                var status = doctor[i].includes(val);
                if (status)
                {
                    doctorDisplay[j]= doctor[i];
                    doctorLink[j]=link[i];

                    console.log("this is array" + doctorDisplay[i]);
                    /* HTML +="<a href='"+doctorLink[j]+"'";
                     HTML +="<tr>"+doctorDisplay[j]+"</tr>";
                     HTML += "</a></br>";*/
                    HTML +="<a href='"+doctorLink[j]+"' class=\"list-group-item\">"+doctorDisplay[j]+"</a>";
                    j++;
                }
            }
            HTML += "</div>";
            if(val.length== 0)
            {
                document.getElementById("outputDiv").innerHTML = "";

            }
            else
            {
                document.getElementById("outputDiv").innerHTML = HTML;
            }
        }
    </script>
    <script>
        function city()
        {
            //var city = ["Jaipur", "Ahemdabad", "Gurgaon", "Bhopal", "Udaipur", "Chennai","Banglore","Jamshedpur","Patna","Surat","Srinagar","Chandigarh","Panji","Kanpur","Lucknow"]
            $( "#tags" ).autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url : "SearchController",
                        type : "GET",
                        data : {
                            term : request.term,
                            kind : "city"
                        },
                        dataType : "json",
                        success : function(data) {
                            response(data);
                        }
                    });
                }
            });
            // var doctor = ["gynacologist", "dentist", "eye", "ear-nose-Throat", "homeopathey", "ayurvedic","dr. ramesh kumar","dr. monika nagar","dr bathra "]
            $("#doc").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url : "SearchController",
                        type : "GET",
                        data : {
                            term : request.term,
                            kind : "spec"
                        },
                        dataType : "json",
                        success : function(data) {
                            response(data);
                        }
                    });
                }
            });

        }
    </script>
    <title>Job Consultation Appointement</title>
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
<!-- header -->
<div class="header wow zoomIn">
    <div class="container">
        <div class="header_right">
            <div class="login">
                <ul>



                    <li><a href="#"><span aria-hidden="true"><img src="icon/user.png" width="30px" height="40px"></span>       <% String doc = (String) session.getAttribute("username");%>

                        <%= doc + " "  %></a></li>
                    <li><a href="logout"><span aria-hidden="true" >Logout</span></a></li>

                </ul>
            </div>

        </div>
    </div>
</div>
<!-- //header -->
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
                        <h1><a class="link link--nukun" href="index.jsp">Consultation<span>Appointment</span></a></h1>
                    </div>
                </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                <nav class="menu menu--horatio">
                    <ul class="nav navbar-nav menu__list">


                    </ul>
                </nav>
            </div>
        </nav>
    </div>
</div>

<div class="container mt-5">
    <form action="./ConsultantAddSheduleServlet" method="post" class="styled-form">
        <%
            String userid = request.getParameter("id");
            String name = request.getParameter("name");
        %>
        <div class="mb-3">
            <label for="selectedDate" class="form-label">Consultant Name</label>
            <input type="text" class="form-control" id="username" name="username" value="<%= name %>">
            <input type="hidden" class="form-control" id="userid" name="userid" value="<%= userid %>">
        </div>

        <div class="mb-3">
            <label for="selectedDate" class="form-label">Select Date:</label>
            <input type="date" class="form-control" id="selectedDate" name="date" required>
        </div>
        <div class="mb-3" style="margin: 10px;">
            <label class="form-label">Add Time Slots:</label><br><br>
            <div id="timeSlotsContainer">
                <!-- JavaScript will dynamically add time slot inputs here -->
            </div>
            <button type="button" class="btn btn-primary mb-3" onclick="addTimeSlot()">Add Time Slot</button>
            <button type="button" class="btn btn-warning mb-3" onclick="removeTimeSlot()">Remove Time Slot</button>
        </div><br><br><br>
        <button type="submit" class="btn btn-success btn-lg btn-block" onclick="gatherTimeSlots()">Submit</button>
        <input type="hidden" id="timeSlotsArrayInput" name="timeSlotsArray">

    </form>
</div>

<style>
    .styled-form {
        max-width: 600px;
        margin: 0 auto;
    }

</style>

<script>
    let timeSlotIndex = 1;

    function addTimeSlot() {
        const timeSlotContainer = document.getElementById('timeSlotsContainer');

        const timeSlotInput = document.createElement('input');
        timeSlotInput.setAttribute('type', 'time');
        timeSlotInput.setAttribute('class', 'form-control mb-2 time-slot'); // Add the time-slot class
        timeSlotInput.setAttribute('name', 'timeSlot_' + timeSlotIndex);
        timeSlotInput.setAttribute('style','margin:10px; width: 200px')
        timeSlotInput.required = true;

        timeSlotContainer.appendChild(timeSlotInput);

        timeSlotIndex++;
    }

    function gatherTimeSlots() {
        const timeSlotInputs = document.querySelectorAll('.time-slot');
        const timeSlotsArray = [];

        timeSlotInputs.forEach(input => {
            timeSlotsArray.push(input.value);
        });

        // Set the value of the hidden input field with the JSON-encoded array
        document.getElementById('timeSlotsArrayInput').value = JSON.stringify(timeSlotsArray);
    }


    function removeTimeSlot() {
        const timeSlotContainer = document.getElementById('timeSlotsContainer');
        timeSlotContainer.removeChild(timeSlotContainer.lastChild);
        timeSlotIndex--;
    }

</script>
<!-- //banner -->
<!-- content -->







<!-- login -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-info">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body modal-spa">
                <div class="login-grids">

                    <div class="login-right">
                        <h3>Sign in with your account</h3>
                        <form  action="/user" method="post">
                            <div class="sign-in">
                                <h4>UserName :</h4>
                                <input type="text" name="username" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
                            </div>
                            <div class="sign-in">
                                <h4>Password :</h4>
                                <input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
                                <a href="#">Forgot password?</a>
                            </div>

                            <div class="single-bottom">
                                <input type="checkbox"  id="brand1" value="">
                                <label for="brand"><span></span>Remember Me.</label>
                            </div>
                            <% String login_msg=(String)request.getAttribute("error");
                                if(login_msg!=null)
                                    out.println("<font color=red size=4px>"+login_msg+"</font>");%><br>
                            <div class="sign-in">
                                <input type="submit" value="SIGNIN" onclick="pa">
                            </div>
                        </form>
                        <form action="#">
                            <p style="padding:1px;"></p>
                            <div class="sign-in">

                            </div>
                        </form>
                    </div>


                    <p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //login -->
<!-- login -->
<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" >
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
<div class="modal fade" id="myModal6" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-info">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body modal-spa">
                <div class="login-grids">
                    <div class="login-right">
                        <h3>Sign in with your account</h3>
                        <form id="signinForm" action="${pageContext.request.contextPath}/user" method="post">
                            <div class="sign-in">
                                <h4>UserName :</h4>
                                <input type="text" name="username" value=""
                                       onfocus="this.value = '';"
                                       onblur="if (this.value == '') {this.value = '';}" required="">

                            </div>
                            <div class="sign-in">
                                <h4>Password :</h4>
                                <input type="password" name="password" value=""
                                       onfocus="this.value = '';"
                                       onblur="if (this.value == '') {this.value = '';}" required="">

                                <a href="#">Forgot password?</a>
                            </div>
                            <!-- ... other form elements ... -->
                            <div class="sign-in">
                                <input type="submit" value="SIGNIN">
                            </div>
                        </form>






                    </div>
                    <p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal9" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-info">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body modal-spa">
                <div class="login-grids">

                    <div class="login-right">
                        <h3>Sign in with your account</h3>
                        <form action="/user" method="post">
                            <div class="sign-in">
                                <h4>UserName :</h4>
                                <input type="text" name="id" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">
                            </div>
                            <div class="sign-in">
                                <h4>Password :</h4>
                                <input type="password" name="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">
                                <a href="#">Forgot password?</a>
                            </div>
                            <div class="single-bottom">
                                <input type="checkbox"  id="brand" value="">
                                <label for="brand"><span></span>Remember Me.</label>
                            </div>
                            <%
                                String login_msg2=(String)request.getAttribute("error");
                                if(login_msg2!=null)
                                    out.println("<font color=red size=4px>"+login_msg2+"</font>");
                            %><br>
                            <div class="sign-in">
                                <input type="submit" value="SIGNIN" onclick="pa">
                            </div>

                        </form>

                    </div>


                    <p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a href="#">Privacy Policy</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal7" tabindex="-1" role="dialog" >
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-info">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body modal-spa">
                <div class="login-grids">
                    <div class="login-bottom">
                        <h3>Sign up for free</h3>
                        <form  action="DocSignupServlet" method="post">
                            <div class="sign-up">
                                <h4>Username</h4>
                                <input type="text" name="id" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
                            </div>
                            <div class="sign-up">
                                <h4>Name : Dr. </h4>
                                <input type="text" name="name" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
                            </div>
                            <div class="sign-up">
                                <h4>Age :</h4>
                                <input type="number" min="25" max="150" name="age" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">	<br><br>
                            </div>
                            <div class="sign-up">

                                <h4>Email :</h4>
                                <input type="email" name="email_id" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Type here';}" required="">	<br/><br/>

                            </div>
                            <div class="sign-up">
                                <h4>Phone</h4>
                                <input type="text"  name="phone_no" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">	<br/>
                            </div>

                            <div class="sign-up">
                                <h4>Location</h4>
                                <input type="text" name="location" value="Type here" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
                            </div>

                            <div class="sign-up">
                                <h4> Specilization :</h4>
                                <input type="text" name="spec" value="Specilization" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Specilization';}" required="">

                            </div>
                            <div class="sign-up">
                                <h4>Experiance :</h4>
                                <input type="number" name="exp" value="Year Of Experiance" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Experiance';}" required="">
                            </div>
                            <div class="sign-up">
                                <h4>Hospital/Clinic Name:</h4>
                                <input type="text" name="hosp_name" value="Working Location" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Experiance';}" required="">
                            </div>
                            <div class="sign-up">
                                <h4> Description :</h4>
                                <input type="text" name="description" value="Description" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Degree';}" required="">
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
                                String signup_msg=(String)request.getAttribute("error");
                                if(signup_msg!=null)
                                    out.println("<font color=red size=4px>"+signup_msg+"</font>");
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
<!-- //login -->


<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
</body>
</html>

