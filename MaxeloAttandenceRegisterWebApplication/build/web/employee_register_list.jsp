<%@page import="co.za.maxelo.bl.MaxeloAttendenceRegisterTable"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="co.za.maxelo.bl.MaxeloClientTable"%>
<%@page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Attendance Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
    <style>
        :root {
            --primary: #3498db;
            --secondary: #2c3e50;
            --success: #28a745;
            --danger: #dc3545;
            --warning: #ffc107;
            --info: #17a2b8;
            --light: #f8f9fa;
            --dark: #343a40;
            --gray: #6c757d;
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
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .logo-container {
            display: flex;
            align-items: center;
        }
        
        .logo {
            width: 50px;
            height: 50px;
            background: var(--primary);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }
        
        .logo i {
            font-size: 24px;
            color: white;
        }
        
        .logo-text {
            font-size: 24px;
            font-weight: 700;
            color: var(--secondary);
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            padding: 10px 20px;
            background: var(--primary);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }
        
        .btn:hover {
            background: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .btn-success {
            background: var(--success);
        }
        
        .btn-success:hover {
            background: #218838;
        }
        
        .summary {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }
        
        .summary h3 {
            margin-bottom: 20px;
            color: var(--secondary);
            display: flex;
            align-items: center;
        }
        
        .summary h3 i {
            margin-right: 10px;
            color: var(--primary);
        }
        
        .summary-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }
        
        .stat-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            border-left: 4px solid var(--primary);
        }
        
        .stat-value {
            font-size: 32px;
            font-weight: 700;
            color: var(--secondary);
            margin-bottom: 5px;
        }
        
        .stat-label {
            color: var(--gray);
            font-size: 14px;
        }
        
        .controls {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .control-group {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }
        
        .control-group h3 {
            margin-bottom: 15px;
            color: var(--secondary);
            display: flex;
            align-items: center;
        }
        
        .control-group h3 i {
            margin-right: 10px;
            color: var(--primary);
        }
        
        .date-picker, .search-input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        
        .search-container {
            position: relative;
        }
        
        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
        }
        
        .search-input {
            padding-left: 40px;
        }
        
        .loading {
            text-align: center;
            padding: 40px;
            background: white;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }
        
        .loading i {
            font-size: 24px;
            color: var(--primary);
            margin-bottom: 15px;
        }
        
        .register-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }
        
        .register-table th {
            background: var(--secondary);
            color: white;
            text-align: left;
            padding: 15px;
            font-weight: 600;
        }
        
        .register-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .register-table tr:last-child td {
            border-bottom: none;
        }
        
        .register-table tr:hover {
            background: #f8f9fa;
        }
        
        .employee-info {
            line-height: 1.8;
        }
        
        .status-badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
        
        .status-office {
            background: #e8f5e9;
            color: #2e7d32;
        }
        
        .status-remote {
            background: #e3f2fd;
            color: #1565c0;
        }
        
        .status-absent {
            background: #ffebee;
            color: #c62828;
        }
        
        .no-results {
            text-align: center;
            color: var(--gray);
            font-style: italic;
        }
        
        .notification {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: var(--success);
            color: white;
            padding: 15px 25px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            transform: translateY(100px);
            opacity: 0;
            transition: all 0.3s ease;
        }
        
        .notification.show {
            transform: translateY(0);
            opacity: 1;
        }
        
        .notification i {
            margin-right: 10px;
        }
        
        @media (max-width: 768px) {
            .summary-stats {
                grid-template-columns: 1fr 1fr;
            }
            
            .controls {
                grid-template-columns: 1fr;
            }
            
            header {
                flex-direction: column;
                text-align: center;
            }
            
            .logo-container {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo-container">
                <div class="logo">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <div class="logo-text">Maxelo Attendance Register</div>
            </div>
            <a href="admin_login_dashboard.jsp" class="btn btn-primary">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
        </header>
        
        <div class="summary">
            <h3>Attendance Summary</h3>
            <div class="summary-stats">
                <div class="stat-card">
                    <div class="stat-value" id="totalEmployees">0</div>
                    <div class="stat-label">Total Employees</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value" id="presentCount">0</div>
                    <div class="stat-label">Present Today</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value" id="remoteCount">0</div>
                    <div class="stat-label">Remote Workers</div>
                </div>
                <div class="stat-card">
                    <div class="stat-value" id="absentCount">0</div>
                    <div class="stat-label">Absent Today</div>
                </div>
            </div>
        </div>
        
        <div class="controls">
            <div class="control-group">
                <h3><i class="fas fa-calendar-alt"></i> Select Date</h3>
                <input type="text" id="datePicker" class="date-picker" placeholder="Select date...">
            </div>
            
            <div class="control-group">
                <h3><i class="fas fa-search"></i> Search by Name</h3>
                <div class="search-container">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" id="nameSearch" class="search-input" placeholder="Search by name...">
                </div>
            </div>
            
            <div class="control-group">
                <h3><i class="fas fa-filter"></i> Filter by Role</h3>
                <select id="roleFilter" class="search-input">
                    <option value="">All Roles</option>
                    <option value="admin">Admin</option>
                    <option value="hr">HR</option>
                    <option value="manager">Manager</option>
                    <option value="employee">Employee</option>
                    <option value="intern">Intern</option>
                </select>
            </div>
            
            <div class="control-group">
                <h3><i class="fas fa-download"></i> Export Options</h3>
                <button id="downloadBtn" class="btn btn-success">
                    <i class="fas fa-file-pdf"></i> Download PDF
                </button>
            </div>
        </div>
        
        <div id="loading" class="loading" style="display: none;">
            <i class="fas fa-spinner fa-spin"></i> Loading attendance data...
        </div>
        
        <table class="register-table" id="registerTable">
            <thead>
                <tr>
                    <th>Employee Info</th>
                    <th>Clock In</th>
                    <th>Clock Out</th>
                    <th>Attendance Type</th>
                    <th>Notes</th>
                </tr>
            </thead>
            <tbody id="attendanceData">
                <%
                    List<MaxeloClientTable> userList = (List<MaxeloClientTable>) request.getAttribute("userList");
                    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
                    String selectedDate = request.getParameter("date");
                    LocalDate filterDate = selectedDate != null ? LocalDate.parse(selectedDate) : LocalDate.now();
                    
                    int totalEmployees = 0;
                    int presentCount = 0;
                    int remoteCount = 0;
                    int absentCount = 0;
                    
                    if (userList != null && !userList.isEmpty()) {
                        for (MaxeloClientTable user : userList) {
                            // Get attendance records for this user
                            List<MaxeloAttendenceRegisterTable> attendanceRecords = user.getAttendanceRecords();
                            
                            if (attendanceRecords != null && !attendanceRecords.isEmpty()) {
                                MaxeloAttendenceRegisterTable attendance = null;
                                
                                // Find attendance record for the selected date
                                for (MaxeloAttendenceRegisterTable record : attendanceRecords) {
                                    if (record.getTimeIn() != null && 
                                        record.getTimeIn().toLocalDate().equals(filterDate)) {
                                        attendance = record;
                                        break;
                                    }
                                }
                                
                                if (attendance != null) {
                                    totalEmployees++;
                                    String attendanceType = attendance.getAttendanceType() != null ? 
                                        attendance.getAttendanceType().toLowerCase() : "";
                                    
                                    if (attendanceType.contains("office") || attendanceType.contains("present")) {
                                        presentCount++;
                                    } else if (attendanceType.contains("remote")) {
                                        remoteCount++;
                                    } else if (attendanceType.contains("absent")) {
                                        absentCount++;
                                    }
                %>
                <tr>
                    <td>
                        <div class="employee-info">
                            <strong>ID:</strong> <%= user.getId() %><br>
                            <strong>Name:</strong> <%= user.getNames() %> <%= user.getSurname() %><br>
                            <strong>Phone:</strong> <%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "N/A" %><br>
                            <strong>Role:</strong> <%= user.getRole() != null ? user.getRole() : "N/A" %><br>
                            <strong>Position:</strong> <%= user.getPosition() != null ? user.getPosition() : "N/A" %>
                        </div>
                    </td>
                    <td>
                        <% if (attendance.getTimeIn() != null) { %>
                            <%= attendance.getTimeIn().format(dateFormatter) %><br>
                            <%= attendance.getTimeIn().format(timeFormatter) %>
                        <% } else { %>
                            N/A
                        <% } %>
                    </td>
                    <td>
                        <% if (attendance.getTimeOut() != null) { %>
                            <%= attendance.getTimeOut().format(dateFormatter) %><br>
                            <%= attendance.getTimeOut().format(timeFormatter) %>
                        <% } else { %>
                            N/A
                        <% } %>
                    </td>
                    <td>
                        <% if (attendance.getAttendanceType() != null) { 
                            String type = attendance.getAttendanceType().toLowerCase();
                        %>
                            <span class="status-badge status-<%= type %>">
                                <%= attendance.getAttendanceType() %>
                            </span>
                        <% } else { %>
                            N/A
                        <% } %>
                    </td>
                    <td><%= attendance.getNotes() != null ? attendance.getNotes() : "N/A" %></td>
                </tr>
                <%
                                } else {
                                    totalEmployees++;
                %>
                <tr>
                    <td>
                        <div class="employee-info">
                            <strong>ID:</strong> <%= user.getId() %><br>
                            <strong>Name:</strong> <%= user.getNames() %> <%= user.getSurname() %><br>
                            <strong>Phone:</strong> <%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "N/A" %><br>
                            <strong>Role:</strong> <%= user.getRole() != null ? user.getRole() : "N/A" %><br>
                            <strong>Position:</strong> <%= user.getPosition() != null ? user.getPosition() : "N/A" %>
                        </div>
                    </td>
                    <td colspan="4" class="no-results">No attendance record for <%= filterDate.format(dateFormatter) %></td>
                </tr>
                <%
                                }
                            } else {
                                totalEmployees++;
                %>
                <tr>
                    <td>
                        <div class="employee-info">
                            <strong>ID:</strong> <%= user.getId() %><br>
                            <strong>Name:</strong> <%= user.getNames() %> <%= user.getSurname() %><br>
                            <strong>Phone:</strong> <%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "N/A" %><br>
                            <strong>Role:</strong> <%= user.getRole() != null ? user.getRole() : "N/A" %><br>
                            <strong>Position:</strong> <%= user.getPosition() != null ? user.getPosition() : "N/A" %>
                        </div>
                    </td>
                    <td colspan="4" class="no-results">No attendance records found for this employee.</td>
                </tr>
                <%
                            }
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="no-results">No employees found in the system.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

    </div>

    <div id="notification" class="notification">
        <i class="fas fa-check-circle"></i> <span id="notificationText">Attendance data loaded successfully</span>
    </div>

    <script>
        // Initialize date picker
        const urlParams = new URLSearchParams(window.location.search);
        const dateParam = urlParams.get('date');
        
        const datePicker = flatpickr("#datePicker", {
            dateFormat: "Y-m-d",
            defaultDate: dateParam ? dateParam : "today",
            maxDate: "today",
            onChange: function(selectedDates, dateStr, instance) {
                // Reload page with date parameter
                const url = new URL(window.location.href);
                url.searchParams.set('date', dateStr);
                window.location.href = url.toString();
            }
        });
        
        // Set summary stats from server-side values
        document.getElementById('totalEmployees').textContent = <%= totalEmployees %>;
        document.getElementById('presentCount').textContent = <%= presentCount %>;
        document.getElementById('remoteCount').textContent = <%= remoteCount %>;
        document.getElementById('absentCount').textContent = <%= absentCount %>;
        
        // Search functionality
        document.getElementById('nameSearch').addEventListener('input', function() {
            filterTable();
        });
        
        document.getElementById('roleFilter').addEventListener('change', function() {
            filterTable();
        });
        
        function filterTable() {
            const nameValue = document.getElementById('nameSearch').value.toLowerCase();
            const roleValue = document.getElementById('roleFilter').value.toLowerCase();
            const rows = document.querySelectorAll('#attendanceData tr');
            
            let visibleCount = 0;
            let presentCount = 0;
            let remoteCount = 0;
            let absentCount = 0;
            
            rows.forEach(row => {
                const employeeInfo = row.cells[0].textContent.toLowerCase();
                const nameMatch = employeeInfo.includes(nameValue);
                const roleMatch = roleValue === '' || employeeInfo.includes(roleValue);
                
                if (nameMatch && roleMatch) {
                    row.style.display = '';
                    visibleCount++;
                    
                    // Count attendance types for visible rows
                    const statusCell = row.cells[3];
                    if (statusCell) {
                        const status = statusCell.textContent.trim().toLowerCase();
                        if (status.includes('office') || status.includes('present')) {
                            presentCount++;
                        } else if (status.includes('remote')) {
                            remoteCount++;
                        } else if (status.includes('absent')) {
                            absentCount++;
                        }
                    }
                } else {
                    row.style.display = 'none';
                }
            });
            
            // Update summary stats based on filtered results
            document.getElementById('totalEmployees').textContent = visibleCount;
            document.getElementById('presentCount').textContent = presentCount;
            document.getElementById('remoteCount').textContent = remoteCount;
            document.getElementById('absentCount').textContent = absentCount;
        }
        
        // PDF download functionality
        document.getElementById('downloadBtn').addEventListener('click', function() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();
            
            // Get selected date
            const selectedDate = document.getElementById('datePicker').value;
            const formattedDate = selectedDate ? new Date(selectedDate).toLocaleDateString() : new Date().toLocaleDateString();
            
            // Add title
            doc.setFontSize(20);
            doc.setTextColor(40, 40, 40);
            doc.text('Maxelo Attendance Register', 14, 15);
            doc.setFontSize(12);
            doc.setTextColor(100, 100, 100);
            doc.text('Date: ' + formattedDate, 14, 22);
            
            // Extract table data
            const table = document.getElementById('registerTable');
            const headers = [];
            
            // Get headers
            for (let i = 0; i < table.rows[0].cells.length; i++) {
                headers.push(table.rows[0].cells[i].textContent);
            }
            
            const rows = [];
            
            // Get data rows (skip header row and hidden rows)
            for (let i = 1; i < table.rows.length; i++) {
                const row = table.rows[i];
                if (row.style.display === 'none') continue;
                
                const rowData = [];
                for (let j = 0; j < row.cells.length; j++) {
                    rowData.push(row.cells[j].textContent);
                }
                rows.push(rowData);
            }
            
            // Generate PDF
            doc.autoTable({
                head: [headers],
                body: rows,
                startY: 30,
                theme: 'grid',
                styles: {
                    fontSize: 8,
                    cellPadding: 2,
                    overflow: 'linebreak'
                },
                headStyles: {
                    fillColor: [44, 62, 80],
                    textColor: 255
                },
                alternateRowStyles: {
                    fillColor: [245, 247, 250]
                }
            });
            
            // Save the PDF
            const fileName = 'maxelo_attendance_register_' + (selectedDate || new Date().toISOString().slice(0, 10)) + '.pdf';
            doc.save(fileName);
        });
    </script>
</body>
</html>