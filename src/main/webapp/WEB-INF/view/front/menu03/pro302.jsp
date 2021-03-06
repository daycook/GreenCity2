<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<style>
#tablebody tr{
	cursor: default;
}
</style>
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
						<input type="hidden" id="excelFileName" name="excelFileName">
						<input type="hidden" id="excelFileDownName" name="excelFileDownName" value="관측소별 검색">
						<div class="form-group"  style="float:right;">
							<table id="searchTable">
								<tr>
									<td><label>검색구분</label>&nbsp;&nbsp;</td>
									<td>
										<select id="searchStatistics" name="searchStatistics" class="form-control">
											<!--  <option value="1">원시</option> -->							
											<option value="2">시평균</option>
											<option value="3">일평균</option>
											<option value="4">월평균</option>
										</select>
									</td>
									
									<td><label>&ensp;&ensp;관측기간</label>&nbsp;&nbsp;</td>
									<td>
										<input type='text' id='fDate' name='fDate' class="datepicker form-control" onchange="fn_alert()" style="width:110px;" readonly>
									</td>
									<td>&nbsp;~&nbsp;</td>
									<td>
										<input type='text' id='lDate' name='lDate' class="datepicker form-control" onchange="fn_alert()" style="width:110px;" readonly>
									</td>
									<td><label>&ensp;&ensp;관측소명</label>&nbsp;&nbsp;</td>
									<td>
										<select id="searchObsvname" name="searchObsvname" class="form-control" onchange="fn_Sensorname2();">
			
										</select>
									</td>
									<td>&ensp;&ensp;
										<input type="button" value="검색" class="btn btn-outline-blue" type="button" onclick="fn_select()">
										<input type="button" value="액셀다운로드" class="btn btn-outline-green" type="button" onclick="fn_excel_down()">
									</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<div id='tableTab' class='tab' style='display:block; height:40px; background: #efefef;'>센서
				</div>
				<div id="tbdiv">        
			 		<div>
						총 게시물 : <strong id="paginationTotalCnt"></strong>
					</div>
					<table class="baseTable" summary="번호,제목,작성자,첨부,등록일,조회수 항목입니다." id="datatable">
						<colgroup>
							<col width="8%"/>
							<col width="8%"/>
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
							<col width="4%"/>
							<!-- <col width="4%"/> -->
							<col width="4%"/>
							<!-- <col width="4%"/> -->
						</colgroup>
						<thead>
							<tr>
								<th>날짜</th>
								<th>센서</th>
								<th>수위EL</th>
								<th>수위GL</th>
								<th>압력</th>
								<th>온도</th>
								<th>전기전도도</th>
								<th>배터리</th>
								<th>NO3</th>
								<th>NH4</th>
								<th>PH</th>
								<th>NH3</th>
								<!-- <th>CL</th> -->
								<th>대기압</th>
								<!-- <th>강수량</th> -->					
							</tr>
							
						</thead>
						<tbody id='tablebody' style="text-align: center;">
							
						</tbody>
					</table>
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

<script src='<c:url value="/js/pagination.js"/>'></script>
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
			
			var siteId = "${paramMap.siteId}";
			if(siteId != null && siteId != ""){
				$("#searchObsvname").val(siteId);
			}
			
			fn_Sensorname();
		}
	})
	
}


//관측소 별 센서버튼 불러오기(처음화면용)
function fn_Sensorname(){
	
	$('#tableTab').empty();
	var formData = $("#searchForm").serialize();
	
	$.ajax({
		url : "<c:url value='/front/statistics/selectSensorList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(data){
			var ss = data.resultlist;
			var ssl = ss.length;
			var html = '';
			
			for(var i=0; i<ssl; i++){
				html += '<button style="margin-top:3px;" class="btn btn-outline-blue" type="button" onclick="';
				html += 'fn_tabChange('+(i+1);
				html += ')" id="sensorNm';
				html += (i+1)+'" name="sensorNm';
				html += (i+1)+'" value="';
				html +=	ss[i].sensorNm+'">';
				html += ss[i].sensorNm;
				html += '</button>&nbsp;';
			}
			
			$('#tableTab').append(html);
			
			fn_select();
		}
	})
}

