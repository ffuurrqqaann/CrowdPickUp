<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Describe the Location</title>
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

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.0/themes/redmond/jquery-ui.css" />

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx2v-xVjKPjRWON4BQ64qAB4x18DEbcWI"
	type="text/javascript"></script>

<script>
	
	function getLocationView(locationId) {
		$.ajax({
			method : "POST",
			url : "place-description.html?locationId="+locationId,
			data : {
				locationId : locationId
			}
		}).done(function(json) {
			/* var response = jQuery.parseJSON(json);

			if (response.status != "200") {
				alert(response.message);
				return;
			} else {
				alert("Your Task has been submitted successfully.");
			}

			window.location.replace("place-description.html");
 */		});
	}
	
	jQuery(document).ready(function() {
		//form submit.
		$("#btnSubmit").click(function() {
			submitTask();
		});
	});
	
</script>
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
				<a href="tasks.html" class="btn btn-primary">Home</a> <a
					href="profile.html" class="btn btn-primary">Dashboard</a> <a
					href="shop.html" class="btn btn-primary">Prizes</a> <a
					href="j_spring_security_logout" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
	<br />
	<div class="container-fluid"
		style="border: 0px solid #000000; height: 100%;">
		<div class="row-fluid">
			<div class="span4"></div>
			<br /> <br />
			
			<div class="span4" align="center" style="margin-top: 10%;">
				<div class="hero-unit" align="center">
					<c:choose>
						<c:when test="${not empty locations}">
							<h3>You need to go to each of these specific places in order to complete the related task</h3>
							<c:forEach var="location" items="${locations}">
								<div class="row" style="border: 0px solid #000000;">
									<div class="span4" align="center" style="margin-top: 5%;">
										<a href="place-description.html?locationId=${location.getId() }" class="btn btn-primary">${location.getName()} </a>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="form-group">
								<label for="email">You have completed all the tasks. Please proceed to other tasks.</label>
							</div>
						</c:otherwise>
					</c:choose>
					<br />
				</div>
			</div>
		</div>
	</div>
	<br/>
</body>
</html>