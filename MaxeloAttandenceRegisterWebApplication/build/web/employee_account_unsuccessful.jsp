<%-- 
    Document   : employee_account_unsuccessful
    Created on : [Current Date]
    Author     : cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Account Creation Failed</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            body {
                background: linear-gradient(135deg, #fff5f5 0%, #fed7d7 100%);
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }
            
            .container {
                background-color: white;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                padding: 40px;
                text-align: center;
                max-width: 600px;
                width: 100%;
            }
            
            .error-icon {
                font-size: 80px;
                color: #e53e3e;
                margin-bottom: 20px;
            }
            
            h1 {
                color: #c53030;
                margin-bottom: 15px;
                font-weight: 600;
            }
            
            p {
                color: #718096;
                margin-bottom: 25px;
                font-size: 18px;
                line-height: 1.6;
            }
            
            .error-details {
                background-color: #fff5f5;
                border: 1px solid #fed7d7;
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 30px;
                text-align: left;
            }
            
            .error-details h3 {
                color: #c53030;
                margin-bottom: 10px;
                font-size: 16px;
            }
            
            .error-message {
                color: #e53e3e;
                font-weight: 500;
            }
            
            .btn {
                display: inline-block;
                padding: 12px 30px;
                text-decoration: none;
                border-radius: 50px;
                font-weight: 600;
                font-size: 16px;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                margin: 0 10px 10px 10px;
            }
            
            .btn-primary {
                background: linear-gradient(45deg, #2c3e50, #4ca1af);
                color: white;
            }
            
            .btn-primary:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
                background: linear-gradient(45deg, #4ca1af, #2c3e50);
            }
            
            .btn-secondary {
                background: linear-gradient(45deg, #e53e3e, #c53030);
                color: white;
            }
            
            .btn-secondary:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
                background: linear-gradient(45deg, #c53030, #e53e3e);
            }
            
            .button-group {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                margin-top: 20px;
            }
            
            @media (max-width: 768px) {
                .container {
                    padding: 30px 20px;
                }
                
                .error-icon {
                    font-size: 60px;
                }
                
                h1 {
                    font-size: 24px;
                }
                
                p {
                    font-size: 16px;
                }
                
                .button-group {
                    flex-direction: column;
                    align-items: center;
                }
                
                .btn {
                    width: 100%;
                    margin: 5px 0;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="error-icon">
                <i class="fas fa-exclamation-circle"></i>
            </div>
            
            <h1>Employee Account Creation Failed</h1>
            
            <p>We were unable to create the employee account. Please check the details below and try again.</p>
            
            <!-- Display error message if available -->
            <div class="error-details">
                <h3>Error Details:</h3>
                <p class="error-message">
                    <% 
                        String errorMessage = (String) request.getAttribute("errorMessage");
                        if (errorMessage != null) {
                            out.print(errorMessage);
                        } else {
                            out.print("An unknown error occurred during account creation.");
                        }
                    %>
                </p>
            </div>
            
            <div class="button-group">
                <form action="employee_new_add.jsp" >
                    <button type="submit" class="btn btn-secondary">
                        <i class="fas fa-redo"></i> Try Again
                    </button>
                </form>
                
                <form action="admin_login_dashboard.jsp" method="GET">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-tachometer-alt"></i> Return to Dashboard
                    </button>
                </form>
            </div>
            
            <div style="margin-top: 30px; font-size: 14px; color: #718096;">
                <p>If the problem persists, please contact system administration.</p>
            </div>
        </div>
    </body>
</html>