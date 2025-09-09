/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.employee.model;

import co.za.maxelo.bl.MaxeloClientTable;
import co.za.maxelo.businesslogic.MaxeloAttendenceRegisterTableFacadeLocal;
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

/**
 *
 * @author cash
 */
public class ViewEmployeeRegisterServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(ViewEmployeeRegisterServlet.class.getName());
    
    @EJB
    private MaxeloClientTableFacadeLocal mctfl;
    
    @EJB
    private MaxeloAttendenceRegisterTableFacadeLocal maryfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            List<MaxeloClientTable> userList = mctfl.findAll();
            
            if (userList != null && !userList.isEmpty()) {
                request.setAttribute("userList", userList);
                logger.log(Level.INFO, "Retrieved {0} employees for register view", userList.size());
            } else {
                logger.log(Level.INFO, "No employees found in database");
                request.setAttribute("message", "No employees found in the system.");
            }
            
            request.getRequestDispatcher("employee_register_list.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error retrieving employee list for register view", e);
            request.setAttribute("errorMessage", "Error retrieving employee list: " + e.getMessage());
            request.getRequestDispatcher("error_page.jsp").forward(request, response);
        }
    }
}