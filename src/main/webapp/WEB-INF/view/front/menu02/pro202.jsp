<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<main>
     <div class="container-fluid px-4">
         <h1 class="mt-4">${menu.menuNm}</h1>
         <ol class="breadcrumb mb-4">
             <li class="breadcrumb-item active"><i class="fas fa-home"></i> ${sideMenu.menuNm} > ${menu.menuNm}</li>
         </ol>
         <div class="card mb-4">
             <div class="card-body">
             	<div class="clearfix" style="background-color: #e1e1ea; padding-right: 10px;"">	
					<form id="searchForm" onsubmit="return false" style="float:right; margin-top:25px;">
						<div class="form-group">
							<label for="searchTitle">
								<span>
									<select id="searchTool" name="searchTool" class="form-control" onchange="javascript:selectList()">
										<option value="sensor">센서 시리얼번호</option>
										<option value="modem">모뎀 시리얼번호</option>
										<option value="rtu">RTU 시리얼번호</option>
									</select>
								</span> 
							</label>
							<label for="searchTxt">
								<input type="text" id="searchTxt" name="searchTxt" placeholder="검색어를 입력하세요" title="검색어를 입력하세요" style="width:100%;" class="form-control">
							</label>
							<div style="float: right; margin-left: 10px;">
								<button class="btn btn-outline-blue" type="button" onclick="selectList()">검색</button>
								<button class="btn btn-outline-blue onlyManager" type="button" onclick="fn_show_modal('insert')">장비등록</button>
							</div>
						</div>
					</form>
				</div>
                <div class="" style="overflow: auto;">         
			 		<div>
						총 게시물 : <strong id="paginationTotalCnt"></strong>
					</div>
					<table class="baseTable dataTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="sensorDatatable">
						<colgroup>
							<col width="5%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="8%"/>
							<col width="15%"/>
							<col width="9%"/>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>시리얼번호</th>
								<th>제조사</th>
								<th>모델명</th>
								<th>PSI</th>
								<th>TYPE</th>
								<th>Cond</th>
								<th>도입구분</th>
								<th>센서상태</th>
								<th>도입년월일</th>
								<th>소재지</th>
								<th>연계여부<th>
							</tr>
							
						</thead>
						<tbody style="text-align: center;">
							
						</tbody>
					</table>
					<table class="baseTable dataTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="rtuDatatable" style="display: none;">
						<colgroup>
							<col width="5%"/>
							<col width="7%"/>
							<col width="7%"/>
							<col width="7%"/>
							<col width="7%"/>
							<col width="7%"/>
							<col width="7%"/>
							<col width="7%"/>
							<col width="15%"/>
							<col width="25%"/>
							<col width="7%"/>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>시리얼번호</th>
								<th>제조사</th>
								<th>모델명</th>
								<th>통신방식</th>
								<th>전원공급방식</th>
								<th>역류방지유무</th>
								<th>구입년월</th>
								<th>구입방식</th>
								<th>비고</th>
								<th>연계여부<th>
							</tr>
							
						</thead>
						<tbody style="text-align: center;">
							
						</tbody>
					</table>
					<table class="baseTable dataTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="modemDatatable" style="display: none;">
						<colgroup>
							<col width="5%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="9%"/>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>시리얼번호</th>
								<th>제조사</th>
								<th>모델명</th>
								<th>전화번호</th>
								<th>연계여부</th>
							</tr>
							
						</thead>
						<tbody style="text-align: center;">
							
						</tbody>
					</table>
					<div class="text-center paginationStyle" id="pagination"></div>
				</div>
             </div>
         </div>
     </div>
 </main>
