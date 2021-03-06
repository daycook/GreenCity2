<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<!DOCTYPE html>
<main>
	<div class="container-fluid px-4">
	    <h1 class="mt-4">${menu.menuNm}</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active"><i class="fas fa-home"></i> ${sideMenu.menuNm} > ${menu.menuNm}</li>
        </ol>
		<div class="card mb-4">
			<div class="card-body">
				<form id=searchForm onsubmit="return false">
					<div class="clearfix" style="background-color: #e1e1ea; padding-right: 10px;">	
						<div class="form-group" style="margin-top:25px;">
							&nbsp;&nbsp;
							<label>
								<label>검색구분</label>&nbsp;
								<label>
									<select id="searchStatistics" name="searchStatistics" class="form-control" style="width:80px;">						
										<option value="1">시평균</option>
										<option value="2">일평균</option>
										<option value="3">월평균</option>
									</select>
								</label>
							</label>
							&nbsp;&nbsp;
							<label>
								<label>관측기간</label>&nbsp;
								<label>
									<input type='text' id='fDate' name='fDate' class="datepicker form-control" onchange="fn_alert()" style="width:120px;" readonly>
								</label>
									&nbsp;~&nbsp;
								<label>
									<input type='text' id='lDate' name='lDate' class="datepicker form-control" onchange="fn_alert()" style="width:120px;" readonly>
								</label>
							</label>
							&nbsp;&nbsp;
							<label style="margin-top:5px;">
							&nbsp;&nbsp;&nbsp;항목변경&nbsp;&nbsp;
							<label style="width:100px;"><input type="radio" id="el" name="graph" value="el" checked="checked">수위EL</label>
							<label style="width:100px;"><input type="radio" id="ec" name="graph" value="ec">전기전도도</label>
							<label style="width:100px;"><input type="radio" id="temp" name="graph" value="temp">온도</label>
							<label style="width:100px;"><input type="radio" id="gl" name="graph" value="gl">수위GL</label>
							<label style="width:100px;"><input type="radio" id="pressr" name="graph" value="pressr">압력</label>
							<!-- <label style="width:100px;"><input type="radio" id="baro" name="graph" value="baro">Barometa</label> -->
							<label style="width:100px;"><input type="radio" id="batt" name="graph" value="batt">배터리</label>
							<label style="width:100px;"><input type="radio" id="no3" name="graph" value="no3">NO3</label>
							<label style="width:100px;"><input type="radio" id="nh4" name="graph" value="nh4">NH4</label>
							<label style="width:100px;"><input type="radio" id="ph" name="graph" value="ph">PH</label>
							<label style="width:100px;"><input type="radio" id="nh3" name="graph" value="nh3">NH3</label>
							<!-- <label style="width:100px; display: none;"><input type="radio" id="cl" name="graph" value="cl">CL</label> -->
							<label style="width:100px;"><input type="radio" id="wBaro" name="graph" value="wBaro">대기압</label>
							<!-- <label style="width:100px;"><input type="radio" id="rainfall" name="graph" value="rainfall">RAINFALL</label> -->
							</label>
							
							<input type="hidden" id="siteSensorKey1" name="siteSensorKey">
							<input type="hidden" id="siteSensorKey2" name="siteSensorKey">
							<input type="hidden" id="siteSensorKey3" name="siteSensorKey">
							<input type="hidden" id="siteSensorKey4" name="siteSensorKey">
							
						</div>
					</div>
					
					<div class="clearfix" style="background-color: #e1e1ea; padding-right: 10px; margin-top:11px; height:50px;">
						<div id='graphElement' class="form-group" style="margin-top:8px;">
							<label>&nbsp;&nbsp;
								<label>관측소명</label>&nbsp;
								<label>
									<select id="searchObsvname1" name="searchObsvname1" class="form-control" style="width:120px;" onchange="fn_Sensorname(1)">
		
									</select>
								</label>
							</label>
							<label>
								<span>
									<select id="searchSsname1" name="searchSsname1" class="form-control" style="width:90px;">
		
									</select>
								</span>
							</label>
							&nbsp;&nbsp;
							<label>
								<label>관측소명</label>&nbsp;
								<label>
									<select id="searchObsvname2" name="searchObsvname2" class="form-control" style="width:120px;" onchange="fn_Sensorname(2)">
		
									</select>
								</label>
							</label>
							<label>
								<span>
									<select id="searchSsname2" name="searchSsname2" class="form-control" style="width:90px;">
		
									</select>
								</span>
							</label>
							&nbsp;&nbsp;
							<label>
								<label>관측소명</label>&nbsp;
								<label>
									<select id="searchObsvname3" name="searchObsvname3" class="form-control" style="width:120px;" onchange="fn_Sensorname(3)">
		
									</select>
								</label>
							</label>
							<label>
								<span>
									<select id="searchSsname3" name="searchSsname3" class="form-control" style="width:90px;">
		
									</select>
								</span>
							</label>
							&nbsp;&nbsp;
							<label>
								<label>관측소명</label>&nbsp;
								<label>
									<select id="searchObsvname4" name="searchObsvname4" class="form-control" style="width:120px;" onchange="fn_Sensorname(4)">
		
									</select>
								</label>
							</label>
							<label>
								<span>
									<select id="searchSsname4" name="searchSsname4" class="form-control" style="width:90px;">
		
									</select>
								</span>
							</label>
							&ensp;&ensp;
							<input type="button" class="btn btn-outline-blue" onclick="drawScales()" value="검색">
						</div>
					</div>
				</form>
				<div id="chart_div1">
				</div>
				<div id="chart_div2">
				</div>
				<div id="chart_div3">
				</div>
				<div id="chart_div4">
				</div>
				
				<div id="insertBtn" style="float:right; margin-top:-74px;">
			
				</div>
				<div>
					${bod.bodFooter}
				</div>
			</div>
		</div>
	</div>
