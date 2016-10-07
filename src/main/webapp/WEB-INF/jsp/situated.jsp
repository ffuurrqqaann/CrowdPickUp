<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Situated Crowdsourcing Tasks</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous" />

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
.bg {
	background-color: #F6F6F6;
}

.totheright { /*this will align the text to the right*/
	text-align: right;
	padding: 40px;
}

.atthecenter { /*this will align the text to the right*/
	text-align: center;
	position: relative;
	top: 30%;
	/* left:40%; */
}

.col-centered {
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
	margin-bottom: auto;
	float: none;
}
</style>
</head>
<body class="bg">
	<div class="container">
		<div class="row" style="border: 0px solid #000000;">
			<div class="span4" align="center" style="margin-top: 5%;">
				<img src="images/applogo.png" class="img-responsive" alt="logo"
					width="121" height="60" />
			</div>
		</div>
		<div class="row" style="border: 0px solid #000000;">
			<div class="span4" align="center" style="margin-top: 5%;">
				<a href="tasks.html" class="btn btn-primary">Home</a> 
				<a href="profile.html" class="btn btn-primary">Dashboard</a>
				<a href="shop.html" class="btn btn-primary">Prizes</a>
				<a href="j_spring_security_logout" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
	<div class="container-fluid"
		style="border: 0px solid #000000; height: 100%;">
		<div class="row-fluid">
			<div class="span4"></div>
			<div class="span4" align="center" style="margin-top: 20%;">
				<div class="hero-unit" align="center">

					<!-- Welcome message -->
					<!-- <h2>Welcome to Situated Crowdsourcing tasks </h2> -->
					<h3> The following tasks require knowledge related to Finland or Oulu </h3>
					
					<!-- different type of tasks. -->

					<div class="row" style="border: 0px solid #000000;">
						<div class="span4" align="center" style="margin-top: 5%;">
							<a href="imageidentification.html" class="btn btn-primary">Object Translation</a>
						</div>
					</div>
					<div class="row" style="border: 0px solid #000000;">
						<div class="span4" align="center" style="margin-top: 5%;">
							<a href="oulu-hobbies.html" class="btn btn-primary">Hobbies In Oulu</a>
						</div>
					</div>
					<div class="row" style="border: 0px solid #000000;">
						<div class="span4" align="center" style="margin-top: 5%;">
							<a href="student-housing.html" class="btn btn-primary">Student Housing</a>
						</div>
					</div>
					<br/>
				</div>
			</div>
			<div class="span4"></div>
		</div>
	</div>
</body>
</html>