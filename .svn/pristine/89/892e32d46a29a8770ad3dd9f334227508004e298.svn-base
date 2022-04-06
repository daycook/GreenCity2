
/**
 * 
 * @param view		: 화면 입력 변수  (포맷 적용)
 * @param val		: hidden 입력변수  (포맷 미적용)
 * @param fmt	: 숫자 포멧을 지정 : 정수자리수.소수자리수  -> 예 : "3", "3.5" "1.7" 등등
 */
function cvtViewNumber(view, val, fmt) {
	if(isNull(view) || isNull(val)) {
		alert("데이터 변환 설정 오류입니다.");
		return;
	}
	if(isNull(fmt)) fmt = "";
	fmt = fmt.trim().toUpperCase();
	
	var nstp = "";
	var hyph = "";
	if((fmt.length>1) && ((fmt.charAt(0)=='N') || fmt.charAt(0)=='n')) nstp = "N";
	if((fmt.length>2) && ((fmt.charAt(1)=='S') || fmt.charAt(1)=='s')) hypn = "S";
	
	
	if(view.selector===undefined) {
		if(nstp=="N") {
			view.value = cvtHypnNum(view.value, fmt);			
			if(hypn == "S") val.value = view.value;
			else val.value = view.value.replace(/-/gi, "");
		}
		else {
			val.value = rmvNumForm(view.value, fmt);	
			view.value = numComma(val.value);
		}
	} else {
		if(nstp=="N") {
			view.val(cvtHypnNum(view.val(), fmt));
			if(hypn == "S") val.val(view.val());
			else val.val(view.val().replace(/-/gi, ""));
		}
		else {
			val.val(rmvNumForm(view.val(), fmt));	
			view.val(numComma(val.val()));
		}
	} 
}

function cvtFomatNumber(view, fmt) {
	if(isNull(view)) {
		alert("데이터 변환 설정 오류입니다.");
		return;
	}
	if(isNull(fmt)) fmt = "";
	fmt = fmt.trim().toUpperCase();
	
	var nstp = "";
	var hyph = "";
	if((fmt.length>1) && ((fmt.charAt(0)=='N') || fmt.charAt(0)=='n')) nstp = "N";
	if((fmt.length>2) && ((fmt.charAt(1)=='S') || fmt.charAt(1)=='s')) hypn = "S";
	
	
	if(view.selector===undefined) {
		if(nstp=="N") {
			view.value = cvtHypnNum(view.value, fmt);
		}
		else {
			view.value = numComma(val.value);
		}
	} else {
		if(nstp=="N") {
			view.val(cvtHypnNum(view.val(), fmt));
			if(hypn == "S") val.val(view.val());
			else val.val(view.val().replace(/-/gi, ""));
		}
		else {
			val.val();	
			view.val(numComma(rmvNumForm(view.val(), fmt)));
		}
	} 
}


/**
 * 슬레쉬(-) 숫자 입력
 * 다중 포멧일 경우 : 로 구분
 */
