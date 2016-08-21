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
	src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<script>
	jQuery(document).ready(function() {

		$("#btnSubmit").click(function() {

			var localFood = $("#localfood").val();
			if (localFood == "") {
				alert("Local food field must not be empty.");
				return;
			}

			submitTask(localFood);
		});
	});

	function initGeolocation() {
		if (navigator.geolocation) {
			// Call getCurrentPosition with success and failure callbacks
			navigator.geolocation.getCurrentPosition(success, fail);
		} else {
			alert("Sorry, your browser does not support geolocation services.");
		}
	}

	function success(position) {
		alert("longitude is = " + position.coords.longitude);
		alert("latitude  is = " + position.coords.latitude);
	}

	function fail() {
		alert("Sorry, Could not obtain location.");
	}

	function submitTask(localFood) {
		var crowdedness = $('input[name="crowdedness"]:checked').val();
		var weather = $('input[name="weather"]:checked').val();
		var noise = $('input[name="noise"]:checked').val();
		var traffic = $('input[name="traffic"]:checked').val();
		var services = $('input[name="services"]:checked').val();
		var easylocation = $('input[name="easylocation"]:checked').val();
		var locationId = $('input[name="locationId"]').val();

		if (jQuery.type(crowdedness) === "undefined") {
			alert("Please rate crowdedness");
			return;
		} else if (jQuery.type(weather) === "undefined") {
			alert("Please rate weather");
			return;
		} else if (jQuery.type(noise) === "undefined") {
			alert("Please rate noise");
			return;
		} else if (jQuery.type(traffic) === "undefined") {
			alert("Please rate traffic");
			return;
		} else if (jQuery.type(services) === "undefined") {
			alert("Please rate services");
			return;
		} else if (jQuery.type(easylocation) === "undefined") {
			alert("Please rate easylocation");
			return;
		}

		$.ajax({
			method : "POST",
			url : "placedescription-post.html",
			data : {
				crowd : crowdedness,
				weather : weather,
				noise : noise,
				traffic : traffic,
				services : services,
				easylocation : easylocation,
				localfood : localFood,
				locationId : locationId
			}
		}).done(function(json) {

			var response = jQuery.parseJSON(json);

			if (response.status != "200") {
				alert(response.message);
				return;
			}

			window.location.replace("tasks.html");
		});
	}
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
	<div class="container-fluid"
		style="border: 0px solid #000000; height: 100%;">
		<div class="row-fluid">
			<div class="span4"></div>
			<div class="text-right"
				style="border: 0px solid #000000; margin-top: 20px;">
				<a href="tasks.html" class="btn btn-primary">Home</a> <a
					href="profile.html" class="btn btn-primary">Dashboard</a>
				<!-- user logout -->
				<a href="j_spring_security_logout" class="btn btn-primary">Logout</a>
			</div>
			<br /> <br />
			<div class="form-group">
				<label for="email"> Task name : ${task.getTask_name()}</label>
			</div>
			<div class="form-group">
				<label for="email"> Task Description :
					${task.getTask_description()}</label>
			</div>
			<div class="form-group">
				<label for="email"> Task Reward : ${task.getDef_reward()}</label>
			</div>
			<!-- https://maps.googleapis.com/maps/api/geocode/json?latlng=65.0578898,25.4695866&key=AIzaSyAx2v-xVjKPjRWON4BQ64qAB4x18DEbcWI -->
			<img src="${location.getImage()}" class="img-thumbnail" />
			<br/>
			<address>${location.getAddress()}</address>

			<form role="form" name="placeDescription" id="placeDescription"
				action="placedescription-post.html" method="POST">

				<div class="form-group">
					<input type="hidden" value="${location.getId()}" name="locationId"
						id="locationId" />
				</div>

				<div class="form-group">
					<label for="email">Rate the Crowdedness of the place.</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="crowdedness"
							name="crowdedness" value="1">Bad</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="crowdedness"
							name="crowdedness" value="2">Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="crowdedness"
							name="crowdedness" value="3">Very Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="crowdedness"
							name="crowdedness" value="4">Excellent</label>
					</div>
				</div>
				<div class="form-group">
					<label for="email">Rate the Weather of the place.</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="weather" name="weather"
							value="1">Bad</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="weather" name="weather"
							value="2">Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="weather" name="weather"
							value="3">Very Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="weather" name="weather"
							value="4">Excellent</label>
					</div>
				</div>

				<div class="form-group">
					<label for="email">Rate the Noise of the place.</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="noise" name="noise"
							value="1">Bad</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="noise" name="noise"
							value="2">Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="noise" name="noise"
							value="3">Very Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="noise" name="noise"
							value="4">Excellent</label>
					</div>
				</div>

				<div class="form-group">
					<label for="email">Is there any good local food restaurant
						nearby, If yes then write the name.</label>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="localfood"
						name="localfood">
				</div>

				<div class="form-group">
					<label for="email">Rate the Traffic Situation of the place.</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="traffic" name="traffic"
							value="1">Bad</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="traffic" name="traffic"
							value="2">Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="traffic" name="traffic"
							value="3">Very Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="traffic" name="traffic"
							value="4">Excellent</label>
					</div>
				</div>

				<div class="form-group">
					<label for="email">Rate the Available Services of the
						place.</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="services" name="services"
							value="1">Bad</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="services" name="services"
							value="2">Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="services" name="services"
							value="3">Very Good</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="services" name="services"
							value="4">Excellent</label>
					</div>
				</div>

				<div class="form-group">
					<label for="email">Is the location easy to find.</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="easylocation"
							name="easylocation" value="1">Yes</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="easylocation"
							name="easylocation" value="0">No</label>
					</div>
				</div>
				<button type="button" class="btn btn-primary" id="btnSubmit">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>