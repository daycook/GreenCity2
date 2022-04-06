<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>

<section class="content-header">
	<tg:menuInfoTag />
</section>

<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;검색조건</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-xs-4">
							<div class="input-group">
								<span class="input-group-addon">게시판구분</span>
	                            <select id="bodId" class="form-control">
									<option value="">전체</option>
									<c:forEach var="bod" items="${bodList}">
										<option value="${bod.bodId}">${bod.bodNm}</option>	
									</c:forEach>
	                            </select>
                            </div>
						</div>
						<div class="col-xs-4">						
                           	<div class="input-group">
                             	<span class="input-group-addon">제목</span>
                             	<input type="text" id="titleLike" class="form-control" placeholder="제목 입력" maxlength="30">
                           	</div>
						</div>
						<div class="col-xs-4">						
                           	<div class="input-group">
                             	<span class="input-group-addon">내용</span>
                             	<input type="text" id="contLike" class="form-control" placeholder="내용 입력" maxlength="30">
                           	</div>
						</div>
					</div>
				</div>
				<div class="box-footer">
					<div class="btn-group pull-right">
						<button type="button" class="btn btn-outline-primary" id="searchBtn">검색</button>
						<button type="button" class="btn btn-outline-primary" id="resetBtn">리셋</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<div class="box box-primary">
				<!-- <div class="box-header">
					<h3 class="box-title">목록</h3>
				</div>
				 -->
				<div class="box-body">
					<table id="datatable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;"></table>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="modal fade view-modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
				<h2 id="view-modal-title"></h2>
			</div>
			<div class="modal-body" id="view-modal-body">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
	
	var datatable;
	$(document).ready(function() {
		
		datatable = $("#datatable").DataTable({
			"searching" : false
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/bodArti/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#bodId').val() != "") {d.bodId = $('#bodId').val();	}
					if ($('#titleLike').val() != "") {d.titleLike = $('#titleLike').val();	}
					if ($('#contLike').val() != "") {d.contLike = $('#contLike').val();	}
				}
			},"processing": true
			,"serverSide": true
			,"order" : [[3, 'desc']]
			,"columns": [
				{ "name" : "BOD_NM", "title" : "게시판명", "data" : "bod.bodNm", "className" : "dt-head-center dt-body-left", "orderable" : false},
				{ "name" : "TITLE", "title" : "제목", "data" : "title", "className" : "dt-head-center dt-body-left"},
				{ "name" : "REG_ID", "title" : "작성자", "data" : "user.userNm", "className" : "dt-head-center dt-body-left"},
				{ "name" : "HIT", "title" : "조회수", "data" : "hit", "className" : "dt-head-center dt-body-right"},
				{ "name" : "REG_DT", "title" : "작성일", "render" : 
					function (data, type, row) {
					return new Date(row["regDt"]).format("yyyy-MM-dd HH:mm:ss");  
				}, "className" : "dt-head-center dt-body-center"},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='상세보기' onclick='showViewModel(\""+row["artiId"]+"\")'><i class='material-icons'>create</i></button>&nbsp;";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='삭제' onclick='del(\""+row["artiId"]+"\")'><i class='material-icons'>delete</i></button>";
						return html;  
					},
				   "className": "dt-head-center dt-body-center", "orderable" : false, "title":"기능"
				},
			]
		});
	});
	
	$("#searchBtn").click(function() {
		datatable.ajax.reload();
	});
	
	$("#bodId").change(function() {
		datatable.ajax.reload();
	});
	
	$("#resetBtn").click(function() {
		$("#titleLike").val("");
		$("#contLike").val("");
		$("#bodId option:eq(0)").attr("selected", "selected");
		datatable.ajax.reload();
	});
	
	function del(artiId) {
		if(confirm("삭제하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/system/bodArti/delete.json' />",
				type : "POST",
				data : {"artiId" : artiId},
				dataType : "json",
				success : function(res) {
					if ("success" == res.result) {
						alert("삭제되었습니다.");
						datatable.ajax.reload();
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
	
	function showViewModel(artiId) {
		$.ajax({
			url : "<c:url value='/system/bodArti/view.json' />",
			type : "POST",
			data : {"artiId" : artiId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var data = res.data;
					$("#view-modal-title").html(data.title);
					var html = "";
					html += "<table class='table table-bordered'>";
					if(data.bod.bodTp == "image") {
						html += "<tr>";
						html += "<td colspan='4'>";
						html += "<div class='col-md-2 col-md-offset-5'>";
						html += "<a href='/file/image.mng?fileId="+data.fileId+"' rel='lightbox'>";
						html += "<img src='/image/thumbnail.json?fileId="+data.fileId+"' class='img-responsive'>";
						html += "</a>";
						html += "</div>";
						html += "</td>";
						html += "</tr>";
					}else if(data.bod.bodTp == "movie") {
						html += "<tr>";
						html += "<td colspan='4'>";
						html += "<video controls style='width:100%;'>";
						html += "<source src='/file/movie/play.json?fileId="+data.fileId+"' type='video/mp4'>";
						html += "</video>";
						html += "</td>";
						html += "</tr>";
					}
					html += "<tr>";
					html += "<th>게시판명</th>";
					html += "<td>"+data.bod.bodNm+"</td>";
					html += "<th>비밀글여부</th>";
					if(data.scrtYn) {
						html += "<td><i class='fa fa-lock'></i> 비밀글</td>";
					}else {
						html += "<td><i class='fa fa-unlock'></i> 비밀글 아님</td>";
					}
					html += "</tr>";
					html += "<tr>";
					html += "<th>작성자</th>";
					html += "<td>"+data.user.userNm+"</td>";
					html += "<th>작성일</th>";
					html += "<td>"+new Date(data.regDt).format("yyyy-MM-dd HH:mm:ss")+"</td>";
					html += "</tr>";
					html += "<tr>";
					html += "<th class='text-center' colspan='4'>내용</th>";
					html += "</tr>";
					html += "<tr>";
					
					var cont = "";
					if(data.cont == null || data.cont == ""){
						cont = "";	
					}else{
						cont = data.cont;
					}
					
					html += "<td colspan='4'>"+cont+"</td>";
					html += "</tr>";
					if(data.bod.bodTp == "normal") {
						html += "<tr>";
						html += "<td>첨부파일</td>";
						html += "<td colspan='3' id='fileList'>";
						html += "</td>";
						html += "</tr>";
						
						//첨부파일 목록 조회
						$.ajax({
							url : "<c:url value='/public/file/view.json' />",
							type : "POST",
							data : {"fileId" : data.fileId},
							dataType : "json",
							success : function(res) {
								if ("success" == res.result) {
									var fileList = "";
									for(idx in res.data.fileList) {
										var fileItem = res.data.fileList[idx];
										fileList += "<a href='/file/download.json?fileId="+fileItem.fileId+"&itemId="+fileItem.itemId+"' target='_blank'>";
										fileList += fileItem.fileNm;
										fileList += "</a>";
										fileList += "<br/>";
									}
									$("#fileList").html(fileList);
								}else {
									alert(res.message);
								}
							}
						});
					}
					html += "</table>";
					$("#view-modal-body").html(html);
					$('.view-modal').modal("show");			
				}else {
					alert(res.message);
				}
			}
		});
	}
	
</script>