var __cvt_hyph_fmt = -1;
var __cvt_hyph_vlen = 0;
function cvtHypnNum(obj, fmt) {	  
    if(isEmpty(obj)) {
    	__cvt_hyph_fmt = -1;
    	__cvt_hyph_vlen = 0;
    	return "";
    }
	if(isEmpty(fmt)) return obj;

    if(__cvt_hyph_vlen > obj.length) {
      __cvt_hyph_fmt = -1;
      __cvt_hyph_vlen = 0;
    }
  
	var val = obj.trim(); // .replace(/[^0-9]/g, '');
	if(val.length==0) __cvt_hyph_fmt = -1;
  
	fmt = fmt.trim();
	var tmp = "";
	var last_hypn = false;
  	if(fmt.charAt(0)=='N') fmt = fmt.substr(1).trim();
	if(fmt=="") return val;
	if(fmt.charAt(0)=='S') fmt = fmt.substr(1).trim(); 
	val = val.replace("--", "-");
	for(var i=0; i<val.length; i++) {
    	if(!isNaN(val.charAt(i)) || val.charAt(i)=='-') tmp += val.charAt(i);
    	else {
    		// alert("숫자만 입력 가능 합니다.");
    		return obj = tmp; 
    	}
    }
    if(val.charAt(val.length-1)=="-") last_hypn = true;
    
    var lenlist = new Array();
	var flist = fmt.split(":");
	var minlen = 100;
	var midx = -1;
    for(var i=0; i<flist.length;i++) {
      flist[i] =  flist[i].trim();
      var fslist = flist[i].split("-");
      var fvlen = 0;
      lenlist[i] = new Array();
      for(var j=0; j<fslist.length; j++) {
    	lenlist[i][j] = Number(fslist[j].trim());
      }
    }
    var vspl = __get_hyph_len(val);
    var fidx = __cvt_hyph_fmt;
    var fcnt = 0;
    
    if(fidx==-1 || last_hypn) fidx = __find_fmt(lenlist, vspl);
    if(fidx==-1) fidx = __cvt_hyph_fmt;
    else __cvt_hyph_fmt = fidx;
    
    var fmlens = null;
    if(lenlist.length>fidx) fmlens = lenlist[fidx];
    else { 
      __cvt_hyph_vlen = obj.length;
      return obj;
    }
  
    var rst = "";
    var rfirst = 0;
    var rstlen = 0;
    var rlen = 0;
  
    val = val.replace(/-/gi, "");  
	for(var i=0; i<fmlens.length; i++) {
        rfirst += rlen; 
        rlen = fmlens[i];
      
        if((rfirst+rlen) > val.length) rlen = val.length-rfirst;
        rst += val.substr(rfirst, rlen);
        if((i<fmlens.length-1) && (fmlens[i]==rlen) && (last_hypn || (rfirst+rlen)<val.length)) rst += "-";        
	}
	
	__cvt_hyph_vlen = obj.length;	
	return rst;	
}

/**
 * 슬레쉬(-) 숫자 입력값 확인
 */
function chkHypnNum(obj, fmt, msg) {
	if(isEmpty(obj)) {	alert("시스템 오류 정의되지 않은 변수입니다."); return true; }
	var val = obj.value.trim();
	if(isEmpty(fmt)) return val;
	var tmp = "";
  	
	fmt = fmt.trim();
	if(fmt.charAt(0)=='N') fmt = fmt.substr(1).trim();
	if(fmt=="") return val;
	if(fmt.charAt(0)=='S') fmt = fmt.substr(1).trim();

    var vspl = __get_hyph_len(val);
	var lenlist = new Array();
	var flist = fmt.split(":");
	var minlen = 100;
	var midx = -1;
    for(var i=0; i<flist.length;i++) {
      flist[i] =  flist[i].trim();
      var fslist = flist[i].split("-");
      var fvlen = 0;
      lenlist[i] = new Array();
      for(var j=0; j<fslist.length; j++) {
    	lenlist[i][j] = Number(fslist[j].trim());
      }
    }
    
    for(var i=0; i<flist[i].length; i++) {
    	if(flist[i].length == vspl.length) {
    		var find_fmt = true;
    		for(var j=0; j<flist[i].length; j++)
    			if(flist[i][j] != vspl.length[j]) find_fmt = false;
    		if(find_fmt) return true;
    	}
    }

    alert(msg);
	obj.focus();
	return false;
}

