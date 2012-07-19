<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>

 <html>
      <head> 
     <link href="style.css" rel="stylesheet">
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
      </head>  
      
      <body>  
 <script type="text/javascript">
$(function(){

      var get_city = get_url('city');
    $("#city option").each(function(){
    
       if ($(this).attr('value') == get_city ){ $(this).prop("selected", true);}
       
    });
   $('.button').css("visibility", "hidden");
      // bind change event to select
      $('#day').on('change',function(){
       if($('#city').attr('value')!='none' && $('#movie').attr('value')!='none' && $('#day').attr('value')!='none')
        { $(".button").css("visibility", "visible").fadeIn('slow');
        } else {
           $(".button").css("visibility", "hidden");
        }
        });
      $('#city').on('change', function () {
        
          var city = $(this).attr('value'); // get selected value
          alert(city);
         location.href ="home.jsp?city="+city;
         
      });
 function get_url( name )
{
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return "";
  else
    return results[1];
}
       
    });
  
 </script>     
      <form name="myForm" action="Search.action">
     <div id="alignment"><div id="mainselection"> <select name="city" id="city">  
      
      
       <option value="none">Select City </option>  
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
           
      </select>  </div></div>
      
            
<script>      
    function showState(city){
    
    //this.value = gup(city);
    alert(city);
    
              location.href = "home.jsp?city="+city; // redirect
       
    //location.href ="home.jsp?city="+city; 
    
    
        <%
     String city=request.getParameter("city");
    
     System.out.println(city);
 	 stmt = con.createStatement();  
 	 ResultSet movies = stmt.executeQuery("SELECT DISTINCT m.name FROM movie m, theatre t, movie_runs_in_theatres mrit WHERE m.id = mrit.movie_id AND mrit.theatre_id = t.id AND t.city ='"+ city +"'");
 	%>
    }
    
    
</script>
      
     
      
  <div id="alignment"> <div id="mainselection"><select name='movie' id="movie">  
  <option value="none">Select Movie</option>  
    <%
 
 while(movies.next()){
     %>
      <option value="<%=movies.getString(1)%>"><%=movies.getString(1)%></option>  
      <%
   }
     %>
 
      </select> 
     
      
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

      
      
      %></div></div>
      
     <div id="alignment"><div id="mainselection"> <select name='day' id="day">  
  <option value="none">Select Date</option>  
      <option value="Today"><%= today %></option>  
      <option value="Tomorrow"><%= tomorrow %></option>  
      <option value="DayAfterTomorrow"><%= dayAfterTomorrow%></option>  
      </select> 
      
      </div><input type="submit" value="Submit" class="button" /></div>
      
      
</form>
 
       </font>
      
      
      </body> 
      </html>