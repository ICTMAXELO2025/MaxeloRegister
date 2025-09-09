<%-- 
    Document   : admin_account_successful
    Created on : 05 Sep 2025, 10:21:11 PM
    Author     : cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Created Successfully - MAXELO</title>
    <style>
        :root {
            --primary: #3498db;
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
        
        .success-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            padding: 40px;
            text-align: center;
            max-width: 500px;
            width: 100%;
        }
        
        .success-icon {
            width: 100px;
            height: 100px;
            background: rgba(46, 204, 113, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            color: var(--success);
            font-size: 40px;
        }
        
        .success-content h1 {
            color: var(--dark);
            margin-bottom: 15px;
            font-size: 28px;
        }
        
        .success-content p {
            color: var(--gray);
            margin-bottom: 30px;
            font-size: 16px;
            line-height: 1.6;
        }
        
        .next-steps {
            background: #f9f9f9;
            border-radius: 8px;
            padding: 20px;
            margin: 25px 0;
            text-align: left;
        }
        
        .next-steps h3 {
            color : var(--dark);
            margin-bottom: 15px;
            font-size: 18px;
            display: flex;
            align-items: center;
        }
        
        .next-steps h3 i {
            margin-right: 10px;
            color : var(--success);
        }
        
        .next-steps ul {
            list-style: none;
            padding-left: 10px;
        }
        
        .next-steps li {
            margin-bottom: 10px;
            display: flex;
            align-items: flex-start;
        }
        
        .next-steps li i {
            color: var(--success);
            margin-right: 10px;
            margin-top: 4px;
            font-size: 14px;
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
            background: var(--primary);
            color: white;
            border: none;
        }
        
        .btn-primary:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .btn-secondary {
            background: var(--light);
            color: var(--dark);
            border: 1px solid #ddd;
        }
        
        .btn-secondary:hover {
            background: #dde4e6;
        }
        
        /* Responsive Styles */
        @media (max-width: 576px) {
            .success-container {
                padding: 30px 20px;
            }
            
            .success-icon {
                width: 80px;
                height: 80px;
                font-size: 30px;
            }
            
            .success-content h1 {
                font-size: 24px;
            }
            
            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="success-container">
        <div class="success-icon">
            <i class="fas fa-check-circle"></i>
        </div>
        
        <div class="success-content">
            <h1>Admin Account Created Successfully!</h1>
            <p>Your administrator account has been successfully created. You can now access the admin dashboard with your credentials.</p>
            
            <div class="next-steps">
                <h3><i class="fas fa-lightbulb"></i> Next Steps</h3>
                <ul>
                    <li><i class="fas fa-check"></i> Remember to keep your login credentials secure</li>
                    <li><i class="fas fa-check"></i> Set up two-factor authentication for added security</li>
                    <li><i class="fas fa-check"></i> Review your account settings after first login</li>
                </ul>
            </div>
            
            <div class="action-buttons">
                <a href="admin_login.jsp" class="btn btn-primary">
                    <i class="fas fa-sign-in-alt"></i> Proceed to Login
                </a>
                <a href="index.html" class="btn btn-secondary">
                    <i class="fas fa-home"></i> Back to Homepage
                </a>
            </div>
        </div>
    </div>
</body>
</html>