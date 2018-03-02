<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<!-- CSS작업부분 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_1.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_2.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonBottom.css" />



<script type="text/javascript">
$(document).ready(function(){
	
	$.ajax({
		url : "./engineer/list",
		dataType : "html",
		type : "get",
		contentType : "text/html; charset:UTF-8",
		data : {param1:"값1"},
		success : function(d){
			$('#boardHTML').html(d); 
		},
		error : function(d){
			alert("실패 : "+d);
		}
	});
});
</script>

<title>list</title>
</head>
<body>
	<!-- Top영역 1첫번째 -->
	<div class="row">
		<%@ include file="../../common/commonTop_1.jsp"%>
	</div>

	<!-- Top영역 2첫번째 -->
	<div class="row">
		<%@ include file="../../common/commonTop_2.jsp"%>
	</div>

	<!-- Body영역 -->
	
		<div class="row" id="boardHTML"></div>

	<!-- Bottom영역 -->
	<div class="row">
		<%@ include file="../../common/commonBottom.jsp"%>
	</div>
</body>
</html>