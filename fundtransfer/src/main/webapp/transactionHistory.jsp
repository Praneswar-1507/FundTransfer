<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.fundtransfer.model.TranferAmountPojo"%>
<!DOCTYPE html>
<html lang=eng>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
}

.sidebar {
	width: 180px;
	min-height: 100vh;
	background-color: #2c3e50;
	color: #fff;
	padding: 20px;
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

.table-container {
	flex-grow: 1;
	padding: 20px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>

	<div class="sidebar">
		<div class="sidebar-header">
			<h2>
				<i class="fas fa-piggy-bank"></i> fastpay
			</h2>
		</div>
		<ul>
			<li><a href="userprofile.jsp"><i class="fas fa-key"></i>UserProfile</a></li>
			<li><a href="#" role="button" onclick="openPopup()"
				aria-label="Deposit"> <i class="fas fa-user"></i> Deposit
			</a></li>
			<li><a href="#"><i class="fas fa-history"></i> Transaction
					History</a></li>
		</ul>
	</div>

	<div class="table-container">
		<table>
			<thead>
				<tr>
					<th>TransferId</th>
					<th>SenderAccNo</th>
					<th>ReceiverAccNo</th>
					<th>TransferDate</th>
					<th>TransferAmount</th>
				</tr>
			</thead>
			<tbody>
				<%
				ArrayList<TranferAmountPojo> history = (ArrayList<TranferAmountPojo>) request.getAttribute("usertransaction");
				for (TranferAmountPojo view : history) {
				%>
				<tr>
					<td><%=view.getTransferId()%></td>
					<td><%=view.getSendAccountNo()%></td>
					<td><%=view.getRecepientAccountNo()%></td>
					<td><%=view.getDate()%></td>
					<td><%=view.getAmount()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>
