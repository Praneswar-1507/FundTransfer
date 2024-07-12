<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fund Transfer Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
            display: flex;
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
            color: #fff;
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
            margin-left: 200px;
            padding: 20px;
            width: calc(100% - 200px);
        }

        .credit-points {
            position: absolute;
            top: 10px;
            right: 20px;
            background-color: #fff;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-weight: bold;
            color: #333;
        }

        .container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px; 
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            width: 80%;
            margin: 0 auto;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="text"][readonly] {
            background-color: #f2f2f2;
        }

        input[type="submit"] {
            background-color: #2c3e50; 
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }

        input[type="submit"]:hover {
            background-color: #34495e;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px; 
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
            <li><a href="selectedfundtransfer?userId=<%=session.getAttribute("id")%>"><i class="fas fa-exchange-alt"></i> Quick Transfer</a></li>
            <li><a href="selectedbeneficiaryfundtransfer?userId=<%=session.getAttribute("id")%>"><i class="fas fa-user-friends"></i> Pay to Beneficiary</a></li>
            <li><a href="#" onclick="openPopup('depositPopup')"><i class="fas fa-coins"></i> Deposit</a></li>
            <li><a href="TransactionHistory?userId=<%=session.getAttribute("id")%>"><i class="fas fa-history"></i> Transaction History</a></li>
            <li><a href="viewbeneficiary?userId=<%=session.getAttribute("id")%>"><i class="fas fa-history"></i>Beneficiary</a></li>
            <li><a href="viewmoneyrequest?userId=<%=session.getAttribute("id")%>"><i class="fas fa-comments-dollar"></i> Requests</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="credit-points">
            Credit Points: <%=session.getAttribute("creditpoints") %>
        </div>
        <div class="container">
            <h2>Fund Transfer Form</h2>
            <form action="fundtransfer" method="post">
          

                <input type="hidden" value="<%=session.getAttribute("id") %>" name="fundId">

                <label for="senderAccount">Sender Account:</label>
                <input type="text" id="senderAccount" name="senderAccount" pattern="^[0-9]{12}$" value="<%=request.getAttribute("accountId") %>">

                <label for="receiverAccount">Receiver Account:</label>
                <input type="text" id="receiverAccount" name="receiverAccount" pattern="^[0-9]{12}$">

                <label for="ifsc">IFSC Code:</label>
                <input type="text" id="ifsc" name="ifsc" pattern="^([A-Z]{4}[0][A-Z0-9]{6})$">

                <label for="transferType">Transfer Type:</label>
                <select id="transferType" name="transferType">
                    <option value="NEFT">NEFT</option>
                    <option value="RTGS">RTGS</option>
                </select>

                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" min="0" max="25000">

                <div id="error-message" class="error">
                    <c:if test="${not empty error}">
                        ${error}
                    </c:if>
                </div>

                <input type="hidden" name="action" value="fundtransfer">
                <input type="submit" value="Transfer">
            </form>
              <input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
            <input type="hidden" id="message" value="<%= request.getAttribute("message") %>">
        </div>
    </div>
    <script>
        var status = document.getElementById('status').value;
    var message = document.getElementById('message').value;

            if (status === "success") {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: message
                });
            } else if (status === "failure") {
                Swal.fire({
                    icon: 'error',
                    title: 'error!',
                    text: message
                });
            }
        
    </script>
</body>
</html>
