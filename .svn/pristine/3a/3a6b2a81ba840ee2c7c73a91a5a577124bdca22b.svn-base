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
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;목록</h3>
				</div>
				<div class="box-body">
					<table id="datatable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;">
						<thead>
							<tr>
								<th class="text-center">즐겨찾기</th>
								<th class="text-center">콘텐츠명</th>
								<c:forEach var="lang" items="${langList}">
									<th class="text-center">${lang.langTpCd.cdDtlNm}</th>
								</c:forEach>
								<th class="text-center">기능</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="diff" items="${diffList}">
								<tr>
									<td class="text-center">
										<c:if test="${diff.BOOKMARK_YN > 0}">
											<i class='material-icons'>bookmarks</i>
										</c:if>
									</td>
									<td>${diff.CONT_NM}</td>
									<c:forEach var="lang" items="${langList}">
										<c:set value="ID_${lang.langId}" var="langId" />
										<td class="text-center">
											<c:out value="${diff[langId]}" />
										</td>
									</c:forEach>
									<td class="text-center">
										<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='수정' onclick="goView('${diff.CONT_ID}')"><i class='material-icons'>create</i></button>
										<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='삭제' onclick="goDelete('${diff.CONT_ID}')"><i class='material-icons'>delete</i></button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="box-footer">
					<button type="button" class="btn btn-outline-primary pull-right" onclick="goInsert()">등록</button>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	var datatable;
	$(document).ready(function() {
		datatable = $("#datatable").DataTable({
			"searching" : false
			,"language": lang_kor
			,"order" : [[0, 'desc']]
		});
	});
	
	function goView(contId) {
		location.href = "/system/cont/view.mng?contId="+contId;
	}
	
	function goInsert() {
		location.href = "/system/cont/insert.mng";
	}
	
	function goDelete(contId) {
		
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : "<c:url value='/system/cont/delete.json' />",
				type : "POST",
				data : {"contId" : contId},
				dataType : "json",
				success : function(res){
					if("success" == res.result){
						alert("삭제되었습니다.");
					}else{
						alert(res.message)
					}
				}
			})
		}
	}
</script>