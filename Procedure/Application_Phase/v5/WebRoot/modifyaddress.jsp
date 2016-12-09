<%@page import="model.Address"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modifyaddress.jsp' starting page</title>
    
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
  	    String u =(String)session.getAttribute("theuser");
    	int IDNum = Integer.parseInt(u);
		List addrs = addresssevice.queryAllCus(IDNum);
		// out.print(stus.size());  
		Iterator iter = addrs.iterator();
	%>
	<table>
		<tr>
			<td>Address ID</td>
			<td>Street</td>
			<td>City</td>
			<td>State</td>
			<td>Zipcode</td>
			<td>Address Type</td>
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				Address addr = (Address) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
			<td><%=addr.getAddrID()%></td>
			<td><%=addr.getStreet()%></td>
			<td><%=addr.getCity()%></td>
			<td><%=addr.getStateName()%></td>
			<td><%=addr.getZipcode()%></td>
			<td><%=addr.getAddrType()%></td>
			<td><a href="modifyaddressResult.jsp?id=<%=addr.getAddrID()%>">modify</a></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
  </body>
</html>