//관측소 별 센서버튼 불러오기(관측소명 onchange용)
function fn_Sensorname2(){
	
	$('#tableTab').empty();
	var formData = $("#searchForm").serialize();
	
	$.ajax({
		url : "<c:url value='/front/statistics/selectSensorList.json'/>",
		type : "POST",
		data : formData,
		dataType : "json",
		success : function(data){
			var ss = data.resultlist;
			var ssl = ss.length;
			var html = '';
			
			for(var i=0; i<ssl; i++){
				html += '<button style="margin-top:3px;" class="btn btn-outline-blue" type="button" onclick="';
				html += 'fn_tabChange('+(i+1);
				html += ')" id="sensorNm';
				html += (i+1)+'" name="sensorNm';
				html += (i+1)+'" value="';
				html +=	ss[i].sensorNm+'">';
				html += ss[i].sensorNm;
				html += '</button>&nbsp;';
			}
			
			$('#tableTab').append(html);
			fn_select();
		}
	})
}


//selectlist + 총 게시물Count
function selectAvgList(sn){
	
	
	$(".loading").show();

	var sensorNm = $("#sensorNm"+sn).val();
	var searchStatistics = $("#searchStatistics").val();
	var searchObsvname = $("#searchObsvname").val();
	var fDate = $("#fDate").val(); 
	var lDate = $("#lDate").val();
	
	$.ajax({
		url : "<c:url value='/front/statistics/selectAvgList.json'/>",
		type : "POST",
		data : {"searchStatistics":searchStatistics, "searchObsvname":searchObsvname, "sensorNm":sensorNm, "fDate":fDate, "lDate":lDate},
		dataType : "json",
		success : function(result){
			var html = "";
			var html2 = "";
			
			var list = result.DataList;
			var leng = list.length;
			var cnt = result.Count;
			
			for(var i=0; i<leng; i++){
				var data = list[i]
				
				html += "<tr>";
				html += "<td>"+data.time+"</td>";
				html += "<td id='nSensor"+(i+1);
				html += "' name='nSensor"+(i+1);
				html += "'>"+data.sensor+"</td>";
				html += "<td>"+udchk(data.el)+"</td>";
				html += "<td>"+udchk(data.gl)+"</td>";
				html += "<td>"+udchk(data.pressr)+"</td>";
				html += "<td>"+udchk(data.temp)+"</td>";
				html += "<td>"+udchk(data.ec)+"</td>";
				/* html += "<td>"+udchk(data.baro)+"</td>"; */
				html += "<td>"+udchk(data.batt)+"</td>";
				html += "<td>"+udchk(data.no3)+"</td>";
				html += "<td>"+udchk(data.nh4)+"</td>";
				html += "<td>"+udchk(data.ph)+"</td>";
				html += "<td>"+udchk(data.nh3)+"</td>";
				/* html += "<td>"+udchk(data.cl)+"</td>"; */
				html += "<td>"+udchk(data.wBaro)+"</td>";
				/* html += "<td>"+udchk(data.rainfall)+"</td>"; */
				html += "</tr>";
			}
			
			html2 += cnt;
			
			$("#tablebody").empty(html);
			$("#tablebody").append(html);
			
			$("#paginationTotalCnt").empty();
			$("#paginationTotalCnt").append(html2);
			
			$(".loading").hide();
		}
	});
}


//센서번호를 selectAvgList로 넘겨줌
function fn_tabChange(sn){
	selectAvgList(sn);
}



//검색버튼 -> 첫번째 센서 정보 보여줌
function fn_select(){
	var sen = 1;
	fn_tabChange(sen);
}


//엑셀 다운로드
function fn_excel_down(){
	$(".loading").show();
	
	var sensorNm = document.getElementById('nSensor1').innerText;
	var searchStatistics = $("#searchStatistics").val();
	var searchObsvname = $("#searchObsvname").val();
	var fDate = $("#fDate").val();
	var lDate = $("#lDate").val();
	$.ajax({
		url : "<c:url value='/front/statistics/selectRealTimeDataListExcel2.json'/>",
		type : "POST",
		data : {"searchStatistics":searchStatistics, "searchObsvname":searchObsvname, "sensorNm":sensorNm, "fDate":fDate, "lDate":lDate},
		dataType : "json",
		success : function(result){
			$("#excelFileName").val(result.fileName);
			fn_excel_real_down();
			$(".loading").hide();
		},
		error:function(request,status,error){
	    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
}

function fn_excel_real_down(){
	$("#searchForm").attr("action", "<c:url value='/front/statistics/selectRealTimeDataListExcelDown.do'/>");
	$('#searchForm')[0].submit();
}
</script>