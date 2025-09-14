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
public class FacultyPojo {
    private String email;
    private String name;
    private String phone;
    private String dept;
    private String password;

    public FacultyPojo() {
    }

    public FacultyPojo(String email, String name, String phone, String dept, String password) {
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.dept = dept;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Faculty{" + "email=" + email + ", name=" + name + ", phone=" + phone + ", dept=" + dept + ", password=" + password + '}';
    }
    
    
}
