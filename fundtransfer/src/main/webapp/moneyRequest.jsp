<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.chainsys.fundtransfer.model.RequestMoneyDetails" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Money Requests</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
          integrity="sha512-Fo3rlrZj/k7ujTnH2N2QZnBjl0XKq8jn59xN2ePv+I1fdk0/5R1d6Q4B5sH8p+E4GZpv6/OiPq4sMz7MWZsPdA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        body {
            font-family: Arial, sans-serif;
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

        .container {
            max-width: 800px;
            margin: auto;
        }

        .money-request {
            background-color: #f0f0f0;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .money-request h3 {
            margin-top: 0;
        }

        .money-request p {
            margin-bottom: 10px;
        }

        .money-request .btn-approve,
        .money-request .btn-reject {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            border-radius: 4px;
            flex: 1;
            margin: 5px;
            text-align: center;
        }

        .money-request .btn-reject {
            background-color: #f44336;
        }

        .button-group {
            display: flex;
            gap: 10px;
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

        .popup input[type="text"], .popup input[type="submit"], .popup input[type="number"] {
            width: 85%;
            padding: 10px;
            margin: 10px 7.5% 10px 2.5%;
        }

        .popup input[type="submit"] {
            background-color: #2c3e50; /* Match sidebar color */
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
        }

        .popup input[type="submit"]:hover {
            background-color: #34495e; /* Darken a bit on hover */
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
<div class="sidebar">
    <div class="sidebar-header">
        <h2>
            <i class="fas fa-piggy-bank"></i> fastpay
        </h2>
    </div>
    <ul>
        <li><a href="transferType.jsp"><i class="fas fa-exchange-alt"></i> Fund Transfer</a></li>
        <li><a href="#" onclick="openPopup('depositPopup')"><i class="fas fa-coins"></i> Deposit</a></li>
        <li><a href="TransactionHistory?userId=<%=session.getAttribute("id")%>"><i class="fas fa-history"></i> Transaction History</a></li>
        <li><a href="viewbeneficiary?userId=<%=session.getAttribute("id")%>"><i class="fas fa-history"></i>Beneficiary</a></li>
        <li><a href="viewmoneyrequest"><i class="fas fa-list-alt"></i>Money Requests</a></li>
    </ul>
</div>
<div class="content">
    <div class="container">
        <h2>Money Requests</h2>
        <button onclick="openPopup('moneyRequestPopup')" style="margin-bottom: 20px;">Request Money</button>
        <% List<RequestMoneyDetails> array = (List<RequestMoneyDetails>) request.getAttribute("money");
        String errorMessage = (String) request.getAttribute("error");
        Integer errorRequestId = (Integer) request.getAttribute("requestId");

        for (RequestMoneyDetails details : array) { %>
        <div class="money-request">
            <h3>Request from <%= details.getRequesterId() %></h3>
            <p>Amount: ₹<%= details.getAmount() %></p>
            <p>Status: </p>
            <div class="button-group">
                <form action="approveRequest" method="post">
                    <input type="hidden" name="requestId" value="<%= details.getRequestId() %>">
                    <input type="hidden" name="userId" value="<%= session.getAttribute("id") %>">
                    <input type="hidden" name="amount" value="<%= details.getAmount() %>">
                    <input type="submit" class="btn-approve" value="Pay">
                </form>
                <form action="rejectRequest" method="post">
                    <input type="hidden" name="requestId" value="<%= details.getRequestId() %>">
                    <input type="hidden" name="userId" value="<%= session.getAttribute("id") %>">
                    <input type="submit" class="btn-reject" value="Reject">
                </form>
            </div>
            <% if (errorMessage != null && details.getRequestId() == errorRequestId) { %>
            <p style="color: red; margin-top: 10px;"><%= errorMessage %></p>
            <% } %>
        </div>
        <% } %>
    </div>
</div>

<div id="depositPopup" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup('depositPopup')">&times;</span>
        <form action="deposit" method="post">
            <input type="text" name="userId" value="<%= session.getAttribute("id") %>" readonly>
            <input type="number" name="amount" placeholder="Amount" required>
            <input type="submit" value="Deposit">
        </form>
    </div>
</div>

<div id="addBeneficiaryPopup" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup('addBeneficiaryPopup')">&times;</span>
        <form action="addBeneficiary" method="post">
            <input type="text" name="userId" value="<%= session.getAttribute("id") %>" readonly>
            <input type="text" name="beneficiaryId" placeholder="Beneficiary ID" required>
            <input type="submit" value="Add Beneficiary">
        </form>
    </div>
</div>

<div id="moneyRequestPopup" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup('moneyRequestPopup')">&times;</span>
        <form action="requestMoney" method="post">
            <input type="text" name="userId" value="<%= session.getAttribute("id") %>" style="display: none;">
            <label for="requesterId">Account ID:</label>
            <input type="text" id="requesterId" name="approverId" placeholder="Enter account ID" required>
            <br>
            <label for="requestAmount">Amount:</label>
            <input type="number" id="requestAmount" name="amount" placeholder="Enter amount" required>
            <br>
            <input type="submit" value="Request Money">
        </form>
    </div>
</div>
</body>
</html>
