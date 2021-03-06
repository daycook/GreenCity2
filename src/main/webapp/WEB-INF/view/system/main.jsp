<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>

<section class="content">
	<div class="row">
		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="box box-info">
				<div class="box-header">
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;사이트 목록</h3>
				</div>
				<div class="box-body no-padding">
					<table id="siteTable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;">
						<thead>
							<tr>
								<th class="text-center">사이트명</th>
								<th class="text-center">메인화면URL</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="3" class="text-center">조회중입니다.</td>
							</tr>
						</tbody>
					</table>
					<div class="box-tools pull-right">
						<a href="<c:url value='/system/site/list.mng'/>">
							<button type="button" class="btn btn-sm btn-outline-primary" data-toggle="tooltip" title="더보기">더보기</button>
						</a>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="box box-info">
				<div class="box-header">
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;최근 게시물</h3>
						<div class="box-body no-padding">
						<table id="bodTable" class="table table-bordered table-striped" style="width:100%; table-layout:fixed;">
							<thead>
								<tr>
									<th class="text-center">게시판 명</th>
									<th class="text-center">게시물 명</th>
									<th class="text-center">등록일자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="3" class="text-center">조회중입니다.</td>
								</tr>
							</tbody>
						</table>
						
						<div class="box-tools pull-right">
							<a href="<c:url value='/system/bodArti/list.mng'/>">
								<button type="button" class="btn btn-sm btn-outline-primary" data-toggle="tooltip" title="더보기">
		                      		더보기
								</button>
							</a>
						</div>
					</div>
				</div>
				<div class="box-body no-padding">					
				</div>
			</div>
		</div>
		
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="box box-info">
				<div class="box-header">
					<h3 class="box-title"><i class='material-icons' style='font-size:16px;'>play_arrow</i>&nbsp;&nbsp;사이트별 사용자 접속자 통계</h3>
						<div class="row">
							<div class="col-xs-6">
								<div class="input-group">
									<span class="input-group-addon">사이트 구분</span>
									<select id="siteId" class="form-control">
										
									</select>
								</div>
							</div>
							<div class="col-xs-6">						
	                            <div class="input-group">
	                               	<span class="input-group-addon">일정기간</span>
	                               	<input type="text" class="form-control datepicker" name="startRegDt" id="startRegDt" placeholder="시작일">
									<span class="input-group-addon"> ~ </span>
									<input type="text" class="form-control datepicker" name="endRegDt" id="endRegDt" placeholder="종료일">
	                            </div>
	                            <div class="box-footer">
									<div class="btn-group pull-right">
										<button type="button" class="btn btn-outline-primary" id="searchBtn" onclick="chatData()"></i> 검색</button>
									</div>
								</div>
							</div>
						</div>
						<div class="box-body no-padding">
							<div class="box-body chart-responsive">
								<div id="line-chart" class="chart" style="width:100%; height:300px;"></div>
							</div>
						<div class="box-tools pull-right">
							<a href="<c:url value='/system/siteStats/list.mng'/>">
								<button type="button" class="btn btn-sm btn-outline-primary" data-toggle="tooltip" title="더보기">
		                      		더보기
								</button>
							</a>
						</div>
					</div>
				</div>
				<div class="box-body no-padding">					
				</div>
			</div>
		</div>
	</div>
	
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
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</section>

<script>

	$(document).ready(function() {
		//사이트목록
		$.ajax({
			url : "<c:url value='/system/site/list.json' />",
			type : "POST",
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var html = "";
					var html2 = "";
					for(idx in res.data) {
						var site = res.data[idx];
						html += "<tr>";
						html += "<td>"+site.siteNm+"</td>";
						html += "<td>";
						if(site.startUrl != null){
							html += "<a href='/GreenCity/"+site.startUrl+"/main.do'>";
							html += "/"+site.startUrl+"/main.do"
						}
						else{
							html += "<a href='/GreenCity/main.do'>";
							html += "/main.do"
						}
						html += "</a>";
						html += "</td>";
						html += "</tr>";
						
						html2 += "<option value='"+site.siteId+"'>"+site.siteNm+"</option>"
					}
					$("#siteTable > tbody").html(html);
					$("#siteId").append(html2);
					chatData()
				}else {
					alert(res.message);
				}
			}
		});
		
		//최근 게시물 리스트
		$.ajax({
			url : "<c:url value='/system/bodArti/recList.json' />",
			type : "POST",
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					var html = "";
					for(idx in res.data) {
						var bod = res.data[idx];
						html += "<tr>";
						html += "<td>"+bod.bodNm+"</td>";
						html += "<td><a onclick='showViewModel("+bod.artiId+")'>"+bod.title+"</td>";
						html += "<td>"+date_to_str(new Date(bod.regDt))+"</td>";
						html += "</tr>";
					}
					$("#bodTable > tbody").html(html);
				}else {
					alert(res.message);
				}
			}
		});
	});
	
	//게시물 상세 보기
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
	
	function chatData() {
		if($('#startRegDt').val() > $('#endRegDt').val()){
			alert("일정기간 : 시작일은 종료일보다 클 수 없습니다.");
			return ;
		}
		
	    $.ajax({
	        url : "<c:url value='/system/siteStats/list.json' />",
	        type : "POST",
	        data : {"siteId":$("#siteId").val(),"startRegDt":$("#startRegDt").val(),"endRegDt":$("#endRegDt").val()},
	        dataType : "json",
	        success : function(result) {
	        	//chart 초기화
	        	$('#line-chart').html('');
	        	
	        	var data = result.data;
	            Morris.Line({
	            		element: 'line-chart',
	                   	data: data,
	                  	xkey: 'rRegDtString',
	                 	ykeys: ['menuCount'],
		                labels: ['접속자수'],
	                	lineColors: ['#3c8dbc'],
	                	hideHover: 'auto',
	                	resize: true	//반응형 리사이징 문제점 파악
	               });
	        },error : function(request,status,error) {
	        }
	    });
	}
	
</script>