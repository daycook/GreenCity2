<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf"%>
<!DOCTYPE html>

<main>
     <div class="container-fluid px-4">
         <h1 class="mt-4">${menu.menuNm}</h1>
         <ol class="breadcrumb mb-4">
             <li class="breadcrumb-item active"><i class="fas fa-home"></i> ${sideMenu.menuNm} > ${menu.menuNm}</li>
         </ol>
         <div class="card mb-4">
             <div class="card-body">
             	<form id="updateForm" onsubmit="return false">
             		<div class="clearfix" style="background-color: #e1e1ea; padding-right: 10px;">	
						<div class="form-group" style="margin-top:25px;">
							&nbsp;
							<label>관측소명</label>
							<label>
								<select id="searchObsvname" name="searchObsvname" class="form-control" style="width:130px;" onchange="fn_Sensorname()">

								</select>
							</label>
							&nbsp;
							<label>센서</label>
							<label for="searchTxt">
								<select id="searchSsname" name="searchSsname" class="form-control" style="width:90px;;">

								</select>
							</label>
							&nbsp;
							<label>관측기간</label>
							<label><input type='text' id='fDate' name='fDate' class="datepicker form-control" onchange="fn_alert()" style="width:110px;" readonly></label>
							<!-- <label>
								<select id='fTime' name='fTime' class="form-control" onchange="fn_alert()" style="width:80px;">
								</select>
							</label> -->
							~
							<input type='hidden' id='first' name='first'>
							<label><input type='text' id='lDate' name='lDate' class="datepicker form-control" onchange="fn_alert()" style="width:110px;" readonly></label>
							<!-- <label>
								<select id='lTime' name='lTime' class="form-control" onchange="fn_alert()" style="width:80px;">
								</select>
							</label> -->
							<input type='hidden' id='last' name='last'>
							&nbsp;&nbsp;
							<label>
								<input class="btn btn-outline-blue" type="button" value="검색" onclick="fn_selectList()">
							</label>
						</div>
					</div>
					<br>
                	<div class="" style="overflow: auto; height: 500px;">         
						<table class="baseTable dataTable" id="Datatable" style="width: 2000px">
							<colgroup>
								<col width="2%"/>
								<col width="8%"/>
								<col width="4%"/>
								<col width="4%"/>
								<col width="4%"/>
								<!-- <col width="4%"/> -->
								<col width="4%"/>
								<col width="4%"/>
								<col width="4%"/>
								<col width="4%"/>
								<col width="4%"/>
								<col width="4%"/>
								<col width="4%"/>
								<!-- <col width="4%"/> -->
								<col width="4%"/>
								<!-- <col width="4%"/> -->
								<col width="8%"/>
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="wholeCheck" name="wholeCheck"></th>
									<th>날짜</th>
									<th>수위EL</th>
									<th>수위GL</th>
									<th>압력</th>
									<th>온도</th>
									<th>전기전도도</th>
									<!-- <th>Barometa</th> -->
									<th>배터리</th>
									<th>NO3</th>
									<th>NH4</th>
									<th>PH</th>
									<th>NH3</th>
									<!-- <th>CL</th> -->
									<th>대기압</th>
									<!-- <th>Rainfall</th> -->
									<th>기능</th>
								</tr>	
							</thead>
							<tbody id="tablebody" style="text-align: center;">
								
							</tbody>
						</table>
					</div>
					<br>
					<div>
						<label style="width:60%;">일괄입력	
							<label>
								<select id="element" name="element" class="form-control" style="width:115px;">
									<option value="EL">수위EL</option>
									<option value="GL">수위GL</option>
									<option value="Pressure">압력</option>
									<option value="Temp">온도</option>
									<option value="EC">전기전도도</option>
									<!-- <option value="Barometa">Barometa</option> -->
									<option value="Battery">배터리</option>
									<option value="NO3">NO3</option>
									<option value="NH4">NH4</option>
									<option value="PH">PH</option>
									<option value="NH3">NH3</option>
									<!-- <option>CL</option> -->
									<option value="W_BARO">대기압</option>
									<!-- <option value="Rainfall">Rainfall</option> -->
								</select>
							</label>
							<label>
								<input id="elementValue" name="elementValue" type="text" style="width:120px;">
							</label>
							&nbsp;<input type="button" class="btn btn-outline-blue" value="일괄입력" onclick="fn_groupUpdate()">
						</label>
						<label style="float:right;">
							<input type="button" class="btn btn-outline-blue" value="일괄초기화" onclick="fn_groupReset()">
							<input type="button" class="btn btn-outline-blue" value="일괄삭제" onclick="fn_groupDetele()">
						</label>
					</div>
					<div>
						${bod.bodFooter}
					</div>
				</form>
             </div>
         </div>
     </div>
 </main>
