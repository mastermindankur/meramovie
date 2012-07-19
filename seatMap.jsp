<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" errorPage="" %> 
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<title>Search</title>
<head>

<link href="style.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</head>
 
<body>
	<div id="holder"> 
        <ul  id="place">
        </ul> 
           
    </div>
    <div id="order_place"></div>
    <button id="click">Submit</button>
    <script type="text/javascript">
        $(function () {
            var settings = {
                reservedSeat: 2,
                unavilableSeat: 3,
            
                rowCssPrefix: 'row-',
                colCssPrefix: 'col-',
                seatWidth: 50,
                seatHeight: 50,
                seatCss: 'seat',
                selectedSeatCss: 'selectedSeat',
                selectingSeatCss: 'selectingSeat',
                unavaliableSeatCss: 'unavilableSeat'
            };

            var init = function (Seat) {
           
                var str = [], seatNo, className;
                var rows= Seat.length;
                var cols= Seat[0].length;
                
                for (i = 0; i <rows; i++) {
                    for (j = 0; j <cols; j++) {
                        seatNo = (i + j *rows + 1);

                        className = settings.seatCss + ' ' + settings.rowCssPrefix + i.toString() + ' ' + settings.colCssPrefix + j.toString();
                        
                        if (Seat[i][j]==settings.reservedSeat) {
                            className += ' ' + settings.selectedSeatCss;
                            //console.log(inArray(seatNo, reservedSeat));
                        }
                        else if(Seat[i][j]== settings.unavilableSeat){
                           className += ' ' + settings.unavaliableSeatCss;
                           //console.log(settings.unavaliableSeatCss);
                        }
                        str.push('<li title="'+seatNo+'" class="' + className + '"' +
                                  'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' + (j * settings.seatWidth).toString() + 'px" href="'+i,'-',j+'">' +
                                  '<a title="' + seatNo + '">' + seatNo + '</a>' +
                                  '</li>');
                       
                    }
                }
                $('#holder').css({height:rows*settings.seatHeight+'px',width:cols*settings.seatWidth+'px'});
                $('#place').html(str.join(''));
            };

            //case I: Show from starting
            //init();

            //Case II: If already booked
           
            var Seats =[[<s:property value="input"/>]];
                      
            init(Seats);
            
            var clickNum=0;
            $('.' + settings.seatCss).on('click',function () {
              
            if ($(this).hasClass(settings.selectedSeatCss)){
                alert('This seat is already reserved');
            }
            else if($(this).hasClass(settings.unavaliableSeatCss))
            {
                alert('Sorry!!!This is unavailable Seats');
            }

            
               
              else
              {
               if($(this).hasClass(settings.selectingSeatCss))
                {
                    $(this).removeClass(settings.selectingSeatCss);
                     var SeatNo=$(this).closest("li").attr("title");
                     console.log($('li.selectingSeat').each(function()
                      {$(this).attr("href")
                    }));
                    $(".sitting:last").remove();
                  

                }
                else
                {
                  $(this).addClass(settings.selectingSeatCss);
                 var link=$(this).attr('href');
                link=link+"";
                 
                var SeatNo=$(this).closest("li").attr("title");
               // console.log(traverse.closest("a"));
                //var SeatNo=$(this).closest("a").attr("title");
                 $('<div class="sitting" title="'+SeatNo+'">SeatNo:>'+SeatNo+ '</div>').appendTo('#order_place');
               


                 
                 } 
                }
              

            });
          $("#click").click(function(){
            var realvalues = [];
            $('li.selectingSeat').each(function(i){realvalues[i]=$(this).attr("href");});
            realvalues=realvalues.join('>');
             location.href ="SeatBook.action?city=<s:property value="city"/>&movie_id=<s:property value="movie_id"/>&date=<s:property value="date"/>&theatre_id=<s:property value="theatre_id"/>&movieclass=<s:property value="movieclass"/>&audi=<s:property value="audi"/>&showtiming=<s:property value="showtiming"/>&seatsWanted="+realvalues;
                     
           
             // window.history.pushState({push:this.push},'','?booking='+href);
          });

           
            

           
        });
    
    </script>
    

</body>
</html>