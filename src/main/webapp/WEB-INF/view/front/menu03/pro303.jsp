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
        		<div class="clearfix" style="background-color: #e1e1ea; padding-right: 10px;">
        			<form id=searchForm onsubmit="return false" style="float:right; margin-top:25px;">
        				<div class="form-group">
        					<table id="searchTable">
        						<tr>
        							<td><label>검색구분</label>&nbsp;&nbsp;</td>
        							<td>
        								<select id="searchStatistics" name="searchStatistics" class="form-control">						
											<option value="1">시평균</option>
											<option value="2">일평균</option>
											<option value="3">월평균</option>
										</select>
        							</td>
        							<td><label>&ensp;&ensp;관측기간</label>&nbsp;&nbsp;</td>
        							<td>
        								<input type='text' id='fDate' name='fDate' class="datepicker form-control" onchange="fn_alert()" style="width:120px;" readonly>
        							</td>
        							<td><label>&nbsp;~&nbsp;</label></td>
        							<td>
        								<input type='text' id='lDate' name='lDate' class="datepicker form-control" onchange="fn_alert()" style="width:120px;" readonly>
        							</td>
        							
        							<td><label>&ensp;&ensp;관측소명</label>&nbsp;&nbsp;</td>
        							<td>
        								<select id="searchObsvname" name="searchObsvname" class="form-control" style="width:150px" onchange="fn_Sensorname()">
			
										</select>
        							</td>
        							<td>
        								<select id="searchSsname" name="searchSsname" class="form-control"  style="width:90px">
			
										</select>
        							</td>
        							<td>&ensp;&ensp;
        								<input type="button" value="검색" class="btn btn-outline-blue" type="button" onclick="fn_drawScales()">
        							</td>
        						</tr>
        					</table>
						</div>
						<input type="hidden" id="siteSensorKey1" name="siteSensorKey">
						<input type="hidden" id="siteSensorKey2" name="siteSensorKey">
        			</form>
        		</div>
				<div id='graphElement' style='display:block; height:50px; background: #efefef;'>
					<label style="margin-top:10px;">
						&ensp;&ensp;
						<label>항목 변경</label>
						&ensp;&ensp;
						<label style="width:100px;"><input type="checkbox" id="el" name="graph" value="el" checked>수위EL</label>
						<label style="width:100px;"><input type="checkbox" id="ec" name="graph" value="ec" checked>전기전도도</label>
						<label style="width:100px;"><input type="checkbox" id="temp" name="graph" value="temp" checked>온도</label>
						<label style="width:100px;"><input type="checkbox" id="gl" name="graph" value="gl">수위GL</label>
						<label style="width:100px;"><input type="checkbox" id="pressr" name="graph" value="pressr">압력</label>
						<!-- <label style="width:100px;"><input type="checkbox" id="baro" name="graph" value="baro"></label> -->
						<label style="width:100px;"><input type="checkbox" id="batt" name="graph" value="batt">배터리</label>
						<label style="width:100px;"><input type="checkbox" id="no3" name="graph" value="no3">NO3</label>
						<label style="width:100px;"><input type="checkbox" id="nh4" name="graph" value="nh4">NH4</label>
						<label style="width:100px;"><input type="checkbox" id="ph" name="graph" value="ph">PH</label>
						<label style="width:100px;"><input type="checkbox" id="nh3" name="graph" value="nh3">NH3</label>
						<!-- <label style="width:100px; display: none;"><input type="checkbox" id="cl" name="graph" value="cl">CL</label> -->
						<label style="width:100px;"><input type="checkbox" id="wBaro" name="graph" value="wBaro">대기압</label>
						<!-- <label style="width:100px;"><input type="checkbox" id="rainfall" name="graph" value="rainfall">Rainfall</label> -->
					</label>
				</div>
				<div id="chart_div1"> 
				</div>
				<div id="chart_div2">
				</div>
				<div id="chart_div3">
				</div>
				<div id="chart_div4">
				</div>
				<div id="chart_div5">
				</div>
				<div id="chart_div6">        
				</div>
				<div id="chart_div7">        
				</div>
				<div id="chart_div8"> 
				</div>
				<div id="chart_div9">
				</div>
				<div id="chart_div10">
				</div>
				<div id="chart_div11">
				</div>
				<div id="chart_div12">
				</div>
				<div id="chart_div13">        
				</div>
				<div id="chart_div14">        
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
	$("#el").change(function(){fn_drawScales()});
	$("#ec").change(function(){fn_drawScales()});
	$("#temp").change(function(){fn_drawScales()});
	$("#gl").change(function(){fn_drawScales()});
	$("#pressr").change(function(){fn_drawScales()});
	$("#baro").change(function(){fn_drawScales()});
	$("#batt").change(function(){fn_drawScales()});
	$("#no3").change(function(){fn_drawScales()});
	$("#nh4").change(function(){fn_drawScales()});
	$("#ph").change(function(){fn_drawScales()});
	$("#nh3").change(function(){fn_drawScales()});
	$("#cl").change(function(){fn_drawScales()});
	$("#wBaro").change(function(){fn_drawScales()});
	$("#rainfall").change(function(){fn_drawScales()});
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
	
	$('#searchObsvname').empty();
	$.ajax({
		url : "<c:url value='/front/statistics/selectObsvname.json'/>",
		type : "POST",
		dataType : "json",
		success : function(data){
			var ob = data.resultlist;
			var obl = ob.length;
			var html = "";
			
			for(var i=0; i<obl; i++){
				html += '<option value="';
				html += ob[i].siteId;
				html += '" id = "obsvname' + (i+1);
				html += '" name = "obsvname' + (i+1);
				html += '">' + ob[i].siteName + '</option>';
			}
			
			$('#searchObsvname').append(html);
			fn_Sensorname();
		}
	})

}


