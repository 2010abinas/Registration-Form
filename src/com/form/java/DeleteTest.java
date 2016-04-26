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
public class DeleteTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DeleteTest() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String employeeId = request.getParameter("eId");
        try{
            
            System.out.println("loading drivers for mysql");
            Class.forName("com.mysql.jdbc.Driver");
            Connection  con=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/demo","root","1234567890");
            PreparedStatement ps=con.prepareStatement
                    ("delete from employee where eid = ?");
            
            ps.setString(1, employeeId);
           
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