function __find_fmt(flist, vspl) {
    if(isNull(vspl) || !(vspl instanceof Array)) return -1;
    var idxs = new Array();
	var idxs_c = 0;

    for(var j=0; j<flist.length; j++) {    
      var teq = true;
      for(var i=0;i<vspl.length-1; i++) {
        if(flist[j][i]!=vspl[i]) teq=false;
      }
      if(teq == true) {
        if((flist[j].length>=vspl.length) && (flist[j][vspl.length-1]>=vspl[vspl.length-1])) idxs[idxs_c++] = j; 
      }
    }
  
    if(idxs_c > 1) {
    	for(var i=0; i<idxs_c; i++) {
    		if(flist[idxs[i]].length==vspl.length) return idxs[i];  
    	}
    }
    
    if(idxs_c == 1) return idxs[0];
	return -1;
}

                    
function __get_hyph_len(val) {
	var ll = new Array();
	var spl = val.split("-");
	for(var i=0; i<spl.length; i++) {
		ll[i] = spl[i].trim().length;
	}
  
	return ll;
}


/**
 * 전화번호 형시 출력
 */
function cvtTelNum(obj) {
	if (isNull(obj)) return "";

	str = obj.value.replace(/[^0-9]/g, '');
	var tmp = '';
	if (str.length < 4) obj.value = str;
	else if (str.length<6 && str.substr(0,2)=="02") obj.value = str.substr(0, 2) + '-' + str.substr(2);
	else if (str.length<7 && str.substr(0,2)!="02") obj.value = str.substr(0, 3) + '-' + str.substr(3);
	else {
		str = str.substr(0, 11);
		var fp = 3;
		var ep = str.length - 4;
		if(str.substr(0, 2)=="02") {
			fp = 2;
			str = str.substr(0, 10);
		}
		tmp += str.substr(0, fp);
		if(ep>fp) tmp += '-' + str.substr(fp, (ep-fp));
		tmp += '-' + str.substr(ep);
		obj.value = tmp;
	}
}

function trm_str(str) {
	if(isNull(str)) return "";
	if(str==null) return "";
	return str.trim();
}
function chkStrByteLen(view, maxbyte) {
	if(view==null) {
		alert("문자 View 설정 오류입니다.");
		return;	
	}
	
	if(maxbyte < strByteLen(view.value)) {
		alert("입력 가능한 문자수를 초과하였습니다.");
		while(maxbyte < strByteLen(view.value))
			view.value = view.value.substr(0, view.value.length-1); 
	}
}

function isNull(obj) {
	if(obj==null || obj==undefined) return true;
	return false;
}
function isNotNull(obj) {
	return !isNull(obj);
}
function isEmpty(str) {
	if(str==null || str==undefined || !( typeof str === "string")) return true;
	if(str.trim()=="") return true;
	return false;
}
function isNotEmpty(str) {
	return !isEmpty(str);
}

/* 내무  함부*/
function rmvNumForm(str, fm) {
	if(isNull(str)) return "";
	if(str=="null") return "";
	var tmp="";
	var show_err = true;
	
	for(var i=0; i<str.length; i++) {
		if( !isNaN(str.charAt(i)) || str.charAt(i)=='.') tmp += str.charAt(i);
		else if(str.charAt(i)!=',' && show_err) {
			alert("숫자만 입력 가능 합니다.");
			show_err = false; 
		}
	}
	
	if(isNull(fm)) return tmp;
	if((fm.trim().length>0) && (tmp.length>0)) {
		var spnum = tmp.split(".");
		var spfm = fm.split(".");
		var dcmCnt = 0;
		var dcmNum = "";
		var dplCnt = 0;
		var dplNum = "";
		
		try {
			dcmCnt = parseInt(spfm[0]);
			if(spfm.length>1) dplCnt = parseInt(spfm[1]);
		} catch(err) {
			alert("잘못된 숫자 포멧입니다.");
			return tmp;
		}
		
		if(spnum.length > 0) dcmNum = spnum[0];
		if(spnum.length > 1) dplNum = spnum[1];
		
		if((dcmNum.length>dcmCnt || spnum.length>1) && spfm.length<2) {
			alert( "'" + dcmCnt + "' 자리수의 정수만 입력이 가능합니다.");
			dcmNum = dcmNum.substring(0, dcmCnt);
			return dcmNum;
		}		
		if(dcmCnt>0 && (dcmNum.length > dcmCnt)) {
			alert( "'" + dcmCnt + "' 자리수의 정수\n\r 소수점 이하 '" +dplCnt+ "' 자리수 입력이 가능합니다.");
			dcmNum = dcmNum.substring(0, dcmCnt);
		}
		if(dplCnt>0 && (dplNum.length > dplCnt)) {
			alert( "'" + dcmCnt + "' 자리수의 정수와 \r\n소수점 이하 '" +dplCnt+ "' 자리수 입력이 가능합니다.");
			dplNum = dplNum.substring(0, dplCnt);
		}
		
		if(spnum.length <2) tmp = dcmNum;
		else if(spnum.length >1) tmp = dcmNum + "." + dplNum;
		
	}
	
	return tmp;
}

