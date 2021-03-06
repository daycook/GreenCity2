<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<style>
	#detailForm .subComtTable th{
		background-color: #e6e7ef!important;
		color: #000;
		border-top:0px;
	}
	#detailForm .subComtTable td{
		background-color: white!important;
	}
</style>
<form id="detailForm">
<input type="hidden" id="siteId" name="siteId">
<input type="hidden" id="linkYn" name="linkYn">
<main>
     <div class="container-fluid px-4">
         <h1 class="mt-4">${menu.menuNm}</h1>
         <ol class="breadcrumb mb-4">
             <li class="breadcrumb-item active"> <i class="fas fa-home"></i> ${sideMenu.menuNm} > ${menu.menuNm}</li>
         </ol>
         <div class="card mb-4" style="overflow: auto; padding-left: 10px;">
             <div class="card-body" style="width: 1600px;">
				<div style="height: 250px;">
					<!-- 관측소 정보 -->
					<div class="clearfix" style="float: left; width: 45%;">
						<p style="display:inline-block; font-size: 15px;"><span class="material-icons" style="font-size: 15px;">done</span>관측소 정보</p>
						<input type="button" class="btn btn-outline-blue btn-sm" value="관측소 조회" style="float: right; margin-bottom: 5px;" onclick="javascript:setSiteModal()">
						<div class="form-group">
							<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="siteTable">
								<colgroup>
									<col width="25%"/>
									<col width="25%"/>
									<col width="25%"/>
									<col width="25%"/>
								</colgroup>
								<tbody style="text-align: center;">
									<tr>
										<th>관측소명</th>
										<td></td>
										<th>허가번호</th>
										<td></td>
									</tr>
									<tr>
										<th>관정심도</th>
										<td></td>
										<th>케이싱구경</th>
										<td></td>
									</tr>
									<tr>
										<th>유역명</th>
										<td></td>
										<th>유역구분</th>
										<td></td>
									</tr>
									<tr>
										<th>소재지</th>
										<td colspan="3"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					<!-- 모뎀 RTU 정보 -->
					<div class="clearfix" style="float: right; width: 45%;">
						<div>
							<p style="display:inline-block; font-size: 15px;"><span class="material-icons" style="font-size: 15px;">done</span>장비 정보</p>
							<input type="button" class="btn btn-outline-red btn-sm noLink" value="RTU 제거" style="float: right; margin-bottom: 5px;" onclick="javascript:fn_set_rtu_info(null, 'remove');">
							<input type="button" class="btn btn-outline-blue btn-sm noLink" value="RTU 추가" style="float: right; margin-bottom: 5px; margin-right: 5PX;" onclick="javascript:setRtuModal()">
							
							<input type="button" class="btn btn-outline-red btn-sm noLink" value="모뎀 제거" style="float: right; margin-bottom: 5px; margin-right: 5PX;" onclick="javascript:fn_set_modem_info(null, 'remove');">
							<input type="button" class="btn btn-outline-blue btn-sm noLink" value="모뎀 추가" style="float: right; margin-bottom: 5px; margin-right: 5PX;" onclick="javascript:setModemModal()">		
						</div>
						<div class="form-group">
							<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="modemRtuTable">
								<colgroup>
									<col width="25%"/>
									<col width="25%"/>
									<col width="25%"/>
									<col width="25%"/>
								</colgroup>
								<thead style="text-align: center;">
									<tr>
										<th>모뎀 시리얼번호</th>
										<td></td>
										<th>모뎀 모델명</th>
										<td></td>
									</tr>
									<tr>
										<th>모뎀 번호</th>
										<td></td>
										<th>모뎀 도입일자</th>
										<td></td>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									
									<tr>
										<th>RTU 시리얼번호</th>
										<td></td>
										<th>RTU 도입일자</th>
										<td></td>
									</tr>
									<tr>
										<th>RTU 모델명</th>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<!-- 센서리스트 정보 -->
				<div style="width: 100%; height: 500px;">
					<div>
						<p style="display:inline-block; font-size: 15px;"><span class="material-icons" style="font-size: 15px;">done</span>센서 정보</p>
					</div>
					<div class="tabs">
					    <input id="P1" type="radio" name="tab_item" value="P1" onchange="javascript:fn_change_port(this.value)" checked="checked">
					    <label class="tab_item" for="P1">P1</label>
					    
					    <input id="P2" type="radio" name="tab_item" value="P2" onchange="javascript:fn_change_port(this.value)">
					    <label class="tab_item" for="P2">P2</label>
					</div>
					<div class="clearfix">
						<div class="form-group">
							<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="sensor1Table">
								<colgroup>
									<col width="5%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="25%"/>
								</colgroup>
								<thead>
									<tr>
										<th>NO</th>
										<th>시리얼번호</th>
										<th>모델명</th>
										<th>type</th>
										<th>PSI</th>
										<th>Cond</th>
										<th>설치일자</th>
										<th>제거일자</th>
										<th>기능</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
								</tbody>
							</table>
							<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="sensor2Table" style="display: none;">
								<colgroup>
									<col width="5%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="10%"/>
									<col width="25%"/>
								</colgroup>
								<thead>
									<tr>
										<th>NO</th>
										<th>시리얼번호</th>
										<th>모델명</th>
										<th>type</th>
										<th>PSI</th>
										<th>Cond</th>
										<th>설치일자</th>
										<th>제거일자</th>
										<th>기능</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<!-- 점검이력 리스트 -->
				<div style="width: 100%; height: 400px;">
					<div>
						<p style="display:inline-block; font-size: 15px;"><span class="material-icons" style="font-size: 15px;">done</span>점검 이력</p>
					</div>
					<div class="clearfix">
						<div class="form-group" style="overflow-y: scroll; height: 350px;">
							<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="siteChckListTable" style="width: 1500px;">
								<colgroup>
									<col width="10%"/>
									<col width="10%"/>
									<col width="60%"/>
									<col width="10%"/>
									<col width="10%"/>
								</colgroup>
								<thead>
									<tr>
										<th>점검 일자</th>
										<th>점검 내용</th>
										<th>세부 내용</th>
										<th>작성자</th>
										<th>작성자IP</th>
									</tr>
								</thead>
								<tbody style="text-align: center;">
									<tr><td colspan="9">데이터가 존재하지 않습니다.</td></tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<!-- 점검내용 -->
				<div style="width: 100%; height: 300px;" id="chkDiv">
					<input type="hidden" id="siteChckId" name="siteChckId">
					<div>
						<p style="display:inline-block; font-size: 15px;"><span class="material-icons" style="font-size: 15px;">done</span>점검 내용</p>
					</div>
					<div class="clearfix">
						<div class="form-group">
							<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="siteChckTable">
								<colgroup>
									<col width="10%"/>
									<col width="20%"/>
									<col width="10%"/>
									<col width="20%"/>
									<col width="40%"/>
								</colgroup>
								<thead>
								</thead>
								<tbody style="text-align: center;">
									<tr>
										<th>점검일</th>
										<td><input type="text" id="siteChckDt" name="siteChckDt" class="datepicker form-control"></td>
										<th>점검내용</th>
										<td>
											<select id="chckKnd" name="chckKnd" class="form-control">
												<option value="">-선택하여주십시오-</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>조치항목</th>
										<td colspan="4"><textarea class="form-control" id="chckIem" name="chckIem" style="height: 100px;"></textarea></td>
									</tr>
									<tr>
										<th>세부내용</th>
										<td colspan="4"><textarea class="form-control" id="cont" name="cont" style="height: 100px;"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div style="text-align: right; margin-top: 10px; margin-bottom: 10px;">
		           <input type="button" class="insertShow btn btn-outline-blue onlyManager" value="등록" onclick="fn_site_check_insert()">
		           <input type="button" class="updateShow btn btn-outline-blue onlyManager" value="수정" onclick="fn_site_check_update()">
		           <input type="button" class="updateShow btn btn-outline-blue onlyManager" value="목록" onclick="javascript:history.back()">
		        </div>
			</div>
         </div>
     </div>
 </main>
