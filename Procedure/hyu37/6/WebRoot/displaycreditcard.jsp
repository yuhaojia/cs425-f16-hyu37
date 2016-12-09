<%@page import="model.Creditcard"%>
<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'displaycreditcard.jsp' starting page</title>
    
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
    <jsp:useBean id="CreditcardServ" class="service.CreditcardService"></jsp:useBean>
	<%
		List stus = CreditcardServ.queryAllCus();
		// out.print(stus.size());  
		Iterator iter = stus.iterator();
	%>
	<table>
		<tr>
			<td>Card Number</td>
			<td>expDate</td>
			<td>holder</td>
			
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				Creditcard addr = (Creditcard) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=addr.getCardNum()%></td>
			<td><%=addr.getExpDate()%></td>
			<td><%=addr.getHolder()%></td>
			
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
