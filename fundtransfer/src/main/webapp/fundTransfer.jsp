<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

</head>
<body>
    <div class="container">
        <h2>Fund Transfer Form</h2>
        <form action="fundtransfer" method="post" >

          
           
            <input type="hidden" value="<%=session.getAttribute("id") %>" name="fundId">

            <label for="transferType">Sender Account:</label> 
            <input type="text" id="transferType" name="senderAccount" pattern="^[0-9]{12}$" value="<%=session.getAttribute("accountid") %>">
            
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
