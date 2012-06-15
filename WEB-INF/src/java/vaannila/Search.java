package vaannila;


import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;




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
        String query = "SELECT m.id,t.id,t.name,a.name,c.name,mrit.show_timing,mrit.price " +
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
        

        while (rs.next()) {

            SearchResult result =new SearchResult();
               
                result.setMovie_id(rs.getInt("m.id"));
                result.setTheatre_id(rs.getInt("t.id"));
                result.setTname(rs.getString("t.name"));
                result.setAudi(rs.getString("a.name"));
                result.setMovieclass(rs.getString("c.name"));
                result.setShowtiming(rs.getString("mrit.show_timing"));
                result.setPrice(rs.getFloat("mrit.price"));
                //Adding every result row to results
                results.add(result);

        }
        
        
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

    
    
    
}