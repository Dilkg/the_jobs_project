<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.example.consultapp.model.User"%>
<%@ page import="com.example.consultapp.DAO.UserDao" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap-social.css" rel="stylesheet">
    <title>Consultation Appointment</title>
    
  
<title>Consultation Appointment</title>
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
	<script>
$(document).ready(function() {

$('#datepicker').change(function(event) {
	var date = $('#datepicker').val();
        //var date = $("select#datepicker").val();
        var doc_id = document.getElementById("doc_id").value
        $.get('TimeServlet', {
                Date : date,
                doc_id : doc_id
        }, function(response) {

        var select = $('#time');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        });
        });
});
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
                    <% String pat = (String) session.getAttribute("username");%>
			
             <%= pat  %></span></a></li>
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
							<h1><a class="link link--nukun" href="index.jsp">The<span>Jobs</span></a></h1>
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
   <div class="container">
                <div class="row row-content">
                    
                    <div class="col-sm-4">&nbsp;</div>
                    <div class="col-sm-8">      
                     <div id="book" class="col-md-4 content_middle wow flipInY" data-wow-duration="1.5s" data-wow-delay="0.3s">
                    
              
                 
			<h3>Book An Appointment</h3>
<%--			<form action="ConfirmBooking" method="post" >--%>
<%--				Doc_id: <input type="text" name="doc_id" id="doc_id" value="${doc_id}" readonly>--%>
<%--				seeker_id: <input type="text" name="pat_id" id="pat_id" value="<%= pat  %>" readonly>--%>
<%--				<input class="date" name="date" id="datepicker" type="text" value="Pick a Date" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Pick a Date';}" required="">--%>
<%--                <p style="padding:5px"></p>--%>
<%--				<select id="time"  name="time"  class="frm-field required sect">--%>
<%--					<option>Select Time</option>							--%>
<%--				</select>--%>
<%--				<input type="submit" value="Book Now">--%>
<%--			</form>--%>

				 <form action="./BookAppointmentServlet?req=new" method="POST" >
					 Consultant: <select id="consultant" name="consultant">
						 <%
							 UserDao userDao = new UserDao();
							 List<User> consultantNames = userDao.getConsultantUsers();
							 for (User name : consultantNames) {
						 %>
						 <option value="<%= name.getId() %>"><%= name.getName() %></option>
						 <%
							 }
						 %>
					 </select>

					 Seeker: <select name="seeker">
					 <%
                         if(session.getAttribute("role").equals("reception"))
                         {
                             //UserDao userDao = new UserDao();
                             List<User> skkertNames = userDao.getJobSeekers();
                             for (User name : skkertNames) {
                                 %>
                                 <option value="<%= name.getId() %>"><%= name.getName() %></option>
                                 <%
						     }
                         }
                         else {
                                 %>
                                <option value="<%= session.getAttribute("id") %>"><%= session.getAttribute("name") %></option>
                     <%
                         }
					 %>
				 </select>
					<select id="date" name="date" class="frm-field required sect" >


					</select>
					 <p style="padding:5px"></p>

					 <select id="time"  name="time"  class="frm-field required sect">

					</select>

					 <input type="submit" value="Book Now">
				 </form>
            </div>  
            
		</div>
		
		<div class="clearfix"></div>
    </div>
    </div>
	<script>
		$(document).ready(function() {
			$('#consultant').change(function() {
				var selectedConsultantId = $(this).val();

				// Fetch available dates for the selected consultant using AJAX
				$.get('AvailableDatesServlet', { consultantId: selectedConsultantId }, function(response) {
					var dateSelect = $('#date');
					dateSelect.find('option').remove();
					$.each(response.dates, function(index, date) {
						$('<option>').val(date).text(date).appendTo(dateSelect);
					});
				});

				// Clear the time options when consultant is changed
				$('#time').html('<option>Select Time</option>');
			});

			$('#date').change(function() {
				var selectedDate = $(this).val();

				// Fetch available times for the selected date using AJAX
				$.get('AvailableTimesServlet', { date: selectedDate }, function(response) {
					var timeSelect = $('#time');
					timeSelect.find('option').remove();
					$.each(response.times, function(index, time) {
						console.log("time: " + time)
						$('<option>').val(time).text(time).appendTo(timeSelect);
					});
				});
			});
		});
	</script>


    </body>

</html>