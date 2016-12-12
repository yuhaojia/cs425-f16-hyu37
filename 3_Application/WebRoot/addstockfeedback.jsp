	<%@page import="model.Stock"%>
<%@page import="service.StockService"%>
	<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addstockfeedback.jsp' starting page</title>
    
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
   <%
		request.setCharacterEncoding("utf-8");
	%>
  <jsp:useBean id="stock" class="model.Stock"></jsp:useBean>
  <jsp:useBean id="stockService" class="service.StockService"></jsp:useBean>
	<jsp:setProperty property="*" name="stock" />

	<%
		int WID = stock.getWareHouseID();
		List pros = stockService.queryAllstock();
		// out.print(stus.size());  
		Iterator iter = pros.iterator();
		int total = 0;
			while (iter.hasNext()) {
				Stock product1 = (Stock)iter.next();
				int pro1WID = product1.getWareHouseID();
				if(pro1WID == WID)
				{
					total = total + product1.getQuanity();
				}
				
				
			}
	%>

	<%
		if (stockService.addstock(stock, total))
			out.print("success!!");
		else
			out.print("sorry! The total size of all products stored in this warehouse exceed the capability!");
	%>

  </body>
</html>