</form>


<!-- 관측소 리스트 모달 -->
<div id="siteModal" class="modal">
  <form id="siteSearchForm">
  <!-- Modal content -->
  <div class="modal-content" style="width: 500px; height: 650px; margin: 5% auto;">
  		<div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('siteModal')">
			<i class="fas fa-times"></i>
		</span>
		</div>
	    <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;" id="insertModalTitle">관측소 조회</span></b></span></p>
		<div style="height: 450px;">
			<div class="insertShow" style="width: 100%; text-align: right; margin-bottom: 10px;">
				<label for="searchTitle">
					<span>
						<select id="searchTitle" name="searchTitle" class="form-control">
							<option value="nm">관측소명</option>
							<option value="perm">허가번호</option>
						</select>
					</span> 
				</label>
				<label for="searchTxt">
					<input class="form-control" style="width: 200px;" type="text" id="searchTxt" name="searchTxt">
				</label>
				<input type="button" class="btn btn-outline-blue" value="조회" onclick="javascript:setSiteModal()">
			</div>
			<div style="overflow-y: scroll; height: 450px;">
				<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="siteListTable" style="width: 400px;">
					<colgroup>
						<col width="10%"/>
						<col width="30%"/>
						<col width="60%"/>
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>허가번호</th>
							<th>관측소명</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						
					</tbody>
				</table>
			</div>
		</div>
  </div>
  </form>
