package vaannila;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class TheaterJToggle {

	// For my 2 dimensional matrix
	//0 means seat is available
	//1 means seat is selected
	//2 means seat is booked
	//3 means seat is not available 
	
	
	private final int AVAILABLE=0;
	private final int SELECTED=1;
	private final int BOOKED=2;
	private final int UNAVAILABLE=3;
	private Icon availableicon = new ImageIcon("/home/ankur/Desktop/available.gif");
    private Icon selectedicon = new ImageIcon("/home/ankur/Desktop/selected.gif");
    private Icon bookedicon = new ImageIcon("/home/ankur/Desktop/booked.gif");
    private Icon unavailableicon = new ImageIcon("/home/ankur/Desktop/unavailable.gif");
    int seatinformation[][];
    
    public void displayImageOnButton(int status,JToggleButton button)
    {
    	if(status==AVAILABLE)
    	{
    		button.setIcon(availableicon);
    	}
    	
    	if(status==SELECTED)
    	{
    		button.setIcon(selectedicon);	
    	}
    	
    	if(status==BOOKED)
    	{
    		button.setIcon(bookedicon);
    	}
    	
    	if(status==3)
    	{
    		button.setIcon(unavailableicon);
    	}
    	
    }
    

    public TheaterJToggle(int array[][]) {
    	
    	seatinformation=array;

    	int rows=seatinformation.length;
    	int columns=seatinformation[0].length;

        JPanel panel = new JPanel(new GridLayout(rows, columns));
        for (int row = 0; row < rows; row++) {
            for (int column = 0; column < columns; column++) {
            	
                //final JToggleButton button = new JToggleButton("Row " + row + " seat " + column);
                final JToggleButton button = new JToggleButton();
                //Setting the row no and column no for the button
                button.setName(row+":"+column);
                displayImageOnButton(seatinformation[row][column],button);
                
                button.addActionListener(new ActionListener() {

                    @Override
                    public void actionPerformed(ActionEvent actionEvent) {
                        AbstractButton abstractButton = (AbstractButton) actionEvent.getSource();
                        boolean selected = abstractButton.getModel().isSelected();
                        //Getting button coordinates
                        String s=button.getName();
                        String temp[]=s.split(":");
                        int r=Integer.parseInt(temp[0]);
                        int c=Integer.parseInt(temp[1]);
                        
                        System.out.println(r+"-"+c);
                        System.out.println(selected);;
                        System.out.println(seatinformation[r][c]);

                        if (selected&seatinformation[r][c]==AVAILABLE) {
                        	displayImageOnButton(SELECTED,button);
                        	seatinformation[r][c]=SELECTED;
                        } 
                        else if (selected&seatinformation[r][c]==SELECTED) {
                        	displayImageOnButton(AVAILABLE,button);
                        	seatinformation[r][c]=AVAILABLE;
                        }
                        else {
                        	displayImageOnButton(seatinformation[r][c],button);
                        }
                        abstractButton.getModel().setSelected(false);
                    }
                });
                panel.add(button);
            }
        }
        final JFrame frame = new JFrame("JToggleButton Test");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.add(panel);
        frame.pack();
        frame.setLocation(150, 150);
        frame.setVisible(true);
    }

    /*public static void main(String[] args) {
    	 int[][] input = {
  		      { 0, 0, 0, 0, 0},
  		      { 0, 0, 0, 0 ,0},
  		      { 2, 2, 2, 2 ,2},
  		      { 3, 3, 3, 3 ,3},
  		    };

                TheaterJToggle theaterJToggle = new TheaterJToggle(input);
            }*/        
    }
