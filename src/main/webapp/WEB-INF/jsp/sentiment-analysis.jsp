<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Sentiment Analysis</title>
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
	jQuery(document).ready(function() {

		var resourceId = $('input[name="resourceId"]').val();

		$("#btnSubmit").click(function() {

			var sentiment 	=	$('input[name="sentiment"]:checked').val();
			var grountTruth	=	$('input[name="groundTruth"]').val();
			
			if (jQuery.type(sentiment) === "undefined") {
				alert("Please select a sentiment.");
				return;
			}

			$.ajax({
				method : "POST",
				url : "sentimentanalysis-post.html",
				data : {
					sentiment 	: sentiment,
					resourceId 	: resourceId,
					isSkipped 	: "0",
					isCorrect 	: sentiment==grountTruth?'1':'0'
				}
			}).done(function(json) {

				var response = jQuery.parseJSON(json);

				if (response.status != "200") {
					alert(response.message);
					return;
				}  else {
					window.location.replace("sentiment-analysis.html");
				}
			});

		});

		$("#btnSkip").click(function() {
			$.ajax({
				method : "POST",
				url : "sentimentanalysis-post.html",
				data : {
					sentiment : "0",
					resourceId : resourceId,
					isSkipped : "1",
					isCorrect 	: ""
				}
			}).done(function(json) {

				var response = jQuery.parseJSON(json);

				if (response.status != "200") {
					alert(response.message);
					return;
				}

				window.location.replace("sentiment-analysis.html");
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
				<c:when test="${not empty resource}">
					<div class="form-group">
						<label for="email"> Task name : ${task.getTask_name()}</label>
					</div>
					<div class="form-group">
						<label for="email"> Task Description :
							${task.getTask_description()}</label>
					</div>
					<div class="form-group">
						<label for="email"> Task Reward : ${task.getDef_reward()}
							Coins</label>
					</div>
					<form role="form" name="sentimentAnalysis" id="sentimentAnalysis"
						action="sentimentanalysis-post.html" method="POST">
						<div class="form-group">
							<label for="email">Sentence:</label> <label for="email">${resource.getSentence()}</label>
						</div>
						<div class="form-group">
							<div class="radio">
								<label><input type="radio" id="sentiment"
									name="sentiment" value="1">Negative</label>
							</div>
							<div class="radio">
								<label><input type="radio" id="sentiment"
									name="sentiment" value="2">Neutral</label>
							</div>
							<div class="radio">
								<label><input type="radio" id="sentiment"
									name="sentiment" value="3">Positive</label>
							</div>
						</div>
						<div class="form-group">
							<input type="hidden" value="${resource.getResource_id()}"
								name="resourceId" id="resourceId" /> <input type="hidden"
								value="${resource.getGround_truth()}" name="groundTruth"
								id="groundTruth" />
						</div>
						<br />
						<button type="button" class="btn btn-primary" id="btnSubmit">Submit</button>
						<button type="button" class="btn btn-primary" id="btnSkip">Skip</button>
					</form>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<label for="email">You have done all Sentiment Analysis
							tasks. Please proceed to other tasks.</label>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<br />
</body>
</html>