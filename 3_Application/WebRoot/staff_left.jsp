<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'staff_left.jsp' starting page</title>
    
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
  	<a href="displayProductInfo.jsp" target="staff_right">Display Product</a><br>
    <a href="inputProductInfo.jsp" target="staff_right">Add New Product</a><br>
    <a href="deleteProductInfo.jsp" target="staff_right">Delete Product</a><br>
    <a href="modifyProductInfo.jsp" target="staff_right">Modify Product</a><br>
    <br>
    <a href="displayPrice.jsp" target="staff_right">Display Product State Price</a><br>
    <a href="inputPriceInfo.jsp" target="staff_right">Add New Price</a><br>
    <a href="modifyPriceInfo.jsp" target="staff_right">Modify Price</a><br>
    <a href="deletePriceInfo.jsp" target="staff_right">Delete price</a><br>
    <br>
    <a href="displaystock.jsp" target="staff_right">Display Stock</a><br>
    <a href="addstock.jsp" target="staff_right">Add Product to Stock</a><br>
    <br>
    <a href="exit.jsp" target="_top">Exit</a><br>
  </body>
</html>
