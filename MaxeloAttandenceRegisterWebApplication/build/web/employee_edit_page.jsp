<%@page import="co.za.maxelo.bl.MaxeloClientTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Employee</title>
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
            max-width: 800px;
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
        
        .edit-form {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .form-title {
            color: #2c3e50;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #4ca1af;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c3e50;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: border 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #4ca1af;
            outline: none;
            box-shadow: 0 0 0 3px rgba(76, 161, 175, 0.1);
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
        
        .btn-secondary {
            background: linear-gradient(45deg, #6c757d, #adb5bd);
            color: white;
        }
        
        .btn-secondary:hover {
            background: linear-gradient(45deg, #adb5bd, #6c757d);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            justify-content: flex-end;
        }
        
        .readonly-field {
            background-color: #f8f9fa;
            color: #6c757d;
        }
        
        .employee-id {
            font-size: 14px;
            color: #6c757d;
            margin-top: 5px;
        }
        
        @media (max-width: 768px) {
            .form-actions {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo-container">
                <div class="logo">
                    <i class="fas fa-user-edit"></i>
                </div>
                <div class="logo-text">Edit Employee</div>
            </div>
            <a href="admin_login_dashboard.jsp" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </header>
        
        <div class="edit-form">
            <h2 class="form-title">Employee Details</h2>
            
            <%
                MaxeloClientTable employee = (MaxeloClientTable) request.getAttribute("employee");
                if (employee != null) {
            %>
            <form action="UpdateEmployeeServlet.do" method="POST">
                <input type="hidden" name="id" value="<%= employee.getId() %>">
                
                <div class="form-group">
                    <label for="employeeId">Employee ID</label>
                    <input type="text" class="form-control readonly-field" value="<%= employee.getId() %>" readonly>
                    <div class="employee-id">This ID cannot be changed</div>
                </div>
                
                <div class="form-group">
                    <label for="names">First Name *</label>
                    <input type="text" class="form-control" id="names" name="names" value="<%= employee.getNames() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="surname">Last Name *</label>
                    <input type="text" class="form-control" id="surname" name="surname" value="<%= employee.getSurname() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address *</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= employee.getEmail() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" value="<%= employee.getPhoneNumber() != null ? employee.getPhoneNumber() : "" %>">
                </div>
                
                <div class="form-group">
                    <label for="role">Role</label>
                    <select class="form-control" id="role" name="role">
                        <option value="admin" <%= "admin".equals(employee.getRole()) ? "selected" : "" %>>Admin</option>
                        <option value="manager" <%= "manager".equals(employee.getRole()) ? "selected" : "" %>>Manager</option>
                        <option value="employee" <%= "employee".equals(employee.getRole()) ? "selected" : "" %>>Employee</option>
                        <option value="intern" <%= "intern".equals(employee.getRole()) ? "selected" : "" %>>Intern</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="position">Position</label>
                    <input type="text" class="form-control" id="position" name="position" value="<%= employee.getPosition() != null ? employee.getPosition() : "" %>">
                </div>
                
                <div class="form-actions">
                    <a href="ViewAllEmployeeServlet.do" class="btn btn-secondary">
                        <i class="fas fa-times"></i> Cancel
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Update Employee
                    </button>
                </div>
            </form>
            <%
                } else {
            %>
            <div style="text-align: center; padding: 30px; color: #6c757d;">
                <i class="fas fa-exclamation-triangle" style="font-size: 48px; margin-bottom: 15px;"></i>
                <h3>Employee Not Found</h3>
                <p>The employee you are trying to edit does not exist or could not be loaded.</p>
                <a href="ViewAllEmployeeServlet.do" class="btn btn-primary" style="margin-top: 20px;">
                    <i class="fas fa-users"></i> View All Employees
                </a>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <script>
        // Basic form validation
        document.querySelector('form').addEventListener('submit', function(e) {
            const names = document.getElementById('names').value.trim();
            const surname = document.getElementById('surname').value.trim();
            const email = document.getElementById('email').value.trim();
            
            if (!names || !surname || !email) {
                e.preventDefault();
                alert('Please fill in all required fields (marked with *).');
                return false;
            }
            
            // Email validation
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                e.preventDefault();
                alert('Please enter a valid email address.');
                return false;
            }
        });
    </script>
</body>
</html>