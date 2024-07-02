<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bank Account Opening Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
}

.form-group {
	margin-bottom: 20px;
}

label {
	font-weight: bold;
}

input[type="text"], input[type="tel"], input[type="date"], input[type="number"]
	{
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Bank Account Opening Form</h2>
		<form action="createbankaccount" method="post">
			<div class="form-group">
				<label for="firstname">First Name</label> <input type="text"
					id="firstname" name="firstname" value="<%=session.getAttribute("username") %>" pattern="[A-Za-z]{4,}" required>
			</div>
			<div class="form-group">
				<label for="lastname">Last Name</label> <input type="text"
					id="lastname" name="lastname" pattern="[A-Za-z]{4,}" required>
			</div>
			<div class="form-group">
				<label for="phonenumber">Phone Number</label> <input type="tel"
					id="phonenumber" name="phonenum" pattern="[6,7,8,9]{1}[0-9]{9}"
					required>
			</div>
			<div class="form-group">
				<label for="dob">Date of Birth</label> <input type="date" id="dob"
					name="dob" required>
			</div>
			<div class="form-group">
				<label for="aadharnumber">Aadhar Number</label> <input type="text"
					id="aadharnumber" name="aadharnumber" pattern="[0-9]{12}" required>
			</div>
			<div class="form-group">
				<label for="address">Address</label> <input type="text"
					id="useraddress" name="address" required>
			</div>
			
			<input type="hidden" value="<%=session.getAttribute("id")%>" name="id">
			<div class="form-group">
				<input type="hidden" name="action" value="registered">
				<button type="submit">submit</button>
			</div>
		</form>
	</div>

</body>
</html>
