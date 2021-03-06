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
						<input type="hidden" id="firstRecordIndex" name="firstRecordIndex">
						<div class="form-group">
							<label for="searchTitle">
								<span>
									<select id="searchTitle" name="searchTitle" class="form-control">
										<option value="nm">관측소명</option>
										<option value="perm">허가번호</option>
									</select>
								</span> 
							</label>
							<label for="searchTxt">
								<input type="text" id="searchTxt" name="searchTxt" placeholder="검색어를 입력하세요" title="검색어를 입력하세요" style="width:100%;" class="form-control">
							</label>
							<div style="float: right; margin-left: 10px;">
								<button class="btn btn-outline-blue" type="button" onclick="selectList()">검색</button>
								<button class="btn btn-outline-blue onlyManager" type="button" onclick="fn_show_modal('insert')">관측소 추가</button>
							</div>
						</div>
					</form>
				</div>
                <div class="" style="overflow: auto;">       
			 		<div>
						총 게시물 : <strong id="paginationTotalCnt"></strong>
					</div>
					<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="datatable">
						<colgroup>
							<col width="5%"/>
							<col width="10%"/>
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="45%" />
							<col width="10%" />
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>관측소명</th>
								<th>허가번호</th>
								<th>표고_TOC(m)</th>
								<th>관정심도(m)</th>
								<th>위치</th>
								<th>연계여부</th>
							</tr>
							
						</thead>
						<tbody style="text-align: center;">
							
						</tbody>
					</table>
				</div>
				<div class="text-center paginationStyle" id="pagination"></div>
             </div>
         </div>
     </div>
 </main>

<script src='<c:url value="/js/pagination.js"/>'></script>

<!-- 관측소 상세 모달 -->
<div id="detailModal" class="modal">
  <form id="">
  <!-- Modal content -->
  <div class="modal-content" style="width: 1500px; height: 600px; margin: 5% auto;">
            <div style="width: 100%; text-align: right;">
		    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('detailModal')">
				<i class="fas fa-times"></i>
			</span>
			</div>
            <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;">관측소 상세</span></b></span></p>
			<br>
			<div style="height: 650px;">
				<div id="siteDtlDiv" class="onlyWeb" style="float: left;">
					<div class="siteImg" style="margin-bottom: 5px;" id="img1">
					</div>
					<div class="siteImg" id="img2">
					</div>
				</div>
				<div style="float: right;">
					<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="insertTable" style="width: 1000px;">
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
						<tbody id="detailTbody" style="text-align: center;">
							
						</tbody>
					</table>
					<div style="text-align: right; margin-top: 10px;">
						<input type="button" class="btn btn-outline-blue onlyMobi" value="관측소 사진1" onclick="fn_show_modal('img1')">
						<input type="button" class="btn btn-outline-blue onlyMobi" value="관측소 사진2" onclick="fn_show_modal('img2')">
						<input type="button" class="btn btn-outline-blue" value="관측소 수정이력" onclick="fn_show_modal('record')">
						<input type="button" class="btn btn-outline-blue onlyManager" value="수정" onclick="fn_show_modal('update')">
						<input type="button" class="btn btn-outline-blue onlyManager" value="삭제" onclick="fn_delete()">
          			</div>
				</div>
			</div>
  </div>
  </form>
</div>

