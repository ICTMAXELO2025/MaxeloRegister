/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.employee.model;

import co.za.maxelo.bl.MaxeloClientTable;
import co.za.maxelo.businesslogic.MaxeloClientTableFacadeLocal;
import java.io.IOException;
import java.util.List;
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
public class ViewAllEmployeeServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(ViewAllEmployeeServlet.class.getName());
    
    @EJB
    private MaxeloClientTableFacadeLocal mctfl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        
        try {
            List<MaxeloClientTable> allUser = mctfl.findAll();
            
            if (allUser != null && !allUser.isEmpty()) {
                session.setAttribute("allUser", allUser);
                logger.log(Level.INFO, "Found {0} employees", allUser.size());
            } else {
                logger.log(Level.INFO, "No employees found in the database");
                request.setAttribute("message", "No employees found in the system.");
            }
            
            request.getRequestDispatcher("employee_all_view_output.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error retrieving employee list", e);
            request.setAttribute("errorMessage", "Error retrieving employee list: " + e.getMessage());
            request.getRequestDispatcher("error_page.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // For consistency, we can make POST requests also call doGet
        doGet(request, response);
    }
}