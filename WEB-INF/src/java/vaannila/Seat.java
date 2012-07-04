package vaannila;

public class Seat {
	int x;
	int y;
	float price;
	int status;
	String bookingid;
	
	//constructor
	Seat(int x,int y,float price, int status,String bid)
	{
		this.x=x;
		this.y=y;
		this.price=price;
		this.status=status;
		this.bookingid=bid;
	}
	
	
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getY() {
		return y;
	}
	public void setY(int y) {
		this.y = y;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getbookingid() {
		return bookingid;
	}
	public void setbookingid(String bookingid) {
		this.bookingid = bookingid;
	}

}
