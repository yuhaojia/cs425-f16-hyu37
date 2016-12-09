<%@page import="model.Shoppingcart"%>
<%@page import="service.ShoppingcartService"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shoppingsearch.jsp' starting page</title>
    
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
  <jsp:useBean id="shoppingcart" class="model.Shoppingcart"></jsp:useBean>
  <jsp:useBean id="shoppingcartService" class="service.ShoppingcartService"></jsp:useBean>
    <%
		String typeL = request.getParameter("type");
		List pros = shoppingcartService.queryAllproByType(typeL);
		Iterator iter = pros.iterator();

	%>
	<form action="shoppingresearchResult.jsp" method="post">
	<table>
		<tr>
			<td>Product ID</td>
			<td>Product Type</td>
			<td>Product Name</td>
			<td>Product Price</td>
			<td>Quantity</td>			
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				Shoppingcart product1 = (Shoppingcart) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><input type="text" size=20 name="productID"
					value="<%= product1.getProductID()%>"readonly></td>
			<td><input type="text" size=20 name="producttype"
					value="<%= product1.getProducttype()%>"readonly></td>
			<td><input type="text" size=20 name="productname"
					value="<%= product1.getProductname()%>"readonly></td>
			<td><input type="text" size=20 name="price"
					value="<%= product1.getPrice()%>"readonly></td>
			<td><input type="text" size=20 name="quantity"
					value="<%= product1.getQuantity()%>"></td>
			<td align="center" colspan="1" ><input type="hidden" name="id" value="<%=product1.getProductID()%>"/><input type="submit"  value="Buy"></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
    
  </body>
</html>