<%@page import="model.PricePerState"%>
<%@page import="service.PriceService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deleteoneprice.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <jsp:useBean id="priceperstate" class="model.PricePerState"></jsp:useBean>
  <jsp:useBean id="priceservice" class="service.PriceService"></jsp:useBean>
     <%
		float id = Float.valueOf(request.getParameter("id"));
		PricePerState pro = priceservice.querystatePrice(id);	
	
		if(priceservice.deletepps(pro))
		out.print("success");
		else
		out.print("failure");
	%>
  </body>
</html>
