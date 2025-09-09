<%@page import="co.za.maxelo.bl.MaxeloClientTable"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.28/jspdf.plugin.autotable.min.js"></script>
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
            padding: 20px 0;
            margin-bottom: 30px;
            border-bottom: 1px solid #e1e4e8;
        }
        
        .logo-container {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .logo {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #4b6cb7 0%, #182848 100%);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 20px;
        }
        
        .logo-text {
            font-size: 24px;
            font-weight: 700;
            color: #2c3e50;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .btn-primary {
            background-color: #4b6cb7;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #3a5795;
            transform: translateY(-2px);
        }
        
        .btn-success {
            background-color: #28a745;
            color: white;
        }
        
        .btn-success:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }
        
        .controls {
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .search-container {
            position: relative;
            flex-grow: 1;
            max-width: 400px;
        }
        
        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }
        
        .search-input {
            width: 100%;
            padding: 12px 20px 12px 45px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        
        .search-input:focus {
            outline: none;
            border-color: #4b6cb7;
            box-shadow: 0 0 0 3px rgba(75, 108, 183, 0.2);
        }
        
        .employee-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .employee-table th {
            background: linear-gradient(135deg, #4b6cb7 0%, #182848 100%);
            color: white;
            padding: 16px;
            text-align: left;
            font-weight: 600;
        }
        
        .employee-table td {
            padding: 14px 16px;
            border-bottom: 1px solid #e1e4e8;
        }
        
        .employee-table tr:last-child td {
            border-bottom: none;
        }
        
        .employee-table tr:hover {
            background-color: #f8f9fa;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        
        .action-form {
            margin: 0;
        }
        
        .action-btn {
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.2s;
        }
        
        .edit-btn {
            background-color: #ffc107;
            color: #212529;
        }
        
        .edit-btn:hover {
            background-color: #e0a800;
        }
        
        .delete-btn {
            background-color: #dc3545;
            color: white;
        }
        
        .delete-btn:hover {
            background-color: #c82333;
        }
        
        .no-results {
            text-align: center;
            color: #6c757d;
            font-style: italic;
            padding: 30px;
        }
        
        .loading {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.8);
            z-index: 1000;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        
        .loading-spinner {
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid #4b6cb7;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-bottom: 15px;
        }
        
        .loading-text {
            font-size: 18px;
            color: #4b6cb7;
            font-weight: 600;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        @media (max-width: 768px) {
            .employee-table {
                display: block;
                overflow-x: auto;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 5px;
            }
            
            header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
            
            .controls {
                flex-direction: column;
            }
            
            .search-container {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo-container">
                <div class="logo">
                    <i class="fas fa-building"></i>
                </div>
                <div class="logo-text">Maxelo Employees</div>
            </div>
            <a href="admin_login_dashboard.jsp" class="btn btn-primary">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
        </header>
        
        <div class="controls">
            <div class="search-container">
                <i class="fas fa-search search-icon"></i>
                <input type="text" id="searchInput" class="search-input" placeholder="Search by name or surname...">
            </div>
            <button id="downloadBtn" class="btn btn-success">
                <i class="fas fa-download"></i> Download PDF
            </button>
        </div>
        
        <table class="employee-table" id="employeeTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Position</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<MaxeloClientTable> allUser = (List<MaxeloClientTable>) session.getAttribute("allUser");
                    if (allUser != null && !allUser.isEmpty()) {
                        for (MaxeloClientTable user : allUser) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getNames() %></td>
                    <td><%= user.getSurname() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getPhoneNumber() != null ? user.getPhoneNumber() : "N/A" %></td>
                    <td><%= user.getPosition() != null ? user.getPosition() : "N/A" %></td>
                    <td><%= user.getRole() != null ? user.getRole() : "N/A" %></td>
                    <td class="action-buttons">
                        <form class="action-form" action="EditEmployeeServlet.do" method="POST">
                            <input type="hidden" name="email" value="<%= user.getEmail() %>"/>
                            <button type="submit" class="action-btn edit-btn">Edit</button>
                        </form>
                        <form class="action-form" action="DeleteEmployeeServlet.do" method="POST" onsubmit="return confirm('Are you sure you want to delete <%= user.getNames() %> <%= user.getSurname() %>?')">
                            <input type="hidden" name="email" value="<%= user.getEmail() %>"/>
                            <button type="submit" class="action-btn delete-btn">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="8" class="no-results">No employees found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <div class="loading" id="loadingIndicator">
        <div class="loading-spinner"></div>
        <div class="loading-text">Generating PDF...</div>
    </div>

    <script>
        // Wait for the jsPDF library to load
        document.addEventListener('DOMContentLoaded', function() {
            // Search functionality
            const searchInput = document.getElementById('searchInput');
            if (searchInput) {
                searchInput.addEventListener('input', function() {
                    const searchValue = this.value.toLowerCase();
                    const rows = document.querySelectorAll('#employeeTable tbody tr');
                    
                    rows.forEach(row => {
                        if (row.classList.contains('no-results')) return;
                        
                        const name = row.cells[1].textContent.toLowerCase();
                        const surname = row.cells[2].textContent.toLowerCase();
                        
                        if (name.includes(searchValue) || surname.includes(searchValue)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                });
            }
            
            // PDF download functionality
            const downloadBtn = document.getElementById('downloadBtn');
            if (downloadBtn) {
                downloadBtn.addEventListener('click', function() {
                    // Show loading indicator
                    const loadingIndicator = document.getElementById('loadingIndicator');
                    loadingIndicator.style.display = 'flex';
                    
                    // Use setTimeout to allow the UI to update before generating the PDF
                    setTimeout(function() {
                        try {
                            // Use jsPDF with autoTable plugin
                            const { jsPDF } = window.jspdf;
                            const doc = new jsPDF();
                            
                            // Add logo and title
                            doc.setFontSize(20);
                            doc.setTextColor(40, 40, 40);
                            doc.text('Maxelo Employees List', 14, 15);
                            doc.setFontSize(12);
                            doc.setTextColor(100, 100, 100);
                            doc.text('Generated on: ' + new Date().toLocaleDateString(), 14, 22);
                            
                            // Extract table data
                            const table = document.getElementById('employeeTable');
                            const rows = [];
                            const headers = [];
                            
                            // Get headers (skip actions column)
                            for (let i = 0; i < table.rows[0].cells.length - 1; i++) {
                                headers.push(table.rows[0].cells[i].textContent);
                            }
                            
                            // Get data rows (skip header row)
                            for (let i = 1; i < table.rows.length; i++) {
                                const row = table.rows[i];
                                // Skip hidden rows (from search) and the no-results row
                                if (row.style.display === 'none' || row.classList.contains('no-results')) continue;
                                
                                const rowData = [];
                                for (let j = 0; j < row.cells.length - 1; j++) { // Skip actions column
                                    rowData.push(row.cells[j].textContent);
                                }
                                rows.push(rowData);
                            }
                            
                            if (rows.length > 0) {
                                // Generate PDF
                                doc.autoTable({
                                    head: [headers],
                                    body: rows,
                                    startY: 30,
                                    theme: 'grid',
                                    styles: {
                                        fontSize: 10,
                                        cellPadding: 3,
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
                            } else {
                                doc.text('No employee data available', 14, 30);
                            }
                            
                            // Save the PDF
                            doc.save('maxelo_employees_' + new Date().toISOString().slice(0, 10) + '.pdf');
                        } catch (error) {
                            console.error('Error generating PDF:', error);
                            alert('Failed to generate PDF. Please try again.');
                        } finally {
                            // Hide loading indicator
                            loadingIndicator.style.display = 'none';
                        }
                    }, 100);
                });
            }
        });
    </script>
</body>
</html>