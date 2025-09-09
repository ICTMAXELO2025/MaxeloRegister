<%-- 
    Document   : admin_profile_updated
    Created on : [Current Date]
    Author     : cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Updated Successfully</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            body {
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
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
            
            .success-icon {
                font-size: 80px;
                color: #4CAF50;
                margin-bottom: 20px;
            }
            
            h1 {
                color: #2c3e50;
                margin-bottom: 15px;
                font-weight: 600;
            }
            
            p {
                color: #7f8c8d;
                margin-bottom: 30px;
                font-size: 18px;
                line-height: 1.6;
            }
            
            .btn {
                display: inline-block;
                background: linear-gradient(45deg, #2c3e50, #4ca1af);
                color: white;
                padding: 12px 30px;
                text-decoration: none;
                border-radius: 50px;
                font-weight: 600;
                font-size: 16px;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }
            
            .btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
                background: linear-gradient(45deg, #4ca1af, #2c3e50);
            }
            
            .additional-info {
                margin-top: 30px;
                padding: 15px;
                background-color: #f8f9fa;
                border-radius: 10px;
                text-align: left;
            }
            
            .additional-info h3 {
                color: #2c3e50;
                margin-bottom: 10px;
            }
            
            .additional-info p {
                font-size: 14px;
                margin-bottom: 0;
                color: #6c757d;
            }
            
            @media (max-width: 768px) {
                .container {
                    padding: 30px 20px;
                }
                
                .success-icon {
                    font-size: 60px;
                }
                
                h1 {
                    font-size: 24px;
                }
                
                p {
                    font-size: 16px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="success-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            
            <h1>Profile Updated Successfully!</h1>
            
            <p>Your administrator profile has been updated successfully. All changes have been saved to the database.</p>
            
            <form action="admin_login_dashboard.jsp" method="GET">
                <button type="submit" class="btn">
                    <i class="fas fa-tachometer-alt"></i> Back to Dashboard
                </button>
            </form>
            
            <div class="additional-info">
                <h3>What's next?</h3>
                <p>You can continue managing your account settings or explore other administrative functions from the dashboard.</p>
            </div>
        </div>
        
        <!-- Font Awesome for icons -->
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </body>
</html>