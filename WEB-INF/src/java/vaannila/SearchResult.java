package vaannila;

import java.util.ArrayList;



public class SearchResult {
	    

		private  int  movie_id;
		private  int  theatre_id;
		private String tname;
		
		public class inner{
		
		private String audi;
		private String movieclass;
		private String showtiming;
		private Float price;
		
			inner(String audi,String movieclass, String showtiming, Float price)
			{
				this.audi=audi;
			  this.movieclass=movieclass;
			  this.showtiming=showtiming;
			  this.price=price;
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
			public String getMovieclass() {
				return movieclass;
			}
			public void setMovieclass(String movieclass) {
				this.movieclass = movieclass;
			}
			public Float getPrice() {
				return price;
			}
			public void setPrice(Float price) {
				this.price = price;
			}
		
		}
		
		 ArrayList<inner> timings = new ArrayList<inner>();
		 
		 public ArrayList<inner> getTimings() {
				return timings;
			}
			public void setTimings(ArrayList<inner> timings) {
				this.timings = timings;
			}

		
		public String getTname() {
			return tname;
		}

		public void setTname(String tname) {
			this.tname = tname;
		}

		
		public int getMovie_id() {
			return movie_id;
		}
		public void setMovie_id(int movieId) {
			movie_id = movieId;
		}
		public int getTheatre_id() {
			return theatre_id;
		}
		public void setTheatre_id(int theatreId) {
			theatre_id = theatreId;
		}
		

}
