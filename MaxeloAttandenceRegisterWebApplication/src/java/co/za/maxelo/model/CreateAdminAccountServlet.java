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
public class CreateAdminAccountServlet extends HttpServlet {
    
    @EJB
    private MaxeloClientTableFacadeLocal matfl;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        
        String names = request.getParameter("names");
        String surname = request.getParameter("surname");
        String phone_number = (String)request.getParameter("phone_number");
        String role = (String)request.getParameter("role");
        String position = request.getParameter("position");
        String emails = (String)request.getParameter("email");
        String password = (String)request.getParameter("password");
        
        
        MaxeloClientTable mat = new MaxeloClientTable();
        mat.setNames(names);
        mat.setSurname(surname);
        mat.setPhoneNumber(phone_number);
        mat.setRole(role);
        mat.setPosition(position);
        mat.setEmail(emails);
        mat.setPassword(password);
       
         
        
        matfl.create(mat);
        request.getRequestDispatcher("admin_account_successful.jsp").forward(request, response);
        
        
    }

   

}
