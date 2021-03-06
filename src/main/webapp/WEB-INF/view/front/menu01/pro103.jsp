<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8314f8cb04df74699fbd5643c4b3afc6"></script>
<style>
	#siteModal .subComtTable th{
		background-color: #eeeff5!important;
		color: #000;
		border-top:0px;
	}
	#siteModal .subComtTable td{
		background-color: white!important;
	}
	
	body {
	  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
	}
	
	#chartdiv {
	  width: 100%;
	  height: 250px;
	max-width: 100%
	}
</style>
<main>
     <div class="container-fluid px-4">
         <h1 class="mt-4">${menu.menuNm}</h1>
         <ol class="breadcrumb mb-4">
             
             <li class="breadcrumb-item active"><i class="fas fa-home"></i> ${sideMenu.menuNm} > ${menu.menuNm}</li>
         </ol>
         <div class="card mb-4">
             
             <div class="card-body">
             	<div class="clearfix" style="background-color: #e1e1ea; margin-bottom: 10px; padding-right: 10px;">	
					<form id="searchForm" onsubmit="return false" style="float:right; margin-top:25px;">
						<input type="hidden" id="siteId" name="siteId">
						<input type="hidden" id="siteRpmsno" name="siteRpmsno">
						<div class="form-group">
							<label for="searchTxt">
								<select id="searchTxt" name="searchTxt" style="width:200px;" class="form-control" onchange="javascript:fn_site_latlon()">
								</select>
							</label>
							<label for="searchTxt">
								<button class="btn btn-outline-blue" onclick="setSituationBoard()">상황판 조회</button>
							</label>
							
						</div>
					</form>
				</div>
                 <div id="map" style="width:100%;height:700px;">
                 	<div id="dataModal1" class="dataModal dataModal1">
			      		<div style="width: 100%; text-align: right;">
						    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('dataModal1')">
								close
							</span>
						</div>
						<div style="text-align: center; margin-bottom: 10px;">
							<span style="font-size: 20px;">실시간현황 (2021년 11월 30일 10시 현재)</span>
						</div>
						<div>
							<table class="subComtTable">
								<tr>
									<td style="background-color: blue; color: white; text-align: center;">정상0개</td>
									<td style="background-color: red; color: white; text-align: center;">센서미수신0개</td>
								</tr>
								<tr>
									<td style="background-color: purple; color: white; text-align: center;">수위이상0개</td>
									<td style="background-color: orange; color: white; text-align: center;">통신이상6개</td>
								</tr>
							</table>
						</div>
 					</div>
 					<div id="dataModal2" class="dataModal dataModal2">
 						<div style="width: 100%; text-align: right;">
						    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('dataModal2')">
								close
							</span>
						</div>
						<div style="text-align: center; margin-bottom: 10px;">
							<span style="font-size: 20px;">급수 펌프 현황</span>
						</div>
						<div>
							<table class="subComtTable">
								<tr>
									<td style="background-color: blue; color: white; text-align: center;">펌프 가동 여부 : 비가동중</td>
								</tr>
								<tr>
									<td style="background-color: purple; color: white; text-align: center;">현재 이용량 : 000m3</td>
								</tr>
							</table>
						</div>
 					</div>
 					<div id="dataModal3" class="dataModal dataModal3">
 						<div style="width: 100%; text-align: right;">
						    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('dataModal3')">
								close
							</span>
						</div>
						<div style="text-align: center;">
							<span style="font-size: 20px;" id="seqSiteName"></span>
						</div>
						<div>
							<div id="chart_div" style="height: 300px; width: 500px;"></div>
						</div>
 					</div>
                 </div>
             </div>
         </div>
     </div>
 </main>
 <!-- 관측소 정보 모달 -->
	<div id="siteModal" class="mapModal">
      <!-- Modal content -->
      	<div class="mapModal-content">
      		<div style="width: 100%; text-align: right;">
			    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('siteModal')">
					close
				</span>
			</div>
	      	<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">관측소 정보</span></b></span></p>
	     	<div class="toolDiv sensorDiv" style="height: 350px;">
				<table class="subComtTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="siteTable" style="width: 530px;">
					<colgroup>
						<col width="20%"/>
						<col width="30%"/>
						<col width="20%"/>
						<col width="30%"/>
					</colgroup>
					<tbody style="text-align: center;">
						
					</tbody>
				</table>
				<div style="text-align: right; margin-top: 10px;">
		   			<input type="button" class="btn btn-outline-blue" value="관측소 상세정보" onclick="javascript:fn_set_detail();">
		   			<input type="button" class="btn btn-outline-blue" value="관측자료 보기" onclick="javascript:fn_go_siteData();">
				</div>
			</div>
        </div>
     </div>
     <!-- 관측소 상세 모달 -->
	<div id="detailModal" class="modal">
	  <form id="">
	  <!-- Modal content -->
	  <div class="modal-content" style="width: 1500px; height: 600px; margin: 5% auto;">
	           <div style="width: 100%; text-align: right;">
		    <span class="material-icons" style="cursor: pointer;" onclick="javascript:fn_close_modal('detailModal')">
				close
			</span>
			</div>
	           <p style="text-align: center;"><span style="font-size: 14pt; height: 100px;"><b><span style="font-size: 24pt;">관측소 상세</span></b></span></p>
			<br>
			<div style="height: 650px;">
				<div style="float: left;" class="onlyWeb">
					<div class="siteImg" style="margin-bottom: 5px;" id="img1">
					</div>
					<div class="siteImg" id="img2">
					</div>
				</div>
				<div id="siteDtlDiv" style="float: right;">
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
						<input type="button" class="btn btn-outline-blue" value="관측소 사진1" onclick="fn_show_modal('img1')">
						<input type="button" class="btn btn-outline-blue" value="관측소 사진2" onclick="fn_show_modal('img2')">
          			</div>
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
			close
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
			close
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {
	selecSiteInfo();
	fn_select_site_list();
	
	var script = document.createElement('script');  
	script.src = "http://t1.daumcdn.net/mapjsapi/js/main/4.4.3/kakao.js";  
	document.head.appendChild(script);
});

