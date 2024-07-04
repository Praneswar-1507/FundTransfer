<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FundTransfer</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	background-color: #f9f9f9;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

/* Navigation Bar */
.navbar {
	background-color: #333;
	color: #fff;
	padding: 1em;
	display: flex;
	justify-content: space-between;
	align-items: center;
	position: fixed;
	width: 100%;
	z-index: 1000;
}

.logo {
	font-size: 1.5em;
	text-decoration: none;
	color: #fff;
	display: flex;
	align-items: center;
}

.logo img {
	width: 150px;
	height: auto;
	margin-right: 10px;
}

.nav-items {
	list-style-type: none;
	display: flex;
	align-items: center;
}

.nav-items li {
	margin-right: 20px;
	position: relative;
}

.nav-items li a {
	text-decoration: none;
	color: #fff;
	padding: 1em;
	position: relative;
	display: inline-block;
}

.nav-items li a:hover {
	background-color: #337ab7;
	border-radius: 5px;
}

/* Login Button */
.login-btn {
	background-color: #337ab7;
	color: #fff;
	border: none;
	padding: 0.5em 1em;
	font-size: 1em;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.login-btn:hover {
	background-color: #23527c;
}

/* Main Content */
main {
	flex: 1;
	padding: 2em;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 60px;
}

.left-content {
	max-width: 50%;
	text-align: center;
	margin: 0 auto;
}

.intro {
	margin-bottom: 2em;
}

.intro h1 {
	font-size: 2.5em;
	margin-bottom: 0.5em;
}

.intro p {
	font-size: 1.1em;
	margin-bottom: 1em;
}

.intro button {
	background-color: #337ab7;
	color: #fff;
	border: none;
	padding: 10px 20px;
	font-size: 1em;
	cursor: pointer;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.intro button:hover {
	background-color: #23527c;
}

/* Footer */
footer {
	background-color: #333;
	color: #fff;
	padding: 0.5em;
	text-align: center;
	margin-top: auto;
	width: 100%;
	position: fixed;
	bottom: 0;
	z-index: 1000;
}

.social-media {
	margin-top: 1em;
	display: flex;
	justify-content: center;
}

.social-media a {
	color: #fff;
	margin: 0 10px;
}

.social-media i {
	font-size: 1.5em;
}
</style>
</head>
<body>
	<!-- Navigation Bar -->
	<!-- Navigation Bar -->
	<nav class="navbar">
		<a href="#" class="logo"> <img src="images/fastpay.jpg" alt="FastPay Logo">
		</a>
		<ul class="nav-items">
			<li><a href="#">Home</a></li>
			<li><a href="#">About</a></li>
			<% 
             session.getAttribute("username"); 
    
    %>
		 	<li><form action="userprofile" method="post">
				<input type="hidden" name="action" value="login2"> <input
					type="hidden" value="<%=session.getAttribute("id")%>" name="id"> 
		 	<button type="submit" class="login-btn"><%=session.getAttribute("username")%></button></li>
		
			<li><a href="#">Contact</a></li>
			<li>
				<form action="home.jsp" method="post">
					<input type="hidden" name="login" value="login1">
					<button type="submit" class="login-btn">Logout</button>
				</form>
			</li>
		</ul>
	</nav>

	<!-- Main Content Section -->
	<main>
		<div class="left-content">
			<div class="intro">
				<h1>Welcome to Fast pay</h1>
				<p>Your trusted platform for secure money transfers.</p>
				<form action="bankAccount.jsp" method="post">
					<input type="hidden" name="login" value="createAccount">
					<button type="submit">Create Account</button>
				</form>
			</div>
		</div>
	</main>

	<!-- Footer Section -->
	<footer>
		<p>© 2024 Fastpay. All rights reserved.</p>
		<div class="social-media">
			<a
				href="https://www.google.com/search?q=icon+facebook+logo&udm=2&sa=X&ved=2ahUKEwi5x6y0l7WGAxUrZWwGHaISCq4QrNwCegUIgAEQAA"><i
				class="fab fa-facebook"></i></a> <a
				href="https://www.google.com/search?q=instagram+logo&udm=2&sa=X&ved=2ahUKEwi5x6y0l7WGAxUrZWwGHaISCq4QrNwCegQIfxAA"><i
				class="fab fa-twitter"></i></a> <a href="#"><i
				class="fab fa-linkedin"></i></a>
		</div>
	</footer>
</body>
</html>
