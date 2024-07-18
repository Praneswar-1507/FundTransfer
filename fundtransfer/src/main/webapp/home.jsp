<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FundTransfer</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="index.css">
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>

    <style>
        @import url("https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap");

        :root{
            --first-color: #12192C;
            --text-color: #8590AD;
            --body-font: 'Roboto', sans-serif;
            --big-font-size: 2rem;
            --normal-font-size: 0.938rem;
            --smaller-font-size: 0.875rem;
        }

        @media screen and (min-width: 768px){
            :root{
                --big-font-size: 2.5rem;
                --normal-font-size: 1rem;
            }  
        }

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #FFFFFF;
            font-family: var(--body-font);
            color: var(--first-color);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .navbar {
            background-color: white;
            color: #fff;
            padding: 1em;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            z-index: 1000;
        }

        .logo {
            font-size: 1.5em;
            text-decoration: none;
            color: #fff;
            display: flex;
            align-items: center;
        }

        .logo img {
            width: 150px;
            height: auto;
            margin-right: 10px;
        }

        .nav-items {
            list-style-type: none;
            display: flex;
            align-items: center;
        }

        .nav-items li {
            margin-right: 20px;
            position: relative;
        }

        .nav-items li a {
            text-decoration: none;
            color: #000;
            padding: 1em;
            position: relative;
            display: inline-block;
            transition: color 0.3s ease; 
        }

        .nav-items li a:hover {
            color: #0000ff; 
        }

        .login-btn {
            background-color: #0000ff;
            color: #fff;
            border: none;
            padding: 0.5em 1em;
            font-size: 1em;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .login-btn:hover {
            background-color: #23527c;
        }

        main {
            flex: 1;
            padding: 2em;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 60px;
        }

        .left-content, .right-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .intro {
            text-align: center;
        }

       .intro h1 {
    font-size: 4rem;
    margin-bottom: 10px; /* Adjust the margin-bottom as per your preference */
    margin-top: 0; /* Reset top margin to ensure consistent spacing */
}
       .intro p {
    font-size: 1.3em;
    margin-bottom: 1.3em;
    margin-top: 30px; /* Adjust the margin-top as per your preference */
}

        .intro button {
            background-color: #1976D2;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .intro button:hover {
            background-color: #23527c;
        }

        footer {
            background-color: white;
            color: #fff;
            padding: 0.5em;
            margin-top: auto;
            width: 100%;
            position: fixed;
            bottom: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between; 
            align-items: center; 
        }

        .footer-content {
            text-align: center;
            flex-grow: 1; 
        }

        .social-media {
            display: flex;
            justify-content: center;
            align-items: center; 
        }

        .social-media a {
            color: #fff;
            margin: 0 10px;
        }

        .social-media i {
            font-size: 1.5em;
        }

        .form__img {
            max-width: 100%;
            height:450px;
            margin-bottom: 40px;
        }
    </style>
</head>
<body>
    <% 
    if(session == null){
        response.sendRedirect("login.jsp");
    }
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setHeader("Expires", "0");
    %> 

    <nav class="navbar">
        <a href="#" class="logo"><img src="images/fastpay.png" alt="FastPay Logo"></a>
        <ul class="nav-items">
            <% if (session.getAttribute("id") != null) { %>
                <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="#"><i class="fas fa-info-circle"></i> About</a></li>
                <li><a href="#"><i class="fas fa-envelope"></i> Contact</a></li>
                <li>
                    <form action="userprofile" method="post">
                        <input type="hidden" name="action" value="login2">
                        <input type="hidden" value="<%=session.getAttribute("id")%>" name="id"> 
                        <button type="submit" class="login-btn"><%=session.getAttribute("username")%></button>
                    </form>
                </li>
                <li>
                    <form action="logout" method="post">
                        <button type="submit" class="login-btn"><i class="fas fa-sign-out-alt"></i> Logout</button>
                    </form>
                </li>
            <% } else { %>
                <li><a href="#"><i class="fa-solid fa-house"></i>Home</a></li>
                <li><a href="#"><i class="fas fa-info-circle"></i> About</a></li>
                <li><a href="#"><i class="fas fa-envelope"></i> Contact</a></li>
                <li>
                    <form action="login.jsp" method="post">
                        <button type="submit" class="login-btn">Login</button>
                    </form>
                </li>
            <% } %>
        </ul>
    </nav>

    <main>
        <div class="left-content">
            <div class="intro">
                <h1>Welcome
                       To
                     Fastpay</h1>  
                <p>Your trusted platform for secure money transfers.</p>
                <% if (session.getAttribute("id") != null) { %>
                    <form action="bankAccount.jsp" method="post">
                        <input type="hidden" name="login" value="createAccount">
                        <button type="submit">Create Account</button>
                    </form>
                <% } %>
            </div>
        </div>
        <div class="right-content">
            <img src="images/login.jpg" alt="login" class="form__img">
        </div>
    </main>

    <footer>
        <div class="footer-content">
            <p>© 2024 Fastpay. All rights reserved.</p>
            <div class="social-media">
                <a href="https://www.google.com/search?q=icon+facebook+logo"><i class="fab fa-facebook"></i></a>
                <a href="https://www.google.com/search?q=instagram+logo"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-linkedin"></i></a>
            </div>
        </div>
    </footer>
</body>
</html>
