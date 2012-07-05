package vaannila;

//http://localhost:8080/mymovie/SeatBook.action?city=Delhi&movie_id=1&date=2012-06-26&theatre_id=2&movieclass=Platinum&showtiming=2pm&audi=2&seatsWanted=0-0%3E0-1

import java.sql.Connection;
import java.util.StringTokenizer; 
import java.sql.ResultSet;
import java.sql.Statement;


public class SeatBook {
  	
	private String city;
    private String movie_id;//
    private String date;//
    private String theatre_id;//
    private String movieclass;
    private String showtiming;//
    private String audi;//
    private String seatsWanted;
    
    Float priceofticket;
    

    DataBase d ;
    Connection conn;
    Statement stmt;
    PG pg;

    
    
    public Seat[][] createSeatMatrixFromDB(int matrix_id) throws Exception
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
    	Seat s[][]=new Seat[r][c];
    	rs = stmt.executeQuery(query);
    	
    	//CREATING MATRIX 
    	while(rs.next())
    	{
    		int rowno=rs.getInt("rowno");
    		String seatstatuses=rs.getString("seatstatus");
    		String prices=rs.getString("price");
    		String bids=rs.getString("booking_id");
    		
    		StringTokenizer st = new StringTokenizer(seatstatuses,","); 
    		StringTokenizer pr = new StringTokenizer(prices,","); 
    		StringTokenizer bt = new StringTokenizer(bids,","); 
			
    		int columnno=0;
			
    		while(st.hasMoreTokens() && pr.hasMoreTokens()) { 
    			
    			String status = st.nextToken(); 
    			int statusi=Integer.parseInt(status);
    			
    			String price = pr.nextToken();
    			float pricef=Float.parseFloat(price);
    			
    			String bid = bt.nextToken();
  

    			s[rowno][columnno]=new Seat(rowno,columnno,pricef,statusi,bid);
    			System.out.println("Setting rowno , price and status as "+rowno+"-"+columnno+"-"+pricef+"-"+status+"-"+bid);
    			
    			columnno++;
    			}
    	}
    	return s;
    }
    
    
    public void updateSeatMatrixInDB(int matrix_id,Seat s[][],StringTokenizer point,String bookingid) throws Exception
    {    	
    	while(point.hasMoreTokens())
    	{
    		StringTokenizer xy= new StringTokenizer(point.nextToken(),"-");
    		while(xy.hasMoreTokens())
    		{
    			int x=Integer.parseInt(xy.nextToken());
    			int y=Integer.parseInt(xy.nextToken());
    			s[x][y].setStatus(1);
    			//BOOKED
    			s[x][y].setbookingid(bookingid);
    		}
    	}	
    	
    	System.out.println("PRINTING ");
    	for (int x=0; x<s.length; x++) {
    			String statuses="";
    			String bookingids="";
    			
    	       for (int y=0; y<s[x].length; y++) {
    	          statuses=statuses+s[x][y].getStatus()+",";
    	          bookingids=bookingids+s[x][y].getbookingid()+",";
    	       	}
    	       statuses=statuses.substring(0, statuses.length()-1);
    	       bookingids=bookingids.substring(0, bookingids.length()-1);
    	      
    	      System.out.println("status"+statuses);
 	          System.out.println("booking_id"+bookingids);
    	      System.out.println(">>>>");
    	      
    	      //INSERT INTO DB
    	      String sql = "UPDATE matrix " +
              "SET seatstatus ='"+statuses+"',booking_id='"+bookingids+"' where id="+matrix_id+" and rowno="+x;
    	      
    	      System.out.println("update query is "+sql);
    	      
    	      stmt.executeUpdate(sql);
    	      
    	      
    	 }//end of outer for
    	
    }
    

    public String createBookingId (int mritid,int movieid,int theatreid ) throws Exception
    {
    	
    	String query = "SELECT max(bookingcounter) from counter";
    	ResultSet rs = stmt.executeQuery(query);
        rs.next();
        
        int count=rs.getInt("max(bookingcounter)");
    	//INCREMENTING COUNT BY 1
        int newcount=count+1;
    	
    	String sql = "UPDATE counter " +
        "SET bookingcounter ="+newcount;
    	stmt.executeUpdate(sql);
    	
    	return mritid+"M"+movieid+"T"+theatreid+"B"+newcount;
    }
    
    
    public void insertBookingTable(String bookingid,int user_id,int movie_runs_in_theatre_id,int booking_status_id,int payment_id) throws java.sql.SQLException
    {
    	
    	String sql="INSERT INTO booking "+"VALUES ('"+bookingid+"',"+user_id+","+movie_runs_in_theatre_id+","+booking_status_id+","+payment_id+")";
    	System.out.println(sql);
    	stmt.executeUpdate(sql);	
    	
    }
    
    
    
    
    public String execute() throws Exception{
    	
    	d =new DataBase();
        conn=d.createConnection();
        stmt = conn.createStatement();

    // Create a query String
    //FINDING MATRIX ID FOR THE INPUT FROM USER
    	
    String query = "SELECT id,mrit.matrix_id,movie_id,theatre_id " +
    		"FROM movie_runs_in_theatres mrit " +
    		" WHERE mrit.movie_id="+getMovie_id()+
    		" AND mrit.theatre_id="+getTheatre_id()+
    		" AND mrit.audi_id="+getAudi()+
    		" AND mrit.show_timing='"+getShowtiming()+"'"+
    		" AND mrit.date like '"+getDate()+"%' order by id asc limit 1";
    
    System.out.println(query);
    
    ResultSet rs = stmt.executeQuery(query);
    rs.next();
    
    int matrix_id=rs.getInt("mrit.matrix_id");
   
    int mritid=rs.getInt("id");
    int movieid=rs.getInt("movie_id");
    int theatreid=rs.getInt("theatre_id");	
    
    Seat s[][]=createSeatMatrixFromDB(matrix_id);

    	//FINDING OUT THE SEATS THAT THE USER HAD SELECTED 
    	//Example seatsWanted String 0-0>0-1>0-2>0-3
    	priceofticket=0.0F;
    
    	StringTokenizer point= new StringTokenizer(seatsWanted,">");
    	while(point.hasMoreTokens())
    	{
    		StringTokenizer xy= new StringTokenizer(point.nextToken(),"-");
    		while(xy.hasMoreTokens())
    		{
    			int x=Integer.parseInt(xy.nextToken());
    			int y=Integer.parseInt(xy.nextToken());
    			
    			System.out.println("the user wants the seat "+x+"~~~~"+y);
    			
    			
    			if(s[x][y].getStatus()==0)
    			{
    				System.out.println("We can book the seat which is available"+x+"~~~~"+y+"which has a price "+s[x][y].getPrice());
    				priceofticket=priceofticket+s[x][y].getPrice();
    			}
    			else
    			{
    				System.out.println("Cannot book seat "+x+"~~~"+y+" which has a status "+s[x][y].getStatus());
    				return "FAILURE";
    			}
    		}
    	}// end of outer while
    	
    	//all seats are available
		//UPDATE DATABASE CHANGE THE STATUS OF BOOKED SEATS FROM 0 TO 1
		pg=new PG();
		point= new StringTokenizer(seatsWanted,">");
		
		if(pg.makePayment()==true)
		{
			System.out.println("the booking has been done successfully , updating matrix table");
			
			String bookingid=createBookingId(mritid,movieid,theatreid);
			
			// UPDATING SEAT MATRIX
			updateSeatMatrixInDB(matrix_id,s,point,bookingid);	
			
			//INSERTING INTO BOOKING TABLE
			//#########instead of setting payment id we will generate a payment id
			pg.setPayment_id(pg.createPaymentId());
			insertBookingTable(bookingid,1, mritid,1,pg.getPayment_id());
			
			//INSERTION INTO PAYMENT TABLE
			pg.insert2Payment(pg.getPayment_id(),bookingid,priceofticket,8,0,"127.0.0.1");
			//#############8 and 0 are for TEST paymentmode and paymentstatus respectively

			
		}
    	
    	
    	
    	System.out.println("The price of the ticket is "+priceofticket);

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
	public Float getPriceofticket() {
		return priceofticket;
	}

	public void setPriceofticket(Float priceofticket) {
		this.priceofticket = priceofticket;
	}

    

}
