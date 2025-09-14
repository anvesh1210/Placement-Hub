/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package in.tnpManagement.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author DELL
 */
public class DBUtil {
    private static Connection conn;
    public static void openConnection(String dbUrl, String username, String password){
        if(conn==null){
            try{
                conn=DriverManager.getConnection(dbUrl, username, password);
                System.out.println("TNP Management Connection opened");
            }catch(SQLException ex){
                System.out.println("Error in opening Connection of TNP Management");
                ex.printStackTrace();
            }
        }
    }
    public static void closeConnection(){
        if(conn!=null){
            try{
                conn.close();
                System.out.println("Connection Closed of TNP Management");
            }catch(SQLException ex){
                System.out.println("Error in closing Connection of TNP Management");
                ex.printStackTrace();
            }
        }
    }
    public static Connection provideConnection(){
        return conn;
    }
    public static void closeResultSet(ResultSet rs){
        if(rs!=null){
            try{
                rs.close();
            }catch(SQLException ex){
                System.out.println("Error in closing ResultSet of TNP Management" );
                ex.printStackTrace();
            }
        }
    }
    public static void closeStatemant(Statement st){
        if(st!=null){
            try{
                st.close();
            }catch(SQLException ex){
                System.out.println("Error in closing Statement of TNP Management");
                ex.printStackTrace();
            }
        }
    }
}
