<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'validate.jsp' starting page</title>

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
	<jsp:useBean id="user" class="model.User"></jsp:useBean>
	<jsp:useBean id="userservice" class="service.UserService"></jsp:useBean>
	<jsp:setProperty property="*" name="user" />
	<%
		if(userservice.validateCustomer(user)){
			session.setAttribute("user", user);
	%>
			<jsp:forward page="customer.jsp"></jsp:forward>
	<%
		}
		else if(userservice.validateStaff(user)){
			session.setAttribute("user", user);
	%>
			<jsp:forward page="staff.jsp"></jsp:forward>
	<%
		}
		else{
	%>
			<jsp:forward page="index.jsp"></jsp:forward>
	<%
		}
	%>
</body>
</html>
