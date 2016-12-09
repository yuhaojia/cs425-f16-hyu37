<%@page import="model.User"%>
<%@page import="model.Customer"%>
<%@ page import="service.UserService"%>
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
  <jsp:useBean id="user" class="model.User"></jsp:useBean>
  <jsp:useBean id="customer" class="model.Customer"></jsp:useBean>
  <jsp:useBean id="customersevice" class="service.CustomerService"></jsp:useBean>
  <jsp:useBean id="shoppingcart" class="model.Shoppingcart"></jsp:useBean>
  <jsp:useBean id="shoppingcartService" class="service.ShoppingcartService"></jsp:useBean>
  <%
    	String u =(String)session.getAttribute("theuser");
    	int IDNum = Integer.parseInt(u);
		//int IDNum = user.getID();
		List stus = customersevice.queryAllCus(IDNum);
		Iterator iter = stus.iterator();
		List stus1 = shoppingcartService.queryAllsc(IDNum);
		Iterator iter1 = stus1.iterator();
		int k = 0;
		while (iter1.hasNext()) {
				Shoppingcart product1 = (Shoppingcart) iter1.next();
				k=k+product1.getPrice();
				}
	%>
   <table>
		<tr>
			<td>Previous Balance</td>
			<td>Total Cost</td>
			<td>Balance after Purchase</td>
		</tr>
		<%
			
			int i = 0;
			while (iter.hasNext()) {
				Customer addr = (Customer) iter.next();
				//if(addr.getID()==IDNum)
				//{
		%>
		<tr >
			<td><%=addr.getBalance()%></td>
			<td><%=k%></td>
			<td><%=addr.getBalance()-k%></td>
			</tr>
			<td> <a href="checkoutresult.jsp?id=<%=k%>">Check Out</a></td>
  </body>
</html>
