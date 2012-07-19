<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" errorPage="" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listing Page</title>
		<style>
		 thead th{
    padding:15px;
    color:#fff;
    text-shadow:1px 1px 1px #568F23;
    border:1px solid #93CE37;
    border-bottom:3px solid #9ED929;
    background-color:#9DD929;
    background:-webkit-gradient(
        linear,
        left bottom,
        left top,
        color-stop(0.02, rgb(123,192,67)),
        color-stop(0.51, rgb(139,198,66)),
        color-stop(0.87, rgb(158,217,41))
        );
    background: -moz-linear-gradient(
        center bottom,
        rgb(123,192,67) 2%,
        rgb(139,198,66) 51%,
        rgb(158,217,41) 87%
        );
    -webkit-border-top-left-radius:5px;
    -webkit-border-top-right-radius:5px;
    -moz-border-radius:5px 5px 0px 0px;
    border-top-left-radius:5px;
    border-top-right-radius:5px;
}
thead th:empty{
    background:transparent;
    border:none;
}
tbody th{
    color:#fff;
    text-shadow:1px 1px 1px #568F23;
    background-color:#9DD929;
    border:1px solid #93CE37;
    border-right:3px solid #9ED929;
    padding:0px 10px;
    background:-webkit-gradient(
        linear,
        left bottom,
        right top,
        color-stop(0.02, rgb(158,217,41)),
        color-stop(0.51, rgb(139,198,66)),
        color-stop(0.87, rgb(123,192,67))
        );
    background: -moz-linear-gradient(
        left bottom,
        rgb(158,217,41) 2%,
        rgb(139,198,66) 51%,
        rgb(123,192,67) 87%
        );
    -moz-border-radius:5px 0px 0px 5px;
    -webkit-border-top-left-radius:5px;
    -webkit-border-bottom-left-radius:5px;
    border-top-left-radius:5px;
    border-bottom-left-radius:5px;
}
tbody td{
    padding:10px;
    text-align:center;
    background-color:#DEF3CA;
    border: 2px solid #E7EFE0;
    -moz-border-radius:2px;
    -webkit-border-radius:2px;
    border-radius:2px;
    color:#666;
    text-shadow:1px 1px 1px #fff;
}
		table,h1
		{
		table-layout: auto;
border-spacing: 8px;
width: 50%;
margin: 40px auto;
border-collapse: separate;
font-family: Calibri, Times New Roman, sans-serif;
}

</style>
    </head>
    <body>
        
<h1> Listing Page</h1>
 <table>

<%
HashMap h=new HashMap();
 %>
<thead>

<tr>  
<th>TheatreName</th>
<th>ShowTimings</th> 
</tr>
<thead>
<tbody>    
<s:iterator value="results">
<th scope="row"><s:property value="tname"/></th>
<tr>	<s:iterator value="timings">
	<a href="SeatSelection.action?city=<s:property value="city"/>&movie_id=<s:property value="movie_id"/>&date=<s:property value="date_string"/>&theatre_id=<s:property value="theatre_id"/>&movieclass=<s:property value="movieclass"/>&showtiming=<s:property value="showtiming"/>
	&audi=<s:property value="audi"/>"><s:property value="showtiming"/></a>&nbsp(Rs<s:property value="price"/>)<s:property value="movieclass"/>&nbsp&nbsp|  </s:iterator></th>
</tr>

</s:iterator>
</tbody>

        
    </body>
</html>
