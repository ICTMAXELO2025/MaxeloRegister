/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.businesslogic;

import co.za.maxelo.bl.MaxeloAttendenceRegisterTable;
import java.time.LocalDate;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author cash
 */
@Local
public interface MaxeloAttendenceRegisterTableFacadeLocal {

    void create(MaxeloAttendenceRegisterTable maxeloAttendenceRegisterTable);

    void edit(MaxeloAttendenceRegisterTable maxeloAttendenceRegisterTable);

    void remove(MaxeloAttendenceRegisterTable maxeloAttendenceRegisterTable);

    MaxeloAttendenceRegisterTable find(Object id);

    List<MaxeloAttendenceRegisterTable> findAll();

    List<MaxeloAttendenceRegisterTable> findRange(int[] range);

    // Add these methods to your facade interface
    MaxeloAttendenceRegisterTable findTodaysClockInByEmployee(Long employeeId, String date);

    List<MaxeloAttendenceRegisterTable> findTodaysRecordsByEmployee(Long employeeId, LocalDate date);

    // In MaxeloAttendenceRegisterTableFacadeLocal.java
    List<MaxeloAttendenceRegisterTable> findByEmployeeIdAndDate(Long employeeId, LocalDate date);

    // NEW: Method to find by employee ID, date, and attendance type
    List<MaxeloAttendenceRegisterTable> findByEmployeeIdAndDateAndAttendanceType(Long employeeId);

    int count();

}