function numComma(str) {
	exp = /\B(?=(\d{3})+(?!\d))/g;
	var sp=str.split(".");
	if(sp.length>1) return sp[0].replace(exp, ",") + "." + (sp[1] ? sp[1] : "");
	return sp[0].replace(exp, ",");
}

/* String 변수의 Byte 길이계산 */
function strByteLen(val) {
	return val.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;	
}

/* 문자열  확인  */
function isEmptyString(str) {
	if(isNull(str)) return true;
	if(str.trim().length < 1) return true;
	return false;
}

/* TextBox 입력여부 확인   */
function isEmptyValue(view, msg) {
	if(isNull(view)) {	alert("시스템 오류 정의되지 않은 변수입니다."); return true; }
	var value = view.value;
	if(isNull(value)) value = view.val();
	if(isNull(value)) {	alert("시스템 오류 정의되지 않은 변수입니다."); return true; }
	
	if(value.trim().length < 1) {
		if(isNull(msg) || msg.length<2) return true;
		alert(msg);
		view.focus();
		return true;
	}
	return false;
}

/* 콤보박스 선태개 여부 확인   */
function unSelectValue(view, msg) {
	if(view===undefined) {	alert("시스템 오류 정의되지 않은 변수입니다."); return true; }
	var index = view.selectedIndex;
	var length = undefined;
	if(index===undefined) length = view.length;
	if(index===undefined && length===undefined) {	alert("시스템 오류 정의되지 않은 변수입니다."); return true; }
	
	if(index<1) {
		alert(msg);
		view.focus();
		return true;
	}
	return false;
}

function unSelectValueJq(vid, msg) {
	if(vid===undefined) {	alert("시스템 오류 정의되지 않은 변수입니다."); return true; }
	
	try {
		var length = $("input:checkbox[id="+vid+"]").length;
		if(length>0 && $("input:checkbox[id="+vid+"]:checked").length>0) return false;
	} catch (e) {
	}
	
	try {
		var index = $("#"+vid+" option:selected").index();
		if(index>0) return false;		
	}catch(e) {
	}

	alert(msg);
	return true;
}



//숫자만 입력 가능하도록 기능
$(document).ready(function(){
	$(".onlyNumber").attr("onkeyup", "return delHangle(event)")
	$(".onlyNumber").attr("onkeypress", "return isNumberKey(event)")
	
	$(".onlyNumberNotDot").attr("onkeyup", "return delHangle(event)")
	$(".onlyNumberNotDot").attr("onkeypress", "return isNumberKey(event, 'notDot')")
	
	$(".onlyTel").attr("onkeyup", "return phoneFomatter(event)")
})


function delHangle(evt){ //한글을 지우는 부분, keyup부분에 넣어준다.
	var objTarget = evt.srcElement || evt.target;
    var _value = event.srcElement.value;  
    if(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g.test(_value)) { 
    	//  objTarget.value = objTarget.value.replace(/[ㄱ-ㅎㅏ-ㅡ가-핳]/g,''); // g가 핵심: 빠르게 타이핑할때 여러 한글문자가 입력되어 버린다.
    	objTarget.value = null;
    	//return false;
    }
}

