<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.chainsys.fundtransfer.model.BankAccount"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Fastpay</title>

<!-- External CSS -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<!-- Internal CSS -->
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	height: 100vh;
	background-color: #f4f4f9;
}

.sidebar {
	width: 180px;
	background-color: #2c3e50;
	color: #fff;
	padding: 20px;
	height: 100vh;
	position: fixed;
	transition: width 0.3s;
}

.sidebar.collapsed {
	width: 70px;
}

.sidebar-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.sidebar h2 {
	margin: 0;
	font-size: 20px;
}

.sidebar.collapsed h2 {
	display: none;
}

.sidebar ul {
	list-style-type: none;
	padding: 0;
}

.sidebar ul li {
	padding: 15px 0;
}

.sidebar ul li a {
	color: #fff;
	text-decoration: none;
	display: flex;
	align-items: center;
	padding: 10px;
	border-radius: 4px;
	transition: background 0.3s;
}

.sidebar ul li a i {
	margin-right: 10px;
}

.sidebar ul li a:hover {
	background-color: #34495e;
}

.menu-toggle {
	background: none;
	border: none;
	color: #fff;
	font-size: 20px;
	cursor: pointer;
}

.has-submenu:hover .submenu {
	display: block;
}

.submenu {
	display: none;
	list-style-type: none;
	padding-left: 20px;
}

.submenu li {
	padding: 10px 0;
}

.submenu li a {
	color: #fff;
	text-decoration: none;
	padding: 10px;
	border-radius: 4px;
	display: block;
}

.submenu li a:hover {
	background-color: #34495e;
}

.content {
	margin-left: 250px;
	padding: 20px;
	width: calc(100% - 250px);
	overflow-y: auto;
	position: relative;
	transition: margin-left 0.3s, width 0.3s;
}

.header {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.profile-card, .balance-card {
	background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%);
	color: #fff;
	padding: 20px;
	border-radius: 10px;
	width: 45%;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s;
}

.balance-card h3 {
	color: #ff5733;
}

.credit-points {
	position: relative;
	background-color: #fff;
	color: #333;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.credit-points h3 {
	font-size: 20px;
	margin: 0;
}

.credit-points p {
	font-size: 18px;
	margin: 0;
	font-weight: bold;
	color: #2575fc;
}

.redeem-button {
	background-color: #2c3e50;
	color: white;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 4px;
	display: none;
}

.redeem-button:hover {
	background-color: #34495e;
}

