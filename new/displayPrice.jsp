<%@page import="model.PricePerState"%>
<%@page import="service.PriceService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'displayStaffInfo.jsp' starting page</title>
    
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
		List pros = priceservice.queryAllpps();
		// out.print(stus.size());  
		Iterator iter = pros.iterator();
	%>
	<table>
		<tr>
			<td>Product ID</td>
			<td>State Name</td>
			<td>State Price</td>
			<td>Product Type</td>
			<td>Product Name</td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				PricePerState product1 = (PricePerState) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=product1.getProductID()%></td>
			<td><%=product1.getstateName()%></td>
			<td><%=product1.getStatePrice()%></td>
			<td><%=product1.getProtype()%></td>
			<td><%=product1.getProname()%></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
