<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Anywhere Crowdsourcing Tasks</title>
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

/* .Absolute-Center {
	margin: auto;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
}

.Absolute-Center.is-Responsive {
	min-width: 200px;
	max-width: 400px;
	padding: 40px;
} */
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

		var resourceId = $("#resourceId").val();

		$("#btnSubmit").click(function() {
			var answer = $("#answer").val();

			if (answer == "") {
				alert("Answer field must not be empty.");
				return;
			}

			$.ajax({
				method : "POST",
				url : "imageidentification-post.html",
				data : {
					suggestedName : answer,
					resourceId : resourceId,
					isSkipped : "0"
				}
			}).done(function(json) {

				var response = jQuery.parseJSON(json);

				if (response.status != "200") {
					alert(response.message);
					return;
				}

				window.location.replace("tasks.html");
			});
		});

		//skip button pressed event.
		$("#btnSkip").click(function() {

			$.ajax({
				method : "POST",
				url : "imageidentification-post.html",
				data : {
					isSkipped : "1",
					suggestedName : "",
					resourceId : resourceId
				}
			}).done(function(json) {

				var response = jQuery.parseJSON(json);

				if (response.status != "200") {
					alert(response.message);
					return;
				}

				window.location.replace("tasks.html");
			});
		});
	});
</script>
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
			<c:choose>
				<c:when test="${not empty resource}">
					<div class="form-group">
						<label for="image">Task name : ${task.getTask_name()}</label>
					</div>
					<div class="form-group">
						<label for="image">Task Description :
							${task.getTask_description()}</label>
					</div>
					<div class="form-group">
						<label for="image">Task Reward : ${task.getDef_reward()}</label>
					</div>

					<c:if test="${not empty emptyAnswer}">
						<div class="errorblock">${emptyAnswer}</div>
					</c:if>
					<form role="form" name="imageIdentification"
						id="imageIdentification" action="imageidentification-post.html"
						method="POST">
						<div class="form-group">
							<img src="${resource.getImage_url()}" class="img-thumbnail" />
						</div>
						<div class="form-group">
							<label for="image">Answer:</label> <input type="text"
								class="form-control" id="answer" name="answer" />
						</div>
						<div class="form-group">
							<input type="hidden" value="${resource.getResource_id()}"
								name="resourceId" id="resourceId" />
						</div>
						<button type="button" class="btn btn-primary" id="btnSubmit">Submit
							Task</button>
						<button type="button" class="btn btn-primary" id="btnSkip">Skip
							Task</button>
					</form>
				</c:when>
				<c:otherwise>
					<div class="form-group">
						<label for="email">You have done all Image identification
							tasks. Please proceed to other tasks.</label>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>