<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<html>
<head>
<title>User Page</title>
<style type="text/css">
.error {
	color:#ff0000;
}

.errorblock {
	color:#000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding:8px;
	margin:16px; 
}
</style>
</head>
<body>
	<h1>User Login</h1>

	<form:form commandName="user">
		<table>
			<tr>
				<td>Username:</td>
				<td><form:input path="name" /></td>
				<td><form:errors path="name" title="Name must not be empty"></form:errors></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><form:password path="password" /></td>
				<td><form:errors path="password" title="Password must not be empty"></form:errors></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form:form>
	
	<div>Don't have an account <a href="signupUser.html">Signup Now</a></div>
	 
	
</body>
</html>