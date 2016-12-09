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
    
    <title>My JSP 'deleteOneStu.jsp' starting page</title>
    
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
    <jsp:useBean id="product" class="model.Product"></jsp:useBean>
  <jsp:useBean id="productsevice" class="service.ProductService"></jsp:useBean>
		<%
		int id = Integer.valueOf(request.getParameter("id"));
		Product pro = productsevice.queryproid(id);

	%>

    <center>
		<form action="modifyfeedback.jsp" method="post">
			<table bgColor="#c0c0c0">
				<tr>
					<td align="center" bgcolor=green colspan=2><font color=white>Input the information of a product</font></td>
				</tr>
				<tr>
					<td>Product ID：</td>
					<td><input type="text" size=20 name="proID"
					value="<%= pro.getProID()%>"></td>
				</tr>
				<tr>
					<td>Product Type：</td>
					<td><input type="text" size=20 name="proType"
					value="<%= pro.getProType()%>"></td>
				</tr>
				<tr>
					<td>Product Name：</td>
					<td><input type="text" size=20 name="proName"
					value="<%= pro.getProName()%>"></td>
				</tr>
				<tr>
					<td>Product Size：</td>
					<td><input type="text" size=20 name="proSize"
					value="<%= pro.getProSize()%>"></td>
				</tr>
				<tr>
					<td>Information Type：</td>
					<td><input type="text" size=20 name="infoType"
					value="<%= pro.getInfoType()%>"></td>
				</tr>
				<tr>
					<td>Information：</td>
					<td><input type="text" size=20 name="info"
					value="<%= pro.getInfo()%>"></td>
				</tr>
				<tr ><td align="center" colspan="2" ><input type="hidden" name="id" value="<%=pro.getProID()%>"/><input type="submit"  value="Submit">&nbsp;&nbsp; <input
				type="reset"  value="Reset"></td></tr>				
			</table>
			
		</form>
	</center>

  </body>
</html>
