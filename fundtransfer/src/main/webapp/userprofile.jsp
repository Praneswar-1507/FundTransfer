<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fundtransfer.model.BankAccountPojo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fundtransfer.util.Jdbc"%>
<%@ page import="com.fundtransfer.model.FundTransferPojo"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!DOCTYPE html>
<html lang=eng>
<head>
<meta charset="UTF-8">
<title>Fastpay</title>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnH2N2QZnBjl0XKq8jn59xN2ePv+I1fdk0/5R1d6Q4B5sH8p+E4GZpv6/OiPq4sMz7MWZsPdA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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

.content {
	margin-left: 250px;
	padding: 20px;
	width: calc(100% - 250px);
	overflow-y: auto;
	transition: margin-left 0.3s, width 0.3s;
}

.content.expanded {
	margin-left: 70px;
	width: calc(100% - 70px);
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

.popup {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
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

.popup input[type="text"], .popup input[type="submit"] {
	width: 85%;
	padding: 10px;
	margin: 10px 7.5% 10px 2.5%;
}

.popup input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
}

.popup input[type="submit"]:hover {
	background-color: #45a049;
}

.info-line {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.edit-button {
	margin-left: 10px;
}
</style>
<script>
	function openPopup(popupId) {
		document.getElementById(popupId).style.display = "block";
	}

	function closePopup(popupId) {
		document.getElementById(popupId).style.display = "none";
	}
</script>
</head>
<body>
	<%
	BankAccountPojo userAccount = (BankAccountPojo) request.getAttribute("userData");
	%>
	<div class="sidebar">
		<div class="sidebar-header">
			<%
			FundTransferPojo userId = (FundTransferPojo) session.getAttribute("user");
			%>
			<h2>
				<i class="fas fa-piggy-bank"></i> fastpay
			</h2>
		</div>
		<ul>
			<li><a
				href="transfertype.jsp?accountNo=<%=userAccount.getAccountId()%>"><i
					class="fas fa-exchange-alt"></i> Fund Transfer</a></li>
			<li><a href="#" onclick="openPopup('depositPopup')"><i
					class="fas fa-coins"></i> Deposit</a></li>
			<li><a href="TransactionHistory?userId=<%=userId.getId()%>"><i
					class="fas fa-history"></i> Transaction History</a></li>
			<li><a href="#" onclick="openPopup('addBeneficiaryPopup')"><i
					class="fas fa-user-plus"></i> Add Beneficiary</a></li>
			<li><a href="BankAccount?userId=<%=userId.getId()%>"><i
					class="fas fa-history"></i>View Beneficiary</a></li>
		</ul>
	</div>
	<div class="content">
		<div class="header">
			<div class="profile-card">

				<h3>
					Welcome
					<%=userAccount.getFirstName()%></h3>
				<div class="info-line">
					<p>
						Phone Number:
						<%=userAccount.getPhonenumber()%></p>
					<button class="edit-button" onclick="openPopup('phoneNumberPopup')"
						title="Edit">
						<i class="material-icons">&#xE254;</i>
					</button>
				</div>
				<div class="info-line">
					<p>
						Address:
						<%=userAccount.getAddress()%></p>
					<button class="edit-button" onclick="openPopup('addressPopup')"
						title="Edit">
						<i class="material-icons">&#xE254;</i>
					</button>
				</div>
			</div>
			<div class="balance-card">
				<h3>
					₹<%=userAccount.getAccountBalance()%></h3>
				<p>
					Account Number:
					<%=userAccount.getAccountId()%></p>
				<p>
					IFSC Code:
					<%=userAccount.getiFSCcode()%></p>
			</div>
		</div>
	</div>


	<div id="phoneNumberPopup" class="popup">
		<div class="popup-content">
			<button class="close" onclick="closePopup('phoneNumberPopup')"
				aria-label="Close popup">&times;</button>

			<h3>Edit Phone Number</h3>
			<form action="BankAccount" method="post">
				<input type="text" name="phoneNumber"
					placeholder="Enter new phone number" pattern="[0-9]{10}" required>
				<input type="hidden" name="action" value="updatePhoneNumber">
				<input type="hidden" name="phonenumber"
					value="<%=userId.getId()%>"> <input type="submit"
					value="Update">
			</form>
		</div>
	</div>

	<div id="addressPopup" class="popup">
		<div class="popup-content">
			<button class="close" onclick="closePopup('addressPopup')"
				aria-label="Close popup">&times;</button>
			<h3>Edit Address</h3>
			<form action="BankAccount" method="post">
				<input type="text" name="addressValue"
					placeholder="Enter new address"> <input type="hidden"
					name="action" value="updateAddress"> <input type="hidden"
					name="address" value="<%=userId.getId()%>"> <input
					type="submit" value="Update">
			</form>
		</div>
	</div>


	<div id="depositPopup" class="popup">
		<div class="popup-content">
			<button class="close" onclick="closePopup('depositPopup')"
				aria-label="Close popup">&times;</button>
			<h3>Deposit Money</h3>
			<form action="BankAccount" method="post">
				<input type="number" name="amount" required
					style="width: 80%; padding: 10px;" Enter amount to
					deposit" required> <input type="hidden" name="action"
					value="deposit"> <input type="hidden" name="accountId"
					value="<%=userId.getId()%>"> <input type="submit"
					value="Deposit">
			</form>
		</div>
	</div>

	<div id="addBeneficiaryPopup" class="popup">
		<div class="popup-content">
			<button class="close" onclick="closePopup('addBeneficiaryPopup')"
				aria-label="Close popup">&times;</button>
			<h3>Add Beneficiary</h3>
			<form action="BankAccount" method="post">
				<input type="text" name="beneficiaryName"
					placeholder="Beneficiary Name" required> <input type="text"
					name="accountID" placeholder="Beneficiary Account ID"
					pattern="^[0-9]{12}$" required> <input type="text"
					name="ifscCode" placeholder="IFSC Code"
					pattern="^([A-Z]{4}[0][A-Z0-9]{6})$" required> <input
					type="hidden" name="action" value="beneficiary"> <input
					type="hidden" name="userId" value="<%=userId.getId()%>">
				<input type="submit" value="Add Beneficiary">
			</form>
		</div>
	</div>

</body>
</html>
