<%@ page import="model.User" %>
<%@ page import="service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	User u = (User)session.getAttribute("user");	
	if(u == null){
%>
		<jsp:forward page="index.jsp"></jsp:forward>
<%
	}

%>
