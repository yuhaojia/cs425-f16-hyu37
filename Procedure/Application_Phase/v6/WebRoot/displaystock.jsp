<%@page import="model.Stock"%>
<%@page import="service.StockService"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'displaystock.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <jsp:useBean id="stock" class="model.Stock"></jsp:useBean>
  <jsp:useBean id="stockService" class="service.StockService"></jsp:useBean>
  <body>
   <%
		List pros = stockService.queryAllstock();
		// out.print(stus.size());  
		Iterator iter = pros.iterator();
  %>
    <table>
		<tr>
			<td>Product ID</td>
			<td>WareHouse ID</td>
			<td>Quantity</td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				Stock product1 = (Stock)iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=product1.getProductID()%></td>
			<td><%=product1.getWareHouseID()%></td>
			<td><%=product1.getQuanity()%></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
