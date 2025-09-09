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
public class EditEmployeeServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(EditEmployeeServlet.class.getName());
    
    @EJB
    private MaxeloClientTableFacadeLocal mctfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String email = request.getParameter("email");
            
            // Validate email parameter
            if (email == null || email.trim().isEmpty()) {
                logger.log(Level.WARNING, "Attempted to edit employee with null or empty email");
                request.setAttribute("errorMessage", "Email parameter is required");
                request.getRequestDispatcher("employee_edit_error.jsp").forward(request, response);
                return;
            }
            
            // Find employee by email
            MaxeloClientTable mct = mctfl.findByEmail(email);
            
            // Check if employee exists
            if (mct == null) {
                logger.log(Level.WARNING, "Attempted to edit non-existent employee with email: {0}", email);
                request.setAttribute("errorMessage", "Employee with email " + email + " does not exist");
                request.getRequestDispatcher("employee_edit_error.jsp").forward(request, response);
                return;
            }
            
            logger.log(Level.INFO, "Loading edit page for employee: {0} ({1})", 
                    new Object[]{mct.getNames() + " " + mct.getSurname(), email});
            
            // Set employee data for the edit form
            request.setAttribute("employee", mct);
            request.getRequestDispatcher("employee_edit_page.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error occurred while loading employee edit page", e);
            request.setAttribute("errorMessage", "An error occurred while loading the employee edit page: " + e.getMessage());
            request.getRequestDispatcher("employee_edit_error.jsp").forward(request, response);
        }
    }
}