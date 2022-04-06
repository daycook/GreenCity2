<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<div id="commentWrap">
<c:if test="${sessionScope.user != null}">
	<h3>댓글</h3>
	<div class="commentBox">
		
			<form>
				<input title='입력' type="hidden" name="artiId" value="${bodArti.artiId}" />
				<input title='입력' type="hidden" name="depth" value="1" />
				<div class="input-group">
					<input title='입력' type="text" class="form-control" name="cont" placeholder="댓글을 입력해 주세요.">
					<span class="input-group-btn">
	                	<button type="button" class="btn btn-ok btn-default" onclick="insertCmnt(this.form,0);">등록</button>
	                </span> 
				</div>
			</form>
		
	</div>
</c:if>
	<div id="commentList" style="margin-top: 50px;">
		
	</div>
</div>

<script>
$(document).ready(function(){
	selectCmntList();
});

function selectCmntList() {
	$.ajax({
		url : "<c:url value='/public/bodCmnt/list.json' />",
		type : "POST",
		data : {"artiId" : "${bodArti.artiId}"},
		dataType : "json",
		success : function(res) {
			if ("success" == res.result) {
				$("#commentList").html("");
				
				var html = "";
				for(idx in res.data) {
					var bodCmnt = res.data[idx];
					if(bodCmnt.depth == 1){
						html += '<table class="baseTable" style="margin-bottom:5px;">';
						html += '<tr>';
						html += '<th colspan="3" class="mobile">작성자 : '+bodCmnt.user.userNm+'</th>';
						html += '</tr>';
						html += '<tr>';
						html += '<th style="width:20%" class="web">작성자 : '+bodCmnt.user.userNm+'</th>';
						html += '<td style="width:50%; padding-left:10px;"><a id="cont_'+bodCmnt.cmntId+'">'+bodCmnt.cont+'</a>'
						html += '<input class="form-control" type="text" id="contIn_'+bodCmnt.cmntId+'" style="display:none;" value="'+bodCmnt.cont+'">'
						html += '</td>';
						html += '<td style="width:30%; text-align:center">';
						if("${sessionScope.user.userId}" == bodCmnt.regId && bodCmnt.delDt == null) {
							html += '<input id="btnMod1_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" type="button" value="수정" onclick="setUpdateDepth1(\''+bodCmnt.cont+'\', \''+bodCmnt.cmntId+'\')">';
							html += '<input id="btnDel_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" type="button" value="삭제" onclick="deleteDepth1(\''+bodCmnt.cont+'\', \''+bodCmnt.cmntId+'\',0)">';
							html += '<input id="btnMod2_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" style="display:none" type="button" value="수정" onclick="updateDepth1(\''+bodCmnt.cont+'\', \''+bodCmnt.cmntId+'\',0)">';
							html += '<input id="btnCancel_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" style="display:none" type="button" value="취소" onclick="setCancelDepth1(\''+bodCmnt.cont+'\', \''+bodCmnt.cmntId+'\')">';
						}
						html += '<input id="btnShowDepth2_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" type="button" value="댓글보기" onclick="showDepth2(\''+bodCmnt.cmntId+'\',0)">';
						html += '<input id="btnHideDepth2_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" type="button" style="display:none" value="댓글숨기기" onclick="showDepth2(\''+bodCmnt.cmntId+'\',1)">';
						html += '</td>';
						html += '</tr>';
						html += '</table>';
						html += '<div id="depth2Div_'+bodCmnt.cmntId+'" style="display:none;float:right; width:90%;"></div>'
					}
				}
				$("#commentList").html(html);
			}else {
				alert(res.message);
			}
		}
	});
}

