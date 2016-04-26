<!doctype html>

<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="utf-8">
<title>Resistration Form</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script>
$(window).load(function(){
state1=new Array("Kolkata","Kharagpur","Durgapur","Siliguri");
state2=new Array('Patna','Gaya','Bhagalpur','Muzaffarpur','Hajipur');
state3=new Array('Bhubaneswar','cuttack','puri');

populateSelect();

$(function() {

      $('#State').change(function(){
        populateSelect();
    });
    
});


function populateSelect(){
    State=$('#State').val();
    $('#item').html('');
    
    
    if(State=='WestBengal'){
        state1.forEach(function(t) { 
            $('#item').append('<option>'+t+'</option>');
        });
    }
    
    if(State=='Bihar'){
        state2.forEach(function(t) {
            $('#item').append('<option>'+t+'</option>');
        });
    }
	if(State=='Orissa'){
        state3.forEach(function(t) {
            $('#item').append('<option>'+t+'</option>');
        });
    }
    
}
});

</script>

</head>

<body>


<%

String empid = request.getParameter("eid");
Class.forName("com.mysql.jdbc.Driver");
Connection  con=DriverManager.getConnection
        ("jdbc:mysql://localhost:3306/demo","root","1234567890");
Statement st = con.createStatement();
ResultSet rs =  st.executeQuery("Select * from employee where eid="+empid);
%>


 <form method="post" action="edit">
<% if(rs.next()){ %>
EmployeeId:<br>
	<input type="text" name="eId" disabled="disabled" value="<%=rs.getString("eid") %>">
	<br>
  First name:<br>
  <input type="text" name="firstname" value="<%=rs.getString("firstname") %>">
  <br>
  Last name:<br>
  <input type="text" name="lastname" value="<%=rs.getString("lastname") %>">
  <br>
  Age:<br>
  <input type="number" name="age" value="<%=rs.getString("Age") %>">
  <br>
  <br>
 
  <b>
  Adress:<br></b>
  <textarea name="address" value="<%=rs.getString("Adress") %>"><%=rs.getString("Adress") %></textarea>
<br>

<%} %>
<br>
<br>
<input type="submit" value="Submit">
</form>
<br>
</body>
</html>
