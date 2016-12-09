<%@page import="model.User"%>
<%@page import="model.Customer"%>
<%@ page import="service.UserService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My profile</title>
    
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
  <jsp:useBean id="user" class="model.User"></jsp:useBean>
  <jsp:useBean id="customer" class="model.Customer"></jsp:useBean>
  <jsp:useBean id="customersevice" class="service.CustomerService"></jsp:useBean>
    <%
    	String u =(String)session.getAttribute("theuser");
    	int IDNum = Integer.parseInt(u);
		//int IDNum = user.getID();
		List stus = customersevice.queryAllCus(IDNum);
		 out.print(stus.size()); 
		 out.print(IDNum); 
		Iterator iter = stus.iterator();
	%>
	<table>
		<tr>
			<td>Id</td>
			<td>Balance</td>
			<td>Last Name</td>
			<td>First Name</td>
		</tr>
		<%
			
			int i = 0;
			while (iter.hasNext()) {
				Customer addr = (Customer) iter.next();
				//if(addr.getID()==IDNum)
				//{
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=addr.getID()%></td>
			<td><%=addr.getBalance()%></td>
			<td><%=addr.getLastName()%></td>
			<td><%=addr.getFirstName()%></td>
		</tr>
		<%
			   //}
			 i++;
			}
		%>
	</table>
  </body>
</html>
