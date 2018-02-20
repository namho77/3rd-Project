<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="../bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>

<!-- CSS작업부분 -->
<link rel="stylesheet" href="../css/commonTop_1.css" />
<link rel="stylesheet" href="../css/commonTop_2.css" />
<link rel="stylesheet" href="../css/commonBottom.css" />

<style type="text/css">
#row-body-write{
	margin-top: 100px;
	background-color: #FAFAFA;
	padding: 90px;
}
.write-body{
	border: 1px solid #E1E1E1;
	background-color: white;
	padding: 15px;
}
.title{
	margin-bottom: 15px;
	border-bottom: 1px solid #E1E1E1;
	padding-bottom: 15px;
}
.contents{
	margin-top: 15px;
	
}
.contents>.form-control{
	height: 500px;
}











</style>

<title>list</title>
</head>
<body>
	<!-- Top영역 1첫번째 -->
	<div class="row">
		<%@ include file="../common/commonTop_1.jsp"%>
	</div>

	<!-- Top영역 2첫번째 -->
	<div class="row">
		<%@ include file="../common/commonTop_2.jsp"%>
	</div>

	<!-- Body영역 -->
	<div class="row" id="row-body-write">
		<div class="col-lg-3 col-sm-2 col-xs-1"></div>
		<div class="col-lg-6 col-sm-8 col-xs-10">
			<div class="write-body">
				<div class="title">
					<input type="text" class="form-control" placeholder="제목을 입력하세요"/>
				</div>
				<div class="contents">
					<textarea class="form-control" placeholder="서비스내용을 입력하세요"></textarea>
				</div>
				<div class="need-contents">필수사항내용</div>
				<div class="images">이미지</div>
			</div>
		</div>
		<div class="col-lg-3 col-sm-2 col-xs-1"></div>
	</div>

	<!-- Bottom영역 -->
	<div class="row">
		<%@ include file="../common/commonBottom.jsp"%>
	</div>
</body>
</html>





































