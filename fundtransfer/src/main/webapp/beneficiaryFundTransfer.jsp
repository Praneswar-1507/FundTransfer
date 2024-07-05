<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.fundtransfer.model.Beneficiary"%>


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

input[type="text"], input[type="number"], select {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
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
.error {
    color: red;
    text-align: center;
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
    <div class="container">
        <h2>Fund Transfer</h2>
        <form action="beneficiaryfundtransfer" method="post" onsubmit="return validateForm()">
            <% 
                List<Beneficiary> beneficiaryList = (List<Beneficiary>) session.getAttribute("beneficiarydetails"); 
            %>

            <label for="accountId">Account ID:</label> <input type="text"
                id="accountId" name="senderAccount"
                value="<%=session.getAttribute("accountid") %>" required>

           
            <input type="hidden" id="currentBalance" value="balance">
            <input type="hidden" value="<%=session.getAttribute("id") %>" name="fundId">

            <label for="beneficiary">Beneficiary Name:</label> 
            <select id="beneficiary" name="beneficiaryName">
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
            <select id="transferType" name=transferType>
                <option value="NEFT">NEFT</option>
                <option value="RTGS">RTGS</option>
            </select> 
            <label for="amount">Amount:</label> 
            <input type="number" id="amount" name="amount" min="0" max="200000" required>
            <div id="error-message" class="error"></div>
            <input type="hidden" name="action" value="beneficiaryfundtransfer">
            <input type="submit" value="Transfer">
        </form>
    </div>
</body>
</html>
