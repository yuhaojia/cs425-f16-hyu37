<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkout.jsp' starting page</title>
    
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
  <jsp:useBean id="checkout" class="service.checkoutService"></jsp:useBean>
  	<%
    	int id = Integer.parseInt(request.getParameter("id"));
		
	%>
   <table>
		<tr>
			<td>Previous Balance</td>
			<td>Total Cost</td>
			<td>Balance after Purchase</td>
		</tr>
		<tr>
			<td><%=checkout.getBalance(id)%></td>
			<td><%=checkout.cost(id)%></td>
			<td><%=checkout.net(id)%></td>
		</tr>
		<td> <a href="checkoutresult.jsp?id=<%=id%>">Confirm</a></td>
  </body>
</html>