<script src='<c:url value="/js/pagination.js"/>'></script>
<!-- 장비 등록, 상세, 수정 모달 -->
<div id="insertModal" class="modal">
  <!-- Modal content -->
  <div class="modal-content" style="width: 1000px; height: 550px; margin: 5% auto;">
  			<div style="width: 100%; text-align: right;">
		    <span class="material-icons" style="cursor: pointer;" onclick="javascript:$('#insertModal').hide()">
				<i class="fas fa-times"></i>
			</span>
			</div>
			<div>
			 <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span id="modalTitle" style="font-size: 24pt;">장비 상세</span></b></span></p>
				<div class="insertShow" style="float: left;">
					<p style="font-size: 12pt; font-weight: bolder;">장비구분</p>
					센서 <input type="radio" class="sensor" name="toolType" value="sensor" onclick="javascript:fn_tool_type(this.value)" checked="checked">
					RTU <input type="radio" name="toolType" value="rtu" onclick="javascript:fn_tool_type(this.value)">
					모뎀 <input type="radio" name="toolType" value="modem" onclick="javascript:fn_tool_type(this.value)">
				</div>
				<div style="float: right;">
					<input type="button" class="noLinkBtn btn btn-outline-blue onlyManager" value="모델추가" onclick="javascript:fn_model_add()">
				</div>
			</div>
			<div class="toolDiv sensorDiv" style="height: 350px;">
				<form id="sensorDataForm">
				<input type="hidden" name="gubun" value="sensor">
				<input type="hidden" id="sensorId" name="sensorId">
				<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="insertTable">
					<colgroup>
						<col width="20%"/>
						<col width="30%"/>
						<col width="20%"/>
						<col width="30%"/>
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>데이터</th>
							<th>구분</th>
							<th>데이터</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<tr>
							<th>시리얼번호</th>
							<td colspan="3"><input type='text' class="noUpt noLink form-control" title="시리얼번호" id="serialNo" name="serialNo" maxlength="25"></td>
						</tr>
						<tr>
							<th>제조사/모델명</th>
							<td>
								<select class="noLink form-control" title="시리얼번호" id="modelSn" name="modelSn">
								</select>
							</td>
							<th>PSI</th>
							<td><input type='text' class="noLink form-control onlyNumber" id="psi" name="psi" maxlength="22"></td>
						</tr>
						<tr>
							<th>TYPE</th>
							<td><input type='text' class="noLink form-control" id="type" name="type" maxlength="50"></td>
							<th>Cond</th>
							<td><input type='text' class="noLink form-control onlyNumber" id="cond" name="cond" maxlength="500"></td>
						</tr>
						<tr>
							<th>도입구분</th>
							<td><input type='text' class="noLink form-control" id="indcSe" name="indcSe" maxlength="250"></td>
							<th>센서상태</th>
							<td>
								<select class="noLink form-control" id="sensorSttus" name="sensorSttus" maxlength="10"></select>
							</td>
						</tr>
						<tr>
							<th>도입년월일</th>
							<td><input type='text' class="noLink form-control datepicker" id="indcDt" name="indcDt"></td>
							<th>소재지</th>
							<td>
								<select class="noLink form-control" id="site" name="site">
								</select>
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="3"><input type='text' class="noLink form-control" id="rm" name="rm" maxlength="250"></td>
						</tr>
					</tbody>
				</table>
				</form>
				<div style="text-align: right; margin-top: 10px;">
		           <input type="button" class="insertShow btn btn-outline-blue onlyManager" value="등록" onclick="fn_insert('sensor')">
		           <input type="button" class="updateShow noLinkBtn btn btn-outline-blue onlyManager" value="수정" onclick="fn_update('sensor')">
		           <input type="button" class="updateShow noLinkBtn btn btn-outline-blue onlyManager" value="이력조회" onclick="fn_select_tool_his('sensor')">
		           <input type="button" class="updateShow noLinkBtn btn btn-outline-blue onlyManager" value="삭제" onclick="fn_delete('sensor')">
		        </div>
			</div>
			<div class="toolDiv rtuDiv" style="height: 550px; display: none;">
				<form id="rtuDataForm">
				<input type="hidden" name="gubun" value="rtu">
				<input type="hidden" id="rtuId" name="rtuId">
				<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="insertTable">
					<colgroup>
						<col width="20%"/>
						<col width="30%"/>
						<col width="20%"/>
						<col width="30%"/>
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>데이터</th>
							<th>구분</th>
							<th>데이터</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<tr>
							<th>시리얼번호</th>
							<td colspan="3"><input type='text' class="noUpt noLink form-control" id="serialNo" name="serialNo" maxlength="25"></td>
						</tr>
						<tr>
							<th>제조사/모델명</th>
							<td>
								<select class="noLink form-control" title="시리얼번호" id="modelSn" name="modelSn">
								</select>
							</td>
							<th>통신방식</th>
							<td><input type='text' class="noLink form-control" id='commMthd' name='commMthd' maxlength="250"></td>
						</tr>
						<tr>
							<th>전원공급방식</th>
							<td><input type='text' class="noLink form-control" id='srcelctMthd' name='srcelctMthd' maxlength="250"></td>
							<th>역류방지유무</th>
							<td>
								<select class="noLink form-control" id='invPrvn' name='invPrvn'>
									<option value="Y">Y</option>
									<option value="N">N</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>구입년월일</th>
							<td><input type='text' class="noLink form-control datepicker" id='purchsDt' name='purchsDt'></td>
							<th>구입방식</th>
							<td><input type='text' class="noLink form-control" id='purchsMthd' name='purchsMthd' maxlength="250"></td>
						</tr>
						<tr>
							<th>현재상태</th>
							<td>
								<select class="noLink form-control" id='sttus' name='sttus'>
								</select>
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="3"><input type='text' class="noLink form-control" id='rm' name='rm' maxlength="250"></td>
						</tr>
					</tbody>
				</table>
				</form>
				<div style="text-align: right; margin-top: 10px;">
		           <input type="button" class="insertShow btn btn-outline-blue onlyManager" value="등록" onclick="fn_insert('rtu')">
		           <input type="button" class="updateShow noLinkBtn btn btn-outline-blue onlyManager" value="수정" onclick="fn_update('rtu')">
		           <input type="button" class="updateShow noLinkBtn btn btn-outline-blue onlyManager" value="이력조회" onclick="fn_select_tool_his('rtu')">
		           <input type="button" class="updateShow noLinkBtn btn btn-outline-blue onlyManager" value="삭제" onclick="fn_delete('rtu')">
		        </div>
			</div>
			<div class="toolDiv modemDiv" style="height: 550px; display: none;">
				<form id="modemDataForm">
				<input type="hidden" name="gubun" value="modem">
				<input type="hidden" id="modemId" name="modemId">
				<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="insertTable">
					<colgroup>
						<col width="20%"/>
						<col width="30%"/>
						<col width="20%"/>
						<col width="30%"/>
					</colgroup>
					<thead>
						<tr>
							<th>구분</th>
							<th>데이터</th>
							<th>구분</th>
							<th>데이터</th>
						</tr>
					</thead>
					<tbody style="text-align: center;">
						<tr>
							<th>시리얼번호</th>
							<td colspan="3"><input type='text' class="noUpt noLink form-control" id="serialNo" name="serialNo" maxlength="25"></td>
						</tr>
						<tr>
							<th>제조사/모델명</th>
							<td>
								<select class="noLink form-control" title="시리얼번호" id="modelSn" name="modelSn">
								</select>
							</td>
							<th>전화번호</th>
							<td><input type='text' class="noLink form-control onlyNumber" id='modemNo' name='modemNo' maxlength="11"></td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="3"><input type='text' class="noLink form-control" id='rm' name='rm' maxlength="250"></td>
						</tr>
					</tbody>
				</table>
				</form>
				<div style="text-align: right; margin-top: 10px; display: ">
		            <input type="button" class="insertShow btn btn-outline-blue onlyManager" value="등록" onclick="fn_insert('modem')">
		           <input type="button" class="updateShow noLinkBtn btn btn-outline-blue onlyManager" value="수정" onclick="fn_update('modem')">
		           <input type="button" class="updateShow noLinkBtn btn btn-outline-blue onlyManager" value="이력조회" onclick="fn_select_tool_his('modem')">
		           <input type="button" class="updateShow noLinkBtn btn btn-outline-blue onlyManager" value="삭제" onclick="fn_delete('modem')">
		        </div>
			</div>
  	</div>
