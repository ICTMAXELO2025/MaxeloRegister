/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.employee.model;

import co.za.maxelo.bl.MaxeloClientTable;
import co.za.maxelo.businesslogic.MaxeloClientTableFacadeLocal;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cash
 */
public class UpdateEmployeeServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(UpdateEmployeeServlet.class.getName());
    
    @EJB
    private MaxeloClientTableFacadeLocal mctfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // Get all parameters from the request
            String idParam = request.getParameter("id");
            String names = request.getParameter("names");
            String surname = request.getParameter("surname");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String role = request.getParameter("role");
            String position = request.getParameter("position");
            
            // Validate required fields
            if (idParam == null || idParam.trim().isEmpty() ||
                names == null || names.trim().isEmpty() ||
                surname == null || surname.trim().isEmpty() ||
                email == null || email.trim().isEmpty()) {
                
                logger.log(Level.WARNING, "Missing required fields in employee update");
                request.setAttribute("errorMessage", "Name, surname, and email are required fields");
                request.getRequestDispatcher("employee_update_error.jsp").forward(request, response);
                return;
            }
            
            Long id;
            try {
                id = Long.parseLong(idParam);
            } catch (NumberFormatException e) {
                logger.log(Level.WARNING, "Invalid ID format: {0}", idParam);
                request.setAttribute("errorMessage", "Invalid employee ID format");
                request.getRequestDispatcher("employee_update_error.jsp").forward(request, response);
                return;
            }
            
            // Find the existing employee
            MaxeloClientTable employee = mctfl.find(id);
            if (employee == null) {
                logger.log(Level.WARNING, "Employee not found with ID: {0}", id);
                request.setAttribute("errorMessage", "Employee not found with ID: " + id);
                request.getRequestDispatcher("employee_update_error.jsp").forward(request, response);
                return;
            }
            
            // Check if email is being changed to one that already exists (for another user)
            if (!email.equalsIgnoreCase(employee.getEmail())) {
                MaxeloClientTable existingUser = mctfl.findByEmail(email);
                if (existingUser != null && !existingUser.getId().equals(employee.getId())) {
                    logger.log(Level.WARNING, "Email already exists: {0}", email);
                    request.setAttribute("errorMessage", "Email already exists for another employee: " + email);
                    request.getRequestDispatcher("employee_update_error.jsp").forward(request, response);
                    return;
                }
            }
            
            // Update employee details
            employee.setNames(names.trim());
            employee.setSurname(surname.trim());
            employee.setEmail(email.trim());
            employee.setPhoneNumber(phoneNumber != null ? phoneNumber.trim() : null);
            employee.setRole(role != null ? role.trim() : null);
            employee.setPosition(position != null ? position.trim() : null);
            
            // Save the updated employee
            mctfl.edit(employee);
            
            logger.log(Level.INFO, "Employee updated successfully: {0} {1} (ID: {2})", 
                    new Object[]{names, surname, id});
            
            // Set success message and forward to success page
            request.setAttribute("successMessage", "Employee " + names + " " + surname + " has been successfully updated");
            request.getRequestDispatcher("employee_update_success.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error updating employee", e);
            request.setAttribute("errorMessage", "An error occurred while updating the employee: " + e.getMessage());
            request.getRequestDispatcher("employee_update_error.jsp").forward(request, response);
        }
    }
}