<script>
$(document).ready(function() {
	fn_Date();
	fn_Obsvname();

	$("#wholeCheck").change(function(){
		if($("#wholeCheck").is(":checked")){
			$("input[name=check]").prop("checked", true);
		}
		else{
			$("input[name=check]").prop("checked", false);
		}
	})
	
	//fn_setTimeList("fTime", "lTime");
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
	var fTime = $("#fTime").val().substring(0,2); 
	var lTime = $("#lTime").val().substring(0,2);
	
	if(fDate > lDate){
		alert("날짜 범위가 잘못되었습니다.");
	}
	if((fDate == lDate) && (fTime > lTime)){
		alert("시간 범위가 잘못되었습니다.");
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


//관측소 별 센서버튼 불러오기
function fn_Sensorname(){
	
	$('#searchSsname').empty();
	var searchObsvname = $("#searchObsvname").val();
	
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


//form 조건에 맞는 selectlist 불러오기
function fn_selectList(){
	
	$(".loading").show();
	$("#first").val($("#fDate").val()+$("#fTime").val());
	$("#last").val($("#lDate").val()+$("#lTime").val());
	var first = $("#first").val();
	var last = $("#last").val();
	
	var searchSsname = $("#searchSsname").val();
	var searchObsvname = $("#searchObsvname").val();
	
	$.ajax({
		url : "<c:url value='/front/statistics/selectUpdateList.json'/>",
		type : "POST",
		data : {"searchSsname":searchSsname, "searchObsvname":searchObsvname, "first":first, "last":last},
		dataType : "json",
		success : function(result){
			var html = "";
			
			var list = result.resultlist;
			var leng = list.length;
			
			for(var i=0; i<leng; i++){
				
				
				var data = list[i]
				
				if(data.dataChgType=='CHG'){
					html += "<tr id='tr"+data.dataId+"' style='background: #d1d6e6;'>";
				}
				else{
					html += "<tr id='tr"+data.dataId+"'>";
				}
				html += "<td><input type='checkbox' id="+data.dataId+" name='check' value='"+data.dataId+"'></td>";
				html += "<td id='time"+data.dataId+"' name='time"+(i+1)+"'>"+data.time+"</td>";
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.el)+"' id='el"+data.dataId+"' name='el"+(i+1)+"'></td>";
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.gl)+"' id='gl"+data.dataId+"' name='gl"+(i+1)+"'></td>";
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.pressr)+"' id='pressr"+data.dataId+"' name='pressr"+(i+1)+"'></td>";
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.temp)+"' id='temp"+data.dataId+"' name='temp"+(i+1)+"'></td>";
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.ec)+"' id='ec"+data.dataId+"' name='ec"+(i+1)+"'></td>";
				/* html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.baro)+"' id='baro"+data.dataId+"' name='baro"+(i+1)+"'></td>"; */
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.batt)+"' id='batt"+data.dataId+"' name='batt"+(i+1)+"'></td>";
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.no3)+"' id='no3"+data.dataId+"' name='no3"+(i+1)+"'></td>";				
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.nh4)+"' id='nh4"+data.dataId+"' name='nh4"+(i+1)+"'></td>";
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.ph)+"' id='ph"+data.dataId+"' name='ph"+(i+1)+"'></td>";
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.nh3)+"' id='nh3"+data.dataId+"' name='nh3"+(i+1)+"'></td>";
				/* html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.cl)+"' id='cl"+data.dataId+"' name='cl"+(i+1)+"'></td>"; */
				html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.wBaro)+"' id='wBaro"+data.dataId+"' name='wBaro"+(i+1)+"'></td>";
				/* html += "<td><input type='text' style='width:70px;' onkeyup='return delHangle(event)' onkeypress='return isNumberKey(event)' value='"+udchk(data.rainfall)+"' id='rainfall"+data.dataId+"' name='rainfall"+(i+1)+"'></td>"; */
				html += "<td><input type='button' onclick='fn_org("+data.dataId+")' value='초기화'>";
				html += "&nbsp;<input type='button' onclick='fn_update("+data.dataId+")' value='수정'>";
				html += "&nbsp;<input type='button' onclick='fn_delete("+data.dataId+")' value='삭제'></td>";
				html += "</tr>";
			}
			$("#tablebody").empty(html);
			$("#tablebody").append(html);
			
			$(".loading").hide();
		}
	});
}