</main>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
$(document).ready(function() {
	fn_Obsvname();
	fn_Date();
});

//Date 디폴트값 설정 함수
function fn_Date(){
	var d = new Date();
	var s = leadingZeros(d.getFullYear(), 4) + '-' + leadingZeros(d.getMonth() + 1, 2) + '-' + leadingZeros(d.getDate(), 2);
	$("#lDate").val(s);
	
	var monthOfYear = d.getMonth();
	d.setMonth(monthOfYear - 1);
	var f = leadingZeros(d.getFullYear(), 4) + '-' + leadingZeros(d.getMonth() + 1, 2) + '-' + leadingZeros(d.getDate(), 2);
	$("#fDate").val(f);
}

function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}


//Date 범위 잘못 선택 시 경고창 띄우는 함수
function fn_alert(){
	var fDate = $("#fDate").val(); 
	var lDate = $("#lDate").val();

	if(fDate > lDate){
		alert("날짜 범위가 잘못되었습니다.");
	}
}

//관측소명 불러오기
function fn_Obsvname(){
	
	$('#searchObsvname1').empty();
	$('#searchObsvname2').empty();
	$('#searchObsvname3').empty();
	$('#searchObsvname4').empty();
	
	$.ajax({
		url : "<c:url value='/front/statistics/selectObsvname.json'/>",
		type : "POST",
		dataType : "json",
		success : function(data){
			var ob = data.resultlist;
			var obl = ob.length;
			var html = '<option value="선택">선택</option>';
			
			for(var i=0; i<obl; i++){
				html += '<option value="';
				html += ob[i].siteId;
				html += '" id = "obsvname' + (i+1);
				html += '" name = "obsvname' + (i+1);
				html += '">' + ob[i].siteName + '</option>';
			}
			
			$('#searchObsvname1').append(html);
			$('#searchObsvname2').append(html);
			$('#searchObsvname3').append(html);
			$('#searchObsvname4').append(html);
			
			$('#searchObsvname1 option:eq(1)').attr("selected", "selected");
			$('#searchObsvname2 option:eq(2)').attr("selected", "selected");
			$('#searchObsvname3 option:eq(3)').attr("selected", "selected");
			$('#searchObsvname4 option:eq(4)').attr("selected", "selected");
			
			fn_Sensorname(1);
			fn_Sensorname(2);
			fn_Sensorname(3);
			fn_Sensorname(4);
		}
	})
	
}


