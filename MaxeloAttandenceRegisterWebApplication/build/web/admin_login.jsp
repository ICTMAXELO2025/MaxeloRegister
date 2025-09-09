<%-- 
    Document   : admin_login
    Created on : 05 Sep 2025, 10:25:04 PM
    Author     : cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MAXELO - Admin Portal</title>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --accent: #e74c3c;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --success: #2ecc71;
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
        
        .container {
            display: flex;
            width: 100%;
            max-width: 1000px;
            min-height: 600px;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }
        
        .left-panel {
            flex: 1;
            background : linear-gradient(135deg, var(--secondary) 0%, var(--primary) 100%);
            color: white;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        
        .left-panel::before {
            content: '';
            position: absolute;
            top: -50px;
            left: -50px;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
        }
        
        .left-panel::after {
            content: '';
            position: absolute;
            bottom: -80px;
            right: -80px;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: rgba(255,255,255,0.1);
        }
        
        .logo {
            margin-bottom: 30px;
            position: relative;
            z-index: 1;
        }
        
        .logo h1 {
            font-size: 28px;
            margin-bottom: 5px;
        }
        
        .logo p {
            color: rgba(255,255,255,0.8);
            font-size: 16px;
        }
        
        .features {
            margin-top: 40px;
            position: relative;
            z-index: 1;
        }
        
        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .feature-icon {
            width: 40px;
            height: 40px;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }
        
        .feature-text {
            flex: 1;
        }
        
        .feature-text h4 {
            margin-bottom: 5px;
            font-size: 16px;
        }
        
        .feature-text p {
            font-size: 14px;
            color: rgba(255,255,255,0.8);
        }
        
        .security-note {
            margin-top: 40px;
            padding: 15px;
            background: rgba(255,255,255,0.1);
            border-radius: 8px;
            font-size: 14px;
            position: relative;
            z-index: 1;
        }
        
        .right-panel {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .login-form {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .form-header h2 {
            color : var(--secondary);
            font-size: 24px;
            margin-bottom: 10px;
        }
        
        .form-header p {
            color : var(--gray);
        }
        
        .user-type-selector {
            display: flex;
            background : var(--light);
            border-radius: 8px;
            padding: 5px;
            margin-bottom: 25px;
        }
        
        .user-type-option {
            flex: 1;
            text-align: center;
            padding: 10px;
            cursor: pointer;
            border-radius: 6px;
            transition: all 0.3s;
        }
        
        .user-type-option.active {
            background: white;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }
        
        .user-type-option input {
            display: none;
        }
        
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color : var(--secondary);
            font-weight: 500;
        }
        
        .input-with-icon {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color : var(--gray);
        }
        
        .form-control {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            border-color : var(--primary);
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }
        
        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
        }
        
        .remember-me input {
            margin-right: 8px;
        }
        
        .forgot-password {
            color : var(--primary);
            text-decoration: none;
            font-size: 14px;
        }
        
        .forgot-password:hover {
            text-decoration: underline;
        }
        
        .submit-btn {
            width: 100%;
            padding: 15px;
            background : var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .submit-btn:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .back-to-home {
            text-align: center;
            margin-top: 20px;
        }
        
        .back-to-home a {
            color : var(--gray);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        
        .back-to-home a:hover {
            color : var(--primary);
        }
        
        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                max-width: 100%;
            }
            
            .left-panel {
                display: none;
            }
            
            .right-panel {
                padding: 30px 20px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="left-panel">
            <div class="logo">
                <h1>MAXELO REGISTER PORTAL</h1>
                <p>Secure access to your management dashboard</p>
            </div>
            
            <div class="features">
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <div class="feature-text">
                        <h4>Enterprise Security</h4>
                        <p>Multi-layer protection for your data</p>
                    </div>
                </div>
                
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <div class="feature-text">
                        <h4>Performance Analytics</h4>
                        <p>Monitor and optimize your business</p>
                    </div>
                </div>
                
                <div class="feature-item">
                    <div class="feature-icon">
                        <i class="fas fa-users-cog"></i>
                    </div>
                    <div class="feature-text">
                        <h4>Employee Management</h4>
                        <p>Efficiently manage your workforce</p>
                    </div>
                </div>
            </div>
            
            <div class="security-note">
                <p><i class="fas fa-info-circle"></i> For security reasons, please log out after each session and avoid using public computers.</p>
            </div>
        </div>
        
        <div class="right-panel">
            <div class="login-form">
                <div class="form-header">
                    <h2>Sign In to Your Account</h2>
                    <p>Enter your credentials to continue</p>
                </div>
                
                <form action="AdminLongInServlet.do" method="POST">
                    <div class="user-type-selector">
                        <label class="user-type-option active">
                            <input type="radio" name="check" value="employee" checked> Employee
                        </label>
                        <label class="user-type-option">
                            <input type="radio" name="check" value="admin"> Admin
                        </label>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <div class="input-with-icon">
                            <i class="fas fa-envelope input-icon"></i>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-with-icon">
                            <i class="fas fa-lock input-icon"></i>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                        </div>
                    </div>
                    
                    <div class="remember-forgot">
                        <label class="remember-me">
                            <input type="checkbox"> Remember this device
                        </label>
                        <a href="resest_pasword.jsp" class="forgot-password">Forgot Password?</a>
                    </div>
                    
                    <button type="submit" class="submit-btn">Sign In</button>
                </form>
                
                <div class="back-to-home">
                    <a href="index.html">
                        <i class="fas fa-arrow-left"></i> Back to Homepage
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Add interactivity to user type selector
        document.querySelectorAll('.user-type-option').forEach(option => {
            option.addEventListener('click', function() {
                document.querySelectorAll('.user-type-option').forEach(opt => {
                    opt.classList.remove('active');
                });
                this.classList.add('active');
                this.querySelector('input').checked = true;
            });
        });
    </script>
</body>
</html>