<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'customer.jsp' starting page</title>
    
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
  <frameset rows="20%,*">
  <frame src="staff_top.jsp">
	<frameset cols="20%,*">
		<frame src="customer_left.jsp">
		<frame src="customer_right.jsp" name="customer_right">
	</frameset>
</frameset>

<jsp:include page="islogin.jsp"></jsp:include>
    <frameset rows="20%,*">
	  <frame src="customer_top.jsp">
	  <frameset cols="20%,*">
		<frame src="staff_left.jsp">
		<frame src="staff_right.jsp" name="staff_right">
	  </frameset>
    </frameset>

  <body>
   Welcome! Dear customer! <br>
  </body>
</html>
