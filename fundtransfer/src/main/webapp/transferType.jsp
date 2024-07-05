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
	width: 200px;
	height: 250px;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin-bottom: 20px;
	transition: transform 0.3s;
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
	height: 80%; 
	object-fit: cover;
	border-radius: 8px;

}

.card-header {
	background-color: #3498db; 
	color: #fff; 
	padding: 10px; 
	border-top-left-radius: 8px; 
	border-top-right-radius: 8px;
}

.card-text {
	margin-top: 15px;
}


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

