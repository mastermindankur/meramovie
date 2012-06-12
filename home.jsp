<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>

 <html>
      <head>  
      
      </head>  
      
      <body>  
      
      <form name="myForm" action="Search.action">
      <font size="7">CITY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <select name='city' onchange="showState(this.value)">  
      <script>
       this.value = city;
       <%
       String city2=request.getParameter("city");
      %>
      </script>
      
       <option value="none">Select</option>  
    <%
 	Class.forName("com.mysql.jdbc.Driver").newInstance();  
 	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mymovie","root","p@55word");  
 	Statement stmt = con.createStatement();  
 	ResultSet rs = stmt.executeQuery("Select DISTINCT city from theatre");
 	while(rs.next()){
     	%>
      	<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>  
      	<%
   		}
     %>
      </select>  
      
            
<script>      
    function showState(city){
    document.myForm.submit();
    alert(city);
    document.location.href ="home.jsp?city="+city; 
    this.value = city;
        <%
     String city=request.getParameter("city");
    
     System.out.println(city);
 	 stmt = con.createStatement();  
 	 ResultSet movies = stmt.executeQuery("SELECT m.name FROM movie m, theatre t, movie_runs_in_theatres mrit WHERE m.id = mrit.movie_id AND mrit.theatre_id = t.id AND t.city ='"+ city +"'");
 	%>
    }
    
    
</script>
      
      <br> 
      
  MOVIE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name='movie' >  
  <option value="none">Select</option>  
    <%
 
 while(movies.next()){
     %>
      <option value="<%=movies.getString(1)%>"><%=movies.getString(1)%></option>  
      <%
   }
     %>
 
      </select> 
      </br>
      
      <%
   
	    Calendar calendar = Calendar.getInstance();
	    
	    // get a date to represent "today"
	    Date today = calendar.getTime();
	 
	    // add one day to the date/calendar
	    calendar.add(Calendar.DAY_OF_YEAR, 1);
	    
	    // now get "tomorrow"
	    Date tomorrow = calendar.getTime();
	    
	    //add two days from current day
	    calendar.add(Calendar.DAY_OF_YEAR, 1);
	    Date dayAfterTomorrow = calendar.getTime();

      
      
      %>
      
    DATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select name='day' >  
  <option value="none">Select</option>  
      <option value="Today"><%= today %></option>  
      <option value="Tomorrow"><%= tomorrow %></option>  
      <option value="DayAfterTomorrow"><%= dayAfterTomorrow%></option>  
      </select> 
      
      
      </br>
      </br>
      </br>
      <input type="submit" value="Submit" />
</form>
 
       </font>
      
      
      </body> 
      </html>