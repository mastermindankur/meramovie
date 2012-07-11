package vaannila;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.StringTokenizer;

//Sammple URL
//http://localhost:8080/mymovie/SeatSelection.action?city=Delhi&movie_id=1&date=2012-07-10&theatre_id=2&movieclass=Platinum&showtiming=2pm&audi=2

public class SeatSelection {
	
	private String city;
    private String movie_id;
    private String date;
    private String theatre_id;
    private String movieclass;
    private String showtiming;
    private String audi;
    private int[][] input ;
    
    DataBase d ;
    Connection conn;
    Statement stmt;
   

	    
	    public int[][] createSeatMatrixFromDB(int matrix_id) throws Exception
	    {    	
	    	String query="SELECT rowno,seatstatus,price,booking_id " +
			"FROM matrix" +
			" WHERE id="+matrix_id;
	    	
	    	ResultSet rs = stmt.executeQuery(query);
	    	//////////////////////////////////
	    	//JUST TO GET SIZE OF 2-3 ARRAY
	    	//UNOPTIMIZED CODE
	    	int r=0,c=0;
	    	while(rs.next())
	    	{
	    		r++;
	        	String seatstatuses=rs.getString("seatstatus");
	        	StringTokenizer st = new StringTokenizer(seatstatuses,","); 
	        	c=st.countTokens();
	    	}
	       	/////////////////////////////////
	    	
	    	//CREATING MATRIX SIZE
	    	input=new int[r][c];
	    	rs = stmt.executeQuery(query);
	    	
	    	//CREATING MATRIX 
	    	while(rs.next())
	    	{
	    		int rowno=rs.getInt("rowno");
	    		String seatstatuses=rs.getString("seatstatus");
	    		//String prices=rs.getString("price");
	    		//String bids=rs.getString("booking_id");
	    		
	    		StringTokenizer st = new StringTokenizer(seatstatuses,","); 
	    		//StringTokenizer pr = new StringTokenizer(prices,","); 
	    		//StringTokenizer bt = new StringTokenizer(bids,","); 
				
	    		int columnno=0;
				
	    		while(st.hasMoreTokens() 
	    				//&& pr.hasMoreTokens()
	    				) { 
	    			
	    			String status = st.nextToken(); 
	    			int statusi=Integer.parseInt(status);
	    			
	    			//String price = pr.nextToken();
	    			//float pricef=Float.parseFloat(price);
	    			
	    			//String bid = bt.nextToken();
	  
	    			input[rowno][columnno]=statusi;	
	    			//s[rowno][columnno]=new Seat(rowno,columnno,pricef,statusi,bid);
	    			//System.out.println("Setting rowno , price and status as "+rowno+"-"+columnno+"-"+pricef+"-"+status+"-"+bid);
	    			
	    			columnno++;
	    			}
	    	}
	    	
	    		return input;
	    }
	    
	    
	    
	    
	    public String execute() throws Exception {
	    	d =new DataBase();
	        conn=d.createConnection();
	        stmt = conn.createStatement();

	    	
	    	String query = "SELECT id,mrit.matrix_id,movie_id,theatre_id " +
    		"FROM movie_runs_in_theatres mrit " +
    		" WHERE mrit.movie_id="+getMovie_id()+
    		" AND mrit.theatre_id="+getTheatre_id()+
    		" AND mrit.audi_id="+getAudi()+
    		" AND mrit.show_timing='"+getShowtiming()+"'"+
    		" AND mrit.date like '"+getDate()+"%' order by id asc limit 1";
	    	
	    	 ResultSet rs = stmt.executeQuery(query);
	    	 rs.next();
	    	    
	    	 int matrix_id=rs.getInt("mrit.matrix_id");
	    	 
	    	 System.out.println("We got the matrix id as "+matrix_id);
	    	 
	    	// CREATING INPUT MATRIX
	    	 
	    	 createSeatMatrixFromDB(matrix_id);
	    	 
	    	 
	    	 //DISPLAYING INPUT MATRIX
	    	 
	    	 for(int i = 0; i < input.length; i++){
	    		 
	    		                 for(int j = 0; j <input[i].length; j++){    
	    		 
	    		                     System.out.print(input[i][j]);

	    		                 				}
	    		                 System.out.println("");
	    	 					}
	    	 /////////
	    	 
	    	 return ("SUCCESS");
	 	    
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
		
		public int[][] getInput() {
			return input;
		}
		public void setInput(int[][] input) {
			this.input = input;
		}

	    

}

