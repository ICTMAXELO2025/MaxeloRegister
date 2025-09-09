/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.businesslogic;

import co.za.maxelo.bl.MaxeloAttendenceRegisterTable;
import static com.sun.xml.ws.security.addressing.impl.policy.Constants.logger;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author cash
 */
@Stateless
public class MaxeloAttendenceRegisterTableFacade extends AbstractFacade<MaxeloAttendenceRegisterTable> implements MaxeloAttendenceRegisterTableFacadeLocal {

    @PersistenceContext(unitName = "MaxeloEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MaxeloAttendenceRegisterTableFacade() {
        super(MaxeloAttendenceRegisterTable.class);
    }

    @Override
    public MaxeloAttendenceRegisterTable findTodaysClockInByEmployee(Long employeeId, String date) {
        try {
            return (MaxeloAttendenceRegisterTable) getEntityManager()
                    .createQuery("SELECT a FROM MaxeloAttendenceRegisterTable a WHERE a.client.id = :employeeId AND a.attendanceDate = :date AND a.timeOut IS NULL")
                    .setParameter("employeeId", employeeId)
                    .setParameter("date", LocalDate.parse(date)) // Adjust based on your date format
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<MaxeloAttendenceRegisterTable> findTodaysRecordsByEmployee(Long employeeId, LocalDate date) {
        try {
            return em.createQuery("SELECT m FROM MaxeloAttendenceRegisterTable m WHERE m.client.id = :employeeId AND m.attendanceDate = :date", MaxeloAttendenceRegisterTable.class)
                    .setParameter("employeeId", employeeId)
                    .setParameter("date", date)
                    .getResultList();
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error finding today's records by employee", e);
            return Collections.emptyList();
        }
    }

    // If your database column is DATETIME, use this query instead:
    @Override
    public List<MaxeloAttendenceRegisterTable> findByEmployeeIdAndDate(Long employeeId, LocalDate date) {
        try {
            LocalDateTime startOfDay = date.atStartOfDay();
            LocalDateTime endOfDay = date.plusDays(1).atStartOfDay();

            return em.createQuery("SELECT m FROM MaxeloAttendenceRegisterTable m WHERE m.client.id = :employeeId AND m.attendanceDate BETWEEN :start AND :end", MaxeloAttendenceRegisterTable.class)
                    .setParameter("employeeId", employeeId)
                    .setParameter("start", startOfDay)
                    .setParameter("end", endOfDay)
                    .getResultList();
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error finding attendance records by employee and date", e);
            return Collections.emptyList();
        }
    }

    @Override
    public List<MaxeloAttendenceRegisterTable> findByEmployeeIdAndDateAndAttendanceType(
            Long employeeId) {
        TypedQuery<MaxeloAttendenceRegisterTable> query = (TypedQuery<MaxeloAttendenceRegisterTable>) em.createNamedQuery(
                "SELECT m FROM MaxeloAttendenceRegisterTable m WHERE m.employee.id = :employeeId AND m.attendanceType IS NOT NULL");
        query.setParameter("employeeId", employeeId);
        return query.getResultList();
    }

}
