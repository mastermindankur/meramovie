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
<%
String name = #tname;
System.out.println("the value of theatre is " +name);
if (h.containsKey(name))
%>
<th><s:property value="tname"/></th>
<th><s:property value="showtiming"/></br></br>Rs <s:property value="price"/></th>
</tr>

</s:iterator>


        
    </body>
</html>
