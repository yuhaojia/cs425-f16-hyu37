<%@page import="model.Product"%>
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
  <jsp:include page="islogin.jsp"></jsp:include>
  <body>
  <jsp:useBean id="product" class="model.Product"></jsp:useBean>
  <jsp:useBean id="productsevice" class="service.ProductService"></jsp:useBean>
  <%
		List pros = productsevice.queryAllpro();
		// out.print(stus.size());  
		Iterator iter = pros.iterator();
	%>
	<table>
		<tr>
			<td>Product ID</td>		
			<td>Product Type</td>
			<td>Product Name</td>
			<td>Product Size</td>
			<td>Information Type</td>
			<td>Information</td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				Product product1 = (Product) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=product1.getProID()%></td>
			<td><%=product1.getProType()%></td>
			<td><%=product1.getProName()%></td>
			<td><%=product1.getProSize()%></td>
			<td><%=product1.getInfoType()%></td>
			<td><%=product1.getInfo()%></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