<!-- 관측소 등록 수정 모달 -->
<div id="insertModal" class="modal">
  <form id="siteUpdateForm">
  <input type="hidden" id="siteId" name="siteId">
  <!-- Modal content -->
  <div class="modal-content" style="width: 1000px; height: 650px; margin: 5% auto;">
  			<div style="width: 100%; text-align: right;">
		    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('insertModal')">
				<i class="fas fa-times"></i>
			</span>
			</div>
            <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;" id="insertModalTitle">관측소 등록</span></b></span></p>
			<div style="height: 550px;">
				<div class="insertShow" style="width: 100%; text-align: right; margin-bottom: 10px;">
					허가번호 : 
					<label for="searchTxt">
						<input class="form-control" style="width: 200px;" type="text" id="oldSiteSn" name="oldSiteSn">
					</label>
					<input type="button" class="btn btn-outline-blue" value="기존관측소 조회" onclick="javascript:fn_old_site_set()">
					<input type="button" class="btn btn-outline-blue" value="초기화" onclick="javascript:insertDataSet()">
				</div>
				<input type="hidden" id="linkYn" name="linkYn" value="N">
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
							<th>관측소명</th>
							<td><input class='form-control siteData' type='text' id="siteName" name="siteName" maxlength="50"></td>
							<th>허가번호</th>
							<td><input class='form-control siteData' type='text' id="siteRpmsno" name="siteRpmsno" maxlength="11"></td>
						</tr>
						<tr>
							<th>위치</th>
							<td colspan="3"><input class='form-control siteData' type='text' id="sitePos" name="sitePos" maxlength="50"></td>
						</tr>
						<tr>
							<th>대유역</th>
							<td>
								<select class='form-control siteData' id="siteBdgr" name="siteBdgr">
									<optoin value="">-대유역-</optoin>
								</select>
							</td>
							<th>소유역</th>
							<td>
								<select class='form-control siteData' id="siteSdgr" name="siteSdgr">
									<optoin value="">-소유역-</optoin>
								</select>
							</td>
						</tr>
						<!-- <tr>
							<th>표고_BOC(m)</th>
							<td><input class='form-control siteData' type='text' id='siteAlboc' name='siteAlboc'></td>
						</tr> -->
						<tr>
							<th>경도</th>
							<td><input class='form-control siteData' type='text' id='siteLo' name='siteLo' maxlength="30"></td>
							<th>심도(m)</th>
							<td><input class='form-control siteData onlyNumber' type='text' id='siteDph' name='siteDph' maxlength="22"></td>
						</tr>
						<tr>
							<th>위도</th>
							<td><input class='form-control siteData' type='text' id='siteLa' name='siteLa' maxlength="30"></td>
							<th>케이싱구경(mm)</th>
							<td><input class='form-control siteData onlyNumber' type='text' id='siteCalbr' name='siteCalbr' maxlength="22"></td>
						</tr>
						<tr>
							<!-- <th>개발년도</th>
							<td><input class='form-control siteData' type='text' id='siteDevdt' name='siteDevdt'></td> -->
							<th>표고_TOC(m)</th>
							<td><input class='form-control siteData onlyNumber' type='text' id='siteAltoc' name='siteAltoc' maxlength="22"></td>
							<th>관측년도</th>
							<td><input class='form-control siteData onlyNumberNotDot' type='text' id='siteDevdt' name='siteDevdt' maxlength="4"></td>
						</tr>
						<tr>
							<th>관측소 사진1</th>
							<td colspan="2">
								<p id="fileNm1">사진 추가를 원하면 추가버튼을 클릭하여 주십시오</p>
								<input type='hidden' id="sitePic1" name="sitePic1">
							</td>
							<td>
								<input type="button" class="btn btn-outline-blue" value="추가" onclick="javascript:$('#file1').trigger('click');">
							</td>
						</tr>
						<tr>
							<th>관측소 사진2</th>
							<td colspan="2">
								<p id="fileNm2">사진 추가를 원하면 추가버튼을 클릭하여 주십시오</p>
								<input type='hidden' id="sitePic2" name="sitePic2">
							</td>
							<td>
								<input type="button" class="btn btn-outline-blue" value="추가" onclick="javascript:$('#file2').trigger('click');">
							</td>
						</tr>
						<tr>
							<th>관측소 지질주상도</th>
							<td colspan="2">
								<p id="fileNm3">지질주상도 추가를 원하면 추가버튼을 클릭하여 주십시오</p>
								<input type='hidden' id="siteGcol" name="siteGcol">
							</td>
							<td>
								<input type="button" class="btn btn-outline-blue" value="추가" onclick="javascript:$('#file3').trigger('click');">
							</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: right; margin-top: 10px;">
		           <input type="button" class="insertShow btn btn-outline-blue" value="등록" onclick="javascript:fileUpload('insert')">
		           <input type="button" class="updateShow btn btn-outline-blue" value="수정" onclick="javascript:fileUpload('update')">
		        </div>
			</div>
  </div>
  </form>
  <form method="text" enctype="multipart/form-data" id="uploadForm" style="background: white; display: none;">
	  <input type="file" id="file1" name="file1" onchange="fnFileSelect('file1')"/>
	  <input type="file" id="file2" name="file2" onchange="fnFileSelect('file2')"/>
	  <input type="file" id="file3" name="file3" onchange="fnFileSelect('file3')"/>
	  <button id='btnUpload'>확인</button>
  </form>
