<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fundtransfer.model.FundTransferPojo"%>
<%@ page import="com.fundtransfer.model.BankAccountPojo"%>
<%@ page import="com.fundtransfer.util.Jdbc"%>
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
}

.container {
    width: 50%;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
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
    background-color: #4CAF50;
    color: white;
    padding: 15px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    margin-top: 10px;
}

input[type="submit"]:hover {
    background-color: #45a049;
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
}
</style>
<script>
function validateForm() {
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
    <div class="container">
        <h2>Fund Transfer Form</h2>
        <form action="AmountTransfer" method="post" onsubmit="return validateForm()">

            <% 
                FundTransferPojo userId = (FundTransferPojo) session.getAttribute("user");
                Jdbc crud = new Jdbc(); 
                BankAccountPojo userAccount = crud.read1(userId.getId());
            %>
            <input type="hidden" id="currentBalance" value="<%= userAccount.getAccountBalance() %>">
            <input type="hidden" value="<%= userId.getId() %>" name="fundId">

            <label for="transferType">Sender Account:</label> 
            <input type="text" id="transferType" name="senderAccount" pattern="^[0-9]{12}$" value="<%= request.getParameter("accountId") %>">
            
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
            <input type="number" id="amount" name="amount" min="0" max="200000">
            
            <div id="error-message" class="error"></div>
            
            <input type="hidden" name="action" value="fundtransfer">
            <input type="submit" value="Transfer">
        </form>
    </div>
</body>
</html>
