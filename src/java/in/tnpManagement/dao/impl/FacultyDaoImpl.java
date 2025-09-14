/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.dao.impl;

import in.tnpManagement.dao.FacultyDao;
import in.tnpManagement.pojo.FacultyPojo;
import in.tnpManagement.utility.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class FacultyDaoImpl implements FacultyDao{
    
    public String registerFaculty(FacultyPojo facultyPojo) {
        PreparedStatement ps = null;
        Connection conn = DBUtil.provideConnection();
        String status = "Registration failed";
        if (facultyPojo.getEmail() == null || facultyPojo.getPassword() == null) {
            return "Please provide email and password";
        }
        try {
            String sql = "INSERT INTO faculty (email, name, phone, department, password_hash) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, facultyPojo.getEmail());
            ps.setString(2, facultyPojo.getName());
            ps.setString(3, facultyPojo.getPhone());
            ps.setString(4, facultyPojo.getDept());
            ps.setString(5, facultyPojo.getPassword());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = "Registration Successful now you can login";
            }
        } catch (SQLException ex) {
            System.out.println("Error in registering faculty: " + ex);
            ex.printStackTrace();
        }
        DBUtil.closeStatemant(ps);
        return status;
    }

    @Override
    public String isValidCredentials(String email, String password) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = DBUtil.provideConnection();
        String status = "Login Denied. Invalid email or password";
        try {
            ps = conn.prepareStatement("SELECT 1 FROM faculty WHERE email=? AND password_hash=?");
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                status = "Login Successful";
            }
        } catch (SQLException ex) {
            status = "Error: " + ex.getMessage();
            System.out.println("Error in isValidCredentials of faculty: " + ex);
            ex.printStackTrace();
        }
        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(ps);
        return status;
    }

    @Override
    public FacultyPojo getFacultyDetails(String email) {
        FacultyPojo faculty = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = DBUtil.provideConnection();
        try {
            ps = conn.prepareStatement("SELECT * FROM faculty WHERE email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                faculty = new FacultyPojo();
                faculty.setEmail(rs.getString("email"));
                faculty.setName(rs.getString("name"));
                faculty.setPhone(rs.getString("phone"));
                faculty.setDept(rs.getString("department"));
                faculty.setPassword(rs.getString("password_hash"));
            }
        } catch (SQLException ex) {
            System.out.println("Error in getFacultyDetails: " + ex);
            ex.printStackTrace();
        }
        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(ps);
        return faculty;
    }

    @Override
    public String updateFaculty(FacultyPojo facultyPojo) {
        PreparedStatement ps = null;
        Connection conn = DBUtil.provideConnection();
        String status = "Update failed";
        try {
            String sql = "UPDATE faculty SET name=?, phone=?, department=?, password_hash=? WHERE email=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, facultyPojo.getName());
            ps.setString(2, facultyPojo.getPhone());
            ps.setString(3, facultyPojo.getDept());
            ps.setString(4, facultyPojo.getPassword());
            ps.setString(5, facultyPojo.getEmail());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = "success";
            }
        } catch (SQLException ex) {
            System.out.println("Error in updating faculty: " + ex);
            ex.printStackTrace();
        }
        DBUtil.closeStatemant(ps);
        return status;
    }

    @Override
    public String deleteFaculty(String email) {
        PreparedStatement ps = null;
        Connection conn = DBUtil.provideConnection();
        String status = "Error in deleting faculty";
        if (email == null) {
            return "Please provide a valid email";
        }
        try {
            String sql = "DELETE FROM faculty WHERE email=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = "success";
            }
        } catch (SQLException ex) {
            System.out.println("Error in deleting faculty: " + ex);
            ex.printStackTrace();
        }
        DBUtil.closeStatemant(ps);
        return status;
    }

    @Override
    public List<FacultyPojo> getAllFaculty() {
        List<FacultyPojo> list = new ArrayList<>();
        Statement st = null;
        ResultSet rs = null;
        Connection conn = DBUtil.provideConnection();
        try {
            st = conn.createStatement();
            rs = st.executeQuery("SELECT * FROM faculty");
            while (rs.next()) {
                FacultyPojo faculty = new FacultyPojo();
                faculty.setEmail(rs.getString("email"));
                faculty.setName(rs.getString("name"));
                faculty.setPhone(rs.getString("phone"));
                faculty.setDept(rs.getString("department"));
                faculty.setPassword(rs.getString("password_hash"));
                list.add(faculty);
            }
        } catch (SQLException ex) {
            System.out.println("Error in getAllFaculty: " + ex);
            ex.printStackTrace();
        }
        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(st);
        return list;
    }

    @Override
    public List<FacultyPojo> searchFaculty(String keyword) {
        List<FacultyPojo> list = new ArrayList<>();
        Connection conn = DBUtil.provideConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM faculty WHERE email LIKE ? OR name LIKE ? OR department LIKE ?";
            ps = conn.prepareStatement(sql);
            String key = "%" + keyword + "%";
            ps.setString(1, key);
            ps.setString(2, key);
            ps.setString(3, key);

            rs = ps.executeQuery();
            while (rs.next()) {
                FacultyPojo faculty = new FacultyPojo();
                faculty.setEmail(rs.getString("email"));
                faculty.setName(rs.getString("name"));
                faculty.setPhone(rs.getString("phone"));
                faculty.setDept(rs.getString("department"));
                faculty.setPassword(rs.getString("password_hash"));
                list.add(faculty);
            }
        } catch (Exception ex) {
            System.out.println("Error in searchFaculty: " + ex);
            ex.printStackTrace();
        }
        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(ps);
        return list;
    }

    
}
