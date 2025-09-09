<%-- 
    Document   : admin_login_dashboard
    Created on : 06 Sep 2025, 12:12:04 AM
    Author     : cash
--%>

<%@page import="co.za.maxelo.bl.MaxeloClientTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MATS Admin Dashboard</title>
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
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
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background: var(--primary);
            color: white;
            padding: 20px 0;
            transition: all 0.3s;
        }
        
        .logo-container {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 20px;
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
        }
        
        .logo i {
            margin-right: 10px;
            color: var(--secondary);
        }
        
        .sidebar-menu {
            list-style: none;
        }
        
        .sidebar-menu li {
            margin-bottom: 5px;
        }
        
        .sidebar-menu a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            display: block;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }
        
        .sidebar-menu a:hover, .sidebar-menu a.active {
            background: rgba(255,255,255,0.1);
            border-left: 3px solid var(--secondary);
        }
        
        .sidebar-menu i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 20px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .welcome-text h1 {
            font-size: 24px;
            color: var(--dark);
            margin-bottom: 5px;
        }
        
        .welcome-text p {
            color: var(--gray);
        }
        
        .logout-btn {
            background: var(--danger);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background 0.3s;
        }
        
        .logout-btn:hover {
            background: #c0392b;
        }
        
        /* Dashboard Cards */
        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            font-size: 20px;
        }
        
        .bg-primary { background: rgba(52, 152, 219, 0.2); color: var(--secondary); }
        .bg-success { background: rgba(46, 204, 113, 0.2); color: var(--success); }
        .bg-warning { background: rgba(243, 156, 18, 0.2); color: var(--warning); }
        
        .card h3 {
            font-size: 24px;
            margin-bottom: 5px;
        }
        
        .card p {
            color: var(--gray);
            font-size: 14px;
        }
        
        /* Action Cards */
        .action-cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        
        .action-card {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 25px;
            text-align: center;
            transition: all 0.3s;
        }
        
        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .action-icon {
            font-size: 40px;
            margin-bottom: 15px;
            color: var(--secondary);
        }
        
        .action-card h3 {
            margin-bottom: 10px;
            color: var(--dark);
        }
        
        .action-card p {
            color: var(--gray);
            margin-bottom: 20px;
            font-size: 14px;
        }
        
        .action-btn {
            background: var(--secondary);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background 0.3s;
            width: 100%;
        }
        
        .action-btn:hover {
            background: #2980b9;
        }
        
        /* Profile Section */
        .profile-section {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            padding: 25px;
            margin-top: 30px;
        }
        
        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .profile-header h2 {
            color: var(--dark);
        }
        
        .edit-btn {
            background: var(--secondary);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background 0.3s;
        }
        
        .edit-btn:hover {
            background: #2980b9;
        }
        
        .profile-details {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        
        .detail-item {
            margin-bottom: 15px;
        }
        
        .detail-label {
            font-size: 12px;
            color: var(--gray);
            margin-bottom: 5px;
        }
        
        .detail-value {
            font-size: 16px;
            color: var(--dark);
            font-weight: 500;
        }
        
        /* Responsive Styles */
        @media (max-width: 992px) {
            .dashboard-container {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                padding: 10px;
            }
            
            .sidebar-menu {
                display: flex;
                overflow-x: auto;
            }
            
            .sidebar-menu li {
                margin-bottom: 0;
                margin-right: 5px;
            }
            
            .sidebar-menu a {
                padding: 10px 15px;
                border-left: none;
                border-bottom: 3px solid transparent;
            }
            
            .sidebar-menu a:hover, .sidebar-menu a.active {
                border-left: none;
                border-bottom: 3px solid var(--secondary);
            }
        }
        
        @media (max-width: 576px) {
            .stats-cards, .action-cards {
                grid-template-columns: 1fr;
            }
            
            .header {
                flex-direction: column;
                text-align: center;
            }
            
            .welcome-text {
                margin-bottom: 15px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo-container">
                <a href="#" class="logo">
                    <i class="fas fa-chart-line"></i>
                    MATS ADMIN
                </a>
            </div>
            
            <ul class="sidebar-menu">
                <li><a href="#" class="active"><i class="fas fa-home"></i> Dashboard</a></li>
                <li><a href="ViewAllEmployeeServlet.do"><i class="fas fa-users"></i> Employees</a></li>
                <li><a href="#"><i class="fas fa-calendar-alt"></i> Schedules</a></li>
                <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
                <li><a href="Logout.do"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <div class="welcome-text">
                    <h1>Welcome, Administrator</h1>
                    <p>Manage your employees and track business performance</p>
                </div>
                <a href="Logout.do" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
            
            <div class="stats-cards">
                <div class="card">
                    <div class="card-icon bg-primary">
                        <i class="fas fa-users"></i>
                    </div>
                    <%
                        int count = (Integer) session.getAttribute("numberOfEmployee");
                    %>
                    <h3><%= count %></h3>
                    <p>Total Employees</p>
                </div>
                
            </div>
            
            <div class="action-cards">
                <div class="action-card">
                    <div class="action-icon">
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <h3>Add New Employee</h3>
                    <p>Register a new employee to the system</p>
                    <a href="employee_new_add.jsp" class="action-btn">Add Employee</a>
                </div>
                
                <div class="action-card">
                    <div class="action-icon">
                        <i class="fas fa-list-alt"></i>
                    </div>
                    <h3>View All Employees</h3>
                    <p>See complete list of all employees in the system</p>
                    <form action="ViewAllEmployeeServlet.do" method="POST">
                        <button type="submit" class="action-btn">View Employees</button>
                    </form>
                </div>
                
                <div class="action-card">
                    <div class="action-icon">
                        <i class="fas fa-clipboard-list"></i>
                    </div>
                    <h3>Employee Register</h3>
                    <p>View and manage employee attendance records</p>
                    <form action="ViewEmployeeRegisterServlet.do" method="POST">
                        <button type="submit" class="action-btn">View Register</button>
                    </form>
                </div>
            </div>
            
            <!-- Admin Profile Section -->
            <div class="profile-section">
                <div class="profile-header">
                    <h2>Admin Profile</h2>
                    <a href="admin_edit_butten.jsp" class="edit-btn"><i class="fas fa-edit"></i> Edit Profile</a>
                </div>
                
                <div class="profile-details">
                    <%
                        MaxeloClientTable user = (MaxeloClientTable) session.getAttribute("user");
                    %>
                    <div class="detail-item">
                        <div class="detail-label">ID</div>
                        <div class="detail-value"><%= user.getId()%></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Name</div>
                        <div class="detail-value"><%= user.getNames()%></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Surname</div>
                        <div class="detail-value"><%= user.getSurname()%></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Phone Number</div>
                        <div class="detail-value"><%= user.getPhoneNumber()%></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Role</div>
                        <div class="detail-value"><%= user.getRole()%></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Position</div>
                        <div class="detail-value"><%= user.getPosition()%></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Email</div>
                        <div class="detail-value"><%= user.getEmail()%></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>