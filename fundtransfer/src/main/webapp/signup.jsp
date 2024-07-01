<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.login-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 300px;
}

.login-container h2 {
	margin-bottom: 20px;
	text-align: center;
}

.form-group {
	margin-bottom: 20px;
	display: flex;
	align-items: center;
}

.form-group label {
	flex: 1;
	margin-bottom: 5px;
}

.form-group input[type="text"], .form-group input[type="password"],
	.form-group input[type="email"] {
	flex: 2;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.form-group .remember-me {
	flex: 2;
	margin-left: 5px;
}

.form-group button {
	padding: 10px 20px;
	background-color: #007bff;
	border: none;
	color: #fff;
	border-radius: 3px;
	cursor: pointer;
	width: 100%;
}

.form-group button:hover {
	background-color: #0056b3;
}

.form-group .error-message {
	flex: 2;
	color: red;
}

.signup-link {
	text-align: center;
	margin-top: 10px;
}

.signup-link a {
	color: #007bff;
	text-decoration: none;
}

.signup-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="login-container">
		<h2>Signup</h2>
		<form action="register" method="post">
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					id="username" name="username" pattern="[A-Za-z]{4,}" required>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[&^%$#@]).{5,}"
					required>
			</div>
			<div class="form-group">
				<label for="password">ConfirmPassword:</label> <input
					type="password" id="password" name="password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}" required>
			</div>
			<div class="form-group">
				<input type="checkbox" id="remember" name="remember"> <label
					for="remember" class="remember-me">Remember me</label>
			</div>
			<div class="form-group">
				<input type="hidden" name="action" value="register">
				<button type="submit">Signup</button>
			</div>
			<div class="form-group error-message">
				<%
				String errorMessage = (String) request.getAttribute("errorMessage");
				if (errorMessage != null) {
					out.println(errorMessage);
				}
				%>
			</div>
		</form>
	</div>
</body>
</html>