</div>


<!-- RTU 리스트 모달 -->
<div id="rtuModal" class="modal">
  <form id="rtuSearchForm">
  <!-- Modal content -->
  <div class="modal-content" style="width: 500px; height: 650px; margin: 5% auto;">
  		<div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('rtuModal')">
			<i class="fas fa-times"></i>
		</span>
		</div>
	    <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;" id="insertModalTitle">RTU 조회</span></b></span></p>
		<div style="height: 450px;">
			<div class="insertShow" style="width: 100%; text-align: right; margin-bottom: 10px;">
				<label for="searchTxt">
					<input class="form-control" style="width: 200px;" type="text" id="searchTxt" name="searchTxt" placeholder="RTU시리얼번호">
				</label>
				<input type="button" class="btn btn-outline-blue" value="조회" onclick="javascript:setRtuModal()">
			</div>
			<div style="overflow-y: scroll; height: 450px;">
				<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="rtuListTable" style="width: 400px;">
					<colgroup>
						<col width="10%"/>
						<col width="30%"/>
						<col width="60%"/>
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>시리얼번호</th>
							<th>모델명</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						
					</tbody>
				</table>
			</div>
		</div>
  </div>
  </form>
</div>


<!-- MODEM 리스트 모달 -->
<div id="modemModal" class="modal">
  <form id="modemSearchForm">
  <!-- Modal content -->
  <div class="modal-content" style="width: 500px; height: 650px; margin: 5% auto;">
	    <div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('modemModal')">
			<i class="fas fa-times"></i>
		</span>
		</div>
	    <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;" id="insertModalTitle">모뎀 조회</span></b></span></p>
		<div style="height: 450px;">
			<div class="insertShow" style="width: 100%; text-align: right; margin-bottom: 10px;">
				<label for="searchTxt">
					<input class="form-control" style="width: 200px;" type="text" id="searchTxt" name="searchTxt" placeholder="모뎀시리얼번호">
				</label>
				<input type="button" class="btn btn-outline-blue" value="조회" onclick="javascript:setModemModal()">
			</div>
			<div style="overflow-y: scroll; height: 450px;">
				<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="modemListTable" style="width: 400px;">
					<colgroup>
						<col width="10%"/>
						<col width="30%"/>
						<col width="60%"/>
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>시리얼번호</th>
							<th>모델명</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						
					</tbody>
				</table>
			</div>
		</div>
  </div>
  </form>
</div>


