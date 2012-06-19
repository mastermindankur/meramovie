package vaannila;


import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;





public class Search {

    private String city;
    private String day;
    private String movie;
    private Date date;
    ArrayList results=new ArrayList<SearchResult>();
   
     
    public Search() {
    }

    public String execute() {
        System.out.println("The city , movie and day are as follows" + getCity()+"-"+getMovie()+"-"+getDay());
        
        Date oneDate=null;
        SimpleDateFormat df=null;
        final long MILLIS_IN_A_DAY = 1000*60*60*24;  
        
        if(day.equals("Today"))
        {
        	oneDate = new Date(new java.util.Date().getTime());
        	df = new SimpleDateFormat("yyyy-MM-dd");
        	System.out.println(df.format(oneDate));
        }
        if(day.equals("Tomorrow"))
        {
        	oneDate = new Date(new java.util.Date().getTime()+MILLIS_IN_A_DAY);
        	df = new SimpleDateFormat("yyyy-MM-dd");
        	System.out.println(df.format(oneDate));
        }
        if(day.equals("DayAfterTomorrow"))
        {
        	oneDate = new Date(new java.util.Date().getTime()+MILLIS_IN_A_DAY+MILLIS_IN_A_DAY);
        	df = new SimpleDateFormat("yyyy-MM-dd");
        	System.out.println(df.format(oneDate));	
        }
        
        try{
        DataBase d =new DataBase();
        Connection conn=d.createConnection();
        Statement stmt = conn.createStatement();
        // Create a query String
        String query = "SELECT DISTINCT m.id,t.id,t.name,a.name,c.name,mrit.show_timing,mrit.price " +
        		"FROM movie_runs_in_theatres mrit, movie m, theatre t, audi a,class c " +
        		" WHERE mrit.movie_id = m.id " +
        		" AND mrit.theatre_id = t.id " +
        		" AND mrit.audi_id = a.id " +
        		" AND mrit.class_id = c.id " +
        		" and t.city='"+getCity()+"'" +
        		" and date like '"+df.format(oneDate)+"%'"+
        		" and m.name ='"+getMovie()+"' order by t.id,show_timing,a.name,c.name asc";
        
        System.out.println(query);
        
        
        
        ResultSet rs = stmt.executeQuery(query);
        
        HashMap h =new HashMap();

        SearchResult result=null;
		ArrayList<SearchResult.inner> timings=null;
		
        while (rs.next()) {

        	if(h.containsKey(rs.getString("t.name"))==false)
            	{
        		h.put(rs.getString("t.name"),1);
        		//adding previous results
        		if(result !=null)
        		{
        		result.setTimings(timings);
                //Adding every result row to results
                results.add(result);
        		}
        		
        		
        		result =new SearchResult();
            	timings = new ArrayList<SearchResult.inner>();
            	
            	result.setMovie_id(rs.getInt("m.id"));
                result.setTheatre_id(rs.getInt("t.id"));
                result.setTname(rs.getString("t.name"));
                result.setDate_string(df.format(oneDate));
                
            	
            	SearchResult.inner i =result.new inner(rs.getString("a.name"),rs.getString("c.name"),rs.getString("mrit.show_timing"),rs.getFloat("mrit.price"));
                timings.add(i); 
            	}
                
            	if(h.containsKey(rs.getString("t.name"))==true)
            	{
            		SearchResult.inner i =result.new inner(rs.getString("a.name"),rs.getString("c.name"),rs.getString("mrit.show_timing"),rs.getFloat("mrit.price"));
                    timings.add(i); 
            	}

            	
        }//end of rs
        
        result.setTimings(timings);
        //Adding last result row to results
        results.add(result);
		
        
        }
        
        catch(Exception e)
        {
        	
        }
        
                return "SUCCESS";
    }
    
    
    public String getCity() {
        return city;
    }

   
    public void setCity(String city) {
        this.city = city;
    }
    
    public String getMovie() {
        return movie;
    }

   
    public void setMovie(String movie) {
        this.movie = movie;
    }
    
    public String getDay() {
        return day;
    }

   
    public void setDay(String day) {
        this.day = day;
    }
    
    public ArrayList<SearchResult> getresults() {
        return results;
    }
    
    public void setresults(ArrayList<SearchResult> results) {
        this.results = results;
    }
    
    public Date getDate() {
        return date;
    }

   
    public void setDate(Date date) {
        this.date = date;
    }

    
    
    
}