</div>

<!-- 관측소 변경 이력 모달 -->
<div id="recordModal" class="modal">
  <form id="">
  <!-- Modal content -->
  <div class="modal-content" style="width: 1100px; height: 550px; margin: 5% auto;">
	          <div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('recordModal')">
			<i class="fas fa-times"></i>
		</span>
		</div>
	          <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;">관측소 변경이력</span></b></span></p>
		<br>
		<div style="height: 350px;">
			<div style="overflow: scroll;  height: 350px;">
				<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="recordTable" style="width: 2000px;">
					<colgroup>
						<col width="3%"/>
						<col width="6%"/>
						<col width="6%"/>
						<col width="20%"/>
						<col width="6%"/>
						<col width="6%"/>
						<col width="6%"/>
						<col width="6%"/>
						<col width="6%"/>
						<col width="6%"/>
						<col width="6%"/>
						<col width="6%"/>
						<col width="10%"/>
					</colgroup>
					<thead>
						<tr>
							<th>순번</th>
							<th>관측소명</th>
							<th>허가번호</th>
							<th>위치</th>
							<th>대유역</th>
							<th>소유역</th>
							<th>경도</th>
							<th>위도</th>
							<th>심도(m)</th>
							<th>케이싱구경(mm)</th>
							<th>표고_TOC(m)</th>
							<th>관측년도</th>
							<th>수정자</th>
							<th>수정일자</th>
						</tr>
					</thead>
					<tbody id="recordTbody" style="text-align: center;">
						<tr>
							<td colspan="14">데이터가 존재하지 않습니다.<td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
  </div>
  </form>
</div>

<!-- 관측소 이미지 모달 -->
<div id="img1Modal" class="modal">
  <form id="">
  <!-- Modal content -->
  <div class="modal-content" style="width: 1100px; height: 400px; margin: 5% auto;">
	          <div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('img1Modal')">
			<i class="fas fa-times"></i>
		</span>
		</div>
	          <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;">관측소 사진</span></b></span></p>
		<br>
		<div style="height: 350px;">
			<div class="siteImg" id="img1Div"  height: 350px;">
				
			</div>
		</div>
  </div>
  </form>
</div>

<div id="img2Modal" class="modal">
  <form id="">
  <!-- Modal content -->
  <div class="modal-content" style="width: 1100px; height: 400px; margin: 5% auto;">
	          <div style="width: 100%; text-align: right;">
	    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('img2Modal')">
			<i class="fas fa-times"></i>
		</span>
		</div>
	          <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;">관측소 사진</span></b></span></p>
		<br>
		<div style="height: 350px;">
			<div class="siteImg" id="img2Div"  height: 350px;">
				
			</div>
		</div>
  </div>
  </form>
</div>
<script>
$(document).ready(function() {
	getCodeList("CODE002", "siteBdgr");
	getCodeList("CODE003", "siteSdgr");
	selectList();
});

//관측소 이미지, 지질주상도 파일 선택시 설정
function fnFileSelect(id){
	var fileValue = $("#"+id).val().split("\\");
	var fileName = fileValue[fileValue.length-1]; // 파일명

	if(id=="file1"){
		$("#fileNm1").html(fileName);
	}else if(id=="file2"){
		$("#fileNm2").html(fileName);
	}else if(id=="file3"){
		$("#fileNm3").html(fileName);
	}
}

