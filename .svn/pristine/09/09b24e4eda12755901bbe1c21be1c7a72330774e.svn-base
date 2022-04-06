function showPopup(menuId) {
	$.ajax({
		url : "/public/cmsMenu/popupList.json",
		type : "POST",
		data : {"menuId" : menuId},
		dataType : "json",
		success : function(res) {
			if ("success" == res.result) {
				var left = 0;
				for(idx in res.data) {
					var html = "";
					var popup = res.data[idx];
					
					if ( getCookie("popup"+popup.popupId) != "done" ) {
						var startDt = popup.startDt;
						var endDt = popup.endDt;
						
						var show = true;
						if(startDt != null && endDt != null)
							show = checkTodayIn(startDt, endDt); //금일이 시작일과 종료일 사이에 존재하는지 확인
						
						if(show) {
							var popupWin;
							var width = 400, height = 500;
							if(popup.width != null) width = popup.width;
							if(popup.height != null) height = popup.height;
							
							console.log("55"+popup.popupTp);
							if(popup.popupTp == 'window') { //윈도우 팝업
								popupWin = window.open("", popup.popupNm, "width="+width+"px, height="+height+"px, left="+left+" ,top=10, toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no");
								
								html += "<html>";
								html += "<head>";
								html += "<link rel='stylesheet' href='/css/bootstrap.css'>";
								html += "<link rel='stylesheet' href='/css/cms.css'>";
								html += "</head>";
								html += "<body>";
								html += "<div>";
								html += "<img src='/file/image.mng?fileId="+popup.fileId+"' style='width:100%;height:95%' alt='"+popup.alt+"' ";
								if(popup.imgMap != null) html += "usemap='#popupImg"+popup.popupId+"'";
								html += "/>";
								if(popup.linkUrl != "") html += "</a>";
								if(popup.imgMap != null) {
									html += "<map name='popupImg"+popup.popupId+"'>";
									html += popup.imgMap;
									html += "</map>";
								}
								html += "</div>";
								html += "<div class='text-right'>";
								html += "<a href='#;' onclick='opener.noShowPopup(\"this.document\",\"popup"+popup.popupId+"\");window.close();'>오늘하루 열지 않기</a>";
								html += "&nbsp;|&nbsp;";
								html += "<a href='#;' onclick='window.close();'>닫기</a>&nbsp;";
								html += "</div>";
								html += "</body>";
								html += "</html>";
								popupWin.document.write(html);
								popupWin.document.title = popup.popupNm;
							}else if(popup.popupTp == 'layer') { //레이어팝업
								if(left == 0) left += 100;
								html += "<div id='layerPopup"+popup.popupId+"' style='left:"+left+"px;padding-right:0px;position:absolute;z-index:1050;background-color:white;width:"+width+"px;height:"+height+"px;'>";
								html += "<div style='width:100%;height:95%'>";
								html += "<img src='/file/image.mng?fileId="+popup.fileId+"' style='width:100%;height:100%' alt='"+popup.alt+"' ";
								if(popup.imgMap != null) html += "usemap='#popupImg"+popup.popupId+"'";
								html += "/>";
								if(popup.linkUrl != "") html += "</a>";
								if(popup.imgMap != null) {
									html += "<map name='popupImg"+popup.popupId+"'>";
									html += popup.imgMap;
									html += "</map>";
								}
								html += "</div>";
								html += "<div class='text-right'>";
								html += "<a href='#;' onclick='noShowPopup(\"this.document\",\"popup"+popup.popupId+"\");$(\"#layerPopup"+popup.popupId+"\").modal(\"hide\");'>오늘하루 열지 않기</a>";
								html += "&nbsp;|&nbsp;";
								html += "<a href='#;' onclick='$(\"#layerPopup"+popup.popupId+"\").modal(\"hide\");'>닫기</a>&nbsp;";
								html += "</div>";
								html += "</div>";
								$("#layerPopup").append(html);
								$("#layerPopup"+popup.popupId).modal("show");
							}
							left += 200;
						}
					}
				}
			}else {
				alert(res.message);
			}
		}
	});
}

function noShowPopup(win, popupId) {
	setCookie(popupId, "done" , 1);
}