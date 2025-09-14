/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.pojo;

import java.util.Date;

/**
 *
 * @author DELL
 */
public class AttendancePojo {
    private String enrollNo;
    private Date date;
    private boolean isPresent;

    public AttendancePojo() {
    }

    public AttendancePojo(String enrollNo, Date date, boolean isPresent) {
        this.enrollNo = enrollNo;
        this.date = date;
        this.isPresent = isPresent;
    }

    public String getEnrollNo() {
        return enrollNo;
    }

    public void setEnrollNo(String enrollNo) {
        this.enrollNo = enrollNo;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean isIsPresent() {
        return isPresent;
    }

    public void setIsPresent(boolean isPresent) {
        this.isPresent = isPresent;
    }
    
    
}
