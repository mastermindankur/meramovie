<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" errorPage="" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listing Page</title>
    </head>
    <body>
        Listing Page
 
 <table  border = "1" cellpadding="5" style="background-color: #ffffcc;">

<%
HashMap h=new HashMap();
 %>

<tr>  
<th>TheatreName</th>
<th>ShowTimings</th> 
</tr>    
<s:iterator value="results">
<th><s:property value="tname"/></th>
<th>	<s:iterator value="timings">
	<a href="SeatSelection.action?city=<s:property value="city"/>&movie=<s:property value="movie_id"/>&day=<s:property value="date_string"/>&theatre=<s:property value="theatre_id"/>&class=<s:property value="movieclass"/>&time=<s:property value="showtiming"/>
	&audi=<s:property value="audi"/>"><s:property value="showtiming"/></a>&nbsp(Rs<s:property value="price"/>)<s:property value="movieclass"/>&nbsp&nbsp|  </s:iterator></th>
</tr>

</s:iterator>


        
    </body>
</html>
