<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<div class="contentWrap">
	<cs:cmsMenuInfoTag siteId="${currentSite.siteId}" menuId="${menu.menuId}" />
	
	<div class="contents-wrapper" ${menu.contDispType}>
		<c:choose>
			<c:when test="${menu.contDispType eq 'CTS002'}">
		    <div id="pageselect-<c:out value='${menu.menuId}'></c:out>" class="pageselect">
		    	<div class="select-tab">
		        <strong>선택</strong>
		        <ul class="tabs">
				<c:forEach var="menuCont" items="${menuContList}" varStatus="status">
					<c:choose>
						<c:when test="${status.count == 1}">
							<li class="active"><a href="#pageselect-<c:out value='${menuCont.cont.contItem.contItemId}'></c:out>"><c:out value='${menuCont.cont.contItem.contItemNm}'></c:out></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#pageselect-<c:out value='${menuCont.cont.contItem.contItemId}'></c:out>"><c:out value='${menuCont.cont.contItem.contItemNm}'></c:out></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		        </ul>
		        </div>
				<c:forEach var="menuCont" items="${menuContList}" varStatus="status">
					<c:choose>
						<c:when test="${status.count == 1}">
							<div class="tab_content fade-in active" id="pageselect-<c:out value='${menuCont.cont.contItem.contItemId}'></c:out>"><c:out value='${menuCont.cont.contItem.cont}' escapeXml="false">></c:out></div>
						</c:when>
						<c:otherwise>
							<div class="tab_content fade-in" id="pageselect-<c:out value='${menuCont.cont.contItem.contItemId}'></c:out>"><c:out value='${menuCont.cont.contItem.cont}' escapeXml="false">></c:out></div>
						</c:otherwise>
					</c:choose>
				</c:forEach>        
		    </div>
			<script type="text/javascript">
			jQuery(document).ready(function() {
			    initTabMenu("pageselect-<c:out value='${menu.menuId}'></c:out>");
			});//ready
			</script>        
			</c:when>	
			<c:when test="${menu.contDispType eq 'CTS003'}">
			<div id="pagetab-<c:out value='${menu.menuId}'></c:out>" class="pagetab">
				<div class="select-tab">
		        <strong>선택</strong>	
				<ul class="tabs <c:out value='${menuContCnt}'></c:out>">
				<c:forEach var="menuCont" items="${menuContList}" varStatus="status">
					<c:choose>
						<c:when test="${status.count == 1}">
							<li class="active"><a href="#pagetab-<c:out value='${menuCont.cont.contItem.contItemId}'></c:out>"><c:out value='${menuCont.cont.contItem.contItemNm}'></c:out></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="#pagetab-<c:out value='${menuCont.cont.contItem.contItemId}'></c:out>"><c:out value='${menuCont.cont.contItem.contItemNm}'></c:out></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</ul>
				</div>
				<c:forEach var="menuCont" items="${menuContList}" varStatus="status">
					<c:choose>
						<c:when test="${status.count == 1}">
							<div class="tab_content fade-in active" id="pagetab-<c:out value='${menuCont.cont.contItem.contItemId}'></c:out>"><c:out value='${menuCont.cont.contItem.cont}' escapeXml="false"></c:out></div>
						</c:when>
						<c:otherwise>
							<div class="tab_content fade-in" id="pagetab-<c:out value='${menuCont.cont.contItem.contItemId}'></c:out>"><c:out value='${menuCont.cont.contItem.cont}' escapeXml="false"></c:out></div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<script type="text/javascript">
			jQuery(document).ready(function() {
			    initTabMenu("pagetab-<c:out value='${menu.menuId}'></c:out>");
			});//ready
			</script>	
			</c:when>
			<c:otherwise>
				<c:forEach var="menuCont" items="${menuContList}" varStatus="status">
					<c:if test="${status.count == 1}">
						<c:out value='${menuCont.cont.contItem.cont}' escapeXml="false"></c:out>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>