//데이터 초기화
function fn_org(sn){
	if(confirm("초기화하시겠습니까?")){
		fn_realOrg(sn);
	}
	else{
		return;
	}
}

function fn_realOrg(sn){
	$.ajax({
		url : "<c:url value='/front/statistics/resetList.json'/>",
		type : "POST",
		data : {"sn": sn},
		dataType : "json",
		success : function(data){
			if(data.result=="success"){
				alert("초기화되었습니다.");
				fn_selectList();
			}
		}
	})
}


//데이터 수정
function fn_update(sn){
	var el = $("#el"+sn).val();
	var gl = $("#gl"+sn).val();
	var pressr = $("#pressr"+sn).val();
	var temp = $("#temp"+sn).val();
	var ec = $("#ec"+sn).val();
	var baro = $("#baro"+sn).val();
	var batt = $("#batt"+sn).val();
	var no3 = $("#no3"+sn).val();
	var nh4 = $("#nh4"+sn).val();
	var ph = $("#ph"+sn).val();
	var nh3 = $("#nh3"+sn).val();
	var cl = $("#cl"+sn).val();
	var wBaro = $("#wBaro"+sn).val();
	var rainfall = $("#rainfall"+sn).val();
	
	
	var time = $("#time"+sn).text();
	var searchObsvname = $("#searchObsvname").val();
	var searchSsname = $("#searchSsname").val();
	
	
	$.ajax({
		url : "<c:url value='/front/statistics/changeYnList.json'/>",
		type : "POST",
		data : {"time":time, "searchObsvname":searchObsvname, "searchSsname":searchSsname},
		dataType : "json",
		success : function(result){
			var data=result.resultlist;
			// null값이 없어야 동작함(현재 no3, nh4, ph, nh3, cl, rainfall이 null값이므로 해당 if문 동작안함)
			if((el==data[0].el)&&(gl==data[0].gl)&&(pressr==data[0].pressr)&&(temp==data[0].temp)&&(ec==data[0].ec)&&(baro==data[0].baro)&&(batt==data[0].batt)&&
					(no3==data[0].no3)&&(nh4==data[0].nh4)&&(ph==data[0].ph)&&(nh3==data[0].nh3)&&(cl==data[0].cl)&&(wBaro==data[0].wBaro)&&(rainfall==data[0].rainfall)){
				alert("수정사항이 없습니다");
			}
			else{
				if(confirm("수정하시겠습니까?")){
					fn_realUpdate(sn);
				}
				else{
					fn_selectList();
				}
			}
		}
	})
}

function fn_realUpdate(sn){
	var el = $("#el"+sn).val();
	var gl = $("#gl"+sn).val();
	var pressr = $("#pressr"+sn).val();
	var temp = $("#temp"+sn).val();
	var ec = $("#ec"+sn).val();
	var baro = $("#baro"+sn).val();
	var batt = $("#batt"+sn).val();
	var no3 = $("#no3"+sn).val();
	var nh4 = $("#nh4"+sn).val();
	var ph = $("#ph"+sn).val();
	var nh3 = $("#nh3"+sn).val();
	var cl = $("#cl"+sn).val();
	var wBaro = $("#wBaro"+sn).val();
	var rainfall = $("#rainfall"+sn).val();
	
	$.ajax({
		url : "<c:url value='/front/statistics/updateList.json'/>",
		type : "POST",
		data : {"el": el, "gl": gl, "pressr": pressr, "temp": temp, "ec": ec, "baro": baro, "batt": batt, "sn": sn,
				"no3": no3, "nh4": nh4, "ph": ph, "nh3": nh3, "cl": cl, "wBaro": wBaro, "rainfall": rainfall},
		dataType : "json",
		success : function(data){
			if(data.result=="success"){
				alert("수정되었습니다.");
				fn_selectList();
			}
		}
	})
}

	

