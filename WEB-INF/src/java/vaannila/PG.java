package vaannila;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class PG {
	
	
	int payment_id;
	
	 	DataBase d ;
	    Connection conn;
	    Statement stmt;
	    
	    PG() throws Exception
	    {
	    	d =new DataBase();
	        conn=d.createConnection();
	        stmt = conn.createStatement();
	    }
	
	
	
	
	public boolean makePayment()
	{
		
		
		return true;
	}
	
	public int createPaymentId () throws Exception
    {
    	String query = "SELECT max(paymentcounter) from counter";
    	ResultSet rs = stmt.executeQuery(query);
        rs.next();
        
        int count=rs.getInt("max(paymentcounter)");
    	//INCREMENTING COUNT BY 1
        int newcount=count+1;
    	
    	String sql = "UPDATE counter " +
        "SET paymentcounter ="+newcount;
    	stmt.executeUpdate(sql);
    	
    	return newcount;
    }
	
	public void insert2Payment(int paymentid,String bookingid,Float amount,int paymentmode, int paymentstatus, String ipaddress) throws Exception
	{
		String sql="INSERT INTO payment "+"VALUES ("+paymentid+","+amount+",'"+bookingid+"',NOW(),'	"+ipaddress+"',"+paymentmode+","+paymentstatus+")";
    	System.out.println(sql);
    	stmt.executeUpdate(sql);
	}

	
	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int paymentId) {
		payment_id = paymentId;
	}

	
}
