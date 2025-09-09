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
public class DeleteEmployeeServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(DeleteEmployeeServlet.class.getName());
    
    @EJB
    private MaxeloClientTableFacadeLocal mctfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String email = request.getParameter("email");
            
            // Validate email parameter
            if (email == null || email.trim().isEmpty()) {
                logger.log(Level.WARNING, "Attempted to delete employee with null or empty email");
                request.setAttribute("errorMessage", "Email parameter is required");
                request.getRequestDispatcher("employee_removed_unsuccessful.jsp").forward(request, response);
                return;
            }
            
            // Find employee by email
            MaxeloClientTable mct = mctfl.findByEmail(email);
            
            // Check if employee exists
            if (mct == null) {
                logger.log(Level.WARNING, "Attempted to delete non-existent employee with email: {0}", email);
                request.setAttribute("errorMessage", "Employee with email " + email + " does not exist");
                request.getRequestDispatcher("employee_removed_unsuccessful.jsp").forward(request, response);
                return;
            }
            
            // Store employee info for success message
            String employeeName = mct.getNames() + " " + mct.getSurname();
            
            // Remove employee
            mctfl.remove(mct);
            
            logger.log(Level.INFO, "Employee deleted successfully: {0} ({1})", new Object[]{employeeName, email});
            
            // Set success message
            request.setAttribute("successMessage", "Employee " + employeeName + " has been successfully removed");
            request.getRequestDispatcher("employee_removed_successful.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error occurred while deleting employee", e);
            request.setAttribute("errorMessage", "An error occurred while deleting the employee: " + e.getMessage());
            request.getRequestDispatcher("employee_removed_unsuccessful.jsp").forward(request, response);
        }
    }
}