function selectDepth2(cmntId){
	$.ajax({
		url : "<c:url value='/public/bodCmnt/list.json' />",
		type : "POST",
		data : {"artiId" : "${bodArti.artiId}"},
		dataType : "json",
		success : function(res) {
			if ("success" == res.result) {
				$("#depth2Div_"+cmntId).html("");
				
				var html = "";
				
				html += '<form>';
				html += '<input title="입력" type="hidden" name="artiId" value="${bodArti.artiId}" />';
				html += '<input title="입력" type="hidden" name="depth" value="2" />';
				html += "<input title='입력' type='hidden' name='cmntGrp' value='"+cmntId+"'/>";
				<c:if test="${sessionScope.user != null}">
				html += '<div class="input-group">';
				html += '<input title="입력" type="text" class="form-control" name="cont" placeholder="댓글을 입력해 주세요.">';
				html += '<span class="input-group-btn">';
				html += '<button type="button" class="btn btn-ok btn-default" onclick="insertCmnt(this.form,1);">등록</button>';
				html += '</span> ';
				html += '</div>';
				</c:if>
				html += '</form>';
				var count = 0;
				for(idx in res.data) {
					var bodCmnt = res.data[idx];
					if(cmntId == bodCmnt.cmntGrp){
						if(bodCmnt.depth == 2){
							count = 1;
							html += '<table class="baseTable" style="margin-bottom:5px;">';
							html += '<tr>';
							html += '<th colspan="3" class="mobile">작성자 : '+bodCmnt.user.userNm+'</th>';
							html += '</tr>';
							html += '<tr>';
							html += '<th style="width:20%" class="web">작성자 : '+bodCmnt.user.userNm+'</td>';
							html += '<td style="width:65%; padding-left:10px;"><a id="cont_'+bodCmnt.cmntId+'">'+bodCmnt.cont+'</a>'
							html += '<input class="form-control" type="text" id="contIn_'+bodCmnt.cmntId+'" style="display:none;" value="'+bodCmnt.cont+'">'
							html += '</td>';
							html += '<td style="width:15%; text-align:center">';
							if("${sessionScope.user.userId}" == bodCmnt.regId && bodCmnt.delDt == null) {
								html += '<input id="btnMod1_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" type="button" value="수정" onclick="setUpdateDepth1(\''+bodCmnt.cont+'\', \''+bodCmnt.cmntId+'\')">';
								html += '<input id="btnDel_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" type="button" value="삭제" onclick="deleteDepth1(\''+bodCmnt.cont+'\', \''+bodCmnt.cmntId+'\',1,'+cmntId+')">';
								html += '<input id="btnMod2_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" style="display:none" type="button" value="수정" onclick="updateDepth1(\''+bodCmnt.cont+'\', \''+bodCmnt.cmntId+'\',1,'+cmntId+')">';
								html += '<input id="btnCancel_'+bodCmnt.cmntId+'" class="btn btn-outline-black btn-sm" style="display:none" type="button" value="취소" onclick="setCancelDepth1(\''+bodCmnt.cont+'\', \''+bodCmnt.cmntId+'\')">';
							}
							html += '</td>';
							html += '</tr>';
							html += '</table>';
							html += '<div id="depth2Div_'+bodCmnt.cmntId+'" style="display:none;text-align:right;"></div>'
						}
					}
				}
				if(count == 0){
					html += '<table class="baseTable" style="margin-bottom:5px;"><tr><td style="text-align:center;">댓글이 존재하지 않습니다.</td></tr></table>';
				}
				$("#depth2Div_"+cmntId).html(html);
				$("#depth2Div_"+cmntId).show();
			}else {
				alert(res.message);
			}
		}
	});
}

function insertCmnt(form, type){
	if(form.cont.value == "") {
		alert("내용을 입력 해 주세요.");
		form.cont.focus();
	}else {
		if(confirm("등록하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/public/bodCmnt/insert.json' />",
				type : "POST",
				data : $(form).serialize(),
				dataType : "json",
				success : function(res) {
					if ("success" == res.result) {
						alert("등록되었습니다.");
						form.cont.value = "";
						if(type==0){
							selectCmntList();	
						}
						else if(type==1){
							selectDepth2(form.cmntGrp.value)
						}
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
}

function updateCmnt(form) {
	if(form.cont.value == "") {
		alert("내용을 입력 해 주세요.");
		form.cont.focus();
	}else {
		if(confirm("수정하시겠습니까?")) {
			$.ajax({
				url : "<c:url value='/public/bodCmnt/update.json' />",
				type : "POST",
				data : $(form).serialize()+"&artiId=${bodArti.artiId}",
				dataType : "json",
				success : function(res) {
					if ("success" == res.result) {
						alert("수정되었습니다.");
						selectCmntList();
					}else {
						alert(res.message);
					}
				}
			});
		}
	}
}

function setCancelDepth1(cont, cmntId){
	$("#cont_"+cmntId).show();
	$("#contIn_"+cmntId).hide();
	
	$("#btnMod1_"+cmntId).show();
	$("#btnDel_"+cmntId).show();
	
	$("#btnMod2_"+cmntId).hide();
	$("#btnCancel_"+cmntId).hide();
	
	$("#contIn_"+cmntId).val(cont);
}
function setUpdateDepth1(cont, cmntId) {
	$("#cont_"+cmntId).hide();
	$("#contIn_"+cmntId).show();
	
	$("#btnMod1_"+cmntId).hide();
	$("#btnDel_"+cmntId).hide();
	
	$("#btnMod2_"+cmntId).show();
	$("#btnCancel_"+cmntId).show();
	
	$("#contIn_"+cmntId).val(cont);
}

function updateDepth1(cont, cmntId, type, cmntGrp) {
	if(confirm("정말 수정하시겠습니까?")) {
		$.ajax({
			url : "<c:url value='/public/bodCmnt/update.json' />",
			type : "POST",
			data : {"cont": $("#contIn_"+cmntId).val(), "cmntId": cmntId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					if(type == 0){
						selectCmntList();
					}
					else{
						selectDepth2(cmntGrp)
					}
				}else {
					alert(res.message);
				}
			}
		});
	}
}


function deleteDepth1(cont, cmntId, type, cmntGrp) {
	if(confirm("정말 삭제하시겠습니까?")) {
		$.ajax({
			url : "<c:url value='/public/bodCmnt/delete.json' />",
			type : "POST",
			data : {"cmntId": cmntId},
			dataType : "json",
			success : function(res) {
				if ("success" == res.result) {
					alert("삭제되었습니다.");
					if(type == 0){
						selectCmntList();
					}
					else{
						selectDepth2(cmntGrp)
					}
					
				}else {
					alert(res.message);
				}
			}
		});
	}
}

function showDepth2(cmntId, type){
	if(type == 0){
		$("#btnShowDepth2_"+cmntId).hide();
		$("#btnHideDepth2_"+cmntId).show();
		selectDepth2(cmntId)
	}
	else{
		$("#btnShowDepth2_"+cmntId).show();
		$("#btnHideDepth2_"+cmntId).hide();
		$("#depth2Div_"+cmntId).hide();
	}
}


</script>