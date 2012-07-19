<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>

 <html>
      <head> 
      <style>
      body
      {
      margin:0 auto;
      position: relative;
      background:#fff;
      }
      *:focus{

			outline:none; /* Prevents blue border in Webkit */

		}
		.button
		{
		background-color: #0074cc;
  *background-color: #0055cc;
  background-image: -ms-linear-gradient(top, #0088cc, #0055cc);
  background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0055cc));
  background-image: -webkit-linear-gradient(top, #0088cc, #0055cc);
  background-image: -o-linear-gradient(top, #0088cc, #0055cc);
  background-image: -moz-linear-gradient(top, #0088cc, #0055cc);
  background-image: linear-gradient(top, #0088cc, #0055cc);
  background-repeat: repeat-x;
  border-color: #0055cc #0055cc #003580;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  filter: progid:dximagetransform.microsoft.gradient(startColorstr='#0088cc', endColorstr='#0055cc', GradientType=0);
  filter: progid:dximagetransform.microsoft.gradient(enabled=false);
  color: #ffffff;
text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
 border-radius:15px;
 -moz-radius:15px;
 -ms-radius:15px;
 -webkit-radius:15px;
 padding:10px;

 font-weight:bolder;
 display: block;
 margin-left: 140px;
 font-size: 20px;
 vertical-align: middle;
 alignment-baseline: middle;
 
 margin-top: 10px;
 
  }
  .button:hover {
  background-color: #0055cc;
  *background-color: #004ab3;
  
}
		span
		{
		font-size:17px;
		font-weight:bolder;
		}
		#alignment
		{		
		width:50%;
		padding: 10px;
        margin: 0 auto;
		font-family:"Helvetica Neue",HelveticaNeue,"Helvetica-Neue",Helvetica,"BBAlpha Sans",sans-serif;
		}

      
      select { border:0; 
      color:#EEE;
       background:transparent;
font-size:20px; 
font-weight:bold;
 padding:2px 10px;
  
width:378px;
*background:#58B14C;

 -webkit-appearance: none;  }
 option{
 
background:#58B14C;

}

#mainselection { overflow:hidden; width:350px;
-moz-border-radius: 9px 9px 9px 9px;
-webkit-border-radius: 9px 9px 9px 9px;
border-radius: 9px 9px 9px 9px;
box-shadow: 1px 1px 11px #330033;
background: url("arrow.gif") no-repeat scroll 319px 5px #58B14C;
font-weight: bolder;
display: inline-block;
margin: 10px;
 }
</style> 
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