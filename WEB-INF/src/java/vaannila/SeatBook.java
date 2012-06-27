package vaannila;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class SeatBook {
  	
	private String city;
    private String movie_id;
    private String date;
    private String theatre_id;
    private String movieclass;
    private String showtiming;
    private String audi;
    private String seatsWanted;
    

    
    public String execute() throws Exception{
    System.out.println(city+movie_id+date+theatre_id+movieclass+showtiming+audi+seatsWanted);
    
    DataBase d =new DataBase();
    Connection conn=d.createConnection();
    Statement stmt = conn.createStatement();
    // Create a query String
    
    String query = "SELECT DISTINCT mrit.matrix_id " +
    		"FROM movie_runs_in_theatres mrit " +
    		" WHERE mrit.movie_id="+getMovie_id()+
    		" AND mrit.theatre_id="+getTheatre_id()+
    		" AND mrit.audi_id="+getAudi()+
    		" AND mrit.show_timing='"+getShowtiming()+"'"+
    		" AND mrit.date like '"+getDate()+"%'";
    System.out.println(query);		
    
    ResultSet rs = stmt.executeQuery(query);
    
    while(rs.next())
    {
    	System.out.println("AM here");
    	int matrix_id=rs.getInt("mrit.matrix_id");
    }
    		
    
    
    
    
    
    
    return("SUCCESS");
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movieId) {
		movie_id = movieId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTheatre_id() {
		return theatre_id;
	}
	public void setTheatre_id(String theatreId) {
		theatre_id = theatreId;
	}
	public String getMovieclass() {
		return movieclass;
	}
	public void setMovieclass(String movieclass) {
		this.movieclass = movieclass;
	}
	public String getShowtiming() {
		return showtiming;
	}
	public void setShowtiming(String showtiming) {
		this.showtiming = showtiming;
	}
	public String getAudi() {
		return audi;
	}
	public void setAudi(String audi) {
		this.audi = audi;
	}
	public String getSeatsWanted() {
		return seatsWanted;
	}
	public void setSeatsWanted(String seatsWanted) {
		this.seatsWanted = seatsWanted;
	}
    

}
