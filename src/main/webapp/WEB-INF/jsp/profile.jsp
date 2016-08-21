<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>User Page</title>

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
</head>
<body>
	<div class="container-fluid"
		style="border: 0px solid #000000; height: 100%;">
		<div class="row-fluid">
			<div class="span4"></div>
			<div class="text-right"
				style="border: 0px solid #000000; margin-top: 20px;">
				<a href="tasks.html" class="btn btn-primary">Home</a> <a
					href="shop.html" class="btn btn-primary">Shop</a>
				<!-- user logout -->
				<a href="j_spring_security_logout" class="btn btn-primary">Logout</a>
			</div>
			<br /> <br />
			<div class="form-group">
				<h3>
					<label for="email"> Welcome, ${user.getUsername()}</label>
				</h3>
			</div>

			<div class="table-responsive">
				<table class="table table-striped">
					<tbody>
						<tr>
							<td>Situated Tasks Completed</td>
							<td>${situatedCount}</td>
						</tr>
						<tr>
							<td>Location based Tasks Completed</td>
							<td>${locationCount}</td>
						</tr>
						<tr>
							<td>Anywhere Tasks Completed</td>
							<td>${anywhereCount}</td>
						</tr>
						<tr>
							<td>Total Tasks Completed</td>
							<td>${totalTasksCount}</td>
						</tr>
						<tr>
							<td>Total coins</td>
							<td>${user.getBalance()}</td>
						</tr>
					</tbody>

				</table>
			</div>
		</div>
	</div>
</body>
</html>