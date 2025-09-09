package co.za.maxelo.admin.model;

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

/**
 *
 * @author cash
 */
public class EditAdminButtenServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(EditAdminButtenServlet.class.getName());
    
    @EJB
    private MaxeloClientTableFacadeLocal matfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        try {
            // Get the current user from session
            MaxeloClientTable currentUser = (MaxeloClientTable) session.getAttribute("user");
            
            if (currentUser == null) {
                // User not logged in, redirect to login
                request.setAttribute("errorMessage", "Please log in first");
                request.getRequestDispatcher("admin_login.jsp").forward(request, response);
                return;
            }
            
            // Get form parameters
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String phoneNumber = request.getParameter("phoneNumber");
            String role = request.getParameter("role");
            String email = request.getParameter("email");
            
            // Validate required fields
            if (name == null || name.trim().isEmpty() ||
                surname == null || surname.trim().isEmpty() ||
                email == null || email.trim().isEmpty()) {
                
                request.setAttribute("errorMessage", "Name, surname, and email are required fields");
                request.getRequestDispatcher("admin_edit_butten.jsp").forward(request, response);
                return;
            }
            
            // Check if email is being changed to one that already exists (for another user)
            if (!email.equalsIgnoreCase(currentUser.getEmail())) {
                MaxeloClientTable existingUser = matfl.findByEmail(email);
                if (existingUser != null && !existingUser.getId().equals(currentUser.getId())) {
                    request.setAttribute("errorMessage", "Email already exists for another user");
                    request.getRequestDispatcher("admin_edit_butten.jsp").forward(request, response);
                    return;
                }
            }
            
            // Update user details
            currentUser.setNames(name.trim());
            currentUser.setSurname(surname.trim());
            currentUser.setPhoneNumber(phoneNumber != null ? phoneNumber.trim() : null);
            currentUser.setRole(role != null ? role.trim() : null);
            currentUser.setEmail(email.trim());
            
            // Save changes
            matfl.edit(currentUser);
            
            // Update user in session
            session.setAttribute("user", currentUser);
            
            // Log the update
            logger.log(Level.INFO, "User details updated for ID: {0}", currentUser.getId());
            
            // Redirect to success page
            request.setAttribute("successMessage", "Profile updated successfully");
            request.getRequestDispatcher("admin_profile_updated.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error updating user profile", e);
            request.setAttribute("errorMessage", "An error occurred while updating your profile: " + e.getMessage());
            request.getRequestDispatcher("admin_edit_butten.jsp").forward(request, response);
        }
    }
}