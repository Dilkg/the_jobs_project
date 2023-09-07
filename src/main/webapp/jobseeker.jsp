<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.example.consultapp.model.User"%>
<%@ page import="com.example.consultapp.DAO.AppointmentDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.consultapp.DAO.UserDao" %>
<%@ page import="com.example.consultapp.model.Appointment" %>
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
<!--
    <script>
        
    </script>
-->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap-social.css" rel="stylesheet">
    <title>Job Appointment</title>
    
  
<title>Job Appointment</title>
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
                    <% String name = (String) session.getAttribute("username"); %>
			
             <%= name %></span></a></li>
                    <li><a href="LogoutServlet"><span aria-hidden="true" >Logout</span></a></li>
                
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
                            <h1><a class="link link--nukun" href="index.jsp">Consultation<span>Appointment</span></a></h1>
						</div>
					</div>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
					<nav class="menu menu--horatio">
						<ul class="nav navbar-nav menu__list">
							<li class="menu__item menu__item--current"><a href="bookappointment.jsp" class="menu__link">Book</a></li>
<%--							<li class="menu__item"><a href="PatientAppointmentServlet" class="menu__link">My Appointment</a></li>--%>
							<li class="menu__item"><a href="mydetails.jsp" class="menu__link">My Details</a></li>

						</ul>
					</nav>
				</div>
			</nav>
		</div>
	</div>
        
    <p style="padding:80px";></p>
<%--    <div class="Container">--%>
<%--        <div class="row row-content">--%>
<%--            <div class="col-xs-12 col-sm-5">&nbsp;</div>--%>
<%--            <div class="col-xs-12  col-sm-4">--%>
<h3>My Appointments</h3>

				<table class="table table-striped table-hover table-bordered" style="background:aliceblue">
					<thead class="thead-inverse">
					<tr>
						<strong><th >No</th></strong>
						<strong><th >Date</th></strong>
						<strong> <th>Time</th></strong>
						<strong><th>Consultant</th></strong>
						<strong> <th >Job Seeker</th></strong>
						<strong> <th >Status</th></strong>


					</tr>
					<%

						int userid=Integer.parseInt(session.getAttribute("id").toString());
						AppointmentDao appDao = new AppointmentDao();
						List<Appointment> app = null;
						try {
							app = appDao.getAppointmentsBySeekerId(userid);
						} catch (Exception e) {
							throw new RuntimeException(e);
						}

						int id=0;
						String date="";
						String time="";
						String consultant="";
						String seeker="";
						String status="";
						if (app != null) {
							for (Appointment ap: app) {

								id = ap.getId();
								date = ap.getBookedDate();
								time = ap.getBookedTime();
								status = ap.getGetStatus();

								UserDao userDao = new UserDao();
								List<User> userSeeker = userDao.getAllUsersByid(ap.getInitiator());

								User seekerUser = userSeeker.get(0); // Assuming you want the first seeker in the list
								seeker = seekerUser.getName();


								List<User> userConsultant = userDao.getAllUsersByid(ap.getConsultant());

								User consultantUser=userConsultant.get(0);
								consultant=consultantUser.getUserName();
								// Handle seeker here if applicable


					%>
						</thead>

						<tr>
							<td><%=id%></td>
							<td><%=date%></td>
							<td><%=time%></td>
							<td><%=consultant%></td>
							<td><%=seeker%></td>
							<td><%=status%></td>



							<%--            <td><c:out value="<%=id%>" /></td>--%>
							<%--            <td><fmt:formatDate type="time" value="${appointment.st_time}" /></td>--%>
							<%--            <td><fmt:formatDate type="date" value="${appointment.date}" /></td>--%>

						</tr>
					<%
						}
						}
					%>

				</table>
				<!-- //banner -->
				<!-- content -->


</body>
</html>


