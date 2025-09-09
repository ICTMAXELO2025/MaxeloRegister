package co.za.maxelo.employee.clock;

import co.za.maxelo.bl.MaxeloAttendenceRegisterTable;
import co.za.maxelo.bl.MaxeloClientTable;
import co.za.maxelo.businesslogic.MaxeloAttendenceRegisterTableFacadeLocal;
import co.za.maxelo.businesslogic.MaxeloClientTableFacadeLocal;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
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

public class ClockInServlet extends HttpServlet {

    private static final Logger logger = Logger.getLogger(ClockInServlet.class.getName());

    @EJB
    private MaxeloAttendenceRegisterTableFacadeLocal martfl;

    @EJB
    private MaxeloClientTableFacadeLocal mctfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            MaxeloClientTable user = (MaxeloClientTable) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("employee_login.jsp");
                return;
            }

            String attendanceType = request.getParameter("attendanceType");
            String notes = request.getParameter("notes");

            if (attendanceType == null || attendanceType.trim().isEmpty()) {
                session.setAttribute("errorMessage", "Please select an attendance type (Remote or Office)");
                response.sendRedirect("z_employee_login_dashboard.jsp");
                return;
            }

            LocalDateTime now = LocalDateTime.now();
            LocalDate today = now.toLocalDate();
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

            // Check for existing clock-in using date only comparison
            if (hasClockedInToday(user.getId(), today)) {
                session.setAttribute("errorMessage", "You have already clocked in today");
                response.sendRedirect("z_employee_login_dashboard.jsp");
                return;
            }
            
            

            MaxeloAttendenceRegisterTable mart = new MaxeloAttendenceRegisterTable();
            mart.setTimeIn(now);
            mart.setAttendanceDate(today);  // Use LocalDate instead of LocalDateTime
            mart.setAttendanceType(attendanceType);
            mart.setNotes(notes != null ? notes.trim() : null);
            mart.setClient(user);

            martfl.create(mart);

            // Update session attributes
            session.setAttribute("hasClockedInToday", true);
            session.setAttribute("hasClockedOutToday", false);
            session.setAttribute("clockInTime", now.format(timeFormatter));
            session.setAttribute("attendanceType", attendanceType);
            session.setAttribute("successMessage", "Clocked in successfully at " + now.format(timeFormatter));

            logger.log(Level.INFO, "Employee {0} {1} clocked in at {2}",
                    new Object[]{user.getNames(), user.getSurname(), now.format(timeFormatter)});

            response.sendRedirect("z_employee_login_dashboard.jsp");

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during clock in process", e);
            session.setAttribute("errorMessage", "An error occurred during clock in. Please try again.");
            response.sendRedirect("z_employee_login_dashboard.jsp");
        }
    }

    private boolean hasClockedInToday(Long employeeId, LocalDate today) {
        try {
            List<MaxeloAttendenceRegisterTable> records = martfl.findByEmployeeIdAndDate(employeeId, today);
            logger.info("Found " + records.size() + " records for employee " + employeeId + " on date " + today);
            return !records.isEmpty();
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error checking existing clock-in", e);
            return false; // Allow clock-in on error
        }
    }
}
