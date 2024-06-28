<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fundtransfer.model.TranferAmountPojo"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .receipt {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
        }
        .receipt .icon {
            font-size: 50px;
            color: green;
        }
        .receipt h1 {
            font-size: 24px;
            color: green;
        }
        .receipt p {
            font-size: 16px;
            color: #333;
        }
        .receipt .details {
            text-align: left;
            margin-top: 20px;
        }
        .receipt .details p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
<%
TranferAmountPojo userAccount = (TranferAmountPojo) request.getAttribute("transferid");
	%>
<div class="receipt">
    <div class="icon">✔</div>
    <h1>Payment Successful!</h1>
    <p>Transaction Number: <%=userAccount.getTransferId() %></p>
    <hr>
    <div class="details">
        <p>Amount Paid: ₹ <%=userAccount.getAmount()  %></p>
    </div>
</div>
</body>
</html>
