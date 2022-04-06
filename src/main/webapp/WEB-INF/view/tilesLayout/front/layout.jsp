<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<!DOCTYPE html>
<html style="">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>Front</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link rel="stylesheet" href="/css/board.css">

<!-- <link rel="stylesheet" href="/css/front/bootstrap.css"> -->

<script src="<c:url value='/ckeditor/ckeditor.js' />"></script>

<script src="/js/front/frontCommon.js"></script>

<link rel="stylesheet" type="text/css" href="/css/front/common.css" />
<link rel="stylesheet" type="text/css" href="/css/front/form.css" />
<link rel="stylesheet" type="text/css" href="/css/selectStyle.css" />
</head>
<body class="layoutBody">
	<div class="content">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="subHeader">
			<tiles:insertAttribute name="subHeader"/>
		</div>
		<div id="main" onclick="hideSideMenuBar()">
			<tiles:insertAttribute name="content"/>
		</div>
		<%-- <div id="banner" class="mobile">
			<tiles:insertAttribute name="banner"/>
		</div> --%>
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>
<script>
	function hideSideMenuBar(){
		alert("a")
	}
</script>