</div>

<!-- 장비 이럭 모달 -->
<div id="toolHisModal" class="modal">
  <form id="">
  <!-- Modal content -->
  <div class="modal-content" style="width: 1500px; height: 600px; margin: 5% auto;">
    <div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:$('#toolHisModal').hide()">
			<i class="fas fa-times"></i>
		</span>
	</div>
          <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;">장비 이력</span></b></span></p>
	<br>
	<div style="height: 650px;">
		<div style="width: 1450px; overflow-y: scroll; height: 400px;">
			<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="insertTable" style="width: 1400px;">

			</table>
		</div>
	</div>
  </div>
  </form>
</div>

<!-- 모델 추가/수정 모달 -->
<div id="toolAddModal" class="modal">
  <form id="toolAddForm">
  <!-- Modal content -->
  <div class="modal-content" style="width: 500px; height: 600px; margin: 5% auto;">
    <div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:$('#toolAddModal').hide()">
			<i class="fas fa-times"></i>
		</span>
	</div>
          <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;">모델 추가</span></b></span></p>
	<br>
	<div style="height: 450px;">
		<div style="width: 450px; overflow-y: scroll; height: 300px;">
			<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="insertTable" style="width: 400px;">
				<thead>
					<tr>
						<th>장비 분류</th>
						<th>제조사</th>
						<th>모델명</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div style="width: 450px; height: 200px; text-align: right; margin-top: 10px;">
			<input type="hidden" id="modelSn" name="modelSn">
			<label style="width: 20%">
				<select id="toolGbn" name="toolGbn" class="form-control">
					<option value="SENSOR">SENSOR</option>
					<option value="RTU">RTU</option>
					<option value="MODEM">MODEM</option>
				</select>
			</label>
			<label style="width: 30%">
				<input type="text" class="form-control" placeholder="모델명" id="modelNm" name="modelNm" >
			</label>
			<label style="width: 30%">
				<input type="text" class="form-control" placeholder="제조사" id="makerNm" name="makerNm">
			</label>
			
			<label>
				<button type="button" class="btn btn-outline-blue onlyManager" onclick="javascript:fn_add_model()">추가</button>
				<button type="button" id="modelUpdBtn" style="display: none;" class="btn btn-outline-blue onlyManager" onclick="javascript:fn_add_model()">수정</button>
			</label>
		</div>
	</div>
  </div>
  </form>
