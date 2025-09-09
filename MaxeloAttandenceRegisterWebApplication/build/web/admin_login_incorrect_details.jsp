<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Error - MAXELO ATS</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            overflow: hidden;
            text-align: center;
            animation: shake 0.5s ease-in-out;
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-10px); }
            20%, 40%, 60%, 80% { transform: translateX(10px); }
        }
        
        .header {
            background: linear-gradient(to right, #e74c3c, #c0392b);
            color: white;
            padding: 25px;
        }
        
        .header h1 {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 5px;
        }
        
        .content {
            padding: 40px 30px;
        }
        
        .error-icon {
            width: 80px;
            height: 80px;
            background: #e74c3c;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 25px;
        }
        
        .error-icon i {
            color: white;
            font-size: 40px;
        }
        
        h2 {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: 28px;
        }
        
        p {
            color: #7f8c8d;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
        }
        
        .btn {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: white;
            border: none;
            padding: 14px 30px;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-block;
            box-shadow: 0 4px 15px rgba(106, 17, 203, 0.3);
            margin-bottom: 20px;
        }
        
        .btn:hover {
            background: linear-gradient(to right, #5809b5, #1c63d8);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(106, 17, 203, 0.4);
        }
        
        .btn i {
            margin-right: 10px;
        }
        
        .help-links {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .help-links a {
            color: #6a11cb;
            text-decoration: none;
            font-size: 14px;
            display: block;
            margin-bottom: 10px;
        }
        
        .help-links a:hover {
            text-decoration: underline;
        }
        
        .help-links i {
            margin-right: 8px;
        }
        
        @media (max-width: 480px) {
            .container {
                border-radius: 10px;
            }
            
            .content {
                padding: 30px 20px;
            }
            
            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>MAXELO Admin Portal</h1>
        </div>
        
        <div class="content">
            <div class="error-icon">
                <i class="fas fa-exclamation-triangle"></i>
            </div>
            
            <h2>Login Failed</h2>
            
            <p>
                The username or password you entered is incorrect. Please check your credentials and try again.
            </p>
            
            <a href="admin_login.jsp" class="btn">
                <i class="fas fa-arrow-left"></i> Back to Login
            </a>
            
            <div class="help-links">
                <a href="#">
                    <i class="fas fa-question-circle"></i> Forgot your password?
                </a>
                <a href="#">
                    <i class="fas fa-envelope"></i> Contact support
                </a>
            </div>
        </div>
    </div>

    <script>
        // Add a subtle shake effect to emphasize the error
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.querySelector('.container');
            
            setTimeout(function() {
                container.style.animation = 'none';
            }, 500);
        });
    </script>
</body>
</html>