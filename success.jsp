<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" errorPage="" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="/struts-tags" prefix="s" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listing Page</title>
		<link href="style.css" rel="stylesheet">
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
<tr>
<th scope="row"><s:property value="tname"/></th>
<td><s:iterator value="timings">
	<a href="SeatSelection.action?city=<s:property value="city"/>&movie_id=<s:property value="movie_id"/>&date=<s:property value="date_string"/>&theatre_id=<s:property value="theatre_id"/>&movieclass=<s:property value="movieclass"/>&showtiming=<s:property value="showtiming"/>
	&audi=<s:property value="audi"/>"><s:property value="showtiming"/></a>&nbsp(Rs<s:property value="price"/>)<s:property value="movieclass"/>&nbsp&nbsp|  </s:iterator>
</td>
</tr>
</s:iterator>
</tbody>

        
    </body>
</html>
