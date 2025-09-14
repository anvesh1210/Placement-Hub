    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.dao.impl;

import in.tnpManagement.dao.SubjectDao;
import in.tnpManagement.pojo.SubjectPojo;
import in.tnpManagement.utility.DBUtil;
import in.tnpManagement.utility.IDUtil;
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
public class SubjectDaoImpl implements SubjectDao{

    @Override
    public int getNextSubjectId() {
        int nextId = -1;
        Connection conn = DBUtil.provideConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement("SELECT subject_seq.NEXTVAL FROM dual");
            rs = ps.executeQuery();
            if (rs.next()) {
                nextId = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println("Error getting next subject ID: " + ex);
            ex.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatemant(ps);
        }

        return nextId;
    }
    
    @Override
    public String addSubject(SubjectPojo subject) {
        PreparedStatement ps = null;
        Connection conn = DBUtil.provideConnection();
        String status = "error in adding subject";

        try {
            String sql = "INSERT INTO subjects (subject_id, name) VALUES (?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, getNextSubjectId());
            ps.setString(2, subject.getSubjectName());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = "Subject successfully added";
            }

        } catch (SQLException ex) {
            System.out.println("Error in adding subject: " + ex);
            ex.printStackTrace();
        }

    DBUtil.closeStatemant(ps);
    return status;    
    }

    @Override
    public String updateSubject(SubjectPojo subject) {
        PreparedStatement ps = null;
        Connection conn = DBUtil.provideConnection();
        String status = "error";

        try {
            String sql = "UPDATE subjects SET name = ? WHERE subject_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, subject.getSubjectName());
            ps.setInt(2, IDUtil.unwrap(subject.getSubjectId()));

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = "success";
            }

        } catch (SQLException ex) {
            System.out.println("Error in updating subject: " + ex);
            ex.printStackTrace();
        }

        DBUtil.closeStatemant(ps);
        return status;
    }

    @Override
    public String deleteSubject(String subjectId) {
        PreparedStatement ps = null;
        Connection conn = DBUtil.provideConnection();
        String status = "error";

        try {
            String sql = "DELETE FROM subjects WHERE subject_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, IDUtil.unwrap(subjectId));

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = "success";
            }

        } catch (SQLException ex) {
            System.out.println("Error in deleting subject: " + ex);
            ex.printStackTrace();
        }

        DBUtil.closeStatemant(ps);
        return status;
    }

    @Override
    public SubjectPojo getSubjectById(String subjectId) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = DBUtil.provideConnection();
        SubjectPojo subject = null;

        try {
            String sql = "SELECT * FROM subjects WHERE subject_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, IDUtil.unwrap(subjectId));
            rs = ps.executeQuery();

            if (rs.next()) {
                subject = new SubjectPojo();
                subject.setSubjectId(IDUtil.wrap("SUB", rs.getInt("subject_id")));
                subject.setSubjectName(rs.getString("name"));
            }

        } catch (SQLException ex) {
            System.out.println("Error in fetching subject by ID: " + ex);
            ex.printStackTrace();
        }

        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(ps);
        return subject;
    }

    @Override
    public List<SubjectPojo> getAllSubjects() {
        List<SubjectPojo> subjectList = new ArrayList<>();
        Statement st = null;
        ResultSet rs = null;
        Connection conn = DBUtil.provideConnection();

        try {
            st = conn.createStatement();
            rs = st.executeQuery("SELECT * FROM subjects");

            while (rs.next()) {
                SubjectPojo subject = new SubjectPojo();
                subject.setSubjectId(IDUtil.wrap("SUB", rs.getInt("subject_id")));
                subject.setSubjectName(rs.getString("name"));
                subjectList.add(subject);
            }

        } catch (SQLException ex) {
            System.out.println("Error in fetching all subjects: " + ex);
            ex.printStackTrace();
        }

        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(st);
        return subjectList;
    }


    @Override
    public boolean isSubjectExists(String subjectName) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = DBUtil.provideConnection();
        boolean exists = false;

        try {
            String sql = "SELECT 1 FROM subjects WHERE name = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, subjectName);

            rs = ps.executeQuery();
            if (rs.next()) {
                exists = true;
            }

        } catch (SQLException ex) {
            System.out.println("Error in checking subject existence: " + ex);
            ex.printStackTrace();
        }

        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(ps);
        return exists;
    }


    @Override
    public List<SubjectPojo> searchSubject(String keyword) {
        List<SubjectPojo> subjectList = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = DBUtil.provideConnection();

        try {
            String sql = "SELECT * FROM subjects WHERE name LIKE ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");

            rs = ps.executeQuery();

            while (rs.next()) {
                SubjectPojo subject = new SubjectPojo();
                subject.setSubjectId(IDUtil.wrap("SUB", rs.getInt("subject_id")));
                subject.setSubjectName(rs.getString("name"));
                subjectList.add(subject);
            }

        } catch (SQLException ex) {
            System.out.println("Error in searching subject: " + ex);
            ex.printStackTrace();
        }

        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(ps);
        return subjectList;
    }

    
}
