<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.example.consultapp.model.Consultant"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap-social.css" rel="stylesheet">
    <title>Jobs Consultation</title>
    
  
<title>Jobs Consultation</title>
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
<link href="css/table.css" rel="stylesheet" type="text/css">
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
                
         

                    <li><a href="#"><span aria-hidden="true"><img src="icon/user.png" width="30px" height="40px"></span>       <% String doc = (String) session.getAttribute("username");%>
			
            <%= doc + " "  %></a></li>
                    <li><a href="logout"><span aria-hidden="true" >Logout</span></a></li>
                
                </ul>
                </div>    
                     
            </div>
        </div>
    </div>
    <div class="header-bottom ">
		<div class="container">
			<nav class="navbar navbar-default ">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" >
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

				<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-2">
					<nav class="menu menu--horatio">
						<ul class="nav navbar-nav menu__list">
						<% Integer id = (Integer) session.getAttribute("id");%>
                        <% String name = (String) session.getAttribute("name");%>

                            <li class="menu__item"><a href="consultant-only-shedule.jsp?id=<%=id%>&name=<%= name %>">Add Shedule</a></li>
						</ul>
					</nav>
				</div>
			</nav>
		</div>
	</div>
    
    
    
    
    
  <p style="padding:80px";></p>  
<div class="container">
  
    
        
       <table class="table table-striped table-hover table-bordered" style="background:aliceblue">
      <thead class="thead-inverse">
       <tr>
                 <strong><th >#</th></strong>
                  <strong><th >Name</th></strong>
                 <strong> <th>Application No.</th></strong>
                  <strong><th>Time-Slot</th></strong>
                 <strong> <th >Date</th></strong>

       </tr>
        </thead>
         <c:forEach items="${appointments}" var="appointment">
        <tr>
            <td>${appointment.doc_id}</td>
            <td><c:out value="${appointment.pat_id}" /></td>
            <td><c:out value="${appointment.app_id}" /></td>
            <td><fmt:formatDate type="time" value="${appointment.st_time}" /></td>
            <td><fmt:formatDate type="date" value="${appointment.date}" /></td>

        </tr>
    </c:forEach>
          
     </table>
    
    </div>


  
        <p style="padding:80px";></p>


    </body>
</html>
