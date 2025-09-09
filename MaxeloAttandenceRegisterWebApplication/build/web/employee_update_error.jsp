<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Employee Update Error</title>
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
            margin: 0 10px;
        }
        
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            background: linear-gradient(45deg, #4ca1af, #2c3e50);
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
            
            .btn {
                display: block;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-icon">
            <i class="fas fa-exclamation-circle"></i>
        </div>
        
        <h1>Employee Update Failed</h1>
        
        <p>${errorMessage}</p>
        
        <div>
            <a href="admin_login_dashboard.jsp" class="btn">
                <i class="fas fa-tachometer-alt"></i> Back to Dashboard
            </a>
            <a href="ViewAllEmployeeServlet.do" class="btn">
                <i class="fas fa-users"></i> View All Employees
            </a>
        </div>
    </div>
</body>
</html>