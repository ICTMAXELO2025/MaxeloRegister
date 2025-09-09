/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.model;

import co.za.maxelo.bl.MaxeloClientTable;
import co.za.maxelo.businesslogic.MaxeloClientTableFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
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
public class AdminLongInServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(AdminLongInServlet.class.getName());
    
    @EJB
    private MaxeloClientTableFacadeLocal matfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String loginType = request.getParameter("check"); // Get login type (admin/employee)
        
        // Validate input
        if (email == null || email.trim().isEmpty() || 
            password == null || password.trim().isEmpty() ||
            loginType == null || loginType.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required");
            request.getRequestDispatcher("admin_login_incorrect_details.jsp").forward(request, response);
            return;
        }
        
        try {
            MaxeloClientTable user = matfl.findByEmail(email);
            
            if (user == null) {
                logger.log(Level.INFO, "Login attempt with non-existent email: {0}", email);
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("admin_login_incorrect_details.jsp").forward(request, response);
                return;
            }
            
            if (user.checkPassword(password)) {
                // Set session attributes for both cases
                session.setAttribute("user", user);
                session.setAttribute("userId", user.getId());
                session.setAttribute("userEmail", user.getEmail());
                session.setAttribute("userName", user.getNames() + " " + user.getSurname());
                session.setAttribute("userRole", user.getRole());
                session.setAttribute("userPosition", user.getPosition());
                session.setAttribute("numberOfEmployee", matfl.count());
                
                // Check role and login type combination
                if ("admin".equals(loginType) && "admin".equals(user.getRole())) {
                    // Admin logging in through admin form
                    
                    logger.log(Level.INFO, "Admin logged in successfully: {0}", email);
                    request.getRequestDispatcher("admin_login_dashboard.jsp").forward(request, response);
                    
                    
                } else if ("employee".equals(loginType) || "employee".equals(user.getRole())
                        ||"admin".equals(loginType) || "admin".equals(user.getRole())) {
                    // Employee logging in through employee form
                    logger.log(Level.INFO, "Employee logged in successfully: {0}", email);
                    request.getRequestDispatcher("z_employee_login_dashboard.jsp").forward(request, response);
                } else {
                    // Role and login type mismatch
                    logger.log(Level.WARNING, "Role mismatch for user: {0}, User role: {1}, Login type: {2}", 
                            new Object[]{email, user.getRole(), loginType});
                    session.invalidate(); // Clear the session
                    request.setAttribute("errorMessage", "You don't have permission to access this portal");
                    request.getRequestDispatcher("admin_login_incorrect_details.jsp").forward(request, response);
                }
            } else {
                logger.log(Level.WARNING, "Failed login attempt for email: {0}", email);
                request.setAttribute("errorMessage", "Invalid email or password");
                request.getRequestDispatcher("admin_login_incorrect_details.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during login process", e);
            request.setAttribute("errorMessage", "An error occurred during login. Please try again.");
            request.getRequestDispatcher("admin_login_incorrect_details.jsp").forward(request, response);
        }
    }
}