<%@page import="model.Creditcard"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifycreditcardResult.jsp' starting page</title>
    
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
  <jsp:useBean id="creditcardserver" class="service.CreditcardService"></jsp:useBean>
		<%
		long id = Long.valueOf(request.getParameter("id"));
		Creditcard cred = creditcardserver.queryCusbyID(id);

	%>

    <center>
		<form action="modifyfeedbackCred.jsp" method="post">
			<table bgColor="#c0c0c0">
				<tr>
					<td align="center" bgcolor=green colspan=2><font color=white>Input the information of a product</font></td>
				</tr>
				<tr>
					<td>Card Number：</td>
					<td><input type="text" size=20 name="cardNum"
					value="<%= cred.getCardNum()%>"></td>
				</tr>
				<tr>
					<td>Exp Date：</td>
					<td><input type="text" size=20 name="expDate"
					value="<%= cred.getExpDate()%>"></td>
				</tr>
				<tr>
					<td>Holder Name：</td>
					<td><input type="text" size=20 name="holder"
					value="<%= cred.getHolder()%>"></td>
				</tr>
				<tr>
					<td>Customer ID：</td>
					<td><input type="text" size=20 name="customerID"
					value="<%= cred.getCustomerID()%>"></td>
				</tr>
				<tr>
					<td>Address ID：</td>
					<td><input type="text" size=20 name="addrID"
					value="<%= cred.getAddrID()%>"></td>
				</tr>
				<tr ><td align="center" colspan="2" ><input type="hidden" name="id" value="<%=cred.getCardNum()%>"/><input type="submit"  value="Submit">&nbsp;&nbsp; <input
				type="reset"  value="Reset"></td></tr>				
			</table>
			
		</form>
	</center>
  </body>
</html>
