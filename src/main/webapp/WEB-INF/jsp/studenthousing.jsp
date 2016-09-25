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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

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

<script>
	jQuery(document)
			.ready(
					function() {
						var checkHousingLocationId = $(
								'input[name="housingLocationId"]').val();

						$("#btnSubmit")
								.click(
										function() {

											var checkCleanliness = $(
													'input[name="cleanliness"]:checked')
													.val();
											var checkNearbyServices = $(
													'input[name="service"]:checked')
													.val();
											var checkLocation = $(
													'input[name="location"]:checked')
													.val();
											var checkCost = $(
													'input[name="cost"]:checked')
													.val();
											var checkInternet = $(
													'input[name="internet"]:checked')
													.val();
											var checkMaintenance = $(
													'input[name="maintenance"]:checked')
													.val();

											if (jQuery.type(checkCleanliness) === "undefined") {
												alert("Please rate cleanliness before submitting.");
												return;
											} else if (jQuery
													.type(checkNearbyServices) === "undefined") {
												alert("Please rate Nearby services before submitting.");
												return;
											} else if (jQuery
													.type(checkLocation) === "undefined") {
												alert("Please rate Location before submitting.");
												return;
											} else if (jQuery.type(checkCost) === "undefined") {
												alert("Please rate Cost before submitting.");
												return;
											} else if (jQuery
													.type(checkInternet) === "undefined") {
												alert("Please rate internet before submitting.");
												return;
											} else if (jQuery
													.type(checkMaintenance) === "undefined") {
												alert("Please rate maintenance before submitting.");
												return;
											}

											$
													.ajax(
															{
																method : "POST",
																url : "studenthousing-post.html",
																data : {
																	housingLocationId : checkHousingLocationId,
																	cleanliness : checkCleanliness,
																	nearbyServices : checkNearbyServices,
																	location : checkLocation,
																	cost : checkCost,
																	internet : checkInternet,
																	maintenance : checkMaintenance,
																	isSkipped : "0"
																}
															})
													.done(
															function(json) {

																var response = jQuery
																		.parseJSON(json);

																if (response.status != "200") {
																	alert(response.message);
																	return;
																}  else {
																	alert("Your Task has been submitted successfully.");
																}

																window.location
																		.replace("student-housing.html");
															});
										});

						$("#btnSkip").click(function() {

							$.ajax({
								method : "POST",
								url : "studenthousing-post.html",
								data : {
									housingLocationId : checkHousingLocationId,
									cleanliness : "0",
									nearbyServices : "0",
									location : "0",
									cost : "0",
									internet : "0",
									maintenance : "0",
									isSkipped : "1"
								}
							}).done(function(json) {

								var response = jQuery.parseJSON(json);

								if (response.status != "200") {
									alert(response.message);
									return;
								}

								window.location.replace("student-housing.html");
							});
						});
					});
