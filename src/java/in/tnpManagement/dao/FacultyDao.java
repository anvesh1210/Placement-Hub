/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.dao;

import in.tnpManagement.pojo.FacultyPojo;
import java.util.List;

/**
 *
 * @author DELL
 */
public interface FacultyDao {
    public String registerFaculty(FacultyPojo facultyPojo);
    public String isValidCredentials(String email, String password);
    public FacultyPojo getFacultyDetails(String email);
    public String updateFaculty(FacultyPojo facultyPojo);
    public String deleteFaculty(String email);
    public List<FacultyPojo> getAllFaculty();
    public List<FacultyPojo> searchFaculty(String keyword);
}
