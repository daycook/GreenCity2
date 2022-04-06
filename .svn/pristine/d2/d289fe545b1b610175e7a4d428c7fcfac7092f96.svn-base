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
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon">게시판 형태</span>
								<!-- <tg:cdDtl cd="board" id="bodTp" styleClass="selectpicker" headerText="전체" labelYn="Y" /> -->
								<tg:cdDtl cd="board" id="bodTp" styleClass="form-control" headerText="전체" labelYn="Y" />
							</div>
						</div>
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon">게시판명</span>
								<input type="text" id="bodNmLike" class="form-control" placeholder="게시판명 입력" maxlength="50">
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
			,"paging": true
			,"bPaginate": true
			,"responsive": true
			,"language": lang_kor
			,"ajax" : {
				"url" : "<c:url value='/system/bod/list.json' />"
				,"method" : "post"
				,"data" : function(d) {
					if ($('#bodNmLike').val() != "") {d.bodNmLike = $('#bodNmLike').val();	}
					if ($('#bodTp').val() != "") {d.bodTp = $('#bodTp').val();	}
				}
			},"processing": true
			,"serverSide": true
			,"order" : [[0, 'desc']]
			,"columns": [
				{ "name" : "BOD_TP", "title" : "게시판 형태", "render" : 
				function (data, type, row) {
					return "<span class='label label-"+row["bodTpCd"].cdDtlLabel+"'>"+row["bodTpCd"].cdDtlNm+"</span>";  
				}, "className" : "dt-head-center dt-body-center"},
				{ "name" : "BOD_NM", "title" : "게시판명", "data" : "bodNm", "className" : "dt-head-center dt-body-left"},
				{ "name" : "BOD_TP", "title" : "게시판 기능", "render" : 
					function (data, type, row) {
						var html = "<span class='label ";
						if(row["cmntYn"]) html += "label-primary' data-toggle='tooltip' title='뎃글'";
						else html += "label-default";
						html += "'>뎃글</span>";
						
						html += "<span class='label ";
						if(row["answYn"]) html += "label-warning' data-toggle='tooltip' title='답변'";
						else html += "label-default";
						html += "'>답변</span>";
						
						html += "<span class='label ";
						if(row["scrtYn"]) html += "label-success' data-toggle='tooltip' title='비밀글'";
						else html += "label-default";
						html += "'>비밀글</span>";
						return html;  
					}, "className" : "dt-head-center dt-body-center", " orderable" : false},
				{ "render" : 
					function (data, type, row) {
						var html = "";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='수정' onclick='goView(\""+row["bodId"]+"\")'><i class='material-icons'>create</i></button>&nbsp;";
						html += "<button type='button' class='btn btn-xs btn-outline-primary' data-toggle='tooltip' title='삭제' onclick='goDelete(\""+row["bodId"]+"\")'><i class='material-icons'>delete</i></button>&nbsp;";
						return html;  
					},
				   "className": "dt-head-center dt-body-center", "orderable" : false, "title":"기능"
				}
			]
		});
	});
	
	$("#searchBtn").click(function() {
		datatable.ajax.reload();
	});
	
	$("#bodTp").change(function() {
		datatable.ajax.reload();
	});
	
	$("#resetBtn").click(function() {
		$("#bodNmLike").val("");
		$('.selectpicker').selectpicker('deselectAll');
		datatable.ajax.reload();
	});
	
	$("input").keypress(function(event) {
	    if (event.which == 13) {
	        event.preventDefault();
	        datatable.ajax.reload();
	    }
	});
	
	function goInsert() {
		location.href = "/system/bod/insert.mng";
	}
	
	function goView(bodId) {
		location.href = "/system/bod/view.mng?bodId="+bodId;
	}
	
	function goDelete(bodId){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : "<c:url value='/system/bod/delete.json' />",
				type : "POST",
				data : {"bodId" : bodId},
				dataType : "json",
				success : function(res){
					if("success" == res.result){
						alert("삭제되었습니다.");
						datatable.ajax.reload();
					}else{
						alert(res.message)
					}
				}
			})
		}
	}
</script>