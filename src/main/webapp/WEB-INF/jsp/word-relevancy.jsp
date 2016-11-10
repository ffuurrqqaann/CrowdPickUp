<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Word Relevancy</title>
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

		var sentence 	= $('input[name="sentenceId"]').val();

		$("#btnSubmit").click(function() {
			var wordId = $('input[name="word"]:checked').val();
			var groundTruth = $('input[name="groundTruth"]').val();
			
			if (jQuery.type(wordId) === "undefined") {
				alert("Please select a word.");
				return;
			} else {

				$.ajax({
					method : "POST",
					url : "wordrelevancy-post.html",
					data : {
						sentence : sentence,
						answer : wordId,
						isSkipped : "0",
						isCorrect : wordId==groundTruth?'1':'0'
					}
				}).done(function(json) {

					var response = jQuery.parseJSON(json);

					if (response.status != "200") {
						alert(response.message);
						return;
					}  else {
						window.location.replace("word-relevancy.html");
					}
				});
			}

		});

		$("#btnSkip").click(function() {
			var wordId = $('input[name="word"]:checked').val();

			$.ajax({
				method : "POST",
				url : "wordrelevancy-post.html",
				data : {
					sentence : sentence,
					answer : "",
					isSkipped : "1",
					isCorrect : ""
				}
			}).done(function(json) {

				var response = jQuery.parseJSON(json);

				if (response.status != "200") {
					alert(response.message);
					return;
				}

				window.location.replace("word-relevancy.html");
			});

		});
	});
</script>
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
						<label for="email">Task Description :</b>
							${task.getTask_description()}
						</label>
					</div>
					<div class="form-group">
						<label for="email"> Task Reward : ${task.getDef_reward()} Coins</label>
					</div>
					<form role="form" name="wordRelevancy" id="wordRelevancy"
						action="wordrelevancy-post.html" method="POST">
						<div class="form-group">
							<label for="email">Sentence:</label> <label for="email">${resource.getText()}</label>
						</div>
						<div class="form-group">
							<c:forEach var="word" items="${resource.getWords()}">
								<label class="checkbox"><input type="radio"
									value="${word.getWord_id()}" name="word" id="word">${word.getText()}</label>
							</c:forEach>
						</div>
						<div class="form-group">
							<input type="hidden" value="${resource.getSentence_id()}"
								name="sentenceId" />
							<input type="hidden" value="${resource.getGroundTruth()}" id="groundTruth"
								name="groundTruth" />
						</div>
						<br/>
						<button type="button" class="btn btn-primary" id="btnSubmit">Submit</button>
						<button type="button" class="btn btn-primary" id="btnSkip">Skip</button>
					</form>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<label for="email">You have done all Word Relevance tasks.
							Please proceed to other tasks.</label>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<br/><br/>
</body>
</html>