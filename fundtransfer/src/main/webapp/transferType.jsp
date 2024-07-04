<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Four Cards in a Column</title>
<link rel="stylesheet" href="styles.css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 400px;
}

.box {
	padding: 40px;
	height: 300px;
}

.card {
	position: relative;
	width: 200px; /* Adjust as needed */
	height: 250px; /* Adjust to accommodate text */
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin-bottom: 20px; /* Spacing between cards */
	transition: transform 0.3s;
	/* Smooth transition for the hover effect */
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.card:hover, .card:active {
	transform: scale(1.05);
	/* Scale up the card slightly on hover/active */
}

.card img {
	width: 100%;
	height: 80%; /* Adjust the image height */
	object-fit: cover;
	/* Ensures the image covers the entire area of the card */
	border-radius: 8px;
	/* Keeps the border radius consistent with the card */
}

.card-header {
	background-color: #3498db; /* Change the color code as needed */
	color: #fff; /* Text color */
	padding: 10px; /* Adjust padding as needed */
	border-top-left-radius: 8px; /* Rounded corners for top */
	border-top-right-radius: 8px; /* Rounded corners for top */
}

.card-text {
	margin-top: 15px; /* Adjust the margin as needed */
}

/* Remove default anchor styles */
a {
	text-decoration: none;
	color: inherit;
}
</style>
</head>
<body>

	<div class="container">
		<div class="box">
			<a
				href="fundTransfer.jsp">
				<div class="card">
					<div class="card-header">QuickTransfer</div>
					<div class="card-text"></div>
				</div>
			</a>
		</div>
		<div class="box">
			<a
				href="beneficiaryFundTransfer.jsp">
				<div class="card">
					<div class="card-header">PayToBeneficiary</div>
					<div class="card-text"></div>
				</div>
			</a>
		</div>
		

	</div>

</body>
</html>

