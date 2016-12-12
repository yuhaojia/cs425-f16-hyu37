<%@page import="model.Product"%>
<%@page import="service.ShoppingcartService"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shoppingsearch.jsp' starting page</title>
    
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
  <jsp:useBean id="shoppingcart" class="model.Shoppingcart"></jsp:useBean>
  <jsp:useBean id="shoppingcartService" class="service.ShoppingcartService"></jsp:useBean>
    <%
    	String u =(String)session.getAttribute("theuser");
    	int IDNum = Integer.parseInt(u);
		String typeL = request.getParameter("type");
		List pros = shoppingcartService.queryAllproByType(IDNum, typeL);
		Iterator iter = pros.iterator();

	%>
	<form action="shoppingresearchResult.jsp" method="post">
	<table>
		<tr>
		    <td>Image</td>	
			<td>Product ID</td>
			<td>Product Type</td>
			<td>Product Name</td>
			<td>Product Size</td>
			<td>Info Type</td>
			<td>Info</td>			
		</tr>
		<%
			int i = 0;
			while (iter.hasNext()) {
				Product product1 = (Product) iter.next();
		%>
		<tr <%if (i % 2 == 0) {%> bgcolor="#F0F8FF" <%}%>>
		    <td><img src=images/<%=product1.getProID()%>.jpg></td>	
			<td><input type="text" size=20 name="proID"
					value="<%= product1.getProID()%>"readonly></td>
			<td><input type="text" size=20 name="proType"
					value="<%= product1.getProType()%>"readonly></td>
			<td><input type="text" size=20 name="proName"
					value="<%= product1.getProName()%>"readonly></td>
			<td><input type="text" size=20 name="proSize"
					value="<%= product1.getProSize()%>"readonly></td>
			<td><input type="text" size=20 name="infoType"
					value="<%= product1.getInfoType()%>"readonly></td>
			<td><input type="text" size=20 name="info"
					value="<%= product1.getInfo()%>"readonly></td>
			<td align="center" colspan="1" ><input type="hidden" name="id" value="<%=product1.getProID()%>"/><input type="submit"  value="Buy"></td>
		</tr>
		<%
			i++;
			}
		%>

	</table>
   </form>
  </body>
</html>
