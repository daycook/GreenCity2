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
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;사이트별 메뉴 목록</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon">사이트 구분</span>
								<c:set value="${siteId}" var="siteIdParameter"></c:set>
								<c:if test="${siteIdParameter == null}">
									<select id="siteId" class="form-control">
										<c:forEach var="site" items="${siteList}">
											<option value="${site.siteId}" <c:if test="${site.siteId == 1}">selected</c:if>>${site.siteNm} (${site.domain})</option>
										</c:forEach>
									</select>
								</c:if>
								<c:if test="${siteIdParameter != null}">
									<select id="siteId" class="form-control">
										<c:forEach var="site" items="${siteList}">
											<option value="${site.siteId}" <c:if test="${site.siteId == siteIdParameter}">selected</c:if>>${site.siteNm} (${site.domain})</option>
										</c:forEach>
									</select>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-xs-12">
							<table id="datatable" class="table table-bordered table-striped cmsTable"  style="width:100%; table-layout:fixed;">
								<thead>
									<tr>
										<th class="text-center" width="20%">메뉴명</th>
										<th class="text-center" width="25%">URL</th>
										<th class="text-center" width="20%">메뉴 타입</th>
										<th class="text-center" width="35%">기능</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="box-footer">
					<button type="button" class="btn btn-outline-primary" onclick="goChangeOrder()"><i class='fa fa-bars'></i> 메뉴 순서 변경</button>
					<button type="button" class="btn btn-outline-primary pull-right" onclick="showInsertModal()">최상위 메뉴 추가</button>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="modal fade save-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2 id="save-modal-title"></h2>
			</div>
			<div class="modal-body no-padding">
				<form id="saveForm" name="saveForm" class="form-horizontal form-label-left">
					<input type="hidden" name="menuId" />
					<input type="hidden" name="upperMenuId" />
					<input type="hidden" name="siteId" />
					<table class="table table-condensed">
						<colgroup>
							<col width="20%">
							<col width="60%">
							<col width="20%">
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center">사이트</th>
								<td colspan="2" id="siteTxt"></td>
							</tr>
							<tr id="upperMenuTxtDiv">
								<th class="text-center">상위 메뉴</th>
								<td colspan="2" id="upperMenuTxt"></td>
							</tr>
							<tr>
								<th class="text-center">메뉴명 <span class="required">*</span></th>
								<td colspan="2">
									<input type="text" name="menuNm" class="form-control" placeholder="메뉴명을 입력">	
								</td>
							</tr>
							<tr>
								<th class="text-center">URL <span class="required">*</span></th>
								<td colspan="2">
									<input type="text" name="menuUrl" class="form-control" placeholder="메뉴명의 URL을 입력">	
								</td>
							</tr>
							<tr>
								<th class="text-center">메뉴 타입</th>
								<td colspan="2">
									<tg:cdDtl type="radio" cd="program" name="menuTp" labelYn="Y" value="ready" event="onchange=\"changeMenuType()\""/>
								</td>
							</tr>
							<tr class="linkDiv">
								<th class="text-center">링크 URL</th>
								<td>
									<input type="text" name="linkUrl" class="form-control">
								</td>
								<td>
									<select name="linkType" class="form-control">
										<option value="blank" selected>새창</option>
										<option value="self">현재창</option>
									</select>
								</td>
							</tr>
							<tr class="contDiv">
								<th class="text-center">콘텐츠 표시방법</th>
								<td colspan="2">
									<tg:cdDtl cd="contdisp" name="contDispType" styleClass="form-control"/>
								</td>
							</tr>
							<tr class="boardDiv">
								<th class="text-center">게시판</th>
								<td colspan="2">
									<select name="bodId" class="form-control">
										<c:forEach var="bod" items="${bodList}">
											<option value="${bod.bodId}">${bod.bodNm}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th class="text-center">메뉴 설명</th>
								<td colspan="2">
									<textarea class="form-control" rows="3" name="menuDesc" placeholder="메뉴설명을 입력"></textarea>	
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onclick="save()">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade popup-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>팝업 관리</h2>
			</div>
			<div class="modal-body no-padding">
				<form id="popupForm" name="popupForm" class="form-horizontal form-label-left">
					<input type="hidden" name="menuId" />
					<table class="table table-bordered" id="popupTable">
						<thead>
							<tr>
								<th class='text-center'>팝업</th>
								<th class='text-center'>기능</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-plus" onclick="addPopupRow()">추가</button>
				<button type="button" class="btn btn-outline-primary" onclick="updatePopup()">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade cont-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h2>콘텐츠 관리</h2>
			</div>
			<div class="modal-body no-padding">
				<form id="contForm" name="contForm" class="form-horizontal form-label-left">
					<input type="hidden" name="menuId" />
					<table class="table table-bordered" id="contTable">
						<thead>
							<tr>
								<th class='text-center'>콘텐츠</th>
								<th class='text-center'>기능</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" onclick="addContRow()">추가</button>
				<button type="button" class="btn btn-outline-primary" onclick="updateCont()">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>

	var selectSite;

	$(document).ready(function() {
		select();
		$("#siteId").change(function() {
			select();
		});
	});
	
	function changeMenuType() {
		$(".linkDiv").hide();
		$(".contDiv").hide();
		$(".boardDiv").hide();

		$("." + $(":radio[name='menuTp']:checked").val () + "Div").show ();
	}
	
	function select() {
		$("#datatable > tbody").html("");
		$.ajax({
			url : "<c:url value='/system/site/view.json' />",
			type : "POST",
			data : {"siteId" : $("#siteId").val()},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					selectSite = res.data;
					$.ajax({
						url : "<c:url value='/system/cmsMenu/list.json' />",
						type : "POST",
						data : {"siteId" : $("#siteId").val()},
						dataType : "json",
						success : function(res) {
							if ("success" == res.result) {
								var html = "";
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
		
		//메뉴명
		html += "<td>";
		for(var i = 0; i < depth; i++) {
			html += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		}
		if(menu.childList.length > 0) html += "<i class='fa fa-chevron-down'></i>"; 
		else html += "<i class='fa fa-chevron-right'></i>";
		html += "&nbsp;"+menu.menuNm;
		html += "</td>";
		
		//메뉴 URL
		html += "<td>";
		if(menu.childList.length == 0) {
			html += "<a href='http://";
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
			html += "</a>";
		}
		html += "</td>";
		
		//메뉴 타입
		html += "<td class='text-center'>";
		if(menu.childList.length == 0) {
			html += "<span class='label label-"+menu.menuTpCd.cdDtlLabel+"'>"+menu.menuTpCd.cdDtlNm+"</span>";
		}
		html += "</td>";
		
		//기능
		html += "<td class='text-center'>";
		if(menu.menuUrl == "main") {
			html += "<button class='btn btn-xs btn-outline-primary disabled' type='button' data-toggle='tooltip' title='메인메뉴는 변경 불가능합니다.'>";
			html += "<i class='material-icons'>panorama_fish_eye</i>";
			html += "</button>&nbsp;";
		}else {
			if(menu.useSt == 'Y') {
				html += "<button class='btn btn-xs btn-outline-primary' type='button' data-toggle='tooltip' title='사용여부변경' onclick='updateUseSt(\""+menu.menuId+"\")'>";
				html += "<i class='material-icons'>panorama_fish_eye</i>";
				html += "</button>&nbsp;";
			}else {
				html += "<button class='btn btn-xs btn-outline-primary' type='button' data-toggle='tooltip' title='사용여부변경' onclick='updateUseSt(\""+menu.menuId+"\")'>";
				html += "<i class='material-icons'>lens</i>";
				html += "</button>&nbsp;";
			}
		}
		
		if(menu.menuUrl == "main") {
			html += "<button class='btn btn-xs btn-outline-primary disabled' type='button' data-toggle='tooltip' title='메인메뉴는 변경 불가능합니다.'>";
			html += "<i class='material-icons'>playlist_add</i>";
			html += "</button>&nbsp;";
		}else {
			if(depth > 1) {
				html += "<button type='button' class='btn btn-xs btn-outline-primary disabled' data-toggle='tooltip' title='최대 3Depth까지 추가가능합니다.' ";
			}else {
				html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='하위 메뉴 추가' ";
			}
			if(depth < 2) {
				html += "onclick='showInsertModal(\""+menu.menuId+"\",\""+menu.menuNm+"\")'";
			}
			html += "><i class='material-icons'>playlist_add</i></button>&nbsp;";
		}
		
		if(menu.menuUrl == "main") {
				html += "<button type='button' class='btn btn-xs btn-outline-primary disabled' data-toggle='tooltip' title='메인메뉴는 변경 불가능합니다.'><i class='material-icons'>build</i></button>&nbsp;";
		}else{
			html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='수정' onclick='showUpdateModal(\""+menu.menuId+"\")'><i class='material-icons'>build</i></button>&nbsp;";
		}
		
		if(menu.menuUrl == "main") {
			html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='팝업 목록' onclick='showPopupModal(\""+menu.menuId+"\")'><i class='material-icons'>flip_to_front</i></button>&nbsp;";
		}else{
			html += "<button type='button' class='btn btn-xs btn-outline-primary disabled' data-toggle='tooltip' title='메인메뉴만 가능합니다.'><i class='material-icons'>flip_to_front</i></button>&nbsp;";
		}
		
		html += "<button type='button' class='btn btn-xs btn-outline-primary ";
		if(menu.menuTp.trim() != "cont") {
			html += "disabled";
		}else{
			html += "enabled";
		}
		html += "' data-toggle='tooltip' title='콘텐츠 목록' ";

		if(menu.menuTp.trim() == "cont") {
			html += " onclick='showContModal(\""+menu.menuId+"\")' ";
		}
		
		html += "><i class='material-icons'>description</i></button>";
		if(menu.menuUrl == "main") {
			html += "<button type='button' class='btn btn-xs btn-outline-primary disabled' data-toggle='tooltip' title='메인메뉴는 변경 불가능합니다.'><i class='material-icons'>delete</i></button>";
		}else {
			html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='삭제' onclick='del(\""+menu.menuId+"\")'><i class='material-icons'>delete</i></button>";
		}
		html += "</td>";
		html += "</tr>";
		for(idx in menu.childList) {
			var childMenu = menu.childList[idx];
			html += makeTbody(childMenu, parseInt(depth)+1);
		}
		return html;
	}
	
	function showInsertModal(upperMenuId, upperMenuNm) {
		$("#upperMenuTxtDiv").hide();
		
		var form = document.saveForm;
		form.siteId.value = $("#siteId").val();
		$("#siteTxt").html($("#siteId option:selected").text());
		
		form.menuId.value = "";
		form.menuNm.value = "";
		form.menuUrl.value = "";
		form.menuDesc.value = "";
		if(upperMenuId != null) {
			$("#upperMenuTxtDiv").show();
			$("#upperMenuTxt").html(upperMenuNm);
			form.upperMenuId.value = upperMenuId;
		}else {
			form.upperMenuId.value = "";
		}
		
		changeMenuType();
		$("#saveForm").attr("action","<c:url value='/system/cmsMenu/insert.json' />");
		$("#save-modal-title").html("등록");
		$('.save-modal').modal("show");
	}
	
	function showUpdateModal(menuId) {
		$.ajax({
			url : "<c:url value='/system/cmsMenu/view.json' />",
			type : "POST",
			data : {"menuId" : menuId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					$("#upperMenuTxtDiv").hide();
					
					var form = document.saveForm;
					form.siteId.value = $("#siteId").val();
					$("#siteTxt").html($("#siteId option:selected").text());
					
					var data = res.data;
					form.menuId.value = data.menuId;
					form.menuNm.value = data.menuNm;
					form.menuUrl.value = data.menuUrl;

					if(data.menuDesc == null || data.menuDesc == ""){
						form.menuDesc.value = "";	
					}else{
						form.menuDesc.value = data.menuDesc;	
					}

					if(data.upperMenuId != null) {
						$("#upper MenuTxtDiv").show();
						$("#upperMenuTxt").html(data.upperMenu.menuNm);
					}
					
					for(var i = 0; i < form.menuTp.length; i++) {
						if(form.menuTp[i].value == data.menuTp) {
							form.menuTp[i].checked = true;
						}
					}
					
					form.linkUrl.value = data.linkUrl;
					for(var i = 0; i < form.linkType.length; i++) {
						if(form.linkType[i].value == data.linkType) {
							form.linkType[i].selected = true;
						}
					}
					for(var i = 0; i < form.contDispType.length; i++) {
						if(form.contDispType[i].value == data.contDispType) {
							form.contDispType[i].selected = true;
						}
					}
					for(var i = 0; i < form.bodId.length; i++) {
						if(form.bodId[i].value == data.bodId) {
							form.bodId[i].selected = true;
						}
					}
					
					changeMenuType();
					$("#saveForm").attr("action","<c:url value='/system/cmsMenu/update.json' />");
					$("#save-modal-title").html("수정");
					$('.save-modal').modal("show");			
				}else {
					alert(12)
					alert(res.message);
				}
			}
		});
	}
	
	function save() {
		var form = document.saveForm;
		if($.trim(form.menuNm.value) == '') {
			alert("메뉴명을 입력 해 주세요.");
			form.menuNm.focus();
		}else if($.trim(form.menuUrl.value) == '') {
			alert("URL을 입력 해 주세요.");
			form.menuUrl.focus();
		}else {
			if(confirm($("#save-modal-title").html()+" 하시겠습니까?")) {
				$.ajax({
					url : $("#saveForm").attr("action"),
					type : "POST",
					data : $("#saveForm").serialize(),
					dataType : "json",
					success : function(res) {
						if ("success" == res.result) {
							alert($("#save-modal-title").html()+"되었습니다.");
							select();
							$('.save-modal').modal("hide");
						}else {
							alert(res.message);
						}
					}
				});
			}
		}
	}
	
	function showContModal(menuId) {
		selectContList(menuId);
		$(".cont-modal").modal("show");
	}
	
	function selectContList(menuId) {
		$.ajax({
			url : "<c:url value='/system/cmsMenu/contList.json' />",
			type : "POST",
			data : {"menuId" : menuId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var form = document.contForm;
					form.menuId.value = menuId;
					
					$("#contTable > tbody").html();
					var html = "";
					for(idx in res.data) {
						var cont = res.data[idx].cont;
						html += "<tr>";
						html += "<td><input type='hidden' name='contIdList' value='"+cont.contId+"'/>"+cont.contNm+"</td>";
						html += "<td class='text-center'><button type='button' class='btn btn-xs btn-danger' data-toggle='tooltip' title='삭제' onclick='delRow(this)'><i class='fa fa-trash'></i></button></td>";
						html += "</tr>";
					}
					$("#contTable > tbody").html(html);
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	function updateCont() {
		if(confirm("수정하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/cmsMenu/contUpdate.json' />",
				type : "POST",
				data : $("#contForm").serialize(),
				dataType : "json",
				success : function(res) {
					if ("success" == res.result) {
						alert("수정되었습니다.");
						selectContList(document.contForm.menuId.value);
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
	
	function addContRow() {
		var html = "<tr>";
		html += "<td>";
		html += "<select name='contIdList' class='form-control selectpicker' data-live-search='true'>";
		<c:forEach var="cont" items="${contList}">
			html += "<option value='${cont.contId}'>${cont.contNm}</option>";
		</c:forEach>
		html += "</select>";
		html += "</td>";
		html += "<td class='text-center'><button type='button' class='btn btn-xs btn-danger' data-toggle='tooltip' title='삭제' onclick='delRow(this)'><i class='fa fa-trash'></i></button></td>";
		html += "</tr>";
		
		var tbody = $('#contTable > tbody').html();
		tbody = tbody.replace(/\n/gi,''); //엔터제거
		tbody = tbody.replace(/' '/gi,''); //공백제거
		tbody = tbody.replace(/\t/gi,''); //탭제거
		if(tbody == '') {
			$('#contTable > tbody').append(html);
		}else {
			$("#contTable > tbody > tr:last").after(html);
		}
		$('.selectpicker').selectpicker();
	}
	
	//메뉴 순서 변경 페이지 이동
	function goChangeOrder() {
		location.href = "/system/cmsMenu/changeOrder.mng?siteId="+$("#siteId").val();
	}
	
	function del(menuId) {
		if(confirm("삭제하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/cmsMenu/delete.json' />",
				type : "POST",
				data : {"menuId" : menuId, "siteId" : $("#siteId").val()},
				dataType : "json",
				success : function(res) {
					if ("success" == res.result) {
						alert("삭제되었습니다.");
						select();
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
	
	function showPopupModal(menuId) {
		selectPopupList(menuId);
		$(".popup-modal").modal("show");
	}
	
	function selectPopupList(menuId) {
		$.ajax({
			url : "<c:url value='/system/cmsMenu/popupList.json' />",
			type : "POST",
			data : {"menuId" : menuId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var form = document.popupForm;
					form.menuId.value = menuId;
					
					$("#popupTable > tbody").html();
					var html = "";
					for(idx in res.data) {
						var popup = res.data[idx];
						html += "<tr>";
						html += "<td><input type='hidden' name='popupId' value='"+popup.popupId+"'/>"+popup.popupNm+"</td>";
						html += "<td class='text-center'><button type='button' class='btn btn-xs btn-danger' data-toggle='tooltip' title='삭제' onclick='delRow(this)'><i class='fa fa-trash'></i></button></td>";
						html += "</tr>";
					}
					$("#popupTable > tbody").html(html);
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	function updatePopup() {
		if(confirm("수정하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/cmsMenu/popupUpdate.json' />",
				type : "POST",
				data : $("#popupForm").serialize()+"&siteId="+$("#siteId").val(),
				dataType : "json",
				success : function(res) {
					if ("success" == res.result) {
						alert("수정되었습니다.");
						select();
						$('.popup-modal').modal("hide");
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
	
	function updateUseSt(menuId) {
		$.ajax({
			url : "<c:url value='/system/cmsMenu/updateUseSt.json' />",
			type : "POST",
			data : {"menuId" : menuId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					alert("수정되었습니다.");
					select();
				}else {
					alert(res.message);
				}
			}
		});
	}
	
	function addPopupRow() {
		var html = "<tr>";
		html += "<td>";
		html += "<select name='popupId' class='form-control selectpicker' data-live-search='true'>";
		<c:forEach var="popup" items="${popupList}">
			html += "<option value='${popup.popupId}'>${popup.popupNm}</option>";
		</c:forEach>
		html += "</select>";
		html += "</td>";
		html += "<td class='text-center'><button type='button' class='btn btn-xs btn-danger' data-toggle='tooltip' title='삭제' onclick='delRow(this)'><i class='fa fa-trash'></i></button></td>";
		html += "</tr>";
		
		var tbody = $('#popupTable > tbody').html();
		tbody = tbody.replace(/\n/gi,''); //엔터제거
		tbody = tbody.replace(/' '/gi,''); //공백제거
		tbody = tbody.replace(/\t/gi,''); //탭제거
		if(tbody == '') {
			$('#popupTable > tbody').append(html);
		}else {
			$("#popupTable > tbody > tr:last").after(html);
		}
		$('.selectpicker').selectpicker();
	}
	
</script>