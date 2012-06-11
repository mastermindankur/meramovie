
package vaannila;
import java.util.Date;	


public class Search {

    private String city;
    private String day;
    private String movie;
    
    
    
    public Search() {
    }

    public String execute() {
        System.out.println("Hello Nice to see u " + getCity()+"-"+getMovie()+"-"+getDay());
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