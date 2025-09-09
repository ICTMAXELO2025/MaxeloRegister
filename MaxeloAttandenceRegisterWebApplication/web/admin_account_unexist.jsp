<%-- 
    Document   : admin_accouct_unexist
    Created on : 05 Sep 2025, 11:18:28 PM
    Author     : cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Not Found - MAXELO</title>
    <style>
        :root {
            --primary: #3498db ;
            --secondary: #2c3e50;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --success: #2ecc71;
            --warning: #f39c12;
            --danger: #e74c3c;
            --gray: #95a5a6;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .error-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            padding: 40px;
            text-align: center;
            max-width: 500px;
            width: 100%;
        }
        
        .error-icon {
            width: 100px;
            height: 100px;
            background: rgba(231, 76, 60, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            color : var(--danger);
            font-size: 40px;
        }
        
        .error-content h1 {
            color : var(--dark);
            margin-bottom: 15px;
            font-size: 28px;
        }
        
        .error-content p {
            color : var(--gray);
            margin-bottom: 30px;
            font-size: 16px;
            line-height: 1.6;
        }
        
        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .btn {
            padding: 15px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .btn-primary {
            background: var(#3498db);
            color: white;
            border: none;
        }
        
        .btn-primary:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .btn-secondary {
            background : var(--light);
            color : var(--dark);
            border: 1px solid #ddd;
        }
        
        .btn-secondary:hover {
            background: #dde4e6;
        }
        
        .help-links {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .help-links a {
            color : var(--primary);
            text-decoration: none;
            font-size: 14px;
            display: inline-block;
            margin: 0 10px;
        }
        
        .help-links a:hover {
            text-decoration: underline;
        }
        
        /* Responsive Styles */
        @media (max-width: 576px) {
            .error-container {
                padding: 30px 20px;
            }
            
            .error-icon {
                width: 80px;
                height: 80px;
                font-size: 30px;
            }
            
            .error-content h1 {
                font-size: 24px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="error-container">
        <div class="error-icon">
            <i class="fas fa-exclamation-triangle"></i>
        </div>
        
        <div class="error-content">
            <h1>Admin Account Not Found</h1>
            <p>The administrator account you're trying to access doesn't exist in our system. Please check your details or contact your system administrator for assistance.</p>
            
            <div class="action-buttons">
                <a href="admin_login.jsp" class="btn btn-primary">
                    <i class="fas fa-arrow-left"></i> Back to Login
                </a>
                <a href="index.html" class="btn btn-secondary">
                    <i class="fas fa-home"></i> Back to Homepage
                </a>
            </div>
            
            <div class="help-links">
                <a href="resest_pasword.jsp">
                    <i class="fas fa-key"></i> Forgot Password?
                </a>
                <a href="#">
                    <i class="fas fa-headset"></i> Contact Support
                </a>
            </div>
        </div>
    </div>
</body>
</html>