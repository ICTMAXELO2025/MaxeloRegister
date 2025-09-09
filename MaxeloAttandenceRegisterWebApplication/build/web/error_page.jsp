<%-- 
    Document   : error_page
    Created on : [Current Date]
    Author     : cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
                background-color: #f8f9fa;
            }
            .error-container {
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                text-align: center;
            }
            .error-message {
                color: #dc3545;
                margin: 20px 0;
            }
            .home-link {
                display: inline-block;
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div class="error-container">
            <h1>Error</h1>
            <div class="error-message">
                ${errorMessage}
            </div>
            <a href="admin_login_dashboard.jsp" class="home-link">Return to Dashboard</a>
        </div>
    </body>
</html>