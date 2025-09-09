<%-- 
    Document   : z_employee_login_dashboard
    Created on : 07 Sep 2025, 2:27:06 AM
    Author     : cash
--%>

<%@page import="co.za.maxelo.bl.MaxeloClientTable"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Dashboard - MATS</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            
            body {
                background-color: #f5f7fa;
                color: #333;
                line-height: 1.6;
            }
            
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            
            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
                padding: 20px;
                background: linear-gradient(135deg, #2c3e50 0%, #4ca1af 100%);
                color: white;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }
            
            .logo-container {
                display: flex;
                align-items: center;
            }
            
            .logo {
                width: 60px;
                height: 60px;
                background: white;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 15px;
            }
            
            .logo i {
                font-size: 28px;
                background: linear-gradient(135deg, #2c3e50 0%, #4ca1af 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }
            
            .logo-text {
                font-weight: 700;
                font-size: 24px;
            }
            
            .welcome-section {
                text-align: center;
                margin-bottom: 30px;
            }
            
            .welcome-section h1 {
                color: #2c3e50;
                margin-bottom: 10px;
            }
            
            .welcome-section p {
                color: #7f8c8d;
                font-size: 18px;
            }
            
            .dashboard-content {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 30px;
            }
            
            .employee-details {
                background-color: white;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }
            
            .employee-details h2 {
                color: #2c3e50;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #4ca1af;
            }
            
            .detail-row {
                display: flex;
                margin-bottom: 15px;
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
            
            .attendance-section {
                background-color: white;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }
            
            .attendance-section h2 {
                color: #2c3e50;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #4ca1af;
            }
            
            .attendance-form {
                margin-bottom: 20px;
            }
            
            .form-group {
                margin-bottom: 15px;
            }
            
            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: 600;
                color: #2c3e50;
            }
            
            textarea {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #ddd;
                border-radius: 8px;
                font-size: 16px;
                resize: vertical;
                min-height: 100px;
            }
            
            .radio-group {
                display: flex;
                gap: 20px;
                margin-bottom: 15px;
            }
            
            .radio-option {
                display: flex;
                align-items: center;
                gap: 8px;
            }
            
            .btn {
                padding: 12px 25px;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
            }
            
            .btn-primary {
                background: linear-gradient(45deg, #2c3e50, #4ca1af);
                color: white;
            }
            
            .btn-primary:hover {
                background: linear-gradient(45deg, #4ca1af, #2c3e50);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            
            .btn-success {
                background: linear-gradient(45deg, #28a745, #20c997);
                color: white;
            }
            
            .btn-success:hover {
                background: linear-gradient(45deg, #20c997, #28a745);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            
            .btn-danger {
                background: linear-gradient(45deg, #dc3545, #e4606d);
                color: white;
            }
            
            .btn-danger:hover {
                background: linear-gradient(45deg, #e4606d, #dc3545);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
            
            .btn-disabled {
                background: linear-gradient(45deg, #6c757d, #adb5bd);
                color: white;
                cursor: not-allowed;
                opacity: 0.6;
            }
            
            .attendance-status {
                margin-top: 20px;
                padding: 15px;
                border-radius: 8px;
                background-color: #f8f9fa;
            }
            
            .status-title {
                font-weight: 600;
                color: #2c3e50;
                margin-bottom: 10px;
            }
            
            .status-item {
                display: flex;
                justify-content: space-between;
                margin-bottom: 8px;
                padding-bottom: 8px;
                border-bottom: 1px solid #eee;
            }
            
            .status-label {
                font-weight: 600;
                color: #6c757d;
            }
            
            .status-value {
                color: #2c3e50;
            }
            
            footer {
                text-align: center;
                margin-top: 40px;
                padding: 20px;
                color: #6c757d;
            }
            
            .message {
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 5px;
                text-align: center;
            }
            
            .success-message {
                background-color: #d4edda;
                color: #155724;
            }
            
            .error-message {
                background-color: #f8d7da;
                color: #721c24;
            }
            
            @media (max-width: 900px) {
                .dashboard-content {
                    grid-template-columns: 1fr;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <!-- Message Display -->
            <%
                String successMessage = (String) session.getAttribute("successMessage");
                String errorMessage = (String) session.getAttribute("errorMessage");

                if (successMessage != null) {
                    session.removeAttribute("successMessage");
            %>
            <div class="message success-message">
                <i class="fas fa-check-circle"></i> <%= successMessage%>
            </div>
            <%
                }

                if (errorMessage != null) {
                    session.removeAttribute("errorMessage");
            %>
            <div class="message error-message">
                <i class="fas fa-exclamation-circle"></i> <%= errorMessage%>
            </div>
            <%
                }
            %>
            
            <header>
                <div class="logo-container">
                    <div class="logo">
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="logo-text">MATS System</div>
                </div>
                <a href="Logout.do" class="btn btn-danger">
                    <i class="fas fa-sign-out-alt"></i> LOGOUT
                </a>
            </header>

            <div class="welcome-section">
                <h1>EMPLOYEE DASHBOARD</h1>
                <p>Welcome to your attendance portal</p>
            </div>

            <div class="dashboard-content">
                <div class="employee-details">
                    <h2>Employee Details</h2>
                    <%
                        MaxeloClientTable user = (MaxeloClientTable) session.getAttribute("user");
                        if (user != null) {
                    %>
                    <div class="detail-row">
                        <div class="detail-label">ID:</div>
                        <div class="detail-value"><%= user.getId()%></div>
                    </div>
                    <div class="detail-row">
                        <div class="detail-label">Name:</div>
                        <div class="detail-value"><%= user.getNames()%></div>
                    </div>
                    <div class="detail-row">
                        <div class="detail-label">Surname:</div>
                        <div class="detail-value"><%= user.getSurname()%></div>
                    </div>
                    <div class="detail-row">
                        <div class="detail-label">Phone:</div>
                        <div class="detail-value"><%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "N/A"%></div>
                    </div>
                    <div class="detail-row">
                        <div class="detail-label">Role:</div>
                        <div class="detail-value"><%= user.getRole() != null ? user.getRole() : "N/A"%></div>
                    </div>
                    <div class="detail-row">
                        <div class="detail-label">Position:</div>
                        <div class="detail-value"><%= user.getPosition() != null ? user.getPosition() : "N/A"%></div>
                    </div>
                    <div class="detail-row">
                        <div class="detail-label">Email:</div>
                        <div class="detail-value"><%= user.getEmail()%></div>
                    </div>
                    <%
                        }
                    %>
                </div>

                <div class="attendance-section">
                    <h2>Attendance Registration</h2>
                    
                    <%
                        // Get current date and time
                        LocalDateTime now = LocalDateTime.now();
                        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
                        
                        // Get attendance status from session
                        String clockInTime = (String) session.getAttribute("clockInTime");
                        String clockOutTime = (String) session.getAttribute("clockOutTime");
                        String attendanceType = (String) session.getAttribute("attendanceType");
                        Boolean hasClockedInToday = (Boolean) session.getAttribute("hasClockedInToday");
                        Boolean hasClockedOutToday = (Boolean) session.getAttribute("hasClockedOutToday");
                        
                        if (hasClockedInToday == null) hasClockedInToday = false;
                        if (hasClockedOutToday == null) hasClockedOutToday = false;
                    %>

                    <!-- Clock In Form -->
                    <form action="ClockInServlet.do" method="POST" class="attendance-form" 
                          <%= hasClockedInToday ? "style='display: none;'" : "" %>>
                        <div class="form-group">
                            <label>Attendance Type *</label>
                            <div class="radio-group">
                                <div class="radio-option">
                                    <input type="radio" id="remote" name="attendanceType" value="Remote" required>
                                    <label for="remote">Remote</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" id="office" name="attendanceType" value="Office" required>
                                    <label for="office">Office</label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label for="notes">Notes (Optional)</label>
                            <textarea id="notes" name="notes" placeholder="Provide any additional notes or reason for being late..."></textarea>
                        </div>
                        
                        <button type="submit" class="btn btn-success" id="clockInBtn">
                            <i class="fas fa-sign-in-alt"></i> CLOCK IN
                        </button>
                    </form>

                    <!-- Clock Out Form -->
                    <form action="ClockOutServlet.do" method="POST" class="attendance-form" 
                          <%= (hasClockedInToday && !hasClockedOutToday) ? "" : "style='display: none;'" %>>
                        <button type="submit" class="btn btn-primary" id="clockOutBtn">
                            <i class="fas fa-sign-out-alt"></i> CLOCK OUT
                        </button>
                    </form>
                    
                    <!-- Already Clocked Out Message -->
                    <div class="attendance-form" <%= hasClockedOutToday ? "" : "style='display: none;'" %>>
                        <div class="message success-message">
                            <i class="fas fa-check-circle"></i> You have completed your attendance for today.
                        </div>
                    </div>

                    <!-- Current Status -->
                    <div class="attendance-status">
                        <div class="status-title">Today's Status</div>
                        <div class="status-item">
                            <span class="status-label">Date:</span>
                            <span class="status-value"><%= now.format(dateFormatter)%></span>
                        </div>
                        <div class="status-item">
                            <span class="status-label">Clock In:</span>
                            <span class="status-value"><%= clockInTime != null ? clockInTime : "Not recorded"%></span>
                        </div>
                        <div class="status-item">
                            <span class="status-label">Clock Out:</span>
                            <span class="status-value"><%= clockOutTime != null ? clockOutTime : "Not recorded"%></span>
                        </div>
                        <div class="status-item">
                            <span class="status-label">Type:</span>
                            <span class="status-value"><%= attendanceType != null ? attendanceType : "Not specified"%></span>
                        </div>
                    </div>
                </div>
            </div>

            <footer>
                <p>&copy; 2025 MATS Employee Attendance System. All rights reserved.</p>
            </footer>
        </div>

        <script>
            // Simple form validation and feedback
            document.addEventListener('DOMContentLoaded', function () {
                const clockInForm = document.querySelector('form[action="ClockInServlet.do"]');
                const clockOutForm = document.querySelector('form[action="ClockOutServlet.do"]');
                
                // Add event listener to clock in form
                if (clockInForm) {
                    clockInForm.addEventListener('submit', function (e) {
                        const attendanceType = document.querySelector('input[name="attendanceType"]:checked');
                        if (!attendanceType) {
                            e.preventDefault();
                            alert('Please select an attendance type (Remote or Office)');
                            return false;
                        }

                        // Show loading feedback
                        const submitBtn = this.querySelector('button[type="submit"]');
                        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> PROCESSING...';
                        submitBtn.disabled = true;
                    });
                }
                
                // Add event listener to clock out form
                if (clockOutForm) {
                    clockOutForm.addEventListener('submit', function (e) {
                        // Show loading feedback
                        const submitBtn = this.querySelector('button[type="submit"]');
                        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> PROCESSING...';
                        submitBtn.disabled = true;
                    });
                }
            });
        </script>
    </body>
</html>