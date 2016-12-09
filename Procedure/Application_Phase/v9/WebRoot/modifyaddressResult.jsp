<%@page import="model.Address"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyaddressResult.jsp' starting page</title>
    
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
    <jsp:useBean id="address" class="model.Address"></jsp:useBean>
  <jsp:useBean id="addresssevice" class="service.AddressService"></jsp:useBean>
		<%
		int id = Integer.valueOf(request.getParameter("id"));
		Address addr = addresssevice.queryCusbyID(id);

	%>

    <center>
		<form action="modifyfeedbackAddr.jsp" method="post">
			<table bgColor="#c0c0c0">
				<tr>
					<td align="center" bgcolor=green colspan=2><font color=white>Input the information of a product</font></td>
				</tr>
				<tr>
					<td>Address ID</td>
					<td><input type="text" size=20 name="addrID"
					value="<%= addr.getAddrID()%>"></td>
				</tr>
				<tr>
					<td>Street</td>
					<td><input type="text" size=20 name="street"
					value="<%= addr.getStreet()%>"></td>
				</tr>
				<tr>
					<td>City</td>
					<td><input type="text" size=20 name="city"
					value="<%= addr.getCity()%>"></td>
				</tr>
				<tr>
					<td>StateName</td>
					<td><input type="text" size=20 name="stateName"
					value="<%= addr.getStateName()%>"></td>
				</tr>
				<tr>
					<td>Zipcode</td>
					<td><input type="text" size=20 name="zipcode"
					value="<%= addr.getZipcode()%>"></td>
				</tr>
				<tr>
					<td>Address Type</td>
					<td><input type="text" size=20 name="addrType"
					value="<%= addr.getAddrType()%>"></td>
				</tr>
				<tr ><td align="center" colspan="2" ><input type="hidden" name="id" value="<%=addr.getAddrID()%>"/><input type="submit"  value="Submit">&nbsp;&nbsp; <input
				type="reset"  value="Reset"></td></tr>				
			</table>
			
		</form>
	</center>
  </body>
</html>
