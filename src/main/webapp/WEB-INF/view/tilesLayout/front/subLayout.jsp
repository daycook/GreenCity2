<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<!DOCTYPE html>
<html style="">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>스마트그린도시</title>
<%@ include file="/WEB-INF/view/front/include.jsp" %>
</head>
<input type="hidden" id="clickModal">
<body class="sb-nav-fixed">
	<!-- 선택한 모달창 정보 -->
	<tiles:insertAttribute name="header"/>
	<div id="layoutSidenav">
		<tiles:insertAttribute name="main-sidebar"/>
		<div id="layoutSidenav_content">
			<tiles:insertAttribute name="content"/>
			<tiles:insertAttribute name="footer"/>
		</div>
	</div>
	<div class="loading">
		<div style="text-align: center; margin: 20% auto; ">
			<img src="<c:url value='/images/front/ajax-loader.gif'/>">
		</div>
	</div>
</body>
</html>



<script>
	$.datepicker.setDefaults({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	});

	
	$(document).ready(function() {
		$(".datepicker").datepicker();
		
		var mobileYn = "${paramMap.mobileYn}";
		if(mobileYn == "MOBI"){
			$(".web").hide();
			$(".content").attr('class','content_mobile');
		}
		
		$(".modal").attr("onclick", "javascript:fn_hide_this_modal(this)");
		$(".mapModal").attr("onclick", "javascript:fn_hide_this_modal(this)");
	});
	
	function getCodeList(code, id){
		$.ajax({
			url : "<c:url value='/front/common/getCodeList.json'/>",
			type : "POST",
			data : {"cdId":code},
			dataType : "json",
			success : function(result){
				var list = result.list
				var leng = list.length;
				
				var html = ""
				
				for(var i=0; i<leng; i++){
					var data = list[i]
					html +="<option value='"+data.cdDtlId+"'>"+data.cdDtlNm+"</option>";
				}
				$("#"+id).append(html);
			},
			error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	}
	
	function fn_hide_this_modal(obj, evt){
		$("#clickModal").val(obj.id);
	}
	
	$(document).keydown(function(event) {
	    if ( event.keyCode == 27 || event.which == 27 ) {
	    	//$("#"+$("#clickModal").val()).hide();
	    }
	});
	
	function hideSideMenuBar(){
		$(".side-menubar-mb").hide();
		//$(".modal-content" ).draggable();
		$(".mapModal").draggable();
	}
	
	//관측소 검색 리스트 조회
	function fn_select_site_list(){
		$(".loading").show()
		$.ajax({
			url : "<c:url value='/front/siteInfo/selectSiteInfoAllList.json'/>",
			type : "POST",
			data : {},
			dataType : "json",
			success : function(result){
				var list = result.list;
				var leng = list.length;
				
				var html="";
				html += "<option value=''>- 관측소 조회 -</option>";
				for(var i=0;i<leng;i++){
					var data = list[i]
					html += "<option value='"+data.siteRpmsno+"'>"+data.siteName+"</option>";
				}
				
				$("#searchTxt").html(html);
				
				$(".loading").hide();
			},error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		})
	}
</script>