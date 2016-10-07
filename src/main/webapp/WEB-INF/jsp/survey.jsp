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
	jQuery(document).ready(function() {
		//form submit.
		$("#btnSubmit").click(function() {
			submitTask();
		});
	});
	
	//form submit function.
	function submitTask() {
		var numberPatter = /^[0-9.]+$/;
		var gender 					= $('input[name="gender"]:checked').val();
		var age						= $('#age').val();
		var education 				= $('input[name="education"]:checked').val();
		var fieldStudy 				= $('input[name="field_study"]:checked').val();
		var living 					= $('input[name="living"]:checked').val();
		var isCrowdsourcingWorker 	= $('input[name="is_crowdsourcing_worker"]:checked').val();
		var isReserved 				= $('input[name="is_reserved"]:checked').val();
		var isGenerallyTrusting 	= $('input[name="is_generally_trusting"]:checked').val();
		var lazy				 	= $('input[name="lazy"]:checked').val();
		var isRelaxed 				= $('input[name="is_relaxed"]:checked').val();
		var artisticInterests 		= $('input[name="artistic_interests"]:checked').val();
		var isSociable 				= $('input[name="is_sociable"]:checked').val();
		var findFaults 				= $('input[name="find_faults"]:checked').val();
		var job 					= $('input[name="job"]:checked').val();
		var nervous 				= $('input[name="nervous"]:checked').val();
		var activeImagination 		= $('input[name="active_imagination"]:checked').val();

		if (jQuery.type(gender) === "undefined") {
			alert("Please select a gender");
			return;
		} else if (age=="" || !numberPatter.test(age)) {
			alert("Please enter a valid age");
			return;
		} else if (jQuery.type(education) === "undefined") {
			alert("Please select education");
			return;
		} else if (jQuery.type(fieldStudy) === "undefined") {
			alert("Please select Field of Study");
			return;
		} else if (jQuery.type(living) === "undefined") {
			alert("Please select Living");
			return;
		} else if (jQuery.type(isCrowdsourcingWorker) === "undefined") {
			alert("Please select whether you are a crowdsourcing worker or not");
			return;
		} else if (jQuery.type(isReserved) === "undefined") {
			alert("Please select your personality level");
			return;
		} else if (jQuery.type(isGenerallyTrusting) === "undefined") {
			alert("Please select your trust level");
			return;
		} else if (jQuery.type(lazy) === "undefined") {
			alert("Please select your level of being lazy");
			return;
		} else if (jQuery.type(isRelaxed) === "undefined") {
			alert("Please select your relaxation level");
			return;
		} else if (jQuery.type(artisticInterests) === "undefined") {
			alert("Please select which level of artistic interests you have");
			return;
		} else if (jQuery.type(isSociable) === "undefined") {
			alert("Please select your level of sociability");
			return;
		} else if (jQuery.type(findFaults) === "undefined") {
			alert("Please select your level of finding faults");
			return;
		} else if (jQuery.type(job) === "undefined") {
			alert("Please select your level of doing thorough jobs");
			return;
		} else if (jQuery.type(nervous) === "undefined") {
			alert("Please select your level of being nervous");
			return;
		} else if (jQuery.type(activeImagination) === "undefined") {
			alert("Please select your level of active imagination");
			return;
		}
		
		$.ajax({
			method : "POST",
			url : "survey-post.html",
			data : {
				gender 					: gender,
				age 					: age,
				education 				: education,
				fieldStudy 				: fieldStudy,
				living 					: living,
				isCrowdsourcingWorker 	: isCrowdsourcingWorker,
				isReserved 				: isReserved,
				isGenerallyTrusting 	: isGenerallyTrusting,
				lazy 					: lazy,
				isRelaxed 				: isRelaxed,
				artisticInterests 		: artisticInterests,
				isSociable 				: isSociable,
				findFaults 				: findFaults,
				job 					: job,
				nervous 				: nervous,
				activeImagination 		: activeImagination
			}
		}).done(function(json) {

			var response = jQuery.parseJSON(json);

			if (response.status != "200") {
				alert(response.message);
				return;
			} else {
				alert("Your Survey has been submitted successfully.");
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
			<div class="form-group">
				<label for="email"> Task name : Survey</label>
			</div>
			<div class="form-group">
				<label for="email"> Task Description : Please complete this survey in its entirety</label>
			</div>
			<div class="form-group">
				<label for="email"> Task Reward : 300 Coins</label>
			</div>
			<form role="form" name="survey" id="survey" action="survey-post.html" method="POST">

				<div class="form-group">
					<label for="email">1. Gender</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="gender"
							name="gender" value="Male">Male</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="gender"
							name="gender" value="Female">Female</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">2. Age</label>
				</div>
				<div class="form-group">
					<textarea rows="1" cols="5" class="form-control" id="age" name="age"></textarea>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">3. Education.</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="education" name="education"
							value="1">High School or Lower</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="education" name="education"
							value="2">Bachelor Degree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="education" name="education"
							value="3">Master Degree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="education" name="education"
							value="4">Doctor Degree</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">4. Field of Study.</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="field_study" name="field_study"
							value="1">IT-Related</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="field_study" name="field_study"
							value="2">Economics Related</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="field_study" name="field_study"
							value="3">Science</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="field_study" name="field_study"
							value="4">Engineering</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="field_study" name="field_study"
							value="5">Arts</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="field_study" name="field_study"
							value="6">Other</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">5. How long have you lived in Oulu?</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="living" name="living"
							value="1">Less Than 1 year</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="living" name="living"
							value="2">Between 1 and 2 years</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="living" name="living"
							value="3">Between 2 and 3 years</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="living" name="living"
							value="4">More than 3 years</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">6. Have you ever done crowdsourcing work online? (e.g., Amazon's Mechanical Turk )</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="is_crowdsourcing_worker" name="is_crowdsourcing_worker"
							value="1">Yes</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_crowdsourcing_worker" name="is_crowdsourcing_worker"
							value="2">No</label>
					</div>
				</div>
				<div class="form-group">
					<label for="email">Instruction: How well do the following statements describe your personality?.</label>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">7. I see myself as someone who...</label>
				</div>
				
				<div class="form-group">
					<label for="email">... is reserved</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="is_reserved" name="is_reserved"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_reserved" name="is_reserved"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_reserved" name="is_reserved"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_reserved" name="is_reserved"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_reserved" name="is_reserved"
							value="5">Agree Strongly</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">... is generally trusting</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="is_generally_trusting" name="is_generally_trusting"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_generally_trusting" name="is_generally_trusting"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_generally_trusting" name="is_generally_trusting"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_generally_trusting" name="is_generally_trusting"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_generally_trusting" name="is_generally_trusting"
							value="5">Agree Strongly</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">... tends to be lazy</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="lazy" name="lazy"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="lazy" name="lazy"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="lazy" name="lazy"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="lazy" name="lazy"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="lazy" name="lazy"
							value="5">Agree Strongly</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">... is relaxed, handles stress well</label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="is_relaxed" name="is_relaxed"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_relaxed" name="is_relaxed"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_relaxed" name="is_relaxed"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_relaxed" name="is_relaxed"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_relaxed" name="is_relaxed"
							value="5">Agree Strongly</label>
					</div>
				</div>				
				<br/>
				<div class="form-group">
					<label for="email">... has few artistic interests </label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="artistic_interests" name="artistic_interests"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="artistic_interests" name="artistic_interests"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="artistic_interests" name="artistic_interests"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="artistic_interests" name="artistic_interests"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="artistic_interests" name="artistic_interests"
							value="5">Agree Strongly</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">... is outgoing, sociable </label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="is_sociable" name="is_sociable"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_sociable" name="is_sociable"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_sociable" name="is_sociable"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_sociable" name="is_sociable"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="is_sociable" name="is_sociable"
							value="5">Agree Strongly</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">... tends to find faults with others </label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="find_faults" name="find_faults"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="find_faults" name="find_faults"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="find_faults" name="find_faults"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="find_faults" name="find_faults"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="find_faults" name="find_faults"
							value="5">Agree Strongly</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">... does a thorough job </label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="job" name="job"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="job" name="job"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="job" name="job"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="job" name="job"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="job" name="job"
							value="5">Agree Strongly</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">... gets nervous easily </label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="nervous" name="nervous"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="nervous" name="nervous"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="nervous" name="nervous"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="nervous" name="nervous"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="nervous" name="nervous"
							value="5">Agree Strongly</label>
					</div>
				</div>
				<br/>
				<div class="form-group">
					<label for="email">... has an active imagination </label>
				</div>
				<div class="form-group">
					<div class="radio">
						<label><input type="radio" id="active_imagination" name="active_imagination"
							value="1">Disagree strongly</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="active_imagination" name="active_imagination"
							value="2">Disagree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="active_imagination" name="active_imagination"
							value="3">Neither agree nor disagree</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="active_imagination" name="active_imagination"
							value="4">Agree a little</label>
					</div>
					<div class="radio">
						<label><input type="radio" id="active_imagination" name="active_imagination"
							value="5">Agree Strongly</label>
					</div>
				</div>
				<br/>
				<button type="button" class="btn btn-primary" id="btnSubmit">Submit</button>
			</form>
		</div>
	</div>
	<br/>
</body>
</html>