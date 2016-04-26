package com.form.java; 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Form
 */
//@WebServlet("/Form")
public class EditTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EditTest() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String employeeId = request.getParameter("eId");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String Age = request.getParameter("age");
        String address = request.getParameter("address");
         
        try{
            
            //loading drivers for mysql
            Class.forName("com.mysql.jdbc.Driver");
            Connection  con=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/demo","root","1234567890");
            PreparedStatement ps=con.prepareStatement
                    ("update employee set firstname = ?,lastname =?, Age= ?,Adress =? where eid = ?");
            
            ps.setString(5, employeeId);
            ps.setString(1, firstname);
            ps.setString(2, lastname);
            ps.setString(3, Age);
            ps.setString(4, address);
            int i = 0;
           try{
             i=ps.executeUpdate();
           }catch(Exception e){
           }
            
            if(i>0)
            {
              out.println("TABLE:");
            }
            response.sendRedirect("display.jsp"); 
          }
          catch(Exception se)
          {
              se.printStackTrace();
          }
		// TODO Auto-generated method stub
	}

}
