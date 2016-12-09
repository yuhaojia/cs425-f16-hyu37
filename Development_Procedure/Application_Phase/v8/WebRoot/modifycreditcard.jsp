<%@page import="model.Creditcard"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifycreditcard.jsp' starting page</title>
    
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
    <jsp:useBean id="creditcard" class="model.Creditcard"></jsp:useBean>
  <jsp:useBean id="creditcardsevice" class="service.CreditcardService"></jsp:useBean>
  <%
  		String u =(String)session.getAttribute("theuser");
    	int IDNum = Integer.parseInt(u);
		List creds = creditcardsevice.queryAllCus(IDNum);
		// out.print(stus.size());  
		Iterator iter = creds.iterator();
	%>
	<table>
		<tr>
			<td>Card Number</td>
			<td>ExpDate</td>
			<td>Holder</td>
			<td>CustomerID</td>
			<td>AddressID</td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				Creditcard cred = (Creditcard) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=cred.getCardNum()%></td>
			<td><%=cred.getExpDate()%></td>
			<td><%=cred.getHolder()%></td>
			<td><%=cred.getCustomerID()%></td>
			<td><%=cred.getAddrID()%></td>	
			<td><a href="modifycreditcardResult.jsp?id=<%=cred.getCardNum()%>">modify</a></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
