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
    
    <title>My JSP 'modifyPriceInforesult.jsp' starting page</title>
    
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

	%>
	 <center>
		<form action="modifypricefeedback.jsp" method="post">
			<table bgColor="#c0c0c0">
				<tr>
					<td align="center" bgcolor=green colspan=2><font color=white>Input the information of a product</font></td>
				</tr>
				<tr>
					<td>Product ID：</td>
					<td><input type="text" size=20 name="stateName"
					value="<%= pro.getstateName()%>"></td>
				</tr>
				<tr>
					<td>Product Type：</td>
					<td><input type="text" size=20 name="productID"
					value="<%= pro.getProductID()%>"></td>
				</tr>
				<tr>
					<td>Product Name：</td>
					<td><input type="text" size=20 name="statePrice"
					value="<%= pro.getStatePrice()%>"></td>
				</tr>
				<tr ><td align="center" colspan="2" ><input type="hidden" name="id" value="<%=pro.getStatePrice()%>"/><input type="submit"  value="Submit">&nbsp;&nbsp; <input
				type="reset"  value="Reset"></td></tr>				
			</table>
			
		</form>
	</center>
  </body>
</html>
