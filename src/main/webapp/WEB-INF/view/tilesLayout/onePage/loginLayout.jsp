<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/tags.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<title>Title of the document</title>
<link rel="stylesheet" href="../css/materialdesignicons.min.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/vendor.bundle.base.css">

<script src="/js/jquery/jQuery-2.1.4.min.js"></script>
<script src="/js/plugins/placeholder/jquery.placeholder.js"></script>
</head>
<body class="hold-transition login-page">
	<tiles:insertAttribute name="content"/>
	
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="/js/jquery/jquery-ui.js"></script>
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<script src="<c:url value='/js/bootstrap.js' />"></script>
	<script src="<c:url value='/js/plugins/jstree/jstree.min.js' />"></script>
	<script src="<c:url value='/js/plugins/lightbox/lightbox.js' />"></script>
	<script src="<c:url value='/js/plugins/fileupload/jquery.fileupload.js' />"></script>
	<script src="<c:url value='/js/app.min.js' />"></script>
	<script src="<c:url value='/js/common.js' />"></script>
	<script src="<c:url value='/js/file.js' />"></script>
	<script src="/js/plugins/iCheck/icheck.min.js"></script>
	<script src="<c:url value='/js/plugins/datatables/jquery.dataTables.min.js' />"></script>
	<script src="<c:url value='/js/plugins/datatables/dataTables.bootstrap.min.js' />"></script>
	<script src="<c:url value='/js/plugins/bootstrapSelect/bootstrap-select.min.js' />"></script>
	<script src="<c:url value='/js/plugins/datepicker/bootstrap-datepicker.js' />"></script>
	<script src="<c:url value='/js/plugins/datepicker/bootstrap-datepicker.ko.min.js' />"></script>
	
	<script>
	/* $(document).ready(function() {
		$('input').iCheck({
			checkboxClass: 'icheckbox_square-blue',
			radioClass: 'iradio_square-blue',
			increaseArea: '20%' // optional
		});
	}); */
	</script>
</body>
</html>