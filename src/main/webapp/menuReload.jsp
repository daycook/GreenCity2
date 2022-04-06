<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="
org.springframework.web.context.WebApplicationContext, 
org.springframework.web.context.support.WebApplicationContextUtils, 
net.jcms.conts.menu.service.MenuService" %>
<%@ page import="net.jcms.conts.bod.service.BodService"%>
<%
	ServletContext servletContext = request.getSession ().getServletContext();
	WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
	
	MenuService menuService = (MenuService) wac.getBean ("cmsMenuService");
	menuService.initJson ();
	
	BodService bodService = (BodService) wac.getBean ("bodService");
	bodService.initJson();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title of the document</title>
</head>

<body>
done;
</body>
</html>