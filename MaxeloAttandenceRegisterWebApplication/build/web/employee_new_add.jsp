<%-- 
    Document   : employee_new_add
    Created on : 06 Sep 2025, 11:47:19 AM
    Author     : cash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Employee - MAXELO</title>
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

            .container {
                background: white;
                border-radius: 12px;
                box-shadow: 0 15px 30px rgba(0,0,0,0.2);
                width: 100%;
                max-width: 800px;
                overflow: hidden;
            }

            .header {
                background: var(--secondary);
                color: white;
                padding: 25px 30px;
                text-align: center;
            }

            .header h1 {
                font-size: 24px;
                margin-bottom: 5px;
            }

            .header p {
                opacity: 0.8;
            }

            .form-container {
                padding: 30px;
            }

            .form-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 20px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                color: var(--dark);
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
                color: var(--gray);
            }

            .form-control {
                width: 100%;
                padding: 12px 15px 12px 45px;
                border: 1px solid #ddd;
                border-radius: 6px;
                font-size: 16px;
                transition: all 0.3s;
            }

            .form-control:focus {
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
                outline: none;
            }

            select.form-control {
                padding-left: 15px;
                appearance: none;
                background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
                background-repeat: no-repeat;
                background-position: right 15px center;
                background-size: 16px;
            }

            .password-match {
                margin-top: 5px;
                font-size: 14px;
                display: none;
            }

            .password-match.valid {
                color: var(--success);
                display: block;
            }

            .password-match.invalid {
                color: var(--danger);
                display: block;
            }

            .form-actions {
                margin-top: 30px;
                text-align: center;
            }

            .submit-btn {
                background: var(--primary);
                color: white;
                border: none;
                padding: 15px 30px;
                border-radius: 6px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                display: inline-flex;
                align-items: center;
                gap: 10px;
            }

            .submit-btn:hover {
                background: #2980b9;
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            .submit-btn:disabled {
                background: var(--gray);
                cursor: not-allowed;
                transform: none;
                box-shadow: none;
            }

            /* Responsive Styles */
            @media (max-width: 768px) {
                .form-grid {
                    grid-template-columns: 1fr;
                }

                .container {
                    margin: 20px;
                }
            }

            @media (max-width: 576px) {
                .form-container {
                    padding: 20px;
                }

                .header {
                    padding: 20px;
                }
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Add New Employee</h1>
                <p>Provide the details of the new employee</p>
            </div>

            <div class="form-container">
                <form action="AddNewEmployeeServlet.do" method="POST" id="employeeForm">
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="names">First Name</label>
                            <div class="input-with-icon">
                                <i class="fas fa-user input-icon"></i>
                                <input type="text" id="names" name="names" class="form-control" placeholder="Enter first name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="surname">Last Name</label>
                            <div class="input-with-icon">
                                <i class="fas fa-user input-icon"></i>
                                <input type="text" id="surname" name="surname" class="form-control" placeholder="Enter last name" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="phone_number">Phone Number</label>
                            <div class="input-with-icon">
                                <i class="fas fa-phone input-icon"></i>
                                <input type="tel" id="phone_number" name="phone_number" class="form-control" placeholder="Enter phone number">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <div class="input-with-icon">
                                <i class="fas fa-envelope input-icon"></i>
                                <input type="email" id="email" name="email" class="form-control" placeholder="Enter email address" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="role">Role</label>
                            <div class="input-with-icon">
                                <i class="fas fa-user-tag input-icon"></i>
                                <select id="role" name="role" class="form-control" required>
                                    <option value="">Select a role</option>
                                    <option value="admin">Admin</option>
                                    <option value="hr">HR</option>
                                    <option value="employee">Employee</option>
                                    <option value="intern">Intern</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="position">Position</label>
                            <div class="input-with-icon">
                                <i class="fas fa-briefcase input-icon"></i>
                                <input type="text" id="position" name="position" class="form-control" placeholder="Enter position">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <div class="input-with-icon">
                                <i class="fas fa-lock input-icon"></i>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Create password" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <div class="input-with-icon">
                                <i class="fas fa-lock input-icon"></i>
                                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm password" required>
                            </div>
                            <div id="passwordMatchMessage" class="password-match"></div>
                        </div>
                    </div>
                    
                     <div class="form-actions">
                          <a href="admin_login_dashboard.jsp" class="btn btn-secondary">
                              <button  id="submitBtn" class="submit-btn" style="text-decoration: #ffffff">
                            <i class="fas fa-arrow-left"></i> Back to Dashboard
                          </a>
                        </button>
                    </div>

                   

                    <div class="form-actions">
                        <button type="submit" id="submitBtn" class="submit-btn">
                            <i class="fas fa-user-plus"></i> ADD NEW EMPLOYEE
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Password matching validation
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmPassword');
            const passwordMatchMessage = document.getElementById('passwordMatchMessage');
            const submitBtn = document.getElementById('submitBtn');
            const form = document.getElementById('employeeForm');

            function validatePassword() {
                if (password.value !== confirmPassword.value) {
                    passwordMatchMessage.textContent = 'Passwords do not match';
                    passwordMatchMessage.classList.remove('valid');
                    passwordMatchMessage.classList.add('invalid');
                    submitBtn.disabled = true;
                    return false;
                } else {
                    passwordMatchMessage.textContent = 'Passwords match';
                    passwordMatchMessage.classList.remove('invalid');
                    passwordMatchMessage.classList.add('valid');
                    submitBtn.disabled = false;
                    return true;
                }
            }

            confirmPassword.addEventListener('input', validatePassword);
            password.addEventListener('input', validatePassword);

            // Form submission validation
            form.addEventListener('submit', function (e) {
                if (!validatePassword()) {
                    e.preventDefault();
                    alert('Please make sure your passwords match');
                }
            });
        </script>
    </body>
</html>