<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Add the new address here.</title>
    
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
   <center>
		<form action="addcreditcard_result.jsp" method="post">
			<table bgColor="#c0c0c0">
				<tr>
					<td align="center" bgcolor=green colspan=2><font color=white>Add The Address</font></td>
				</tr>
				<tr>
					<td>Card Number：</td>
					<td><input type="text" size=20 name="cardNum"></td>
				</tr>
				<tr>
					<td>expDate</td>
					<td><input type="text" size=20 name="expDate"></td>
				</tr>
				<tr>
					<td>holder</td>
					<td><input type="text" size=20 name="holder"></td>
				</tr>
				
				<tr ><td align="center" colspan="2" ><input type="submit"  value="submit">&nbsp;&nbsp; <input
				type="reset"  value="reset"></td></tr>				
			</table>
			
		</form>
	</center>
  </body>
</html>
