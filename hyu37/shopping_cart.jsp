<%@page import="model.Shoppingcart"%>
<%@page import="service.ShoppingcartService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyPriceInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
    <jsp:useBean id="shoppingcart" class="model.Shoppingcart"></jsp:useBean>
  <jsp:useBean id="shoppingcartService" class="service.ShoppingcartService"></jsp:useBean>
  <body>
  <%
		
		String u =(String)session.getAttribute("theuser");
    	int IDNum = Integer.parseInt(u);
		List stus = shoppingcartService.queryAllsc(IDNum);
		Iterator iter = stus.iterator();
	
	%>
	<table>
		<tr>
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

			<td><input type="text" size=20 name="quantity"
					value="<%= product1.getProducttype()%>"readonly></td>
			<td><input type="text" size=20 name="quantity"
					value="<%= product1.getProductname()%>"readonly></td>
			<td><input type="text" size=20 name="quantity"
					value="<%= product1.getPrice()%>"readonly></td>
			<td><input type="text" size=20 name="quantity"
					value="<%= product1.getQuantity()%>"></td>
			<td><a href="modifyProductInforesult.jsp?id=<%=product1.getProductID()%>">Add to shopping cart</a></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
