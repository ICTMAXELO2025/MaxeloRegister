<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Reset Successful - MAXELO ATS</title>
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
        }
        
        .header {
            background: linear-gradient(to right, #4b6cb7, #182848);
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
        
        .success-icon {
            width: 80px;
            height: 80px;
            background: #4CAF50;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 25px;
            animation: pulse 1.5s infinite;
        }
        
        .success-icon i {
            color: white;
            font-size: 40px;
        }
        
        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(76, 175, 80, 0.4);
            }
            70% {
                box-shadow: 0 0 0 15px rgba(76, 175, 80, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(76, 175, 80, 0);
            }
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
        }
        
        .btn:hover {
            background: linear-gradient(to right, #5809b5, #1c63d8);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(106, 17, 203, 0.4);
        }
        
        .btn i {
            margin-right: 10px;
        }
        
        .footer {
            margin-top: 30px;
            font-size: 14px;
            color: #95a5a6;
        }
        
        .footer a {
            color: #6a11cb;
            text-decoration: none;
        }
        
        .footer a:hover {
            text-decoration: underline;
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
            <h1>Your Account Portal</h1>
        </div>
        
        <div class="content">
            <div class="success-icon">
                <i class="fas fa-check"></i>
            </div>
            
            <h2>Password Reset Successful!</h2>
            
            <p>
                Your admin password has been successfully reset. You can now log in to your account using your new password.
            </p>
            
            <a href="admin_login.jsp" class="btn">
                <i class="fas fa-sign-in-alt"></i> Back to Login
            </a>
            
            <div class="footer">
                <p>Need help? <a href="#">Contact Support</a></p>
            </div>
        </div>
    </div>

    <script>
        // Add a simple confetti effect for celebration
        document.addEventListener('DOMContentLoaded', function() {
            const colors = ['#6a11cb', '#2575fc', '#4CAF50', '#FFC107'];
            
            function createConfetti() {
                const confetti = document.createElement('div');
                confetti.style.position = 'fixed';
                confetti.style.width = '10px';
                confetti.style.height = '10px';
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.borderRadius = '50%';
                confetti.style.top = '0';
                confetti.style.left = Math.random() * window.innerWidth + 'px';
                confetti.style.opacity = '0.8';
                confetti.style.zIndex = '9999';
                confetti.style.pointerEvents = 'none';
                document.body.appendChild(confetti);
                
                const animation = confetti.animate([
                    { top: '0', transform: 'rotate(0deg)' },
                    { top: window.innerHeight + 'px', transform: 'rotate(720deg)' }
                ], {
                    duration: Math.random() * 3000 + 2000,
                    easing: 'cubic-bezier(0.1, 0.8, 0.1, 1)'
                });
                
                animation.onfinish = function() {
                    confetti.remove();
                };
            }
            
            // Create confetti for a few seconds
            for (let i = 0; i < 50; i++) {
                setTimeout(createConfetti, i * 100);
            }
        });
    </script>
</body>
</html>