<!-- 센서 리스트 모달 -->
<div id="sensorModal" class="modal">
  <form id="sensorSearchForm">
  <!-- Modal content -->
  <div class="modal-content" style="width: 500px; height: 650px; margin: 5% auto;">
	    <div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('sensorModal')">
			<i class="fas fa-times"></i>
		</span>
		</div>
	    <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;" id="insertModalTitle">센서 조회</span></b></span></p>
		<div style="height: 450px;">
			<div class="insertShow" style="width: 100%; text-align: right; margin-bottom: 10px;">
				<label for="searchTxt">
					<input class="form-control" style="width: 200px;" type="text" id="searchTxt" name="searchTxt" placeholder="센서시리얼번호">
				</label>
				<input type="button" class="btn btn-outline-blue" value="조회" onclick="javascript:setSensorModal()">
			</div>
			<div style="overflow-y: scroll; height: 450px;">
				<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="sensorListTable" style="width: 430px;">
					<colgroup>
						<col width="10%"/>
						<col width="30%"/>
						<col width="60%"/>
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>시리얼번호</th>
							<th>모델명</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						
					</tbody>
				</table>
			</div>
		</div>
  </div>
  </form>
</div>
<script>
$(document).ready(function() {
	$("#siteId").val("${paramMap.siteId}");
	$("#linkYn").val("${paramMap.linkYn}");
	$("#siteChckId").val("${paramMap.siteChckId}");
	
	if($("#siteId").val() != null && $("#siteId").val() != ""){
		selectSiteAndToolInfo();
	}
	
	if($("#linkYn").val() == "Y"){
		$(".noLink").hide();
	}
	
	getCodeLists();
	
	var now = new Date();	// 현재 날짜 및 시간

	$("#siteChckDt").datepicker().datepicker("setDate", now);
});

//코드 가져오는 기능
function getCodeLists(){
	getCodeList("CODE001", "chckKnd");
}

//센서 포트 관련 탭 선택 시 이벤트
function fn_change_port(data){
	if(data == "P1"){
		$("#sensor1Table").show();
		$("#sensor2Table").hide();
	}else if(data == "P2"){
		$("#sensor1Table").hide();
		$("#sensor2Table").show();
	}
}

