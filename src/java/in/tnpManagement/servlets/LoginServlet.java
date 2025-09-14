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
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class LoginServlet extends HttpServlet {

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
            String userId=request.getParameter("userId");
            String password=request.getParameter("password");
            String loginType=request.getParameter("loginType");
            
            String status="Login denied! Invalid userid or password";
            if(loginType.equalsIgnoreCase("student")){
                StudentDao studentDao=new StudentDaoImpl();
                status=studentDao.isValidCredentials(userId, password);
                
                if(status.equalsIgnoreCase("Login Succesful")){
                    StudentPojo student = studentDao.getStudentDetails(userId);  
                    RequestDispatcher rd=request.getRequestDispatcher("./StudentHomeServlet");
                    
                    HttpSession session=request.getSession();
                    session.setAttribute("studentData",student);
                    session.setAttribute("enrollment", userId);
                    session.setAttribute("password", password);
                    session.setAttribute("loginType", loginType);
                    
                    rd.forward(request, response);
            }else{
                System.out.println(status);
                RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                request.setAttribute("message", status);
                rd.forward(request, response);
                }
            }else if(loginType.equalsIgnoreCase("faculty")){
                FacultyDao facultyDao=new FacultyDaoImpl();
                status=facultyDao.isValidCredentials(userId, password);
                if(status.equalsIgnoreCase("Login Successful")){
                    FacultyPojo faculty = facultyDao.getFacultyDetails(userId);
                    RequestDispatcher rd=request.getRequestDispatcher("./FacultyHomeServlet");
                    HttpSession session=request.getSession();
                    session.setAttribute("facultyData",faculty);
                    session.setAttribute("email", userId);
                    session.setAttribute("password", password);
                    session.setAttribute("loginType", loginType);
                    rd.forward(request, response);
            }else{
                 RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                request.setAttribute("message", status);
                rd.forward(request, response);
                }   
            }else if(loginType.equalsIgnoreCase("admin")){
                
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
