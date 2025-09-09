/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.employee.clock;

import co.za.maxelo.bl.MaxeloAttendenceRegisterTable;
import co.za.maxelo.bl.MaxeloClientTable;
import co.za.maxelo.businesslogic.MaxeloAttendenceRegisterTableFacadeLocal;
import co.za.maxelo.businesslogic.MaxeloClientTableFacadeLocal;
import java.io.IOException;
import java.time.LocalDate;
import static java.time.LocalDate.now;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
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
public class ClockOutServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(ClockOutServlet.class.getName());

    @EJB
    private MaxeloAttendenceRegisterTableFacadeLocal martfl;

    @EJB
    private MaxeloClientTableFacadeLocal mctfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("admin_login.jsp");
            return;
        }

        try {
            // Get the current user ID from session
            Long userId = (Long) session.getAttribute("userId");
            MaxeloClientTable mct = mctfl.find(userId);

            if (mct == null) {
                logger.log(Level.WARNING, "User not found with ID: {0}", userId);
                request.setAttribute("errorMessage", "User not found");
                request.getRequestDispatcher("z_employee_login_dashboard.jsp").forward(request, response);
                return;
            }

            // Get current date and time
            LocalDate currentDate = LocalDate.now();
            LocalDateTime currentTime = LocalDateTime.now();
            
            // Format the date to match how it's stored in the database
            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            String formattedDate = currentDate.format(dateFormatter);
            
            // Find today's attendance record for this user
            List<MaxeloAttendenceRegisterTable> attendanceRecords = mct.getAttendanceRecords();
            MaxeloAttendenceRegisterTable todayRecord = null;
            
            for (MaxeloAttendenceRegisterTable record : attendanceRecords) {
                if (record.getAttendanceDate()!= null && record.getAttendanceDate().toString().equals(formattedDate)) {
                    todayRecord = record;
                    break;
                }
            }
            
            if (todayRecord == null) {
                logger.log(Level.WARNING, "No clock-in record found for today for user: {0}", mct.getEmail());
                request.setAttribute("errorMessage", "You haven't clocked in today");
                request.getRequestDispatcher("z_employee_login_dashboard.jsp").forward(request, response);
                return;
            }
            
            if (todayRecord.getTimeOut() != null) {
                logger.log(Level.INFO, "User already clocked out today: {0}", mct.getEmail());
                request.setAttribute("errorMessage", "You have already clocked out today");
                request.getRequestDispatcher("z_employee_login_dashboard.jsp").forward(request, response);
                return;
            }
            
            // Set clock-out time
            todayRecord.setTimeOut(currentTime);
            martfl.edit(todayRecord);
            
            logger.log(Level.INFO, "User clocked out successfully: {0}", mct.getEmail());
            request.setAttribute("successMessage", "Clocked out successfully at " + currentTime);
            request.getRequestDispatcher("z_employee_login_dashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during clock-out process", e);
            request.setAttribute("errorMessage", "An error occurred during clock-out. Please try again.");
            request.getRequestDispatcher("z_employee_login_dashboard.jsp").forward(request, response);
        }
    }
}