//데이터삭제
function fn_delete(sn){
	if(confirm("삭제하시겠습니까?")){
		fn_realDelete(sn);
	}
	else{
		return;
	}
}

function fn_realDelete(sn){
	$.ajax({
		url : "<c:url value='/front/statistics/deleteList.json'/>",
		type : "POST",
		data : {"sn": sn},
		dataType : "json",
		success : function(data){
			if(data.result=="success"){
				alert("삭제되었습니다.");
				fn_selectList();
			}
		}
	})
}


//데이터 일괄 삭제
function fn_groupDetele(){
	var arr = [];
	$("input[name=check]:checked").each(function(){
		arr.push(this.id);
	});
	
	var isChk = 0;
	
	if(arr.length){
		isChk = 1;
	}
	
	if(confirm("선택한 사항을 삭제하시겠습니까?")){
		if(isChk == 1){
			fn_realGroupDelete();
		}
		else{
			alert("선택된 데이터가 없습니다.");
		}
	}
	else{
		return;
	}
}

function fn_realGroupDelete(){
	
	var arrayCheck = [];
	$("input[name=check]:checked").each(function(){
		arrayCheck.push(this.id);
	});
	
	$.ajax({
		url : "<c:url value='/front/statistics/groupDeleteList.json'/>",
		type : "POST",
		data : {"arrayCheck" : arrayCheck},
		dataType : "json",
		success : function(data){
			if(data.result=="success"){
				alert("삭제되었습니다.");
				fn_selectList();
			}
		}
	})
}


//데이터 일괄 초기화
function fn_groupReset(){
	var arr = [];
	$("input[name=check]:checked").each(function(){
		arr.push(this.id);
	});
	
	var isChk = 0;
	
	if(arr.length){
		isChk = 1;
	}
	
	if(confirm("선택한 사항을 초기화하시겠습니까?")){
		if(isChk == 1){
			fn_realGroupReset();
		}
		else{
			alert("선택된 데이터가 없습니다.");
		}
	}
	else{
		return;
	}
}

function fn_realGroupReset(){
	
	var arrayCheck = [];
	$("input[name=check]:checked").each(function(){
		arrayCheck.push(this.id);
	});
	
	$.ajax({
		url : "<c:url value='/front/statistics/groupResetList.json'/>",
		type : "POST",
		data : {"arrayCheck" : arrayCheck},
		dataType : "json",
		success : function(data){
			if(data.result=="success"){
				alert("초기화되었습니다.");
				fn_selectList();
			}
		}
	})
}

//데이터 일괄 수정(일괄입력)
function fn_groupUpdate(){
	var arr = [];
	$("input[name=check]:checked").each(function(){
		arr.push(this.id);
	});
	
	var isChk = 0;
	
	if(arr.length){
		isChk = 1;
	}
	
	if(confirm("선택한 사항을 수정하시겠습니까?")){
		if(isChk == 1){
			fn_realGroupUpdate();
		}
		else{
			alert("선택된 데이터가 없습니다.");
		}
	}
	else{
		return;
	}
}

function fn_realGroupUpdate(){

	var arrayCheck = [];
	$("input[name=check]:checked").each(function(){
		arrayCheck.push(this.id);
	});
	var element = $("#element").val();
	var elementValue = $("#elementValue").val();
	
	$.ajax({
		url : "<c:url value='/front/statistics/groupUpdateList.json'/>",
		type : "POST",
		data : {"arrayCheck" : arrayCheck, "element" : element, "elementValue" : elementValue},
		dataType : "json",
		success : function(data){
			if(data.result=="success"){
				alert("수정되었습니다.");
				$("#elementValue").val("");
				$("#element").val("EL").attr("selected", "selected");
				fn_selectList();
			}
		}
	})
}
</script>