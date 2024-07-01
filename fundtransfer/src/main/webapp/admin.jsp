<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>User Details</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">
body {
	color: #404E67;
	background: #F5F7FA;
	font-family: 'Open Sans', sans-serif;
}

.table-wrapper {
	width: 90%;
	margin: 30px auto;
	background: #fff;
	padding: 20px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 10px;
	margin: 0 0 10px;
}

.table-title h2 {
	margin: 6px 0 0;
	font-size: 22px;
}

.table-title .add-new {
	float: right;
	height: 30px;
	font-weight: bold;
	font-size: 12px;
	text-shadow: none;
	min-width: 100px;
	border-radius: 50px;
	line-height: 13px;
}

.table-title .add-new i {
	margin-right: 4px;
}

table.table {
	table-layout: fixed;
	width: 100%;
	margin: auto;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
}

table.table th i {
	font-size: 5px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td a {
	cursor: pointer;
	display: inline-block;
	margin: 0 5px;
	width: 150px;
}

table.table td a.add {
	
}

table.table td a.edit {
	
}

table.table td form.delete button {
	
}

table.table td i {
	font-size: 19px;
}

table.table td a.add i {
	font-size: 24px;
	margin-right: -1px;
	position: relative;
	top: 3px;
}

table.table .form-control {
	height: 32px;
	line-height: 32px;
	box-shadow: none;
	border-radius: 2px;
}

table.table .form-control.error {
	border-color: #f50000;
}

table.table td .add {
	display: none;
}

.search-container {
	float: right;
	margin-top: 20px;
}

.search-container input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
	border-radius: 5px;
}

.search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.search-container button:hover {
	background: #ccc;
}
</style>
</head>
<body>
	<div class="container">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-8">
						<h2>
							User <b>Details</b>
						</h2>
					</div>
					<div class="col-sm-4">

						<form action="home.jsp" method="post">
							<button type="submit" class="btn btn-danger pull-right">Logout</button>
						</form>
					</div>
				</div>
			</div>
			<table border="1" class="table">
				<tr>
					<th style="width: 8%;">ID</th>
					<th style="width: 20%;">FirstName</th>
					<th style="width: 20%;">LastName</th>
					<th style="width: 30%;">PhoneNumber</th>
					<th style="width: 20%;">Date</th>
					<th style="width: 30%;">AadharNumber</th>
					<th style="width: 30%;">IFSCcode</th>
					<th style="width: 40%;">Address</th>
					<th style="width: 18%;">Balance</th>
					<th style="width: 30%;">AccountId</th>
					<th style="width: 30%;">GenerateId</th>
				</tr>
				<tbody>
					<% 
            Jdbc jdbc = new Jdbc();
            ArrayList<BankAccountPojo> array = jdbc.read();
            for (BankAccountPojo view : array) { 
            %>
					<tr>
						<td><%=view.getUserId() %></td>
						<td><%=view.getFirstName() %></td>
						<td><%=view.getLastName() %></td>
						<td><%=view.getPhonenumber() %></td>
						<td><%=view.getDate() %></td>
						<td><%=view.getAadharNumber() %></td>
						<td><%=view.getiFSCcode() %></td>
						<td><%=view.getAddress() %></td>
						<td><%=view.getAccountBalance() %></td>
						<td><%=view.getAccountId() %></td>
						<td>
							<form action="BankAccount" method="post">
								<input type="hidden" name="action" value="generateID"> <input
									type="hidden" name="generateid" value="<%=view.getUserId()%>">
								<button type="submit" title="Approve">Approve</button>
							</form>
						</td>
						<% } %>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
