/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.servlets;

import in.tnpManagement.dao.FacultyDao;
import in.tnpManagement.dao.StudentDao;
import in.tnpManagement.dao.impl.FacultyDaoImpl;
import in.tnpManagement.dao.impl.StudentDaoImpl;
import in.tnpManagement.pojo.FacultyPojo;
import in.tnpManagement.pojo.StudentPojo;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class RegistrationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String status="registration failed";
               String password=request.getParameter("password");
               String conPassword=request.getParameter("confirmPassword");
               if(!password.equals(conPassword)){
                status="both password does not match";
                RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                request.setAttribute("message", status);
                rd.forward(request, response);
               } else{
                   if(request.getParameter("registerType").equalsIgnoreCase("student")){
                    StudentPojo student=new StudentPojo();   
                    student.setStuName(request.getParameter("fullName"));
                    student.setEnrollNo(request.getParameter("enrollment"));
                    student.setPhone(request.getParameter("stuPhone"));
                    student.setEmail(request.getParameter("stuEmail"));
                    student.setCollege(request.getParameter("stuCollege"));
                    student.setPassword(request.getParameter("password"));
                    student.setDept(request.getParameter("stuBranch"));
                    int year=Integer.parseInt(request.getParameter("stuYear"));
                    student.setYear(year);
                    
                    StudentDao stuDao=new StudentDaoImpl();
                    status=stuDao.registerStudent(student);
                    RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                    request.setAttribute("message", status);
                    rd.forward(request, response);
                }else{
                       FacultyPojo faculty=new FacultyPojo();
                       faculty.setEmail(request.getParameter("facultyEmail"));
                       faculty.setName(request.getParameter("fullName"));
                       faculty.setPhone(request.getParameter("facultyPhone"));
                       faculty.setDept(request.getParameter("facultyDept"));
                       faculty.setPassword(request.getParameter("password"));
                       
                       FacultyDao facultyDao=new FacultyDaoImpl();
                       status = facultyDao.registerFaculty(faculty);
                       RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                       request.setAttribute("message", status);
                       rd.forward(request, response);
                   }
            }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
