import java.util.ArrayList;

public class Movie {
	
	private String name;
	private String language;
	private String duration;
	private String audience;
	ArrayList genre=new ArrayList<String>();
	
	
	//Setter and Getter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getAudience() {
		return audience;
	}
	public void setAudience(String audience) {
		this.audience = audience;
	}
	public ArrayList getGenre() {
		return genre;
	}
	public void setGenre(ArrayList genre) {
		this.genre = genre;
	}

}
