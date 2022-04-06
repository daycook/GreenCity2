
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext, org.springframework.web.context.support.WebApplicationContextUtils" %>
<%@ page import="net.jcms.framework.cd.service.CdDtlService" %>
<%@ page import="net.jcms.framework.menu.service.MenuService"%>
<%@ page import="net.jcms.conts.plan.service.PlanService"%>
<%@ page import="net.jcms.conts.bod.service.BodService"%>
<%@ page import="net.jcms.conts.menu.service.*" %>
<%@ page import="egovframework.rte.fdl.security.securedobject.impl.SecuredObjectServiceImpl"%>


<%
	ServletContext servletContext = request.getSession ().getServletContext();
	WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
	
	
	CdDtlService cdDtlService = (CdDtlService) wac.getBean ("cdDtlService");
	cdDtlService.initJson();
	
	/*PlanService planService = (PlanService) wac.getBean("planService");
	planService.initJson();*/
	
	BodService bodService = (BodService) wac.getBean ("bodService");
	bodService.initJson();
	
	MenuService menuService = (MenuService) wac.getBean ("menuService");
	menuService.initRoleMenuList();
	
	net.jcms.conts.menu.service.MenuService cmsMenuService = (net.jcms.conts.menu.service.MenuService) wac.getBean ("cmsMenuService");
	cmsMenuService.initJson((long)13);
	
	System.out.println("################## 공통코드 조기화");
	System.out.println("################## 게시판목록 조기화");
	System.out.println("################## 권한별 메뉴 조기화");

// 	SecuredObjectServiceImpl service = (SecuredObjectServiceImpl) wac.getBean("securedObjectService");
// 	Object obj2 = wac.getBean("requestMap");
	
// // 	System.out.println("################## "+obj2.getClass().toString());
// // 	System.out.println("################## 값 : "+service.getRolesAndUrl());
// 	System.out.println("################## 값(전) : "+obj2);
// 	obj2 = service.getRolesAndUrl();
// 	System.out.println("################## 값(후) : "+obj2);
	
	
	
	
	//wac.getBean("requestMap") = service.getRolesAndUrl();
	
// 	UrlResourcesMapFactoryBean urlbean = (UrlResourcesMapFactoryBean) wac.getBean("requestMap");
// 	System.out.println("################## "+urlbean);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Title of the document</title>
</head>

<body>
관련정보가 재로드 되었습니다.
<script type="text/javascript">
/*
	setTimeout( function {
        alert('자동으로 화면 전환 됩니다.');
    }, 3000); 
 3초 뒤에 경고창으로 해당문구를 출력함 */
 document.location.href="/system/main.mng";
</script>
	<script>
		
	</script>
</body>
</html>