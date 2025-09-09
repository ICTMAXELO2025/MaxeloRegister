<%-- 
    Document   : employee_account_successful
    Created on : [Current Date]
    Author     : cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Account Created Successfully</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            
            .employee-details {
                margin-top: 30px;
                padding: 15px;
                background-color: #f8f9fa;
                border-radius: 10px;
                text-align: left;
            }
            
            .employee-details h3 {
                color: #2c3e50;
                margin-bottom: 10px;
                border-bottom: 1px solid #ddd;
                padding-bottom: 5px;
            }
            
            .detail-row {
                display: flex;
                margin-bottom: 8px;
            }
            
            .detail-label {
                font-weight: 600;
                color: #2c3e50;
                width: 120px;
            }
            
            .detail-value {
                color: #6c757d;
                flex: 1;
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
                
                .detail-row {
                    flex-direction: column;
                    margin-bottom: 15px;
                }
                
                .detail-label {
                    width: 100%;
                    margin-bottom: 3px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="success-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            
            <h1>Employee Account Created Successfully!</h1>
            
            <p>The new employee account has been created and added to the system. The employee can now log in using their credentials.</p>
            
            <!-- Display employee details if available in request -->
            <% if (request.getAttribute("successMessage") != null) { %>
                <div class="employee-details">
                    <h3>Account Details</h3>
                    <div class="detail-row">
                        <span class="detail-label">Name:</span>
                        <span class="detail-value">${param.names} ${param.surname}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Email:</span>
                        <span class="detail-value">${param.email}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Position:</span>
                        <span class="detail-value">${param.position}</span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Role:</span>
                        <span class="detail-value">${param.role}</span>
                    </div>
                </div>
            <% } %>
            
            <div style="margin-top: 30px;">
                <form action="admin_login_dashboard.jsp" method="GET">
                    <button type="submit" class="btn">
                        <i class="fas fa-tachometer-alt"></i> Return to Dashboard
                    </button>
                </form>
            </div>
            
            <div style="margin-top: 20px;">
                <p>Need to add another employee? 
                    <a href="add_employee.jsp" style="color: #4ca1af; text-decoration: none;">
                        <i class="fas fa-plus-circle"></i> Add Another Employee
                    </a>
                </p>
            </div>
        </div>
    </body>
</html>