//관측소 별 센서목록 불러오기
function fn_Sensorname(){
	
	var searchObsvname = $("#searchObsvname").val();
	$('#searchSsname').empty();
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
				html += '" id = "sensorname' + (i+1);
				html += '" name = "sensorname' + (i+1);
				html += '">' + ss[i].sensorNm + '</option>';
			}
			
			$('#searchSsname').append(html);

			}
	})
}


google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawLogScales1);
google.charts.setOnLoadCallback(drawLogScales2);
google.charts.setOnLoadCallback(drawLogScales3);
google.charts.setOnLoadCallback(drawLogScales4);
google.charts.setOnLoadCallback(drawLogScales5);
google.charts.setOnLoadCallback(drawLogScales6);
google.charts.setOnLoadCallback(drawLogScales7);
google.charts.setOnLoadCallback(drawLogScales8);
google.charts.setOnLoadCallback(drawLogScales9);
google.charts.setOnLoadCallback(drawLogScales10);
google.charts.setOnLoadCallback(drawLogScales11);
google.charts.setOnLoadCallback(drawLogScales12);
google.charts.setOnLoadCallback(drawLogScales13);
google.charts.setOnLoadCallback(drawLogScales14);


//라인차트 그리는 함수
function fn_drawScales() {
	$(".loading").show();

	$("#siteSensorKey1").val($("#searchObsvname").val()+","+$("#searchSsname").val());
	$("#siteSensorKey2").val('faultValue');
	
	$("#chart_div1").empty();
	$("#chart_div2").empty();
	$("#chart_div3").empty();
	$("#chart_div4").empty();
	$("#chart_div5").empty();
	$("#chart_div6").empty();
	$("#chart_div7").empty();
	$("#chart_div8").empty();
	$("#chart_div9").empty();
	$("#chart_div10").empty();
	$("#chart_div11").empty();
	$("#chart_div12").empty();
	$("#chart_div13").empty();
	$("#chart_div14").empty();
	
	var formData = $("#searchForm").serialize();
	var arrayParam = new Array();
	$("input:checkbox[name=graph]:checked").each(function(){
		arrayParam.push(this.value);
	});
	
	$.ajax({
		url : "<c:url value='/front/statistics/selectGraphList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(result){
			var cl = result.resultlist;
			var cll = cl.length;
			
		    var m = null;
		    var t = null;
			
			for(var k=0; k<14; k++){
				if(arrayParam[k].length != null){
					var second = arrayParam[k];
					
					var measure = [
						{val:"el", ms:"m", text:"수위EL"},{val:"ec", ms:"μS/㎝", text:"전기전도도"},{val:"temp", ms:"°C", text:"온도"},{val:"gl", ms:"m", text:"수위GL"},
						{val:"pressr", ms:"m", text:"압력"},{val:"baro", ms:"mbar", text:"Barometa"},{val:"batt", ms:"V",  text:"배터리"},
						{val:"no3", ms:"mg/L", text:"NO3"},{val:"nh4", ms:"mg/L", text:"NH4"},{val:"ph", ms:"pH", text:"PH"},{val:"nh3", ms:"mg/L", text:"NH3"},
						{val:"cl", ms:"mg/L", text:"CL"},{val:"wBaro", ms:"-", text:"대기압"},{val:"rainfall", ms:"-", text:"RAINFALL"}
					];
					
					for(var l=0; l<14; l++){
						if(measure[l].val == second){
							m = measure[l].ms;
							t = measure[l].text;
						}
					}
					
				    var data = new google.visualization.DataTable();
				    data.addColumn('date', 'Date');
				    data.addColumn('number', second);
				    data.addColumn({type: 'string', role: 'tooltip'});
				
				    var arr = new Array();
				    var num = 0;
				    
				    for(var i=0; i<cll; i++) {
				    	if(second=='el'){
				    		arr[num] = [new Date(cl[i].time), cl[i].el, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nEL:'+cl[i].el];
				    	}
				    	else if(second=='ec'){
				    		arr[num] = [new Date(cl[i].time), cl[i].ec, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nEC:'+cl[i].ec];
				    	}
				    	else if(second=='temp'){
				    		arr[num] = [new Date(cl[i].time), cl[i].temp, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nTemp:'+cl[i].temp];
				    	}
				    	else if(second=='gl'){
				    		arr[num] = [new Date(cl[i].time), cl[i].gl, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nGL:'+cl[i].gl];
				    	}
				    	else if(second=='pressr'){
				    		arr[num] = [new Date(cl[i].time), cl[i].pressr, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nPressure:'+cl[i].pressr];
				    	}
				    	else if(second=='baro'){
				    		arr[num] = [new Date(cl[i].time), cl[i].baro, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nBarometa:'+cl[i].baro];
				    	}
				    	else if(second=='batt'){
				    		arr[num] = [new Date(cl[i].time), cl[i].batt, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nBattery:'+cl[i].batt];
				    	}
				    	else if(second=='no3'){
				    		arr[num] = [new Date(cl[i].time), cl[i].no3, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nNO3:'+cl[i].no3];
				    	}
				    	else if(second=='nh4'){
				    		arr[num] = [new Date(cl[i].time), cl[i].nh4, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nNH4:'+cl[i].nh4];
				    	}
				    	else if(second=='ph'){
				    		arr[num] = [new Date(cl[i].time), cl[i].ph, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nPH:'+cl[i].ph];
				    	}
				    	else if(second=='nh3'){
				    		arr[num] = [new Date(cl[i].time), cl[i].nh3, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nNH3:'+cl[i].nh3];
				    	}
				    	else if(second=='cl'){
				    		arr[num] = [new Date(cl[i].time), cl[i].cl, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nCL:'+cl[i].cl];
				    	}
				    	else if(second=='wBaro'){
				    		arr[num] = [new Date(cl[i].time), cl[i].wBaro, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nW_BARO:'+cl[i].wBaro];
				    	}
				    	else if(second=='rainfall'){
				    		arr[num] = [new Date(cl[i].time), cl[i].rainfall, cl[i].time.substring(0,10)+' '+cl[i].time.substring(11,13)+'\nRainfall:'+cl[i].rainfall];
				    	}
				    	num = num + 1;
				    }
				    
				    data.addRows(arr);
				    
				    if($("#searchStatistics").val() == "1"){
						var options = {
								title: $("#searchObsvname option:selected").text()+'('+t+', '+m+')',
						        hAxis: {
						          title: 'Date',
						          format: 'YYYY-MM-dd hh'
						        },
						        vAxis: {
						          title: second
						        },
						        explorer: { 
						              actions: ['dragToZoom', 'rightClickToReset'],    //확대 : 마우스로 범위 선택
						              axis: 'horizontal',
						              keepInBounds: true,
						              maxZoomIn: 12.0},
						        colors: ['#3d59b3']
						    };
					}else if($("#searchStatistics").val() == "2"){
						var options = {
								title: $("#searchObsvname option:selected").text()+'('+t+', '+m+')',
						        hAxis: {
						          title: 'Date',
						          format: 'YYYY-MM-dd',
						          minorGridlines: {count: 0}
						        },
						        vAxis: {
						          title: second
						        },
						        explorer: { 
						              actions: ['dragToZoom', 'rightClickToReset'],
						              axis: 'horizontal',
						              keepInBounds: true,
						              maxZoomIn: 8.0},
						        colors: ['#3d59b3']
						    };
					}else if($("#searchStatistics").val() == "3"){
						var options = {
								title: $("#searchObsvname option:selected").text()+'('+t+', '+m+')',
						        hAxis: {
						          title: 'Date',
						          format: 'YYYY-MM',
						          minorGridlines: {count: 0}
						        },
						        vAxis: {
						          title: second
						        },
						        explorer: { 
						              actions: ['dragToZoom', 'rightClickToReset'],
						              axis: 'horizontal',
						              keepInBounds: true,
						              maxZoomIn: 4.0},
						        colors: ['#3d59b3']
						    };
					}
				
				    var chart = new google.visualization.LineChart(document.getElementById('chart_div'+(k+1)));
				    chart.draw(data, options);
				    $(".loading").hide();
				}
			}
			
		}
		
	})
}

</script>