package co.za.maxelo.model;

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
import javax.servlet.http.HttpSession;

public class RestAdminPasswordServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(RestAdminPasswordServlet.class.getName());
    
    @EJB
    private MaxeloClientTableFacadeLocal matfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try {
            // Get parameters from request
            String email = request.getParameter("email");
            String idParam = request.getParameter("id");
            String password = request.getParameter("password");
            
            // Validate parameters
            if (email == null || email.trim().isEmpty() || 
                idParam == null || idParam.trim().isEmpty() || 
                password == null || password.trim().isEmpty()) {
                
                request.setAttribute("errorMessage", "All fields are required");
                request.getRequestDispatcher("admin_account_error.jsp").forward(request, response);
                return;
            }
            
            Long id;
            try {
                id = Long.parseLong(idParam);
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid ID format");
                request.getRequestDispatcher("admin_account_error.jsp").forward(request, response);
                return;
            }
            
            // Find client by ID
            MaxeloClientTable mat = matfl.find(id);
            
            // Check if client exists
            if (mat == null) {
                request.setAttribute("errorMessage", "No account found with the provided ID");
                request.getRequestDispatcher("admin_account_unexist.jsp").forward(request, response);
                return;
            }
            
            // Check if email matches
            if (!email.equalsIgnoreCase(mat.getEmail())) {
                request.setAttribute("errorMessage", "Email does not match the account");
                request.getRequestDispatcher("admin_account_unexist.jsp").forward(request, response);
                return;
            }
            
            // Update password (automatically hashed by the entity setter)
            mat.setPassword(password);
            matfl.edit(mat);
            
            // Log the password reset
            logger.log(Level.INFO, "Password reset for user ID: {0}", id);
            
            // Forward to success page
            request.getRequestDispatcher("admin_reset_successful.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error in password reset process", e);
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("admin_account_error.jsp").forward(request, response);
        }
    }
}