//관측소 이미지, 지질주상도 파일 업로드
function fileUpload(type){
	if(type == "insert"){
		if(!confirm("관측소를 등록하시겠습니까?")){
			return;
		}
	}else if(type == "update"){
		if(!confirm("관측소를 수정하시겠습니까?")){
			return;
		}
	}
	
	var form = $('#uploadForm')[0]
    var data = new FormData(form);
    
    $('#btnUpload').prop('disabled', true);
	
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url : "<c:url value='/front/siteManage/selectSiteImgFileUpload.json'/>",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (result) {
        	var data = result.imgFileId;
        	
        	if(data.file1 != null && data.file1 != ""){
        		$("#sitePic1").val(data.file1);
        	}
        	if(data.file2 != null && data.file2 != ""){
        		$("#sitePic2").val(data.file2);
        	}
        	if(data.file3 != null && data.file3 != ""){
        		$("#siteGcol").val(data.file3);
        	}
        	
        	$("#file1").val(null);
			$("#file2").val(null);
			$("#file3").val(null);
        	
        	if(type == "insert"){
        		fn_insert();
        	}else if(type == "update"){
        		fn_update();
        	}
        }, 
        error: function (e) {
            $('#btnUpload').prop('disabled', false);
            alert('fail');
        }
    });
}

//관측소 리스트 조회
function selectList(){
	$("#firstRecordIndex").val(firstRecordIndex);
	$(".loading").show();
	var formData = $("#searchForm").serialize();
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
				html += "<tr><td colspan='6'>데이터가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i=0; i<leng; i++){
					var data = list[i];
					html += "<tr onclick='javascript:fn_show_modal(\"detail\", "+data.siteId+")'>";
					html += "<td>"+udchk(data.num)+"</td>";
					html += "<td>"+udchk(data.siteName)+"</td>";
					html += "<td>"+udchk(data.siteRpmsno)+"</td>";
					html += "<td>"+udchk(data.siteAltoc)+"</td>";
					html += "<td>"+udchk(data.siteDph)+"</td>"
					html += "<td>"+udchk(data.sitePos)+"</td>";
					if(data.linkYn == "Y"){
						html += "<td style='color:green;'>연계</td>";
					}else{
						html += "<td style='color:blue;'>비연계</td>";
					}
					html += "</tr>";
				}
			}
			$("#datatable tbody").empty(html);
			$("#datatable tbody").append(html);
			
			setPagination(result.total, 10);
			renderPagination();
			
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
	
}

