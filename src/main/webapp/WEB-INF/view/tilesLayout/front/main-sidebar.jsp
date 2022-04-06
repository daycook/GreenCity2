<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<div id="layoutSidenav_nav" style="padding-top: 20px;">
    <nav class="sb-sidenav accordion sb-sidenav-dark"   id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <c:forEach var="menu" items="${menuList}" varStatus="status">
						<c:if test="${menu.menuUrl != 'main' && menu.useSt == 'Y'}">
							<a class="nav-link collapsed" onclick="showMenu(${menu.menuId})">
			                    <div class="sb-nav-link-icon"></div>
			                    	<p style="font-size: 17px;">${menu.menuNm}</p>
			                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down fa-lg"></i></div>
			                </a>
			                <div class="collapse" id="collapseLayouts${menu.menuId}">
			                    <nav class="sb-sidenav-menu-nested nav">
			                     <c:forEach var="subMenu" items="${menu.childList}">
									<c:if test="${subMenu.useSt == 'Y'}">
										<a class="nav-link" href="<c:url value='/front/${subMenu.upperMenu.menuUrl}/${subMenu.menuUrl}.do'/>">- ${subMenu.menuNm}</a>
									</c:if>
								</c:forEach>
			                    </nav>
			                </div>
						</c:if>
				</c:forEach>
            </div>
        </div>
    </nav>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("#collapseLayouts"+${menu.upperMenuId}).show();
});

function showMenu(menuId){
	$(".collapse").hide();
	$("#collapseLayouts"+menuId).show();
}
</script>