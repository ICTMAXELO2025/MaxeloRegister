/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.za.maxelo.bl;

import co.za.maxelo.clesses.PasswordUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 *
 * @author cash
 */
@Entity
@Table(name = "maxelo_client_table")
public class MaxeloClientTable implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Changed to IDENTITY
    private Long id;

    @Column(name = "names", nullable = false)
    private String names;

    @Column(name = "surname", nullable = false)
    private String surname;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "role")
    private String role;

    @Column(name = "position")
    private String position;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "password", nullable = false, length = 255)
    private String password;

    // One-to-Many relationship with attendance register
    @OneToMany(mappedBy = "client", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<MaxeloAttendenceRegisterTable> attendanceRecords = new ArrayList<>();

    public MaxeloClientTable() {
    }

    public MaxeloClientTable(String names, String surname, String phoneNumber, 
                           String role, String position, String email, String password) {
        this.names = names;
        this.surname = surname;
        this.phoneNumber = phoneNumber;
        this.role = role;
        this.position = position;
        this.email = email;
        setPassword(password);
    }

    // Regular getter for JPA (returns the actual stored value)
    public String getPassword() {
        return this.password;
    }

    // Setter that automatically hashes the password
    public void setPassword(String plainPassword) {
        this.password = PasswordUtil.hashPassword(plainPassword);
    }

    // Method to check if a plain text password matches the stored hash
    public boolean checkPassword(String plainPassword) {
        return PasswordUtil.checkPassword(plainPassword, this.password);
    }

    // Method to get masked password for display purposes only
    @Transient
    public String getMaskedPassword() {
        return "********";
    }

    // Helper method to add attendance record
    public void addAttendanceRecord(MaxeloAttendenceRegisterTable attendanceRecord) {
        attendanceRecords.add(attendanceRecord);
        attendanceRecord.setClient(this);
    }

    // Helper method to remove attendance record
    public void removeAttendanceRecord(MaxeloAttendenceRegisterTable attendanceRecord) {
        attendanceRecords.remove(attendanceRecord);
        attendanceRecord.setClient(null);
    }

    // Standard getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNames() {
        return names;
    }

    public void setNames(String names) {
        this.names = names;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public List<MaxeloAttendenceRegisterTable> getAttendanceRecords() {
        return attendanceRecords;
    }

    public void setAttendanceRecords(List<MaxeloAttendenceRegisterTable> attendanceRecords) {
        this.attendanceRecords = attendanceRecords;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof MaxeloClientTable)) {
            return false;
        }
        MaxeloClientTable other = (MaxeloClientTable) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "MaxeloClientTable{" +
                "id=" + id +
                ", names='" + names + '\'' +
                ", surname='" + surname + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}