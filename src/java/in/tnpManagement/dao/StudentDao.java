/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.dao;

import in.tnpManagement.pojo.StudentPojo;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface StudentDao {
    public boolean isRegisterd(String enroll);
    public StudentPojo getStudentDetails(String enroll);
    public String isValidCredentials(String enroll,String password);
    public String updateStudentData(StudentPojo studentPojo);
    public String registerStudent(StudentPojo studentPojo);
    public String deleteStudent(String enroll);
    public List<StudentPojo> getAllStudents();
    public List<StudentPojo> searchStudents(String keyword);
}