//이전 관측소 조회
function fn_old_site_set(){
	if($("#oldSiteSn").val() == null || $("#oldSiteSn").val() == ""){
		alert("조회하려는 관측소의 허가번호를 입력하여 주십시오.");
		return;
	}
	var formData = $("#siteUpdateForm").serialize();
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteManage/selectLinkSiteInfo.json'/>",
		type : "POST",
		data : {"oldSiteSn":$("#oldSiteSn").val()},
		dataType : "json",
		success : function(result){
			if(result.chk == "1"){
				alert("해당 관측소는 등록되어 있습니다.");
				$(".loading").hide();
				return;
			}
			var data = result.siteInfo;
			if(data == null){
				alert("해당 관측소는 존재하지 않습니다.");
				$(".loading").hide();
			}else{
				$("#linkYn").val("Y");
				$(".siteData").attr("readonly", true); //비활성화
				
				//데이터 입력
				$("#siteName").val(udchk(data.siteName)); //관측소명
				$("#siteRpmsno").val(udchk(data.siteRpmsno)); //허가번호
				$("#sitePos").val(udchk(data.sitePos)); //위치
				$("#siteBdgr").val(udchk(data.siteBdgr)); //대유역
				$("#siteSdgr").val(udchk(data.siteSdgr)); //소유역
				$("#siteAltoc").val(udchk(data.siteAltoc)); //표고_TOC
				//$("#siteAlboc").val(); //표고_BOC
				$("#siteLo").val(udchk(data.siteLo)); //경도
				$("#siteLa").val(udchk(data.siteLa)); //위도
				$("#siteDph").val(udchk(data.siteDph)); //심도(m)
				$("#siteCalbr").val(udchk(data.siteCalbr)); //케이싱구경(mm)
				$("#siteDevdt").val(udchk(data.siteDevdt)); //관측년도
				
				$(".loading").hide();
			}
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//등록을 위한 데이터 초기화
function insertDataSet(){
	$("#insertModal").show();
	$("#insertModalTitle").empty();
	$("#insertModalTitle").append("관측소 등록");
	
	$(".insertShow").show();
	$(".updateShow").hide();
	
	$("#siteName").val(null); //관측소명
	$("#siteRpmsno").val(null); //허가번호
	$("#sitePos").val(null); //위치
	$("#siteBdgr").val("001"); //대유역
	$("#siteSdgr").val("001"); //소유역
	$("#siteAltoc").val(null); //표고_TOC
	/* $("#siteAlboc").val(null); //표고_BOC */
	$("#siteLo").val(null); //경도
	$("#siteLa").val(null); //위도
	$("#siteDph").val(null); //심도(m)
	$("#siteCalbr").val(null); //케이싱구경(mm)
	$("#siteDevdt").val(null); //관측년도
	/* $("#siteInstldt").val(); //관측년도 */
	
	$("#sitePic1").val(null);
	$("#sitePic1").val(null);
	$("#siteGcol").val(null);
	
	$("#file1").val(null);
	$("#file2").val(null);
	$("#file3").val(null);
	
	$("#fileNm1").html("사진 추가를 원하면 추가버튼을 클릭하여 주십시오");
	$("#fileNm2").html("사진 추가를 원하면 추가버튼을 클릭하여 주십시오");
	$("#fileNm3").html("지질주상도 추가를 원하면 추가버튼을 클릭하여 주십시오");
	
	$("#oldSiteSn").val("")
	$("#linkYn").val("N");
	$(".siteData").attr("readonly", false); //비활성화	
}


//관측소 데이터 등록
function fn_insert(){
	var formData = $("#siteUpdateForm").serialize();
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteManage/insertSiteInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			if(result.chk == "1"){
				alert("해당 관측소는 등록되어 있습니다.");
				$(".loading").hide();
				return;
			}
			alert("등록성공");
			selectList();
			fn_close_modal("insertModal");
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//모달창 제어
function fn_show_modal(type, siteId){
	fn_close_modal();
	if(type=="insert"){
		insertDataSet();
	}else if(type=="detail"){
		if(siteId == "back"){
			siteId = $("#siteId").val();
		}
		fn_set_detail(siteId);
	}else if(type=="update"){
		fn_set_udpate();
	}else if(type=="record"){
		fn_record_list();
	}else if(type=="img1"){
		$("#img1Modal").show();
	}
	else if(type=="img2"){
		$("#img2Modal").show();
	}
}

//관측망 수정 데이터 셋팅
function fn_set_udpate(){
	$("#insertModalTitle").empty();
	$("#insertModalTitle").append("관측소 수정");
	
	$(".insertShow").hide();
	$(".updateShow").show();
	
	$("#insertModal").show();
	
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteManage/selectSiteInfo.json'/>",
		type : "POST",
		data : {"siteId":$("#siteId").val()},
		dataType : "json",
		success : function(result){
			var data = result.siteInfo;
			if(data.linkYn == "Y"){
				$(".siteData").attr("readonly", true); //비활성화
			}else{
				$(".siteData").attr("readonly", false); //활성화
			}
			
			//데이터 입력
			$("#siteName").val(udchk(data.siteName)); //관측소명
			$("#siteRpmsno").val(udchk(data.siteRpmsno)); //허가번호
			$("#sitePos").val(udchk(data.sitePos)); //위치
			$("#siteBdgr").val(udchk(data.siteBdgr)); //대유역
			$("#siteSdgr").val(udchk(data.siteSdgr)); //소유역
			$("#siteAltoc").val(udchk(data.siteAltoc)); //표고_TOC
			//$("#siteAlboc").val()); //표고_BOC
			$("#siteLo").val(udchk(data.siteLo)); //경도
			$("#siteLa").val(udchk(data.siteLa)); //위도
			$("#siteDph").val(udchk(data.siteDph)); //심도(m)
			$("#siteCalbr").val(udchk(data.siteCalbr)); //케이싱구경(mm)
			$("#siteDevdt").val(udchk(data.siteDevdt)); //관측년도
			
			$("#sitePic1").val(udchk(data.sitePic1));
			$("#sitePic2").val(udchk(data.sitePic2));
			$("#siteGcol").val(udchk(data.siteGcol));
			
			$("#file1").val(null);
			$("#file2").val(null);
			$("#file3").val(null);
			
			$("#fileNm1").html(udchk(data.sitePic1));
			$("#fileNm2").html(udchk(data.sitePic2));
			$("#fileNm3").html(udchk(data.siteGcol));
			
			if(udchk(data.sitePic1) == null || udchk(data.sitePic1) == ""){
				$("#fileNm1").html("사진 추가를 원하면 추가버튼을 클릭하여 주십시오");
			}
			if(udchk(data.sitePic2) == null || udchk(data.sitePic2) == ""){
				$("#fileNm2").html("사진 추가를 원하면 추가버튼을 클릭하여 주십시오");
			}
			if(udchk(data.siteGcol) == null || udchk(data.siteGcol) == ""){
				$("#fileNm3").html("지질주상도 추가를 원하면 추가버튼을 클릭하여 주십시오");
			}
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}


//관측소 상세정보 셋팅
function fn_set_detail(siteId){
	$("#detailModal").show();
	
	$("#siteId").val(siteId);
	$("#detailTbody").empty();
	
	var html = "";
	
	$(".loading").show();
	
	$.ajax({
		url : "<c:url value='/front/siteManage/selectSiteInfo.json'/>",
		type : "POST",
		data : {"siteId":siteId},
		dataType : "json",
		success : function(result){
			var html = "";
			var data = result.siteInfo;
			$("#img1").empty();
			$("#img2").empty();
			if(udchk(data.sitePic1) != null && udchk(data.sitePic1) != ""){
				$("#img1").append('<img src="/GreenCity/front/common/display.do?name='+data.sitePic1+'"  style="height: 200px; width:400px;">')
				$("#img1Div").html('<img src="/GreenCity/front/common/display.do?name='+data.sitePic1+'"  style="height: 200px; width:100%;">');
			}else{
				$("#img1").append("<div style='margin-top:20%;'>이미지가 없습니다.</div>");
				$("#img1Div").html("<div style='margin-top:20%;'>이미지가 없습니다.</div>");
			}
			if(udchk(data.sitePic2) != null && udchk(data.sitePic2) != ""){
				$("#img2").append('<img src="/GreenCity/front/common/display.do?name='+data.sitePic2+'"  style="height: 200px; width:400px;">');
				$("#img2Div").html('<img src="/GreenCity/front/common/display.do?name='+data.sitePic2+'"  style="height: 200px; width:100%;">');
			}else{
				$("#img2").append("<div style='margin-top:20%;'>이미지가 없습니다.</div>");
				$("#img2Div").html("<div style='margin-top:20%;'>이미지가 없습니다.</div>");
			}
			
			html += '<tr><th>관측소명</th><td>'+udchk(data.siteName)+'</td><th>관측년도</th><td>'+udchk(data.siteDevdt)+'</td></tr>';
			html += '<tr><th>위치</th><td colspan="3">'+udchk(data.sitePos)+'</td></tr>';
			html += '<tr><th>허가번호</th><td>'+udchk(data.siteRpmsno)+'</td><th>대유역</th><td>'+udchk(data.siteBdgrNm)+'</td></tr>';
			html += '<tr><th>표고_TOC(m)</th><td>'+udchk(data.siteAltoc)+'</td><th>소유역</th><td>'+udchk(data.siteSdgrNm)+'</td></tr>';
			html += '<tr><th>X_COORD</th><td>'+udchk(data.wellX)+'</td><th>Y_COORD</th><td>'+udchk(data.wellY)+'</td></tr>';
			html += '<tr><th>경도</th><td>'+udchk(data.siteLo)+'</td><th>심도(m)</th><td>'+udchk(data.siteDph)+'</td></tr>';
			html += '<tr><th>위도</th><td>'+udchk(data.siteLa)+'</td><th>케이싱구경(mm)</th><td>'+udchk(data.siteCalbr)+'</td></tr>';
			if(udchk(data.siteGcol) == "" || udchk(data.siteGcol) == null){
				html += '<tr><th>관측소 지질주상도</th><td colspan="3">지질주상도 파일이 없습니다.</td></tr>';
			}else{
				html += '<tr><th>관측소 지질주상도</th><td colspan="3" onclick="javascript:fn_imgFiledownload()"><a>'+udchk(data.siteName)+'지질주상도</a></td></tr>';
			}
			
			
			$("#detailTbody").append(html);
			
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_imgFiledownload(){
	var siteId = $("#siteId").val();
	location.href = "<c:url value='/front/siteManage/imgFiledownload.do?siteId="+siteId+"'/>"
}

//관층망 데이터 수정
function fn_update(){
	var formData = $("#siteUpdateForm").serialize();
	$(".loading").show();
	$.ajax({
		url : "<c:url value='/front/siteManage/updateSiteInfo.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			if(result.result == "success"){
				selectList();
				fn_set_detail($("#siteId").val());
				alert("수정 성공");
			}else{
				alert("에러!")
			}
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_delete(){
	if(confirm("삭제하시겠습니까?")){
		var formData = $("#siteUpdateForm").serialize();
		$(".loading").show();
		$.ajax({
			url : "<c:url value='/front/siteManage/deleteSiteInfo.json'/>",
			type : "POST",
			data : formData,
			dataType : "json",
			success : function(result){
				if(result.result == "success"){
					selectList();
					alert("삭제 성공");
					fn_close_modal('detailModal')
				}else{
					alert("에러!")
				}
			},
			error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
}

//관측망 수정이력 리스트 조회
function fn_record_list(){
	$(".loading").show();
	
	$.ajax({
		url : "<c:url value='/front/siteManage/selectSiteInfoHisList.json'/>",
		type : "POST",
		data : {"siteId":$("#siteId").val()},
		dataType : "json",
		success : function(result){
			$("#recordTbody").empty();
			var html = "";
			
			var list = result.siteInfoHisList;
			var leng = list.length;
			
			for(var i=0; i<leng; i++){
				var data = list[i];
				html += "<tr>";
				html += '<td>'+udchk(i+1)+'</td>' //순번
				html += '<td>'+udchk(data.siteName)+'</td>' //관측소명
				html += '<td>'+udchk(data.siteRpmsno)+'</td>' //허가번호
				html += '<td>'+udchk(data.sitePos)+'</td>' //위치
				html += '<td>'+udchk(data.siteBdgrNm)+'</td>' //대유역
				html += '<td>'+udchk(data.siteSdgrNm)+'</td>' //소유역
				html += '<td>'+udchk(data.siteLo)+'</td>' //경도
				html += '<td>'+udchk(data.siteLa)+'</td>' //위도
				html += '<td>'+udchk(data.siteDph)+'</td>' //심도(m)
				html += '<td>'+udchk(data.siteCalbr)+'</td>' //케이싱구경(mm)
				html += '<td>'+udchk(data.siteAltoc)+'</td>' //표고_TOC(m)
				html += '<td>'+udchk(data.siteDevdt)+'</td>' //관측년도
				html += '<td>'+udchk(data.userLoginId)+'</td>' //수정자
				html += '<td>'+udchk(data.chRegDt)+'</td>' //수정일자
				html += "</tr>";
			}
			
			$("#recordTbody").append(html);
			
			$('#recordModal').show();
			
			$(".loading").hide();
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

</script>