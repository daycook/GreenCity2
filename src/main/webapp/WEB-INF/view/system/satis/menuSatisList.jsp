<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>

<section class="content-header">
	<tg:menuInfoTag />
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;메뉴별 만족도 통계</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon">사이트 구분</span>
								<select id="siteId" class="form-control">
									<c:forEach var="site" items="${siteList}">
										<option value="${site.siteId}" <c:if test="${site.siteId == 1}">selected</c:if>>${site.siteNm} (${site.domain})</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<!-- <label class="control-label col-md-3 col-sm-3 col-xs-12">일정기간</label>
						<div class="input-group col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control datepicker" name="startRegDt" id="startRegDt" placeholder="시작">
							<span class="input-group-addon"> ~ </span>
							<input type="text" class="form-control datepicker" name="endRegDt" id="endRegDt" placeholder="종료">
						</div> -->
					</div>
				</div>

				<div class="box-body">
					<div class="row">
						<div class="col-xs-6">
							<table id="datatable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;">
								<colgroup>
							        <col width="30%">
							        <col width="30%">
							        <col width="30%">
							        <col width="10%">
							    </colgroup>
								<thead>
									<tr>
										<th class="text-center">메뉴명</th>
										<th class="text-center">URL</th>
										<th class="text-center">점수</th>
										<th class="text-center">카운트</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
						
						<div class="col-xs-6" id="satisDiv">
							<table id="datatable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;">
								<colgroup>
							        <col width="20%">
							        <col width="15%">
							        <col width="10%">
							        <col width="50%">
							    </colgroup>
								<thead>
									<tr>
										<th class="text-center">등록자</th>
										<th class="text-center">등록시간</th>
										<th class="text-center">점수</th>
										<th class="text-center">의견</th>
									</tr>
								</thead>
								<tbody id="satistable"></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>

	var selectSite;
	var satis;
	
	$(document).ready(function() {
		$('#satisDiv').hide();
		
		select();
		
		$("#siteId").change(function() {
			$('#satisDiv').hide();
			select();
		});
	});
	
	function select() {
		$("#datatable > tbody").html("");
		$.ajax({
			url : "<c:url value='/system/satis/view.json' />",
			type : "POST",
			data : {"siteId" : $("#siteId").val(),"startRegDt":$("#startRegDt").val(),"endRegDt" : $("#endRegDt").val()},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					selectSite = res.data;
					$.ajax({
						url : "<c:url value='/system/satis/list.json' />",
						type : "POST",
						data : {"siteId" : $("#siteId").val()},
						dataType : "json",
						success : function(res) {
							if ("success" == res.result) {
								var html = "";
								satis = res.satis;
								for(idx in res.data) {
									var menu = res.data[idx];
									html += makeTbody(menu, 0);
								}
								$("#datatable > tbody").html(html);
							}else {
								alert(res.message);
							}
						}
					});
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	function makeTbody(menu, depth) {
		var html = "";
		html += "<tr>";
		html += "<td>";
		html += "<a onclick='openOpinion("+menu.menuId+",\""+$("#siteId").val()+"\")'>";
		for(var i = 0; i < depth; i++) {
			html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		if(menu.childList.length > 0){ 
			html += "<i class='fa fa-chevron-down'></i>"; 
		}else{ 
			html += "<i class='fa fa-chevron-right'></i>";
		}
		html += "&nbsp;"+menu.menuNm;
		html += "</a>";
		html += "</td>";

		html += "<td><a href='http://";
		html += selectSite.domain+"/";
		if(selectSite.startUrl != null && selectSite.startUrl != '') {
			html += selectSite.startUrl+"/";
		}
		if(menu.upperMenuId != null) {
			if(menu.upperMenu.upperMenuId != null) {
				html += menu.upperMenu.upperMenu.menuUrl+"/";
			}
			html += menu.upperMenu.menuUrl+"/";
		}
		html += menu.menuUrl;
		html += ".do' target='_blank'>/";
		if(selectSite.startUrl != null && selectSite.startUrl != '') {
			html += selectSite.startUrl+"/";
		}
		if(menu.upperMenuId != null) {
			if(menu.upperMenu.upperMenuId != null) {
				html += menu.upperMenu.upperMenu.menuUrl+"/";
			}
			html += menu.upperMenu.menuUrl+"/";
		}
		html += menu.menuUrl;
		html += "</a></td>";

		var percent = 0;
		var menuCount = 0;
		if(satis.length>0){
			for(inx in satis) {
				var menuSatis = satis[inx];
				if(menuSatis.MENU_ID == menu.menuId){
					percent = menuSatis.SCORE;
					menuCount = menuSatis.CNT;
				}
			}
		}
		
		html += "<td>"; 
		html += "<div class='progress'>";
		html += "<div class='progress-bar progress-bar-info' role='progressbar' aria-valuenow="+percent+" aria-valuemin='1' aria-valuemax='5' style='width:"+percent*20+"%'>";
		html += "</div>";
		html += "<span class='progress-completed'>"+percent+"</span>";
		html += "</div>";
		html += "</td>";
		html += "<td>";
		html += "<span class='text-center'>"+menuCount+"&nbsp;회</span>";
		html += "</td>";
		html += "</tr>";
		for(idx in menu.childList) {
			var childMenu = menu.childList[idx];
			html += makeTbody(childMenu, parseInt(depth)+1);
		}
		return html;
	}
	
	function openOpinion(menuId, siteId){
		$('#satistable').empty();
		$.ajax({
			url : "<c:url value='/system/satis/opinion.json' />",
			type : "POST",
			data : {"menuId": menuId, "siteId" : siteId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					if(res.data.length > 0){
					var opinionHtml = "";
						$.each(res.data, function(i) {
							var Nm = res.data[i].regNm;
							/*
							if(Nm != null && Nm != ''){
								var length = Nm.length;
								Nm = Nm.replace(Nm.substring(1,length), nameTostar(length-1)); 
							}
							*/
							opinionHtml += "<tr>";
							opinionHtml += "<td class='text-left'>";
							//opinionHtml += (Nm== null ? "익명" : Nm+"("+res.data[i].regId+")");
							opinionHtml += (Nm== null ? "익명" : Nm+"("+res.data[i].satisRegId+")");
							opinionHtml += "</td>";
							
							opinionHtml += "<td class='text-center'>";
							opinionHtml += new Date(res.data[i].regDt).format("yyyy-MM-dd")
							opinionHtml += "</td>";
							
							opinionHtml += "<td class='text-center'>";
							opinionHtml += res.data[i].score+"점";
							opinionHtml += "</td>";
							
							opinionHtml += "<td class='text-left ellipsis'>";
							opinionHtml += (res.data[i].opinion == null ? "" : res.data[i].opinion);
							opinionHtml += "</td>";
							opinionHtml += "</tr>";
						});
					}else{
						opinionHtml += "<tr>";
						opinionHtml += "<td class='text-center' colspan='4'>등록된 의견이 없습니다.</td>";
						opinionHtml += "</tr>";
					}
					$("#satistable").html(opinionHtml);
					$('#satisDiv').show();
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	function nameTostar(num){
		var star = "";
		for(var i=0; i<num; i++){
			star += "*";
		}
		return star;
	}
</script>