function isNumberKey(evt, type) { // 숫자를 제외한 값을 입력하지 못하게 한다. 
    var charCode = (evt.which) ? evt.which : event.keyCode;
    // Textbox value       
    var _value = event.srcElement.value;     
	if (event.keyCode < 48 || event.keyCode > 57) { 
		 if(type == "notDot"){
			 return false; 
		 }else{
			 if (event.keyCode != 46) { //숫자와 . 만 입력가능하도록함
                return false; 
            } 
		 }
    } 
    if (event.keyCode < 48 || event.keyCode > 57) { 
        if (event.keyCode != 46) { //숫자와 . 만 입력가능하도록함
            return false; 
        } 
    } 

    // 소수점(.)이 두번 이상 나오지 못하게
    var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가
    if (_pattern0.test(_value)) {
        if (charCode == 46) {
            return false;
        }
    }

    // 두자리 이하의 숫자만 입력가능
    /*var _pattern1 = /^\d{2}$/; // 현재 value값이 2자리 숫자이면 . 만 입력가능
    // {숫자}의 값을 변경하면 자리수를 조정할 수 있다.
    if (_pattern1.test(_value)) {
        if (charCode != 46) {
            alert("두자리 이하의 숫자만 입력가능합니다");
            return false;
        }
    }*/

    // 소수점 둘째자리까지만 입력가능
    var _pattern2 = /^\d*[.]\d{2}$/; // 현재 value값이 소수점 둘째짜리 숫자이면 더이상 입력 불가
   /* // {숫자}의 값을 변경하면 자리수를 조정할 수 있다.
    if (_pattern2.test(_value)) {
        alert("소수점 둘째자리까지만 입력가능합니다.");
        return false;
    }     */
    return true;
}


//전화번호 변경
function phoneFomatter(){
	var id = $(event.target).attr('id');
	
	var num = $("#"+id).val().replaceAll("-", "");
	
    var formatNum = '';
    if(num.length==11){
    	formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    }else if(num.length==8){
        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
    }else{
        if(num.indexOf('02')==0){
        	 formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
        }else{
        	 formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
        }
    }
    $("#"+id).val(formatNum);
}

//null체크
function nullChk(id, title){
	if($("#"+id).val() == null || $("#"+id).val() == ""){
		alert(title+"은 필수값 입니다.")
		return false;
	}else{
		return true;
	}
}

//undefined체크
function udchk(data){
	if(data == undefined || data == "undefined"){
		return "";
	}else{
		return data;
	}
}

//글자 byte계산 후 맨뒷자리 자르기
//obj : 데이터 입력 위치
//num : 체크할 byte수
function chkByte (obj, num){
	var str = $(obj).val();
	
	var retCode = 0;
	var strLength = 0;
	
	
	 
	for (i = 0; i < str.length; i++)
	{
	var code = str.charCodeAt(i)
	var ch = str.substr(i,1).toUpperCase()
	
	code = parseInt(code)
	
	if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0)))
	strLength = strLength + 2;
	else
	strLength = strLength + 1;
	}
	
	if(strLength > num){
		str = str.slice(0, -1);
		$(obj).val(str);
	}
}

/**
 * 비밀번호 체크, 8~20자 이내, 숫자, 영문자, 특수문자 포함
 * @param value
 * @returns {Boolean}
 */
 function checkInsertPwd(value){
	var pw = value;
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩';:₩/?]/gi);

	if((pw.length < 8) || (pw.length > 20)){
		alert("8자리 ~ 20자리 이내로 입력해주세요.");
		return false;
	}
	
	if(pw.search(/₩s/) != -1){
		alert("비밀번호는 공백업이 입력해주세요.");
		return false;
	} 
	
	if((num < 0) || (eng < 0) || (spe < 0) ){
		alert("숫자, 영문자, 특수문자 포함 8~20자 이내로 입력해주세요.");
		return false;
	}
	return true;
}