</script>
</head>
<body class="bg">
	<div class="container">
		<div class="row" style="border: 0px solid #000000;">
			<div class="span4" align="center" style="margin-top: 5%;">
				<img src="images/logo.png" class="img-responsive" alt="logo"
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
			<br />
			<c:choose>
				<c:when test="${not empty location}">
					<div class="form-group">
						<label for="email"> Task name : ${task.getTask_name()}</label>
					</div>
					<div class="form-group">
						<label for="email">Task Description :
							${task.getTask_description()}</label>
					</div>
					<div class="form-group">
						<label for="email">Task Reward : ${task.getDef_reward()} Coins</label>
					</div>
					<form role="form" name="studentHousing" id="studentHousing"
						action="studenthousing-post.html" method="POST">

						<div class="form-group">
							<input type="hidden" value="${location.getId()}"
								name="housingLocationId" id="housingLocationId" />
						</div>

						<div class="form-group">
							<label for="email"> Location : ${location.getName()}</label>
						</div>
						<div class="form-group">
							<h3>
								<label for="email">Cleanliness</label>
							</h3>
							<label class="checkbox"><input type="radio" value="1"
								name="cleanliness" id="cleanliness">Very Bad</label> <label
								class="checkbox"><input type="radio" value="2"
								name="cleanliness" id="cleanliness">Bad</label> <label
								class="checkbox"><input type="radio" value="3"
								name="cleanliness" id="cleanliness">Neutral</label> <label
								class="checkbox"><input type="radio" value="4"
								name="cleanliness" id="cleanliness">Good</label> <label
								class="checkbox"><input type="radio" value="5"
								name="cleanliness" id="cleanliness">Very Good</label>
								<label class="checkbox"><input type="radio" value="0"
								name="cleanliness" id="cleanliness">Don't Know</label>
						</div>
						<div class="form-group">
							<h3>
								<label for="email">Nearby Services</label>
							</h3>
							<label class="checkbox"><input type="radio" value="1"
								name="service" id="service">Very Bad</label> <label
								class="checkbox"><input type="radio" value="2"
								name="service" id="service">Bad</label> <label class="checkbox"><input
								type="radio" value="3" name="service" id="service">Neutral</label>
							<label class="checkbox"><input type="radio" value="4"
								name="service" id="service">Good</label> <label
								class="checkbox"><input type="radio" value="5"
								name="service" id="service">Very Good</label>
								<label class="checkbox"><input type="radio" value="0"
								name="service" id="service">Don't Know</label>
						</div>
						<div class="form-group">
							<h3>
								<label for="email">Location</label>
							</h3>
							<label class="checkbox"><input type="radio" value="1"
								name="location" id="location">Very Bad</label> <label
								class="checkbox"><input type="radio" value="2"
								name="location" id="location">Bad</label> <label
								class="checkbox"><input type="radio" value="3"
								name="location" id="location">Neutral</label> <label
								class="checkbox"><input type="radio" value="4"
								name="location" id="location">Good</label> <label
								class="checkbox"><input type="radio" value="5"
								name="location" id="location">Very Good</label>
								<label class="checkbox"><input type="radio" value="0"
								name="location" id="location">Don't Know</label>
						</div>
						<div class="form-group">
							<h3>
								<label for="email">Cost</label>
							</h3>
							<label class="checkbox"><input type="radio" value="1"
								name="cost" id="cost">Very Bad</label> <label class="checkbox"><input
								type="radio" value="2" name="cost" id="cost">Bad</label> <label
								class="checkbox"><input type="radio" value="3"
								name="cost" id="cost">Neutral</label> <label class="checkbox"><input
								type="radio" value="4" name="cost" id="cost">Good</label> <label
								class="checkbox"><input type="radio" value="5"
								name="cost" id="cost">Very Good</label>
								<label class="checkbox"><input type="radio" value="0"
								name="cost" id="cost">Don't Know</label>
						</div>
						<div class="form-group">
							<h3>
								<label for="email">Internet</label>
							</h3>
							<label class="checkbox"><input type="radio" value="1"
								name="internet" id="internet">Very Bad</label> <label
								class="checkbox"><input type="radio" value="2"
								name="internet" id="internet">Bad</label> <label
								class="checkbox"><input type="radio" value="3"
								name="internet" id="internet">Neutral</label> <label
								class="checkbox"><input type="radio" value="4"
								name="internet" id="internet">Good</label> <label
								class="checkbox"><input type="radio" value="5"
								name="internet" id="internet">Very Good</label>
								<label class="checkbox"><input type="radio" value="0"
								name="internet" id="internet">Don't Know</label>
						</div>
						<div class="form-group">
							<h3>
								<label for="email">Maintenance</label>
							</h3>
							<label class="checkbox"><input type="radio" value="1"
								name="maintenance" id="maintenance">Very Bad</label> <label
								class="checkbox"><input type="radio" value="2"
								name="maintenance" id="maintenance">Bad</label> <label
								class="checkbox"><input type="radio" value="3"
								name="maintenance" id="maintenance">Neutral</label> <label
								class="checkbox"><input type="radio" value="4"
								name="maintenance" id="maintenance">Good</label> <label
								class="checkbox"><input type="radio" value="5"
								name="maintenance" id="maintenance">Very Good</label>
								<label class="checkbox"><input type="radio" value="0"
								name="maintenance" id="maintenance">Don't Know</label>
						</div>
						<br/>
						<button type="button" class="btn btn-primary" id="btnSubmit">Submit</button>
						<button type="button" class="btn btn-primary" id="btnSkip">Skip</button>
					</form>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<label for="email">You have done all student Housing
							tasks. Please proceed to other tasks.</label>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<br/>
</body>
</html>