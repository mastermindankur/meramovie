package vaannila;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DataBase {
	Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    // 3306 is the default port number of MySQL
    String url = "jdbc:mysql://localhost/";
    String dbName = "mymovie";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "root";
    String password = "p@55word";
    
   public Connection createConnection()
   {
	   try {
           // Load the driver
           Class.forName(driver);
           // Get a connection
           conn = DriverManager
                           .getConnection(url + dbName, userName, password);
           System.out.println("Connected to the database");
           
           return conn;
           }
	   
	   	   catch (Exception e) {
	   	   	   
           e.printStackTrace();
           return null;
	   		} 
	   
   }
	
	

}