.popup {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.popup-content {
	background-color: #fefefe;
	margin: 20% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 250px;
	border-radius: 10px;
	position: relative; /* Ensure close button positioning */
}

.close {
	color: #aaa;
	position: absolute;
	top: 5px;
	right: 10px;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
}

.popup input[type="text"], .popup input[type="submit"], .popup input[type="number"]
	{
	width: 85%;
	padding: 10px;
	margin: 10px 7.5% 10px 2.5%;
}

.popup input[type="submit"] {
	background-color: #2c3e50; /* Match sidebar background color */
	color: white;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	border-radius: 4px;
}

.popup input[type="submit"]:hover {
	background-color: #34495e; /* Darker shade for hover effect */
}

.info-line {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.edit-button {
	margin-left: 10px;
}

.sidebar ul li a .badge {
	background-color: red;
	color: white;
	padding: 2px 5px;
	border-radius: 50%;
	font-size: 12px;
	margin-left: 5px;
}
</style>
</head>
<body onload="checkCreditPoints()">

	<% BankAccount userAccount = (BankAccount) request.getAttribute("userprofiledetails"); %>
	<% Integer moneyRequestCount = (Integer) request.getAttribute("count"); %>


	<div class="sidebar">
		<div class="sidebar-header">
			<h2>Fastpay</h2>
		</div>
		<ul>
			<li><a
				href="selectedfundtransfer?userId=<%=session.getAttribute("id")%>"><i
					class="fas fa-exchange-alt"></i> Quick Transfer</a></li>
			<li><a
				href="selectedbeneficiaryfundtransfer?userId=<%=session.getAttribute("id")%>"><i
					class="fas fa-user-friends"></i> Pay to Beneficiary</a></li>
			<li><a href="#" onclick="openPopup('depositPopup')"><i
					class="fas fa-coins"></i> Deposit</a></li>
			<li><a
				href="TransactionHistory?userId=<%=session.getAttribute("id")%>"><i
					class="fas fa-history"></i> Transaction History</a></li>
			<li><a
				href="viewbeneficiary?userId=<%=session.getAttribute("id")%>"><i
					class="fas fa-history"></i> Beneficiary</a></li>
			<li class="has-submenu"><a
				href="viewmoneyrequest?userId=<%= session.getAttribute("id") %>">
					<i class="fas fa-comments-dollar"></i> Requests <% if (moneyRequestCount != null && moneyRequestCount > 0) { %>
					<span class="badge"><%= moneyRequestCount %></span> <% } %>
			</a></li>
		</ul>
	</div>


	<div class="content">

		<div class="credit-points">
			<h3>Credit Points</h3>
			<p><%= session.getAttribute("creditpoints") %></p>
			<button id="redeemButton" class="redeem-button"
				onclick="openPopup('redeemPopup')">Redeem Points</button>
		</div>


		<div class="header">
			
			<div class="profile-card">
				<h3>
					Welcome
					<%= userAccount.getFirstName() %></h3>
				<div class="info-line">
					<p>
						Phone Number:
						<%= userAccount.getPhoneNumber() %></p>
					<button class="edit-button" onclick="openPopup('phoneNumberPopup')"
						title="Edit">
						<i class="material-icons">&#xE254;</i>
					</button>
				</div>
				<div class="info-line">
					<p>
						Address:
						<%= userAccount.getAddress() %></p>
					<button class="edit-button" onclick="openPopup('addressPopup')"
						title="Edit">
						<i class="material-icons">&#xE254;</i>
					</button>
				</div>
			</div>


			<div class="balance-card">
				<h3>
					₹<%= userAccount.getAccountBalance() %></h3>
				<p>
					Account Number:
					<%= userAccount.getAccountId() %></p>
				<p>
					IFSC Code:
					<%= userAccount.getIfscCode() %></p>
			</div>
		</div>
	</div>


	<div id="phoneNumberPopup" class="popup">
		<div class="popup-content">
			<button class="close" onclick="closePopup('phoneNumberPopup')"
				aria-label="Close popup">&times;</button>
			<h3>Edit Phone Number</h3>
			<form action="updatephonenumber" method="post">
				<input type="text" name="phoneNumber"
					placeholder="Enter new phone number" pattern="[0-9]{10}" required>
				<input type="hidden" name="phonenumber"
					value="<%= session.getAttribute("id") %>"> <input
					type="submit" value="Update">
			</form>
		</div>
	</div>


	<div id="addressPopup" class="popup">
		<div class="popup-content">
			<button class="close" onclick="closePopup('addressPopup')"
				aria-label="Close popup">&times;</button>
			<h3>Edit Address</h3>
			<form action="updateaddress" method="post">
				<input type="text" name="addressValue"
					placeholder="Enter new address"> <input type="hidden"
					name="action" value="updateAddress"> <input type="hidden"
					name="address" value="<%= session.getAttribute("id") %>"> <input
					type="submit" value="Update">
			</form>
		</div>
	</div>


	<div id="depositPopup" class="popup">
		<div class="popup-content">
			<button class="close" onclick="closePopup('depositPopup')"
				aria-label="Close popup">&times;</button>
			<h3>Deposit Money</h3>
			<form action="deposit" method="post">
				<input type="number" name="amount" required
					style="width: 80%; padding: 10px;"
					placeholder="Enter amount to deposit" required> <input
					type="hidden" name="action" value="deposit"> <input
					type="hidden" name="accountId"
					value="<%= session.getAttribute("id") %>"> <input
					type="submit" value="Deposit">
			</form>
		</div>
	</div>


	<div id="redeemPopup" class="popup">
		<div class="popup-content">
			<button class="close" onclick="closePopup('redeemPopup')"
				aria-label="Close popup">&times;</button>
			<h3>Redeem Points</h3>
		<form id="redeemForm" action="redeempoints" method="post">
    <input type="hidden" name="id" value="<%= session.getAttribute("id") %>">
    <input type="number" id="redeemAmount" name="points" value="1000" readonly>
    <button type="button" id="subtractPointsButton" onclick="subtractPoints(1000)">-</button>
    <button type="button" id="addPointsButton" onclick="addPoints(1000)">+</button>
    <input type="submit" value="Redeem">
</form>
		</div>
	</div>


	<script>
        function openPopup(popupId) {
            document.getElementById(popupId).style.display = "block";
        }

        function closePopup(popupId) {
            document.getElementById(popupId).style.display = "none";
        }

        function checkCreditPoints() {
            var creditPoints = <%= session.getAttribute("creditpoints") %>;
            var redeemButton = document.getElementById("redeemButton");

            if (creditPoints > 1000) {
                redeemButton.style.display = "block";
            } else {
                redeemButton.style.display = "none";
            }
        }

        function addPoints(amount) {
            var redeemAmountInput = document.getElementById("redeemAmount");
            var currentPoints = parseInt(redeemAmountInput.value);
            var newPoints = currentPoints + amount;

          
            var creditPoints = <%= session.getAttribute("creditpoints") %>;
            if (newPoints > creditPoints) {
                newPoints = creditPoints;
            }

            redeemAmountInput.value = newPoints;

         
            var addButton = document.getElementById("addPointsButton");
            var subtractButton = document.getElementById("subtractPointsButton");

            if (newPoints >= creditPoints) {
                addButton.style.display = "none";
            } else {
                addButton.style.display = "inline-block";
            }

            if (newPoints > 0) {
                subtractButton.style.display = "inline-block";
            } else {
                subtractButton.style.display = "none";
            }
        }

        function subtractPoints(amount) {
            var redeemAmountInput = document.getElementById("redeemAmount");
            var currentPoints = parseInt(redeemAmountInput.value);
            var newPoints = currentPoints - amount;

            if (newPoints < 0) {
                newPoints = 0;
            }

            redeemAmountInput.value = newPoints;

         
            var addButton = document.getElementById("addPointsButton");
            var subtractButton = document.getElementById("subtractPointsButton");

            if (newPoints >= <%= session.getAttribute("creditpoints") %>) {
                addButton.style.display = "none";
            } else {
                addButton.style.display = "inline-block";
            }

            if (newPoints > 0) {
                subtractButton.style.display = "inline-block";
            } else {
                subtractButton.style.display = "none";
            }
        }
    </script>
</body>
</html>
