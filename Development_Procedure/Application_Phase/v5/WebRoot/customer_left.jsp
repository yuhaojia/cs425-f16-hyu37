<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'customer_left.jsp' starting page</title>
    
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
    <a href="profile.jsp" target="customer_right">My Profile</a><br>
    <br>
    <a href="displayaddress.jsp" target="customer_right">Display Address</a><br>
    <a href="addaddress.jsp" target="customer_right">Add New Address</a><br>
    <a href="modifyaddress.jsp" target="customer_right">Modify Address</a><br>
    <a href="deleteaddress.jsp" target="customer_right">Delete Address</a><br>
    <br>
    <a href="displaycreditcard.jsp" target="customer_right">Display Credit Card</a><br>
    <a href="addcreditcard.jsp" target="customer_right">Add Credit Card</a><br>
    <a href="modifycreditcard.jsp" target="customer_right">Modify Credit Card</a><br>
    <a href="deletecreditcard.jsp" target="customer_right">Delete Credit Card</a><br>
    <br>
    <a href="exit.jsp" target="_top">Exit</a><br>
  </body>
</html>
