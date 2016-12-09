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
    <a href="inputProductInfo.jsp" target="staff_right">Add new product</a><br>
     <a href="inputPriceInfo.jsp" target="staff_right">Add new price</a><br>
     <a href="inputWarehouseInfo.jsp" target="staff_right">Add new warehouse</a><br>
     
    <a href="displayProductInfo.jsp" target="staff_right">Display profile</a><br>
    
     <a href="modifyProductInfo.jsp" target="staff_right">Modify product</a><br>
     
       <a href="deleteProductInfo.jsp" target="staff_right">Delete product</a><br>
       <a href="deletePriceInfo.jsp" target="staff_right">Delete price</a><br>
       
        <a href="exit.jsp" target="_top">Exit</a><br>
  </body>
</html>
