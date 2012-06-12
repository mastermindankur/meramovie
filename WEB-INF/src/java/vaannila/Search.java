package vaannila;


import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;



public class Search {

    private String city;
    private String day;
    private String movie;
    
    private Date date;
    
    
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
        String query = "SELECT DISTINCT m.name,language,duration,t.name,mrit.show_timings FROM movie_runs_in_theatres mrit, movie m, movie_has_actor mha, theatre t, audi a, actor actr " +
        		"WHERE mrit.movie_id = m.id " +
        		"AND mrit.theatre_id = t.id " +
        		" AND mrit.audi_id = a.id " +
        		" AND mha.movie_id = m.id" +
        		" AND mha.actor_id = actr.id and t.city='"+getCity()+"'" +
        		" and date like '"+df.format(oneDate)+"%'";
        
        System.out.println(query);
        		
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
                System.out.println("Movie Name  " + rs.getString("m.name")
                                + ", Language " + rs.getString("language")
                                + ",duration " + rs.getString("duration")
                                +",Theatre Name " + rs.getString("t.name")
                                +",Show Timings " + rs.getString("mrit.show_timings"));
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


    

}