//관측소 별 센서목록 불러오기
function fn_Sensorname(sn){
	
	var searchObsvname = $("#searchObsvname"+sn).val();
	$('#searchSsname'+sn).empty();
	$.ajax({
		url : "<c:url value='/front/statistics/selectSensorList.json'/>",
		type : "POST",
		data : {"searchObsvname":searchObsvname},
		dataType : "json",
		success : function(data){
			var ss = data.resultlist;
			var ssl = ss.length;
			var html = '';
			
			for(var i=0; i<ssl; i++){
				html += '<option value="';
				html += ss[i].sensorNm;
				html += '" id = "sensorname' + '(' + sn + ')' + (i+1);
				html += '" name = "sensorname' + '(' + sn + ')' + (i+1);
				html += '">' + ss[i].sensorNm + '</option>';
			}
			
			$('#searchSsname'+sn).append(html);

			}
	})
}


google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawLogScales1);
google.charts.setOnLoadCallback(drawLogScales2);
google.charts.setOnLoadCallback(drawLogScales3);
google.charts.setOnLoadCallback(drawLogScales4);


//라인차트 그리는 함수
function drawScales(){
	
	$(".loading").show();
	
	for(var j=1; j<5; j++){
		$("#siteSensorKey"+j).val($("#searchObsvname"+j).val()+","+$("#searchSsname"+j).val());
	}
	
	var formData = $("#searchForm").serialize();
	
	$("#chart_div1").empty();
	$("#chart_div2").empty();
	$("#chart_div3").empty();
	$("#chart_div4").empty();
	
	var radioVal = $('input:radio[name=graph]:checked').val();
	
	$.ajax({
		url : "<c:url value='/front/statistics/selectGraphList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var cl = result.resultlist;
			var cll = cl.length;
		
		    var searchObsvname = null;
		    var m = null;
		    var t = null;
		    
			var measure = [
				{val:"el", ms:"m", text:"수위EL"},{val:"ec", ms:"μS/㎝", text:"전기전도도"},{val:"temp", ms:"°C", text:"온도"},{val:"gl", ms:"m", text:"수위GL"},
				{val:"pressr", ms:"m", text:"압력"},{val:"baro", ms:"mbar", text:"Barometa"},{val:"batt", ms:"V",  text:"배터리"},
				{val:"no3", ms:"mg/L", text:"NO3"},{val:"nh4", ms:"mg/L", text:"NH4"},{val:"ph", ms:"pH", text:"PH"},{val:"nh3", ms:"mg/L", text:"NH3"},
				{val:"cl", ms:"mg/L", text:"CL"},{val:"wBaro", ms:"-", text:"대기압"},{val:"rainfall", ms:"-", text:"RAINFALL"}
			];
			for(i=0;i<14;i++){
				if(measure[i].val==radioVal){
					m = measure[i].ms;
					t = measure[i].text;
					}
			}
		    
		    for(var k=1; k<5; k++){
		    	searchObsvname = $('#searchObsvname'+k).val();

		    	var data = new google.visualization.DataTable();
			    data.addColumn('date', 'Date');
			    data.addColumn('number', radioVal);
		        data.addColumn({type: 'string', role: 'tooltip'});
		    	
		    	var arr = new Array();
		    	var num = 0;
		    	
			    for(var i=0; i<cll; i++) {
			    	if(cl[i].siteId == searchObsvname){
			    		if(radioVal=='el'){
				    		arr[num] = [new Date(cl[i].time), cl[i].el, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nEL:'+cl[i].el];
				    	}
			    		else if(radioVal=='ec'){
				    		arr[num] = [new Date(cl[i].time), cl[i].ec, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nEC:'+cl[i].ec];
				    	}
				    	else if(radioVal=='temp'){
				    		arr[num] = [new Date(cl[i].time), cl[i].temp, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nTemp:'+cl[i].temp];
				    	}
				    	else if(radioVal=='gl'){
				    		arr[num] = [new Date(cl[i].time), cl[i].gl, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nGL:'+cl[i].gl];
				    	}
				    	else if(radioVal=='pressr'){
				    		arr[num] = [new Date(cl[i].time), cl[i].pressr, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nPressure:'+cl[i].pressr];
				    	}
				    	else if(radioVal=='baro'){
				    		arr[num] = [new Date(cl[i].time), cl[i].baro, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nBarometa:'+cl[i].baro];
				    	}
				    	else if(radioVal=='batt'){
				    		arr[num] = [new Date(cl[i].time), cl[i].batt, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nBattery:'+cl[i].batt];
				    	}
				    	else if(radioVal=='no3'){
				    		arr[num] = [new Date(cl[i].time), cl[i].no3, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nNO3:'+cl[i].no3];
				    	}
				    	else if(radioVal=='nh4'){
				    		arr[num] = [new Date(cl[i].time), cl[i].nh4, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nNH4:'+cl[i].nh4];
				    	}
				    	else if(radioVal=='ph'){
				    		arr[num] = [new Date(cl[i].time), cl[i].ph, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nPH:'+cl[i].ph];
				    	}
				    	else if(radioVal=='nh3'){
				    		arr[num] = [new Date(cl[i].time), cl[i].nh3, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nNH3:'+cl[i].nh3];
				    	}
				    	else if(radioVal=='cl'){
				    		arr[num] = [new Date(cl[i].time), cl[i].cl, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nCL:'+cl[i].cl];
				    	}
				    	else if(radioVal=='wBaro'){
				    		arr[num] = [new Date(cl[i].time), cl[i].wBaro, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nW_BARO:'+cl[i].wBaro];
				    	}
				    	else if(radioVal=='rainfall'){
				    		arr[num] = [new Date(cl[i].time), cl[i].rainfall, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nRainfall:'+cl[i].rainfall];
				    	}
				    	num = num+1;
			    	}
			    }
			    data.addRows(arr);
				if($("#searchStatistics").val() == "1"){
					var options = {
							title: $("#searchObsvname"+k+" option:selected").text()+'('+t+', '+m+')',
					        hAxis: {
					          title: 'Date',
					          format: 'YYYY-MM-dd hh'
					        },
					        vAxis: {
					          title: radioVal
					        },
					        explorer: {   //확대 : 마우스 스크롤 이용
					              axis: 'horizontal',
					              keepInBounds: true,
					              maxZoomIn: 12.0,
					              maxZoomOut: 1},
					        colors: ['#3d59b3']
					    };
				}else if($("#searchStatistics").val() == "2"){
					var options = {
							title: $("#searchObsvname"+k+" option:selected").text()+'('+t+', '+m+')',
					        hAxis: {
					          title: 'Date',
					          format: 'YYYY-MM-dd',
					          minorGridlines: {count: 0}
					        },
					        vAxis: {
					          title: radioVal
					        },
					        explorer: { 
					              axis: 'horizontal',
					              keepInBounds: true,
					              maxZoomIn: 8.0,
					              maxZoomOut: 1},
					        colors: ['#3d59b3']
					    };
				}else if($("#searchStatistics").val() == "3"){
					var options = {
							title: $("#searchObsvname"+k+" option:selected").text()+'('+t+', '+m+')',
					        hAxis: {
					          title: 'Date',
					          format: 'YYYY-MM',
					          minorGridlines: {count: 0}
					        },
					        vAxis: {
					          title: radioVal
					        },
					        explorer: { 
					              axis: 'horizontal',
					              keepInBounds: true,
					              maxZoomIn: 4.0,
					              maxZoomOut: 1},
					        colors: ['#3d59b3']
					    };
				}
			
			    var chart = new google.visualization.LineChart(document.getElementById('chart_div'+k));
			    chart.draw(data, options);
		    }
		    $(".loading").hide();
		}
	})
}

</script>