</div>

<script>
$(document).ready(function() {
	getCodeList("CODE004","sensorSttus");
	getCodeList("CODE004","sttus");
	getCodeList("CODE005","site");
	selectList();
	fn_set_model_info()
});

function selectList(){
	$(".loading").show();
	var html = "";
	
	var searchTool = $("#searchTool").val()
	$(".dataTable").hide();
	
	var formData = $("#searchForm").serialize();
	
	$.ajax({
		url : "<c:url value='/front/siteManage/selectToolInfoList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			
			var list = result.list;
			var leng = list.length;
			
			if(searchTool == "sensor"){
				if(leng == 0){
					html += "<tr><td colspan='11'>데이터가 존재하지 않습니다.</td></tr>"
				}else{
					for(var i=0; i<leng; i++){
						var data = list[i];
						
						html += "<tr onclick='javascript:fn_show_modal(\"update\", \"sensor\", \""+data.sensorId+"\", \""+data.serialNo+"\", \""+data.linkYn+"\")'>";
						html += "<td>"+(i+1)+"</td>";
						html += '<td>'+udchk(data.serialNo)+'</td>';
						html += '<td>'+udchk(data.makerNm)+'</td>';
						html += '<td>'+udchk(data.modelNm)+'</td>';
						html += '<td>'+udchk(data.psi)+'</td>';
						html += '<td>'+udchk(data.type)+'</td>';
						html += '<td>'+udchk(data.cond)+'</td>';
						html += '<td>'+udchk(data.indcSe)+'</td>';
						html += '<td>'+udchk(data.sensorSttusNm)+'</td>';
						html += '<td>'+udchk(data.chIndcDt)+'</td>';
						html += '<td>'+udchk(data.siteNm)+'</td>';
						if(data.linkYn == "1"){
							html += "<td style='color:green;'>연계</td>";
						}else{
							html += "<td style='color:blue;'>비연계</td>";
						}
						html += "</tr>";
					}
				}
				$("#sensorDatatable").show();
				
				$("#sensorDatatable tbody").empty();
				$("#sensorDatatable tbody").append(html);
			}else if(searchTool == "rtu"){
				if(leng == 0){
					html += "<tr><td colspan='11'>데이터가 존재하지 않습니다.</td></tr>"
				}else{
					for(var i=0; i<leng; i++){
						var data = list[i];
						
						html += "<tr onclick='javascript:fn_show_modal(\"update\", \"rtu\", \""+data.rtuId+"\", \""+data.serialNo+"\", \""+data.linkYn+"\")'>";
						html += "<td>"+(i+1)+"</td>";
						html += '<td>'+udchk(data.serialNo)+'</td>';
						html += '<td>'+udchk(data.makerNm)+'</td>';
						html += '<td>'+udchk(data.modelNm)+'</td>';
						html += '<td>'+udchk(data.commMthd)+'</td>';
						html += '<td>'+udchk(data.srcelctMthd)+'</td>';
						html += '<td>'+udchk(data.invPrvn)+'</td>';
						html += '<td>'+udchk(data.chPurchsDt)+'</td>';
						html += '<td>'+udchk(data.purchsMthd)+'</td>';
						html += '<td>'+udchk(data.rm)+'</td>';
						if(data.linkYn == "1"){
							html += "<td style='color:green;'>연계</td>";
						}else{
							html += "<td style='color:blue;'>비연계</td>";
						}
						html += "</tr>";
					}
				}
				$("#rtuDatatable").show();
				
				$("#rtuDatatable tbody").empty();
				$("#rtuDatatable tbody").append(html);
			}else if(searchTool == "modem"){
				if(leng == 0){
					html += "<tr><td colspan='5'>데이터가 존재하지 않습니다.</td></tr>"
				}else{
					for(var i=0; i<leng; i++){
						var data = list[i];
						
						html += "<tr onclick='javascript:fn_show_modal(\"update\", \"modem\", \""+data.modemId+"\", \""+data.serialNo+"\", \""+data.linkYn+"\")'>";
						html += "<td>"+(i+1)+"</td>";
						html += '<td>'+udchk(data.serialNo)+'</td>';
						html += '<td>'+udchk(data.makerNm)+'</td>';
						html += '<td>'+udchk(data.modelNm)+'</td>';
						html += '<td>'+udchk(data.modemNo)+'</td>';
						if(data.linkYn == "1"){
							html += "<td style='color:green;'>연계</td>";
						}else{
							html += "<td style='color:blue;'>비연계</td>";
						}
						html += "</tr>";
					}
				}
				$("#modemDatatable").show();
				
				$("#modemDatatable tbody").empty();
				$("#modemDatatable tbody").append(html);
			}
			$(".loading").hide();
			setPagination(10, 10);

			renderPagination();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_show_modal(type, gubun, id, serialNo, linkYn){
	fn_close_modal();
	$(".toolDiv").hide();
	$(".sensorDiv").show();
	$(".sensor").prop('checked', true);

	

	
	if(type=="insert"){
		$(".noLink").attr("disabled", false);
		$(".noLinkBtn").show();
		
		$("#insertModal").show();
		$(".insertShow").show();
		$(".updateShow").hide();
		fn_insert_set();
	}else if(type=="update"){
		$("#insertModal").show();
		$(".insertShow").hide();
		$(".updateShow").show();
		
		if(linkYn == "0"){
			$(".noLink").attr("disabled", false);
			$(".noLinkBtn").show();
		}
		if(linkYn == "1"){
			$(".noLink").attr("disabled", true);
			$(".noLinkBtn").hide();
		}
		
		fn_update_set(gubun, id, serialNo, linkYn);
	}
}

function fn_tool_type(toolType){
	$(".toolDiv").hide();
	$("."+toolType+"Div").show();
}

function fn_insert_set(){
	$(".noUpt").attr("readonly", false);
	
	$("#modalTitle").html("장비 등록");
	
	//SENSOR
	$('#sensorDataForm #sensorId').val(null); //SENSOR_ID
	$('#sensorDataForm #serialNo').val(null); //시리얼번호
	$('#sensorDataForm #siteId').val(null); //관측소 ID
	$('#sensorDataForm #portNo').val(null); //포트번호
	$('#sensorDataForm #rm').val(null); //비고
	$('#sensorDataForm #modelSn').val(null); //모델명
	$('#sensorDataForm #psi').val(null); //PSI
	$('#sensorDataForm #type').val(null); //TYPE
	$('#sensorDataForm #cond').val(null); //상태
	$('#sensorDataForm #indcSe').val(null); //도입구분
	$('#sensorDataForm #sensorSttus').val("001"); //센서상태
	$('#sensorDataForm #indcDt').val(null); //도입날짜
	$('#sensorDataForm #site').val("001"); //소재지

	//RTU
	$('#rtuDataForm #rtuId').val(null); //RTU_ID
	$('#rtuDataForm #serialNo').val(null); //시리얼번호
	$('#rtuDataForm #siteId').val(null); //관측소 ID
	$('#rtuDataForm #modelSn').val(null); //모델명
	$('#rtuDataForm #commMthd').val(null); //통신방식
	$('#rtuDataForm #srcelctMthd').val(null); //전원공급방식
	$('#rtuDataForm #invPrvn').val(null); //역류방지유무
	$('#rtuDataForm #purchsDt').val(null); //구입날짜
	$('#rtuDataForm #purchsMthd').val(null); //구입방식
	$('#rtuDataForm #sttus').val(null); //현재상태
	$('#rtuDataForm #rm').val(null); //비고

	//MODEM
	$('#modemDataForm #modemId').val(null); //모뎀 ID
	$('#modemDataForm #serialNo').val(null); //시리얼번호
	$('#modemDataForm #modemNo').val(null); //모뎀 번호
	$('#modemDataForm #modelSn').val(null); //모델명
	$('#modemDataForm #site').val(null); //관측소
	$('#modemDataForm #rm').val(null); //비고
}

function fn_update_set(gubun, id, serialNo, linkYn){
	$(".toolDiv").hide();
	$("."+gubun+"Div").show();
	$(".noUpt").attr("readonly", true);
	if(gubun == "sensor"){
		fn_sensor_set(id, serialNo, linkYn);
	}else if(gubun == "rtu"){
		fn_rtu_set(id, serialNo, linkYn);
	}else if(gubun == "modem"){
		fn_modem_set(id, serialNo, linkYn);
	}
}

function fn_sensor_set(id, serialNo, linkYn){
	$("#modalTitle").html("센서 수정");
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteManage/selectSensorInfo.json'/>",
		type : "POST",
		data : {"id":id, "serialNo":serialNo, "linkYn":linkYn},
		dataType : "json",
		success : function(result){
			var data = result.data;
			if(data != null){
				$('#sensorDataForm #sensorId').val(udchk(data.sensorId)); //SENSOR_ID
				$('#sensorDataForm #serialNo').val(udchk(data.serialNo)); //시리얼번호
				$('#sensorDataForm #siteId').val(udchk(data.siteId)); //관측소 ID
				$('#sensorDataForm #portNo').val(udchk(data.portNo)); //포트번호
				$('#sensorDataForm #rm').val(udchk(data.rm)); //비고
				$('#sensorDataForm #modelSn').val(udchk(data.modelSn)); //모델명
				$('#sensorDataForm #psi').val(udchk(data.psi)); //PSI
				$('#sensorDataForm #type').val(udchk(data.type)); //TYPE
				$('#sensorDataForm #cond').val(udchk(data.cond)); //상태
				$('#sensorDataForm #indcSe').val(udchk(data.indcSe)); //도입구분
				$('#sensorDataForm #sensorSttus').val(udchk(data.sensorSttus)); //센서상태
				$('#sensorDataForm #indcDt').val(udchk(data.chIndcDt)); //도입날짜
				$('#sensorDataForm #site').val(udchk(data.site)); //소재지
			}

			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_rtu_set(id, serialNo, linkYn){
	$("#modalTitle").html("RTU 수정");
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteManage/selectRtuInfo.json'/>",
		type : "POST",
		data : {"id":id, "serialNo":serialNo, "linkYn":linkYn},
		dataType : "json",
		success : function(result){
			var data = result.data;
			if(data != null){
				$('#rtuDataForm #rtuId').val(udchk(data.rtuId)); //RTU_ID
				$('#rtuDataForm #serialNo').val(udchk(data.serialNo)); //시리얼번호
				$('#rtuDataForm #siteId').val(udchk(data.siteId)); //관측소 ID
				$('#rtuDataForm #modelSn').val(udchk(data.modelSn)); //모델명
				$('#rtuDataForm #commMthd').val(udchk(data.commMthd)); //통신방식
				$('#rtuDataForm #srcelctMthd').val(udchk(data.srcelctMthd)); //전원공급방식
				$('#rtuDataForm #invPrvn').val(udchk(data.invPrvn)); //역류방지유무
				$('#rtuDataForm #purchsDt').val(udchk(data.chPurchsDt)); //구입날짜
				$('#rtuDataForm #purchsMthd').val(udchk(data.purchsMthd)); //구입방식
				$('#rtuDataForm #sttus').val(udchk(data.sttus)); //현재상태
				$('#rtuDataForm #rm').val(udchk(data.rm)); //비고
			}

			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_modem_set(id, serialNo, linkYn){
	$("#modalTitle").html("모뎀 수정");
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteManage/selectModemInfo.json'/>",
		type : "POST",
		data : {"id":id, "serialNo":serialNo, "linkYn":linkYn},
		dataType : "json",
		success : function(result){
			var data = result.data;
			if(data != null){
				$('#modemDataForm #modemId').val(udchk(data.modemId)); //모뎀 ID
				$('#modemDataForm #serialNo').val(udchk(data.serialNo)); //시리얼번호
				$('#modemDataForm #modemNo').val(udchk(data.modemNo)); //모뎀 번호
				$('#modemDataForm #modelSn').val(udchk(data.modelSn)); //모델명
				$('#modemDataForm #site').val(udchk(data.site)); //관측소
				$('#modemDataForm #rm').val(udchk(data.rm)); //비고
			}

			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_insert(type){
	var formData = null;
	
	if(type == "sensor"){
		var serialNo = $('#sensorDataForm #serialNo').val();
		var modelSn = $('#sensorDataForm #modelSn').val();
		
		if(serialNo == null || serialNo == ""){
			alert("시리얼번호는 필수값 입니다.");
			return;
		}
		if(modelSn == null || modelSn == ""){
			alert("제조사/모델명은 필수값 입니다.");
			return;
		}
		
		formData = $("#sensorDataForm").serialize();
		
	}else if(type == "rtu"){
		var serialNo = $('#rtuDataForm #serialNo').val();
		var modelSn = $('#rtuDataForm #modelSn').val();
		
		if(serialNo == null || serialNo == ""){
			alert("시리얼번호는 필수값 입니다.");
			return;
		}
		if(modelSn == null || modelSn == ""){
			alert("제조사/모델명은 필수값 입니다.");
			return;
		}
		
		formData = $("#rtuDataForm").serialize();
	}else if(type == "modem"){
		var serialNo = $('#modemDataForm #serialNo').val();
		var modelSn = $('#modemDataForm #modelSn').val();
		var modemNo = $('#modemDataForm #modemNo').val();
		
		if(serialNo == null || serialNo == ""){
			alert("시리얼번호는 필수값 입니다.");
			return;
		}
		if(modelSn == null || modelSn == ""){
			alert("제조사/모델명은 필수값 입니다.");
			return;
		}
		if(modemNo == null || modemNo == ""){
			alert("전화번호는 필수값 입니다.");
			return;
		}
		
		
		formData = $("#modemDataForm").serialize();
	}
	$.ajax({
		url : "<c:url value='/front/siteManage/insertToolInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			alert("장비를 등록하였습니다.");
			selectList();
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_update(type){
	var formData = null;
	if(type == "sensor"){
		formData = $("#sensorDataForm").serialize();
	}else if(type == "rtu"){
		formData = $("#rtuDataForm").serialize();
	}else if(type == "modem"){
		formData = $("#modemDataForm").serialize();
	}
	$.ajax({
		url : "<c:url value='/front/siteManage/updateToolInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			alert("장비를 수정하였습니다.");
			selectList();
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_delete(type){
	var formData = null;
	if(type == "sensor"){
		formData = $("#sensorDataForm").serialize();
	}else if(type == "rtu"){
		formData = $("#rtuDataForm").serialize();
	}else if(type == "modem"){
		formData = $("#modemDataForm").serialize();
	}
	$.ajax({
		url : "<c:url value='/front/siteManage/deleteToolInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			alert("장비를 삭제하였습니다.");
			selectList();
			$("#insertModal").hide();
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_select_tool_his(type){
	var formData = null;
	if(type == "sensor"){
		formData = $("#sensorDataForm").serialize();
	}else if(type == "rtu"){
		formData = $("#rtuDataForm").serialize();
	}else if(type == "modem"){
		formData = $("#modemDataForm").serialize();
	}
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteManage/selectToolHis.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var list = result.list;
			var leng = list.length;
			
			var html = "";
			if(type == "sensor"){
				html += '<thead>';
				html += '<tr>';
				html += '<th>시리얼번호</th>';
				html += '<th>제조사</th>';
				html += '<th>모델명</th>';
				html += '<th>PSI</th>';
				html += '<th>TYPE</th>';
				html += '<th>Cond</th>';
				html += '<th>도입구분</th>';
				html += '<th>센서상태</th>';
				html += '<th>도입년월일</th>';
				html += '<th>소재지</th>';
				html += '<th>비고</th>';
				html += '<th>수정자</th>';
				html += '<th>수정일</th>';
				html += '</tr>';
				html += '</thead>';
			}
			if(type == "rtu"){
				html += '<thead>';
				html += '<tr>';
				html += '<th>시리얼번호</th>';
				html += '<th>모델명</th>';
				html += '<th>제조사</th>';
				html += '<th>통신방식</th>';
				html += '<th>전원공급방식</th>';
				html += '<th>역류방지유무</th>';
				html += '<th>구입년월일</th>';
				html += '<th>구입방식</th>';
				html += '<th>현재상태</th>';
				html += '<th>비고</th>';
				html += '<th>수정자</th>';
				html += '<th>수정일</th>';
				html += '</tr>';
				html += '</thead>';
			}
			if(type == "modem"){
				html += '<thead>';
				html += '<tr>';
				html += '<th>시리얼번호</th>';
				html += '<th>모델명</th>';
				html += '<th>제조사</th>';
				html += '<th>전화번호</th>';
				html += '<th>비고</th>';
				html += '<th>수정자</th>';
				html += '<th>수정일</th>';
				html += '</tr>';
				html += '</thead>';
			}
			for(var i=0; i<leng; i++){
				var data = list[i]
				
				if(type == "sensor"){
					html += '<tbody id="detailTbody" style="text-align: center;">';
					html += '<td>'+data.serialNo+'</td>';
					html += '<td>'+data.makerNm+'</td>';
					html += '<td>'+data.modelNm+'</td>';
					html += '<td>'+data.psi+'</td>';
					html += '<td>'+data.type+'</td>';
					html += '<td>'+data.cond+'</td>';
					html += '<td>'+data.indcSe+'</td>';
					html += '<td>'+data.sensorSttusNm+'</td>';
					html += '<td>'+data.chIndcDt+'</td>';
					html += '<td>'+data.siteNm+'</td>';
					html += '<td>'+data.rm+'</td>';
					html += '<td>'+data.loginId+'</td>';
					html += '<td>'+data.chRegDt+'</td>';
					html += '</tbody>';
				}
				
				if(type == "modem"){
					html += '<tbody id="detailTbody" style="text-align: center;">';
					html += '<td>'+data.serialNo+'</td>';
					html += '<td>'+data.modelNm+'</td>';
					html += '<td>'+data.makerNm+'</td>';
					html += '<td>'+data.modemNo+'</td>';
					html += '<td>'+data.rm+'</td>';
					html += '<td>'+data.loginId+'</td>';
					html += '<td>'+data.chRegDt+'</td>';
					html += '</tbody>';
				}
					
				if(type == "rtu"){
					html += '<tbody id="detailTbody" style="text-align: center;">';
					html += '<td>'+data.serialNo+'</td>';
					html += '<td>'+data.modelNm+'</td>';
					html += '<td>'+data.makerNm+'</td>';
					html += '<td>'+data.commMthd+'</td>';
					html += '<td>'+data.srcelctMthd+'</td>';
					html += '<td>'+data.invPrvn+'</td>';
					html += '<td>'+data.chPurchsDt+'</td>';
					html += '<td>'+data.purchsMthd+'</td>';
					html += '<td>'+data.sttus+'</td>';
					html += '<td>'+data.rm+'</td>';
					html += '<td>'+data.loginId+'</td>';
					html += '<td>'+data.chRegDt+'</td>';
					html += '</tbody>';
				}
			}
			$("#toolHisModal #insertTable").html(html);
			$("#toolHisModal").show();
			
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_model_add(){
	/* var toolType = $("input[name='toolType']:checked").val(); */
	var formData = $("#toolAddForm").serialize();
	
	$.ajax({
		url : "<c:url value='/front/siteManage/selectModelInfoList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var list = result.list;
			var leng = list.length;
			
			var html ="";
			
			for(var i=0;i<leng; i++){
				var data = list[i];
				html += "<tr class='modelTr' onclick='fn_get_model_info("+data.modelSn+", this)' style='text-align:center;'>";
				html += "<td>"+data.toolGbn+"</td>";
				html += "<td>"+data.makerNm+"</td>";
				html += "<td>"+data.modelNm+"</td>";
				html += "</tr>";
			}
			$("#toolAddModal tbody").html(html);
			$("#toolAddModal").show();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_get_model_info(modelSn, obj){
	$(".modelTr").css("background-color", "white");
	$(obj).css("background-color", "#d3d3d3");
	$.ajax({
		url : "<c:url value='/front/siteManage/selectModelInfo.json'/>",
		type : "POST",
		data : {"modelSn":modelSn},
		dataType : "json",
		success : function(result){
			var data = result.data;
			
			$("#toolAddForm #modelSn").val(data.modelSn);
			$("#toolAddForm #toolGbn").val(data.toolGbn);
			$("#toolAddForm #modelNm").val(data.modelNm);
			$("#toolAddForm #makerNm").val(data.makerNm);
			
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_add_model(){
	var formData = $("#toolAddForm").serialize();
	$.ajax({
		url : "<c:url value='/front/siteManage/insertModelInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			fn_model_add()
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_upd_model(){
	var formData = $("#toolAddForm").serialize();
	$.ajax({
		url : "<c:url value='/front/siteManage/updateModelInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			fn_model_add()
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_set_model_info(){
	$.ajax({
		url : "<c:url value='/front/siteManage/selectModelInfoList.json'/>",
		type : "POST",
		data : {},
		dataType : "json",
		success : function(result){
			var list = result.list;
			var leng = list.length;
			
			var sensorHtml = "";
			var rtuHtml = "";
			var modemHtml = "";
			
			for(var i=0; i<leng; i++){
				var data = list[i];
				if(data.toolGbn == "SENSOR"){
					sensorHtml += "<option value='"+data.modelSn+"'>"+data.makerNm+" / "+data.modelNm+"</option>";
				}else if(data.toolGbn == "RTU"){
					rtuHtml += "<option value='"+data.modelSn+"'>"+data.makerNm+" / "+data.modelNm+"</option>";
				}else if(data.toolGbn == "MODEM"){
					modemHtml += "<option value='"+data.modelSn+"'>"+data.makerNm+" / "+data.modelNm+"</option>";
				}
			}
			$("#sensorDataForm #modelSn").html(sensorHtml);
			$("#rtuDataForm #modelSn").html(rtuHtml);
			$("#modemDataForm #modelSn").html(modemHtml);
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//팝업 Close 기능
function fn_close_modal() {
     $('.modal').hide();
};

</script>