<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Wallet Transfer</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }
        .main-container {
            display: flex;
            padding: 5px;
            margin: 5px;
        }
        .left-container {
            width: 30%;
            background-color: #3c445c;
            color: #ffffff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .container {
            width: 70%;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        .submit-button,
        .cancel-button {
            width: 100%;
            padding: 15px;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        .submit-button {
            background-color: #3c445c;
            color: #ffffff;
            border: none;
            margin-bottom: 10px;
        }
        .cancel-button {
            background-color: #ffffff;
            color: #3c445c;
            border: 1px solid #3c445c;
        }
        .logo {
            display: block;
            margin: 0 auto;
            margin-bottom: 20px;
        }
        @media only screen and (max-width: 600px) {
            /* Adjustments for mobile phones */
            .main-container {
                flex-direction: column;
                align-items: center;
            }
            .left-container,
            .container {
                width: 100%;
                margin: 0;
            }
            .left-container {
                padding: 10px;
            }
            .logo {
                margin-bottom: 10px;
            }
            .form-group {
                margin-bottom: 10px;
            }
            input[type="text"],
            input[type="password"],
            .submit-button,
            .cancel-button {
                width: 100%;
                margin-bottom: 10px;
            }
        }
        .bar {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.95);
            z-index: 1000;
            overflow: hidden;
            justify-content: center;
            align-items: center;
        }
        .bar-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            text-align: center;
        }
        .closeBtn {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 25px;
            text-decoration: none;
            color: #000;
        }
    </style>
</head>
<body>

<div class="main-container">
    <div class="left-container">
        <h3 style="font-style: italic; font-size: xx-large;"></h3>
    </div>
    <div class="container">
        <form id="transferForm" action="Transfers" method="post">
            <input type="hidden" name="action" value="walletTransfer">
            <input type="hidden" name="id" value="">
            
            <div class="form-group">
                <label for="receiverWalletId">Receiver Wallet ID:</label>
                <input type="text" id="receiverWalletId" name="receiverWalletId" required>
                <button type="button" onclick="generateQRCode()" style="background-color: #3c445c; border-radius: 5px; color:white;">Generate QR</button>
            </div>
            <div id="qrBar" class="bar">
                <div class="bar-content">
                    <div id="qrCodeDiv"></div>
                    <a href="javascript:void(0)" class="closeBtn" onclick="closeQr()">&times;</a>
                </div>
            </div>
            <div class="form-group">
                <label for="senderWalletId">Sender Wallet ID:</label>
                <input type="text" id="senderWalletId" name="senderWalletId" required readonly>
            </div>
            <div class="form-group">
                <label for="amountToSend">Amount to Send:</label>
                <input type="text" id="amountToSend" name="amountToSend" required>
            </div>
            <button type="submit" class="submit-button">OK</button>
            <button type="button" class="cancel-button" onclick="window.location.href='LandingPage.jsp'">Cancel</button>
        </form>
    </div>
</div>

<script>
function generateQRCode() {
    var receiverWalletId = document.getElementById("receiverWalletId").value;
    if (receiverWalletId === "") {
        alert("Please enter a Receiver Wallet ID.");
        return;
    }
    var qrCodeDiv = document.getElementById("qrCodeDiv");
    qrCodeDiv.innerHTML = "<img src='https://via.placeholder.com/150' alt='QR Code'><p>QR Code for " + receiverWalletId + "</p>";
    var qrBar = document.getElementById("qrBar");
    qrBar.style.display = "flex";
}

function closeQr() {
    var qrBar = document.getElementById("qrBar");
    qrBar.style.display = "none";
}
</script>

</body>
</html>
