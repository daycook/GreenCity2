<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<main>
     <div class="container-fluid px-4">
         <h1 class="mt-4">${menu.menuNm}</h1>
         <ol class="breadcrumb mb-4">
             <li class="breadcrumb-item active"> <i class="fas fa-home"></i> ${sideMenu.menuNm} > ${menu.menuNm}</li>
         </ol>
         <div class="card mb-4">
             <div class="card-body">
             	<div class="clearfix" style="background-color: #e1e1ea; padding-right: 10px;"">	
					<form id="searchForm" onsubmit="return false" style="float:right; margin-top:25px;">
						<input type="hidden" id="firstRecordIndex" name="firstRecordIndex">
						<div class="form-group">
							<label for="searchTitle">
								<span>
									<select id="searchTitle2" name="searchTitle2" class="form-control">
										<option value="nm">관측소명</option>
										<option value="perm">허가번호</option>
									</select>
								</span> 
							</label>
							<label for="searchTxt">
								<input type="text" id="searchTxt2" name="searchTxt2" placeholder="검색어를 입력하세요" title="검색어를 입력하세요" style="width:100%;" class="form-control">
							</label>
							<div style="float: right; margin-left: 10px;">
								<button class="btn btn-outline-blue" type="button" onclick="selectList()">검색</button>
								<button class="btn btn-outline-blue onlyManager" type="button" onclick="setSiteModal()">점검등록</button>
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
							<col width="10%"/>
							<col width="10%"/>
							<col width="45%"/>
							<col width="10%"/>
							<col width="10%"/>
						</colgroup>
						<thead>
							<tr>
								<th>순번</th>
								<th>관측소명</th>
								<th>점검일</th>
								<th>조치항목</th>
								<th>세부 내용</th>
								<th>작성자</th>
								<th>작성자IP</th>
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

<!-- 관측소 리스트 모달 -->
<div id="siteModal" class="modal">
  <form id="siteSearchForm" method="post">
  <input type="hidden" id="siteId" name="siteId">
  <input type="hidden" id="siteChckId" name="siteChckId">
  <input type="hidden" id="linkYn" name="linkYn">
  <input type="hidden" id="pageData" name="pageData" value="Detail">
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
				<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="siteTable" style="width: 430px;">
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
<script src='<c:url value="/js/pagination.js"/>'></script>
<script>
$(document).ready(function() {
	selectList();
});

//관측소 점검관리 리스트 조회
function selectList(){
	$("#firstRecordIndex").val(firstRecordIndex);
	$(".loading").show();
	var formData = $("#searchForm").serialize();
	$.ajax({
		url : "<c:url value='/front/siteChckManage/selectSiteChckList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			
			var html = "";
			var list = result.siteChckList;
			var leng = list.length;
			if(leng == 0){
				html += "<tr><td colspan='7'>데이터가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i=0; i<leng; i++){
					var data = list[i];
					html += "<tr onclick='javascript:fn_go_site_chk_page("+data.siteChckId+", "+data.siteId+", \""+data.linkYn+"\")'>";
					html += "<td>"+udchk(data.num)+"</td>";
					html += "<td>"+udchk(data.siteName)+"</td>";
					html += "<td>"+udchk(data.chSiteChckDt)+"</td>";
					html += "<td>"+udchk(data.chckIem)+"</td>";
					html += "<td>"+udchk(data.cont)+"</td>"
					html += "<td>"+udchk(data.loginId)+"</td>";
					html += "<td>"+udchk(data.ip)+"</td>";
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

function fn_show_modal(type){
	if(type == "siteModal"){
		setSiteModal();
	}
}

//관측소 추가시 모달창 리스트 조회
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
					html += "<tr onclick='javascript:fn_go_site_chk_page(null, "+data.siteId+", \""+data.linkYn+"\")'>";
					html += "<td>"+udchk(data.num)+"</td>";
					html += "<td>"+udchk(data.siteRpmsno)+"</td>";
					html += "<td>"+udchk(data.siteName)+"</td>";
					html += "</tr>";
				}
			}
			$("#siteTable tbody").empty(html);
			$("#siteTable tbody").append(html);
			
			
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

//관측소 점검관리 상세 화면 이동
function fn_go_site_chk_page(siteChckId, siteId, linkYn){
	$("#siteChckId").val(siteChckId);
	$("#siteId").val(siteId);
	$("#linkYn").val(linkYn);
	
	$('#siteSearchForm').attr("action","<c:url value='/front/menu05/pro501.do'/>").submit();
}
</script>