/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.pojo;

/**
 *
 * @author DELL
 */
public class StudentPojo {
    private String enrollNo;
    private String stuName;
    private String email;
    private String phone;
    private String password;
    private String dept;
    private int year;
    private String college;

    public StudentPojo(String enrollNo, String stuName, String email, String phone, String password, String dept, int year, String college) {
        this.enrollNo = enrollNo;
        this.stuName = stuName;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.dept = dept;
        this.year = year;
        this.college = college;
    }

    public StudentPojo() {
    }
    
    public String getEnrollNo() {
        return enrollNo;
    }

    public void setEnrollNo(String enrollNo) {
        this.enrollNo = enrollNo;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    @Override
    public String toString() {
        return "Student{" + "enrollNo=" + enrollNo + ", stuName=" + stuName + ", email=" + email + ", phone=" + phone + ", password=" + password + ", dept=" + dept + ", year=" + year + ", college=" + college + '}';
    }
    
    
}
