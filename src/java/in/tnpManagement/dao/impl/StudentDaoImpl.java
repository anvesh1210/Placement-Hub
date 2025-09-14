/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.dao.impl;

import in.tnpManagement.dao.StudentDao;
import in.tnpManagement.pojo.StudentPojo;
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
public class StudentDaoImpl implements StudentDao{

    @Override
    public boolean isRegisterd(String enroll) {
        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=DBUtil.provideConnection();
        boolean flag=false;
        try{
            ps=conn.prepareStatement("select 1 from students where enrollment_no=?");
            ps.setString(1,enroll);
            rs=ps.executeQuery();
            if(rs.next()){
                flag=true;
                
            }
        }catch(SQLException ex){
            System.out.println("Error in isRegisterd of student "+ex);
            ex.printStackTrace();
        }
        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(ps);
        return flag;
    }

    @Override
    public StudentPojo getStudentDetails(String enroll) {
        StudentPojo student=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=DBUtil.provideConnection();
        try{
        ps=conn.prepareStatement("select * from student where enrollment_no=?");
            ps.setString(1,enroll);
            rs=ps.executeQuery();
            if(rs.next()){
                student=new StudentPojo();
                student.setEnrollNo(rs.getString("enrollment_no"));
                student.setStuName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setPassword(rs.getString("password"));
                student.setDept(rs.getString("department"));
                student.setYear(rs.getInt("year"));
                student.setCollege(rs.getString("college"));
            }
    }catch(SQLException ex){
            
            System.out.println("Error in get student details"+ex);
            ex.printStackTrace();
        }
        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(ps);
        return student;
    }

    @Override
    public String isValidCredentials(String enroll, String password) {
        PreparedStatement ps=null;
        ResultSet rs=null;
        Connection conn=DBUtil.provideConnection();
        String status="Login Denied. Invalid enrollment or Password";
        try{
               ps=conn.prepareStatement("Select * from student where enrollment_no=? and password=?");
               ps.setString(1,enroll);
               ps.setString(2,password);
               rs=ps.executeQuery();
               if(rs.next()){
                   status="Login Succesful";      
                   }
               }
        catch(SQLException ex){
            status="Error:"+ex.getMessage();
            System.out.println("Error in isValidCredentials of student:"+ex);
            ex.printStackTrace();
        }       
       DBUtil.closeResultSet(rs);
       DBUtil.closeStatemant(ps);
       return status;
    }

    @Override
    public String updateStudentData(StudentPojo studentPojo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String registerStudent(StudentPojo studentPojo) {
        PreparedStatement ps = null;
        Connection conn = DBUtil.provideConnection();
        String status = "Registration failed";
        System.out.println(studentPojo.getPhone());
        System.out.println(studentPojo.getEmail());
        if(studentPojo.getEnrollNo()==null || studentPojo.getPassword()==null){
            return "please give enrollment no or password ";
        }
        try {
            String sql = "INSERT INTO student "
                    + "(enrollment_no, name, email, phone, password, department, year, college) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            ps = conn.prepareStatement(sql);
            ps.setString(1, studentPojo.getEnrollNo());
            ps.setString(2, studentPojo.getStuName());
            ps.setString(3, studentPojo.getEmail());
            ps.setString(4, studentPojo.getPhone());
            ps.setString(5, studentPojo.getPassword());  // password required at registration
            ps.setString(6, studentPojo.getDept());
            ps.setInt(7, studentPojo.getYear());
            ps.setString(8, studentPojo.getCollege());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = "Registration Successful now you can Login";
            }

        } catch (SQLException ex) {
            System.out.println("Error in registering student: " + ex);
            ex.printStackTrace();
        }

        DBUtil.closeStatemant(ps);
        return status;
    }


    @Override
    public String deleteStudent(String enroll) {
        PreparedStatement ps = null;
        Connection conn = DBUtil.provideConnection();
        String status = "error in deleting student";
        if(enroll == null){
            return "Please provide valid enrollment no";
        }

        try {
            String sql = "DELETE FROM student WHERE enrollment_no = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, enroll);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = "success";
            }
        } catch (SQLException ex) {
            System.out.println("Error in deleting student: " + ex);
            ex.printStackTrace();
        }

        DBUtil.closeStatemant(ps);
        return status;
    }


    @Override
    public List<StudentPojo> getAllStudents() {
        List<StudentPojo> productList=new ArrayList<>();
        Statement st=null;
        ResultSet rs=null;
        Connection conn=DBUtil.provideConnection();
        try{
            st=conn.createStatement();
            rs=st.executeQuery("Select * from student");
            while(rs.next()){
                StudentPojo student=new StudentPojo();
                student.setEnrollNo(rs.getString("enrollment_no"));
                student.setStuName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setPassword(rs.getString("password"));
                student.setDept(rs.getString("department"));
                student.setYear(rs.getInt("year"));
                student.setCollege(rs.getString("college"));
            }
    }catch(SQLException ex){
            
            System.out.println("Error in fatching All Students details"+ex);
            ex.printStackTrace();
        }
        DBUtil.closeResultSet(rs);
        DBUtil.closeStatemant(st);
        return productList;
    }

    @Override
    public List<StudentPojo> searchStudents(String keyword) {
        List<StudentPojo> list = new ArrayList<>();
        Connection conn = DBUtil.provideConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;  
    try {
        String sql = "SELECT * FROM student WHERE "
                   + "ENROLLMENT_NO LIKE ? OR "
                   + "NAME LIKE ? OR "
                   + "DEPARTMENT LIKE ? OR "
                   + "YEAR LIKE ?";
        ps = conn.prepareStatement(sql);
        String key = "%" + keyword + "%";
        for (int i = 1; i <= 4; i++) {
            ps.setString(i, key);
        }
        rs = ps.executeQuery();
        while (rs.next()) {
            StudentPojo sp = new StudentPojo();
            sp.setEnrollNo(rs.getString("ENROLLMENT_NO"));
            sp.setStuName(rs.getString("NAME"));
            sp.setEmail(rs.getString("EMAIL"));
            sp.setPhone(rs.getString("PHONE"));
            sp.setDept(rs.getString("DEPARTMENT"));
            sp.setYear(rs.getInt("YEAR"));
            sp.setCollege(rs.getString("COLLEGE"));
            list.add(sp);
        }
    } catch (Exception ex) {
        System.out.println("Error in searchStudents "+ex);
        ex.printStackTrace();
    }
     DBUtil.closeResultSet(rs);
    DBUtil.closeStatemant(ps);
    return list;
    }
    
    
}
