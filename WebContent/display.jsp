<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function editEmployee(){
	var checkedValue = null; 
	var inputElements = document.getElementsByName("rowId");
	for(var i=0; inputElements[i]; ++i){
	      if(inputElements[i].checked){
	           checkedValue = inputElements[i].value;
	           break;
	      }
	}
    var jspcall = "edit.jsp?eid="+checkedValue;
    window.location.href = jspcall;
    }
    
function deleteEmployee(){
	var checkedValue = null; 
	var inputElements = document.getElementsByName("rowId");
	for(var i=0; inputElements[i]; ++i){
	      if(inputElements[i].checked){
	           checkedValue = inputElements[i].value;
	           break;
	      }
	}
    var jspcall = "delete?eId="+checkedValue;
    window.location.href = jspcall;
    }


</script>

</head>

<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection  con=DriverManager.getConnection
        ("jdbc:mysql://localhost:3306/demo","root","1234567890");
Statement st = con.createStatement();
ResultSet rs =  st.executeQuery("Select * from employee");
%>
<table border='1'>
<tr>
 	<th>	</th>
 	<th>eid</th>
 	<th>Name</th>
 	<th>Age</th>
 	<th>Adress</th>
</tr>
	<% while(rs.next()){ %>
 <TR>
 				<td><input type="checkbox" id="rowId" name="rowId" value="<%= rs.getString("eid") %>" ></td>
                <TD id="eid"> <%= rs.getString("eid") %></td>
                <TD> <%= rs.getString("firstname") %> &nbsp;<%= rs.getString("lastname") %></TD>
                <TD> <%= rs.getString("Age") %></TD>
                <TD> <%= rs.getString("Adress") %></TD>
            </TR>
            <% } %>
            </TABLE>
            
            <input type="button" name="edit" value="EDIT" onclick="editEmployee()"/>
            <input type="button" name="delete" value="DELETE" onclick="deleteEmployee()"/>
            
            
</body>
</html>