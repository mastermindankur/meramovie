package vaannila;

import java.sql.Date;

//Sammple URL
//http://localhost:8080/mymovie/SeatSelection.action?city=Gurgaon&movie=1&day=2012-06-18&theatre=5&class=Silver&time=10:30am

public class SeatSelection {
	
	   	private String city;
	    private String movie_id;
	    private String date;
	    private String theatre_id;
	    private String movieclass;
	    private String showtiming;
	    private String audi;
	    
	    //input DB MATRIX 
	    //get it from query from DB
	    int[][] input = {
	  		      { 0, 0, 0, 0, 0},
	  		      { 0, 0, 0, 0 ,0},
	  		      { 2, 2, 2, 2 ,2},
	  		      { 3, 3, 3, 3 ,3},
	  		    };
	    
	    
	    public String execute() {
	    	
	    	TheaterJToggle theaterJToggle = new TheaterJToggle(input);
	    	
	    createMap();
	    	
	    	
	    }

}