//관측소 및 장비 정보 조회
function selectSiteAndToolInfo(){
	$(".loading").show();
	
	$.ajax({
		url : "<c:url value='/front/siteChckManage/selectSiteAndToolInfo.json'/>",
		type : "POST",
		data : {"siteId":$("#siteId").val(),
				"linkYn":$("#linkYn").val()},
		dataType : "json",
		success : function(result){
			
			fn_select_site_chck_list();
			
			var html = "";
			var data = result.data;
			var list = result.list;
			var leng = list.length;
			
			//관측소정보
			html += '<tr>';
			html += '<th>관측소명</th>';
			html += '<td>'+udchk(data.siteName)+'</td>';
			html += '<th>허가번호</th>';
			html += '<td>'+udchk(data.siteRpmsno)+'</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<th>관정심도</th>';
			html += '<td>'+udchk(data.siteDph)+'</td>';
			html += '<th>케이싱구경</th>';
			html += '<td>'+udchk(data.siteCalbr)+'</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<th>유역명</th>';
			html += '<td>'+udchk(data.siteBdgr)+'</td>';
			html += '<th>유역구분</th>';
			html += '<td>'+udchk(data.siteSdgr)+'</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<th>소재지</th>';
			html += '<td colspan="3">'+udchk(data.sitePos)+'</td>';
			html += '</tr>';
			
			$("#siteTable tbody").html(html);
			
			// 모뎀 정보
			html = "";
			html += '<tr>';
			html += '<th>모뎀 시리얼번호</th>';
			html += '<td>'+udchk(data.modemSerialNo)+'</td>';
			html += '<th>모뎀 모델명</th>';
			html += '<td>'+udchk(data.modemModelNm)+'</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<th>모뎀 번호</th>';
			html += '<td>'+udchk(data.modemNo)+'</td>';
			html += '<th>모뎀 도입일자</th>';
			html += '<td>'+udchk()+'</td>';
			html += '</tr>';
			$("#modemRtuTable thead").html(html);
			
			
			//RTU정보
			html = "";
			html += '<tr>';
			html += '<th>RTU 시리얼번호</th>';
			html += '<td>'+udchk(data.rtuSerialNo)+'</td>';
			html += '<th>RTU 도입일자</th>';
			html += '<td>'+udchk(data.rtuPurchsDt)+'</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<th>RTU 모델명</th>';
			html += '<td>'+udchk(data.rtuModelNm)+'</td>';
			html += '</tr>';
			$("#modemRtuTable tbody").html(html);
			
			
			//센서 p1
			html = "";
			for(var i=1; i<9; i++){
				html += '<tr id="p1'+i+'tr">'
				html += '<td>'+i+'</td>';
				html += '<td><button type="button" class="btn btn-outline-blue btn-sm noLink" onclick="setSensorModal(\''+"P1"+i+'\')"><span class="material-icons" style="font-size:10px;">add</span></button></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '</tr>'
			}
			
			$("#sensor1Table tbody").html(html);
			
			
			for(var i=1; i<9; i++){
				for(var j=0; j<leng; j++){
					var dt = list[j];
					var portNo1 = udchk(dt.portNo).substring(1, 2);
					var portNo2 = udchk(dt.portNo).substring(2, 3);
					if(portNo1 == "1" && portNo2 == i){
						html = "";
						html += '<td>'+i+'</td>';
						html += '<td>'+udchk(dt.serialNo)+'</td>';
						html += '<td>'+udchk(dt.modelNm)+'</td>';
						html += '<td>'+udchk(dt.type)+'</td>';
						html += '<td>'+udchk(dt.psi)+'</td>';
						html += '<td>'+udchk(dt.cond)+'</td>';
						html += '<td>'+udchk()+'</td>';
						html += '<td>'+udchk()+'</td>';
						
						html += '<td><button type="button" class="btn btn-outline-red btn-sm noLink" onclick="fn_set_sensor_info(null, \''+dt.portNo+'\', \''+"remove"+'\')"><span class="material-icons" style="font-size:10px;">remove</span></button></td>';

						$("#p1"+i+"tr").html(html);
						
					}
				}
			}
			
			//센서 p2
			html = "";
			for(var i=1; i<9; i++){
				html += '<tr id="p2'+i+'tr">'
				html += '<td>'+i+'</td>';
				html += '<td><button type="button" class="btn btn-outline-blue btn-sm noLink" onclick="setSensorModal(\''+"P2"+i+'\')"><span class="material-icons" style="font-size:10px;">add</span></button></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '<td></td>';
				html += '</tr>'
			}
			
			$("#sensor2Table tbody").html(html);
			
			for(var i=1; i<9; i++){
				for(var j=0; j<leng; j++){
					var dt = list[j];
					var portNo1 = udchk(dt.portNo).substring(1, 2);
					var portNo2 = udchk(dt.portNo).substring(2, 3);
					
					if(portNo1 == "2" && portNo2 == i){
						html = "";
						html += '<td>'+i+'</td>';
						html += '<td>'+udchk(dt.serialNo)+'</td>';
						html += '<td>'+udchk(dt.modelNm)+'</td>';
						html += '<td>'+udchk(dt.type)+'</td>';
						html += '<td>'+udchk(dt.psi)+'</td>';
						html += '<td>'+udchk(dt.cond)+'</td>';
						html += '<td>'+udchk()+'</td>';
						html += '<td>'+udchk()+'</td>';
						html += '<td><button type="button" class="btn btn-outline-red btn-sm noLink" onclick="fn_set_sensor_info(null, \''+dt.portNo+'\', \''+"remove"+'\')"><span class="material-icons" style="font-size:10px;">remove</span></button></td>';

						$("#p2"+i+"tr").html(html)
					}
				}
			}
			
			if($("#linkYn").val() == "Y"){
				$(".noLink").hide();
			}
			
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//관측소 선택 모달창 데이터 조회
function setSiteModal(){
	var formData = $("#siteSearchForm").serialize();
	$('#siteModal').show();
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteManage/selectSiteInfoList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var html = "";
			var list = result.siteInfoList;
			var leng = list.length;
			
			if(leng == 0){
				html += "<tr><td colspan='3'>데이터가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i=0; i<leng; i++){
					var data = list[i];
					html += "<tr onclick='javascript:fn_change_site("+data.siteId+", \""+data.linkYn+"\")'>";
					html += "<td>"+udchk(data.num)+"</td>";
					html += "<td>"+udchk(data.siteRpmsno)+"</td>";
					html += "<td>"+udchk(data.siteName)+"</td>";
					html += "</tr>";
				}
			}
			$("#siteListTable tbody").html(html);

			$(".loading").hide();
			
			
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//RTU 선택 모달창 데이터 조회
function setRtuModal(){
	var formData = $("#rtuSearchForm").serialize();
	$('#rtuModal').show();
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/selectRtuInfoList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var html = "";
			var list = result.list;
			var leng = list.length;
			
			if(leng == 0){
				html += "<tr><td colspan='3'>데이터가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i=0; i<leng; i++){
					var data = list[i];
					html += "<tr onclick='javascript:fn_set_rtu_info(\""+data.rtuId+"\")'>";
					html += "<td>"+(i+1)+"</td>";
					html += "<td>"+udchk(data.serialNo)+"</td>";
					html += "<td>"+udchk(data.modelNm)+"</td>";
					html += "</tr>";
				}
			}
			$("#rtuListTable tbody").html(html);

			$(".loading").hide();
			
			
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//관측소 RTU 데이터 수정
function fn_set_rtu_info(rtuId, type){
	if(type == "remove"){
		if(!confirm("해당관측소에 RTU를 제거하시겠습니까?")){
			return;
		}
	}else{
		if(!confirm("해당관측소에 RTU를 추가하시겠습니까?")){
			return;
		}
	}
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/chgSiteRtu.json'/>",
		type : "POST",
		data : {"rtuId":rtuId,
				"siteId":$("#siteId").val()},
		dataType : "json",
		success : function(result){
			selectSiteAndToolInfo();
			
			$('#rtuModal').hide();
			
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}



//모뎀 선택 모달창 데이터 조회
function setModemModal(){
	var formData = $("#modemSearchForm").serialize();
	$('#modemModal').show();
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/selectModemInfoList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var html = "";
			var list = result.list;
			var leng = list.length;
			
			if(leng == 0){
				html += "<tr><td colspan='3'>데이터가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i=0; i<leng; i++){
					var data = list[i];
					html += "<tr onclick='javascript:fn_set_modem_info(\""+data.modemId+"\", null)'>";
					html += "<td>"+(i+1)+"</td>";
					html += "<td>"+udchk(data.serialNo)+"</td>";
					html += "<td>"+udchk(data.modelNm)+"</td>";
					html += "</tr>";
				}
			}
			$("#modemListTable tbody").html(html);

			$(".loading").hide();
			
			
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//관측소 모뎀 데이터 수정
function fn_set_modem_info(modemId, type){
	if(type == "remove"){
		if(!confirm("해당관측소에 모뎀을 제거하시겠습니까?")){
			return;
		}
	}else{
		if(!confirm("해당관측소에 모뎀을 추가하시겠습니까?")){
			return;
		}
	}
	
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/chgSiteModem.json'/>",
		type : "POST",
		data : {"modemId":modemId,
				"siteId":$("#siteId").val()},
		dataType : "json",
		success : function(result){
			selectSiteAndToolInfo();
			$('#modemModal').hide();		
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}


//센서 선택 모달창 데이터 조회
function setSensorModal(port){
	var formData = $("#sensorSearchForm").serialize();
	$('#sensorModal').show();
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/selectSensorInfoList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var html = "";
			var list = result.list;
			var leng = list.length;
			
			if(leng == 0){
				html += "<tr><td colspan='3'>데이터가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i=0; i<leng; i++){
					var data = list[i];
					html += "<tr onclick='javascript:fn_set_sensor_info(\""+data.sensorId+"\", \""+port+"\")'>";
					html += "<td>"+(i+1)+"</td>";
					html += "<td>"+udchk(data.serialNo)+"</td>";
					html += "<td>"+udchk(data.modelNm)+"</td>";
					html += "</tr>";
				}
			}
			$("#sensorListTable tbody").html(html);

			$(".loading").hide();
			
			
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//관측소 모뎀 데이터 수정
function fn_set_sensor_info(sensorId, port, type){
	if(type == "remove"){
		if(!confirm("해당관측소에 센서를 제거하시겠습니까?")){
			return;
		}
	}else{
		if(!confirm("해당관측소에 센서를 추가하시겠습니까?")){
			return;
		}
	}
	
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/chgSiteSensor.json'/>",
		type : "POST",
		data : {"portNo":port,
				"sensorId":sensorId,
				"siteId":$("#siteId").val()},
		dataType : "json",
		success : function(result){
			selectSiteAndToolInfo();
			$('#sensorModal').hide();	
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});	
}


//모달창 Close 기능
function fn_close_modal(type) {
     $('#'+type).hide();
};


//관측소 변경 후 이벤트
function fn_change_site(siteId, linkYn){
	$("#siteId").val(siteId);
	$("#linkYn").val(linkYn);
	
	if($("#siteId").val() != null && $("#siteId").val() != ""){
		selectSiteAndToolInfo();
	}
	
	if($("#linkYn").val() == "Y"){
		$(".noLink").hide();
	}else{
		$(".noLink").show();
	}
	$("#siteModal").hide();
}


//관측소 점검이력 리스트 조회
function fn_select_site_chck_list(){
	var formData = $("#detailForm").serialize();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/selectSiteChekList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var list = result.list;
			var leng = list.length;
			
			var html = "";
			
			if(leng == 0){
				html += '<tr><td colspan="9">데이터가 존재하지 않습니다.</td></tr>';
			}	
			
			for(var i=0; i<leng; i++){
				var data = list[i]
				html += "<tr class='chckListTr' id='chckTr"+data.siteChckId+"' onclick='javascript:fn_get_site_chck_info("+data.siteChckId+", this)'>";
				html += "<td>"+data.chSiteChckDt+"</td>";
				html += "<td>"+data.chckKndNm+"</td>";
				html += "<td>"+data.cont+"</td>";
				html += "<td>"+data.loginId+"</td>";
				html += "<td>"+data.ip+"</td>";		
				html += "</tr>"
			}
			
			$("#siteChckListTable tbody").html(html);
			
			if($("#siteChckId").val() != null && $("#siteChckId").val() != ""){
				fn_get_site_chck_info($("#siteChckId").val());
			}	
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});	
}


//관측소 점검이력 상세 데이터 조회
function fn_get_site_chck_info(siteChckId){	
	$("#siteChckId").val(siteChckId);
	
	$(".chckListTr").css("backgroundColor", "white");
	$("#chckTr"+siteChckId).css("backgroundColor", "#FCE6E0");
	
	
	var formData = $("#detailForm").serialize();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/selectSiteChekInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var data = result.data;
			$("#siteChckDt").val(data.chSiteChckDt);
			$("#chckKnd").val(data.chckKnd);
			$("#chckIem").val(data.chckIem);
			$("#cont").val(data.cont);
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});	
	
	
}

//관측소 점검이력 등록
function fn_site_check_insert(){
	var formData = $("#detailForm").serialize();
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/insertSiteChekInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			alert("등록에 성공하였습니다.");
			$(".loading").hide();
			
			fn_select_site_chck_list();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});	
}

//관측소 점검이력 수정
function fn_site_check_update(){
	if($("#siteChckId").val() == null || $("#siteChckId").val() == ""){
		alert("점검이력을 선택하여 주십시오");
		return;
	}
	var formData = $("#detailForm").serialize();
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/updateSiteChekInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			alert("수정에 성공하였습니다.");
			$(".loading").hide();
			
			fn_select_site_chck_list();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});	
}
</script>