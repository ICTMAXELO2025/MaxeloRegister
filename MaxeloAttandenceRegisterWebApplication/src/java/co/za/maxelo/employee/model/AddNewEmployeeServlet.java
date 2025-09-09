package co.za.maxelo.employee.model;

import co.za.maxelo.bl.MaxeloClientTable;
import co.za.maxelo.businesslogic.MaxeloClientTableFacadeLocal;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cash
 */
public class AddNewEmployeeServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(AddNewEmployeeServlet.class.getName());

    @EJB
    private MaxeloClientTableFacadeLocal matfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        try {
            // Get parameters from request
            String names = request.getParameter("names");
            String surname = request.getParameter("surname");
            String phone_number = request.getParameter("phone_number");
            String role = request.getParameter("role");
            String position = request.getParameter("position");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Log received parameters for debugging
            logger.log(Level.INFO, "Received parameters - names: {0}, surname: {1}, email: {2}, phone: {3}, role: {4}, position: {5}", 
                    new Object[]{names, surname, email, phone_number, role, position});

            // Validate required fields
            if (names == null || names.trim().isEmpty()
                    || surname == null || surname.trim().isEmpty()
                    || email == null || email.trim().isEmpty()
                    || password == null || password.trim().isEmpty()) {

                String errorMsg = "Name, surname, email and password are required";
                logger.log(Level.WARNING, errorMsg);
                request.setAttribute("errorMessage", errorMsg);
                request.getRequestDispatcher("employee_account_unsuccessful.jsp").forward(request, response);
                return;
            }

            // Check if email already exists
            MaxeloClientTable existingUser = matfl.findByEmail(email);
            if (existingUser != null) {
                String errorMsg = "Email already exists: " + email;
                logger.log(Level.WARNING, errorMsg);
                request.setAttribute("errorMessage", errorMsg);
                request.getRequestDispatcher("employee_account_unsuccessful.jsp").forward(request, response);
                return;
            }

            // Create new employee
            MaxeloClientTable newEmployee = new MaxeloClientTable();
            newEmployee.setNames(names.trim());
            newEmployee.setSurname(surname.trim());
            newEmployee.setPhoneNumber(phone_number != null ? phone_number.trim() : null);
            newEmployee.setRole(role != null ? role.trim() : "employee");
            newEmployee.setPosition(position != null ? position.trim() : null);
            newEmployee.setEmail(email.trim());
            
            // Store plain text password (for now)
            newEmployee.setPassword(password);
            logger.log(Level.INFO, "Password stored as plain text");

            // Save the new employee
            try {
                matfl.create(newEmployee);
                logger.log(Level.INFO, "New employee created successfully: {0} {1} ({2})",
                        new Object[]{names, surname, email});
                
                // Set attributes for the success page
                request.setAttribute("names", names);
                request.setAttribute("surname", surname);
                request.setAttribute("email", email);
                request.setAttribute("position", position);
                request.setAttribute("role", role);
                request.setAttribute("successMessage", "Employee account created successfully for " + names + " " + surname);
                
                // Forward to success page
                request.getRequestDispatcher("employee_account_successful.jsp").forward(request, response);
                
            } catch (EJBException ejbEx) {
                // Handle database constraints violations
                Throwable cause = ejbEx.getCause();
                if (cause != null) {
                    logger.log(Level.SEVERE, "Database constraint violation: " + cause.getMessage(), cause);
                    
                    // Check for specific constraint violations
                    if (cause.getMessage().contains("constraint") || cause.getMessage().contains("unique") || 
                        cause.getMessage().contains("duplicate")) {
                        request.setAttribute("errorMessage", "Database error: Possible duplicate entry or constraint violation");
                    } else if (cause.getMessage().contains("null") || cause.getMessage().contains("NOT NULL")) {
                        request.setAttribute("errorMessage", "Database error: Required field is missing");
                    } else {
                        request.setAttribute("errorMessage", "Database error: " + cause.getMessage());
                    }
                } else {
                    logger.log(Level.SEVERE, "EJB Exception while creating employee: " + ejbEx.getMessage(), ejbEx);
                    request.setAttribute("errorMessage", "Database error occurred");
                }
                request.getRequestDispatcher("employee_account_unsuccessful.jsp").forward(request, response);
            } catch (Exception e) {
                logger.log(Level.SEVERE, "Unexpected error creating employee: " + e.getMessage(), e);
                request.setAttribute("errorMessage", "Unexpected error occurred: " + e.getMessage());
                request.getRequestDispatcher("employee_account_unsuccessful.jsp").forward(request, response);
            }

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Top-level error in servlet: " + e.getMessage(), e);
            request.setAttribute("errorMessage", "System error occurred: " + e.getMessage());
            request.getRequestDispatcher("employee_account_unsuccessful.jsp").forward(request, response);
        }
    }
}