function fn_show_modal(type){
	if(type=="img1"){
		$("#img1Modal").show();
	}
	else if(type=="img2"){
		$("#img2Modal").show();
	}
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
		center: new kakao.maps.LatLng(33.380980, 126.536428), //지도의 중심좌표.
		level: 10 //지도의 레벨(확대, 축소 정도)
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//지도를 표시하는 div 크기를 변경하는 함수입니다
function resizeMap() {
    var mapContainer = document.getElementById('map');
    mapContainer.style.width = '650px';
    mapContainer.style.height = '650px'; 
}

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


//관측소 조회 이동
function fn_site_latlon(){
	if($("#searchTxt").val() == null||$("#searchTxt").val() == ""){
		return;
	}
	$(".loading").show()
	$.ajax({
		url : "<c:url value='/front/siteInfo/selectSiteInfo.json'/>",
		type : "POST",
		data : {"searchTxt" : $("#searchTxt").val(),
				"siteId" : null},
		dataType : "json",
		success : function(result){
			var data = result.siteInfo;

			if(data == null){
				alert("해당 허가번호로 등록된 관측소가 존재하지 않습니다.");
				$(".loading").hide()
				return;
			}
			 // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(data.lo, data.la);
		    
		    //map.setLevel(3);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);   
		    
		    setSiteModal(data.siteId, data.siteRpmsno);
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//마커 이미지
var imageSrc = "<c:url value='/images/front/water.png'/>"; 

//마커 이미지의 이미지 크기 입니다
var imageSize = new kakao.maps.Size(15, 15); 

// 마커 이미지를 생성합니다    
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

//관측소 정보 가져와서 마커 생성하는 기능
function selecSiteInfo(){
	var formData = $("#searchForm").serialize();
	$.ajax({
		url : "<c:url value='/front/siteInfo/selectSiteInfoList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var html = "";
			var list = result.siteInfoList;
			var leng = list.length;
			
			var positions = [];
			
			for(var i=0; i<leng; i++){
				var data = list[i]
				// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
				positions[i] =
					{
				        title : data.siteName,
				        siteId : data.siteId,
				        latlng: new kakao.maps.LatLng(data.lo, data.la),
				        siteRpmsno: data.siteRpmsno
				    }
			}
			
			for (var j = 0; j < positions.length; j ++) {
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        title: positions[j].title,
			        position: positions[j].latlng, // 마커의 위치
			        image : markerImage
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'click', makerClick(positions[j].siteId, positions[j].siteRpmsno));
			}
			
			
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
	
}

// 마커 클릭 이벤트 
function makerClick(siteId, siteRpmsno) {
	return function() {
		setSiteModal(siteId, siteRpmsno)
    };
}

function fn_close_modal(modal){
	if(modal == "dataModal3"){
		clearInterval(drawChartRep);
		setMarkers(null);
	}
	$('#'+modal).hide();
}

//마커 클릭시 보이는 관측소 모달창 구성 기능
function setSiteModal(siteId, siteRpmsno){
	$(".loading").show()
	$("#siteId").val(siteId);
	$("#siteRpmsno").val(siteRpmsno);
	$.ajax({
		url : "<c:url value='/front/siteInfo/selectSiteInfoAndData.json'/>",
		type : "POST",
		data : {"searchTxt" : null,
				"siteId" : siteId},
		dataType : "json",
		success : function(result){
			var data = result.siteInfo;

			var html = "";
			
			html += "<tr>";
			html += "<th>위치</th>";
			html += "<td colspan='3'>"+udchk(data.sitePos)+"</td>";
			html += "</tr>";
			
			html += "<tr>";
			html += "<th>관측소명</th>";
			html += "<td colspan='3'>"+udchk(data.siteName)+"</td>";
			html += "</tr>";
			
			html += "<tr>";
			html += "<th>경도(도분초)</th>";
			html += "<td>"+udchk(data.siteLo)+"</td>";
			html += "<th>설치일자</th>";
			html += "<td>"+udchk(data.siteInstldt)+"</td>";
			html += "</tr>";

			html += "<tr>";
			html += "<th>위도(도분초)</th>";
			html += "<td>"+udchk(data.siteLa)+"</td>";
			html += "<th>개발년도</th>";
			html += "<td>"+udchk(data.siteDevdt)+"</td>";
			html += "</tr>";
			
			html += "<tr>";
			html += "<th colspan='4'>실시간 관측자료 조회("+udchk(data.dataTime)+")</th>";
			html += "</tr>";
			
			html += "<tr>";
			html += "<th>센서</th>";
			html += "<td>"+udchk(data.mSn)+"</td>";
			html += "<th>수위(GL)</th>";
			html += "<td>"+udchk(data.gl)+"</td>";
			html += "</tr>";
			
			html += "<tr>";
			html += "<th>수온</th>";
			html += "<td>"+udchk(data.temp)+"</td>";
			html += "<th>전기전도도</th>";
			html += "<td>"+udchk(data.ec)+"</td>";
			html += "</tr>";
			$("#siteTable tbody").empty();
			$("#siteTable tbody").append(html);
			$('#siteModal').show();
			$(".loading").hide()

		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//관측소 상세정보 셋팅
function fn_set_detail(){
	$("#detailModal").show();
	$("#detailTbody").empty();
	
	var html = "";
	
	$(".loading").show();
	
	$.ajax({
		url : "<c:url value='/front/siteManage/selectSiteInfo.json'/>",
		type : "POST",
		data : {"siteId":$("#siteId").val()},
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
			
			$("#detailTbody").append(html);
			
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

//선택한 관측소의 실시간 관측자료 화면이동 함수
function fn_go_siteData(){
	var siteRpmsno = $("#siteRpmsno").val();
	window.open('<c:url value="/front/menu03/pro301.do?type=map&siteRpmsno='+siteRpmsno+'"/>', '_blank'); 
}

//차트
function setSituationBoard(){
	
	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawChart);
	$(".dataModal").show();
}
var seqSiteId = 0;

function drawChart(){
	drawChartReal();
	
	drawChartRep = setInterval(function() {
		drawChartReal()
	}, 10000);
}

var markers = [];

function drawChartReal() {
	  var data = new google.visualization.DataTable();
	  $.ajax({
			url : "<c:url value='/front/statistics/selectMapChartGwDataList.json'/>",
			type : "POST",
			data : {"seqSiteId": seqSiteId},
			dataType : "json",
			success : function(result){
				var list = result.list;
				var leng = list.length;
				var maxMinData = result.maxMinData;
				var seqSiteData = result.seqSiteData;
				
				seqSiteId = seqSiteData.siteId;
				
				$("#seqSiteName").html(seqSiteData.siteName)
				
				var data = new google.visualization.DataTable();
				data.addColumn('date', '날짜');
		      	data.addColumn('number', '수위데이터');
		      	
		      	var arr = new Array();
		      	var num = 0;
		      	
				for(var i=0; i<leng; i++){
					var dataMap = list[i];
					arr[num] = [new Date(dataMap.dataTime), dataMap.gl];
					num = num + 1;
				}
				
				data.addRows(arr);
				
				var options = {
			    	legend: "none",
			    	
			        hAxis: {
			          title: '날짜',
			          format: 'YYYY-MM-dd'
			        },
			        vAxis: {
			          title: '수위데이터',
			          viewWindow: {
			        	  	min: maxMinData.minGl,
	                        max: maxMinData.maxGl
	                    }
			        },
			        explorer: { 
		              actions: ['dragToZoom', 'rightClickToReset'],    //확대 : 마우스로 범위 선택
		              axis: 'horizontal',
		              keepInBounds: true,
		              maxZoomIn: 12.0},
			        backgroundColor: 'white'
			      };
	
			      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
			      
			      $("#chart_div").empty();
			      
			      chart.draw(data, options);
			      
			      //마커가 표시될 위치입니다 
			      var markerPosition  = new kakao.maps.LatLng(seqSiteData.lo, seqSiteData.la); 
			      
			      // 마커를 생성합니다
			      var marker = new kakao.maps.Marker({
			          position: markerPosition
			      });
			      
			      // 마커가 지도 위에 표시되도록 설정합니다
			      setMarkers(null);
			      
			      marker.setMap(map);
			      
			      markers.push(marker);
			},
			error:function(request,status,error){
		    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
	  });
    }
    
    function setMarkers(map) {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }            
    }

</script>