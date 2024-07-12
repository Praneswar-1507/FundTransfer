<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.fundtransfer.model.Beneficiary"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Beneficiary Fund Transfer</title>
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
        color: #fff; /* Sidebar header text color to white */
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
        position: relative; /* Ensure the credit points are positioned relative to this container */
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
            color: #333;    }

    .container {
        width: 60%; 
        margin: 0 auto;
        padding: 40px 20px; 
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 20px; 
        margin-left: 100px; 
    }

    h2 {
        text-align: center;
        color: #333;
    }

    form {
        width: 100%; 
        height: 100%; 
        margin: 0 auto;
    }

    label {
        font-weight: bold;
        margin-bottom: 5px;
        display: block;
    }

    input[type="text"], input[type="number"], select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #2c3e50; /* Sidebar color */
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

    .error {
        color: red;
        text-align: center;
        margin-bottom: 10px; 
    }
</style>
<script>
function updateBeneficiaryAccountId() {
    var beneficiarySelect = document.getElementById("beneficiary");
    var beneficiaryIdInput = document.getElementById("beneficiaryID");
    var beneficiaryAccountIdInput = document.getElementById("beneficiaryAccountId");
    var receiverIfscCodeInput = document.getElementById("receiverIfscCode");
    var selectedOption = beneficiarySelect.options[beneficiarySelect.selectedIndex];
    
    if (selectedOption.value !== "") {
        var beneficiaryAccountId = selectedOption.getAttribute("data-accountid");
        var beneficiaryIfscCode = selectedOption.getAttribute("data-ifsc");
        var beneficiaryId = selectedOption.getAttribute("data-id"); 
        
        beneficiaryIdInput.value = beneficiaryId; 
        beneficiaryAccountIdInput.value = beneficiaryAccountId;
        receiverIfscCodeInput.value = beneficiaryIfscCode; 
    } else {
        beneficiaryIdInput.value = "";
        beneficiaryAccountIdInput.value = "";
        receiverIfscCodeInput.value = "";
    }
}

function validateForm() {
    updateBeneficiaryAccountId();
    const currentBalance = parseFloat(document.getElementById('currentBalance').value);
    const transferAmount = parseFloat(document.getElementById('amount').value);
    const errorMessage = document.getElementById('error-message');

    errorMessage.innerText = ''; 

    if (transferAmount > currentBalance) {
        errorMessage.innerText = 'Insufficient balance.';
        return false;
    }
    return true;
}

document.addEventListener("DOMContentLoaded", function() {
    const inputs = document.querySelectorAll("input[type='text'], input[type='number'], select");
    const errorMessage = document.getElementById('error-message');
    
    inputs.forEach(input => {
        input.addEventListener('input', () => {
            errorMessage.innerText = ''; 
        });
    });
});
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
            <li><a href="selectedfundtransfer?userId=<%=session.getAttribute("id")%>"><i class="fas fa-exchange-alt"></i> Quick Transfer</a></li>
            <li><a href="selectedbeneficiaryfundtransfer?userId=<%=session.getAttribute("id")%>"><i class="fas fa-user-friends"></i> Pay to Beneficiary</a></li>
            <li><a href="#" onclick="openPopup('depositPopup')"><i class="fas fa-coins"></i> Deposit</a></li>
            <li><a href="TransactionHistory?userId=<%=session.getAttribute("id")%>"><i class="fas fa-history"></i> Transaction History</a></li>
            <li><a href="viewbeneficiary?userId=<%=session.getAttribute("id")%>"><i class="fas fa-history"></i> Beneficiary</a></li>
            <li><a href="viewmoneyrequest?userId=<%=session.getAttribute("id")%>"><i class="fas fa-comments-dollar"></i> Requests</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="credit-points">
            Credit Points: <%=session.getAttribute("creditpoints") %>
        </div>
        <div class="container">
            <h2>Fund Transfer</h2>
            <form action="beneficiaryfundtransfer" method="post" onsubmit="return validateForm()">
                <% 
                    List<Beneficiary> beneficiaryList = (List<Beneficiary>) session.getAttribute("beneficiarydetails"); 
                    Integer balance = (Integer) request.getAttribute("balance"); // Get balance from request attribute
                %>

                <label for="accountId">Account ID:</label> 
                <input type="text" id="accountId" name="senderAccount" value="<%=request.getAttribute("accountId") %>" required>

                <input type="hidden" id="currentBalance" value="<%= balance %>">
                <input type="hidden" value="<%=session.getAttribute("id") %>" name="fundId">

                <label for="beneficiary">Beneficiary Name:</label> 
                <select id="beneficiary" name="beneficiaryName" onchange="updateBeneficiaryAccountId()">
                    <option value="" disabled selected>Select Beneficiary</option>
                    <% for (Beneficiary beneficiary : beneficiaryList) { %>
                        <option value="<%= beneficiary.getBeneficiaryName() %>"
                            data-accountid="<%= beneficiary.getBeneficiaryAccountId() %>"
                            data-ifsc="<%= beneficiary.getIfsccode() %>"
                            data-id="<%= beneficiary.getBeneficiaryId() %>">
                            <%= beneficiary.getBeneficiaryName() %>
                        </option>
                    <% } %>
                </select> 
                
                <input type="hidden" id="beneficiaryID" name="beneficiaryId">
                <input type="hidden" id="beneficiaryAccountId" name="receiverAccount">
                <input type="hidden" id="receiverIfscCode" name="ifsc"> 

                <label for="transferType">Transfer Type:</label> 
                <select id="transferType" name="transferType">
                    <option value="NEFT">NEFT</option>
                    <option value="RTGS">RTGS</option>
                </select> 

                <label for="amount">Amount:</label> 
                <input type="number" id="amount" name="amount" min="0" max="200000" required>
                
                <div id="error-message" class="error">
                  
                    <c:if test="${not empty error}">
                        ${error}
                    </c:if>
                </div>

                <input type="hidden" name="action" value="beneficiaryfundtransfer">
                <input type="submit" value="Transfer">
            </form>
        </div>
    </div>
</body>
</html>
