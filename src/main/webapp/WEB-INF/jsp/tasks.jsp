<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>User Page</title>

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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous" />
	
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.0/themes/redmond/jquery-ui.css" />

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>

<script type="text/javascript">
	jQuery(function() {
		jQuery("#helpDialoge").dialog({
			autoOpen : false,
		});

		jQuery("#help").on("click", function(e) {
			e.preventDefault();
			jQuery("#helpDialoge").dialog("open");
		});
	});
</script>
</head>
<body class="bg">
	<div id="helpDialoge" title="CrowdFlow Help">
		<p>CrowdFlow is a Research project developed under the supervision of Center for Ubiquitous Computing, University Of Oulu.</p>
		<p>The purpose of this project is to asses the feasibility and performance of Local Knowledge, Location Based and General Crowdsourcing tasks as well as a basic understanding of its worker's behaviors.</p>
		<p>In order to claim your prizes send an email to furqan.ahmed@student.oulu.fi (cc: Jorge.Goncalves@oulu.fi) and schedule an appointment.</p>
	</div>
	<div class="container">
		<div class="row" style="border: 0px solid #000000;">
			<div class="span4" align="center" style="margin-top: 5%;">
				<img src="images/applogo.png" class="img-responsive" alt="logo"
					width="121" height="60" />
			</div>
		</div>
		<div class="row" style="border: 0px solid #000000;">
			<div class="span4" align="center" style="margin-top: 5%;">
				<button type="button" class="btn btn-info" id="help">Help</button>
				<a href="profile.html" class="btn btn-primary">Dashboard</a> <a
					href="shop.html" class="btn btn-primary">Prizes</a> <a
					href="j_spring_security_logout" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
	<div class="container-fluid"
		style="border: 0px solid #000000; height: 100%;">

		<div class="row-fluid">
			<div class="span4"></div>
			<div class="span4" align="center" style="margin-top: 10%;">
				<div class="hero-unit" align="center">
					<!-- Welcome message -->
					<h2>Welcome ${username}</h2>
					<h2>Perform the following tasks and win prizes.</h2>

					<!-- different type of tasks. -->

					<div class="row" style="border: 0px solid #000000;">
						<div class="span4" align="center" style="margin-top: 5%;">
							<a href="situated.html" class="btn btn-primary">Local Knowledge Tasks</a>
						</div>
					</div>
					<div class="row" style="border: 0px solid #000000;">
						<div class="span4" align="center" style="margin-top: 5%;">
							<a href="locations.html" class="btn btn-primary">Location Based Tasks</a>
						</div>
					</div>
					<div class="row" style="border: 0px solid #000000;">
						<div class="span4" align="center" style="margin-top: 5%;">
							<a href="anywhere.html" class="btn btn-primary">General Tasks</a>
						</div>
					</div>
					<c:if test="${not isSurveySubmitted}">
						<div class="row" style="border: 0px solid #000000;">
							<div class="span4" align="center" style="margin-top: 5%;">
								<a href="survey.html" class="btn btn-primary">Survey</a>
							</div>
						</div>
					</c:if>
					<br />
					<br /> <br />
					<!-- </div> -->
				</div>
			</div>
			<div class="span4"></div>
		</div>
	</div>
</body>
</html>