<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Anywhere Crowdsourcing Tasks</title>
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

<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>

<script>
	var item = null;

	jQuery(function() {

		jQuery("#dialog").dialog({
			autoOpen : false,
			modal : true,
			buttons : {
				"Confirm" : function() {

					purchaseItem(item, this);

					//alert("You have confirmed!");
				},
				"Cancel" : function() {
					jQuery(this).dialog("close");
				}
			}
		});
		
		jQuery("#helpDialoge").dialog({
			autoOpen : false,
		});

		jQuery("#help").on("click", function(e) {
			e.preventDefault();
			jQuery("#helpDialoge").dialog("open");
		});
	});

	function openDialogue(shopItem) {
		jQuery("#dialog").dialog("open");
		this.item = shopItem;
	}

	function purchaseItem(item, dialogueObj) {

		var cost = "";
		var itemName = "";

		if (item == "tenEuroVoucher") {
			cost = jQuery("#tenEuroVoucher").val();
			itemName = "tenEuroVoucher";
		} else if (item == "twentyFiveEuroVoucher") {
			cost = jQuery("#twentyFiveEuroVoucher").val();
			itemName = "twentyFiveEuroVoucher";
		} else if (item == "movieticket") {
			cost = jQuery("#movieticket").val();
			itemName = "movieticket";
		}

		jQuery.ajax({
			method : "POST",
			url : "purchase.html",
			data : {
				cost : cost,
				name : itemName
			}
		}).done(function(json) {
			var response = jQuery.parseJSON(json);
			alert(response.message);
			jQuery(dialogueObj).dialog("close");
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
	<div id="dialog" title="Confirmation Required">Are you sure about this?</div>
	<div id="helpDialoge" title="CrowdPickUp Help">
		
		<p>CrowdPickup is a Research project developed under the supervision of Center for Ubiquitous Computing, University Of Oulu.</p>
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
				<a href="tasks.html" class="btn btn-primary">Home</a> <a
					href="profile.html" class="btn btn-primary">Dashboard</a> <a
					href="j_spring_security_logout" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
	<br />
	<div class="container-fluid"
		style="border: 0px solid #000000; height: 100%;">
		<div class="row-fluid">
			<div class="span4"></div>
			<div class="alert alert-warning">
				<strong>Disclaimer!</strong> Prizes will only be awarded If the tasks will be carried out seriously.
			</div>
			<div class="row">
				<div class="col-md-4">
					<a href="#" class="thumbnail" onclick="openDialogue('tenEuroVoucher')">
						 <img src="images/shop/10-euro-voucher.png" style="width: 150px; height: 150px" class="img-thumbnail">
						 <input type="hidden" id="tenEuroVoucher" name="tenEuroVoucher" value="1000" />
					</a>
				</div>
				<div class="col-md-4">
					<a href="#" class="thumbnail" onclick="openDialogue('twentyFiveEuroVoucher')">
						 <img src="images/shop/25-euro-voucher.png" style="width: 150px; height: 150px" class="img-thumbnail">
						 <input type="hidden" id="twentyFiveEuroVoucher" name="twentyFiveEuroVoucher" value="2500" />
					</a>
				</div>
				<div class="col-md-4">
					<a href="#" class="thumbnail" onclick="openDialogue('movieticket')">
						 <img src="images/shop/movie-ticket.png" style="width: 150px; height: 150px" class="img-thumbnail">
						 <input type="hidden" id="movieticket" name="movieticket" value="975" />
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>