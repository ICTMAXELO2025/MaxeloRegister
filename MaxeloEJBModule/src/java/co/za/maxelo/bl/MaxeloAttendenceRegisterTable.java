/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.bl;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author cash
 */
@Entity
@Table(name = "maxelo_attendence_register")

public class MaxeloAttendenceRegisterTable implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Changed to IDENTITY for auto-increment
    private Long id;

    @Column(name = "time_in")
    private LocalDateTime timeIn;

    @Column(name = "time_out")
    private LocalDateTime timeOut;

    @Column(name = "attendance_date")
    private LocalDate attendanceDate;

    @Column(name = "attendance_type") // e.g., office, remote
    private String attendanceType;

    @Column(name = "notes", length = 500) // Added length for notes
    private String notes;

    // Many-to-One relationship with client
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "client_id", nullable = false) // Added nullable constraint
    private MaxeloClientTable client;

    public MaxeloAttendenceRegisterTable() {
    }

    public MaxeloAttendenceRegisterTable(LocalDateTime timeIn, LocalDateTime timeOut,
            LocalDate attendanceDate, String attendanceType,
            String notes, MaxeloClientTable client) {
        this.timeIn = timeIn;
        this.timeOut = timeOut;
        this.attendanceDate = attendanceDate;
        this.attendanceType = attendanceType;
        this.notes = notes;
        this.client = client;
    }

    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDateTime getTimeIn() {
        return timeIn;
    }

    public void setTimeIn(LocalDateTime timeIn) {
        this.timeIn = timeIn;
    }

    public LocalDateTime getTimeOut() {
        return timeOut;
    }

    public void setTimeOut(LocalDateTime timeOut) {
        this.timeOut = timeOut;
    }

    public LocalDate getAttendanceDate() {
        return attendanceDate;
    }

    public void setAttendanceDate(LocalDate attendanceDate) {
        this.attendanceDate = attendanceDate;
    }

    public String getAttendanceType() {
        return attendanceType;
    }

    public void setAttendanceType(String attendanceType) {
        this.attendanceType = attendanceType;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public MaxeloClientTable getClient() {
        return client;
    }

    public void setClient(MaxeloClientTable client) {
        this.client = client;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof MaxeloAttendenceRegisterTable)) {
            return false;
        }
        MaxeloAttendenceRegisterTable other = (MaxeloAttendenceRegisterTable) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "MaxeloAttendenceRegisterTable{"
                + "id=" + id
                + ", timeIn=" + timeIn
                + ", timeOut=" + timeOut
                + ", attendanceDate=" + attendanceDate
                + ", attendanceType='" + attendanceType + '\''
                + ", notes='" + notes + '\''
                + ", client=" + (client != null ? client.getId() : "null")
                + '}';
    }
}
