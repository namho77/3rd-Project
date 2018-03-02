<%@page import="com.cafe24.ourplanners.member.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	//ajax json데이터 캐쉬 방지
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="http://abusinesstheme.com/demo/voyo/assets/images/favicon.ico">
<link rel="apple-touch-icon" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="144x144" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-144x144.png">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<style>
.fileDrop {
	width: 600px;
	height: 200px;
	border: 1px dotted blue;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>

<script>
	$(document).ready(function() {
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault(); // 기본효과를 막음
		});
		// event : jQuery의 이벤트
		// originalEvent : javascript의 이벤트
		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			console.log(file);
			var formData = new FormData();
			formData.append("file", file);

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/upload/uploadAjax",
				data : formData,
				dataType : "text",
				processData : false,
				contentType : false,
				// 업로드 성공하면
				success : function(data) {
					var str = "";
					// 이미지 파일이면 썸네일 이미지 출력
					if (checkImageType(data)) {
						str = "<div><a href='${pageContext.request.contextPath}/upload/displayFile?fileName=" + getImageLink(data) + "'>";
						str += "<img src='${pageContext.request.contextPath}/upload/displayFile?fileName=" + data + "'></a>";
						// 일반파일이면 다운로드링크
					} else {
						str = "<div><a href='${pageContext.request.contextPath}/upload/displayFile?fileName=" + data + "'>" + getOriginalName(data) + "</a>";
					}
					// 삭제 버튼
					str += "<span data-src="+data+">[삭제]</span></div>";
					$(".uploadedList").append(str);
				},
				error : function(e) {
					popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);

				}
			});
		});

		$(".uploadedList").on("click", "span", function(event) {
			alert("이미지 삭제")
			var that = $(this); // 여기서 this는 클릭한 span태그
			$.ajax({
				url : "${path}/upload/deleteFile",
				type : "post",
				// data: "fileName="+$(this).attr("date-src") = {fileName:$(this).attr("data-src")}
				// 태그.attr("속성")
				data : {
					fileName : $(this).attr("data-src")
				}, // json방식
				dataType : "text",
				success : function(result) {
					if (result == "deleted") {
						// 클릭한 span태그가 속한 div를 제거
						that.parent("div").remove();
					}
				},
				error : function(e) {
					popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);

				}
			});
		});
	});

	// 원본파일이름을 목록에 출력하기 위해
	function getOriginalName(fileName) {
		// 이미지 파일이면
		if (checkImageType(fileName)) {
			return; // 함수종료
		}
		// uuid를 제외한 원래 파일 이름을 리턴
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}

	// 이미지파일 링크 - 클릭하면 원본 이미지를 출력해주기 위해
	function getImageLink(fileName) {
		// 이미지파일이 아니면
		if (!checkImageType(fileName)) {
			return; // 함수 종료 
		}
		// 이미지 파일이면(썸네일이 아닌 원본이미지를 가져오기 위해)
		// 썸네일 이미지 파일명 - 파일경로+파일명 /2017/03/09/s_43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
		var front = fileName.substr(0, 12); // 년원일 경로 추출
		var end = fileName.substr(14); // 년원일 경로와 s_를 제거한 원본 파일명을 추출
		console.log(front); // /2017/03/09/
		console.log(end); // 43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
		// 원본 파일명 - /2017/03/09/43fc37cc-021b-4eec-8322-bc5c8162863d_spring001.png
		return front + end; // 디렉토리를 포함한 원본파일명을 리턴
	}

	// 이미지파일 형식을 체크하기 위해
	function checkImageType(fileName) {
		// i : ignore case(대소문자 무관)
		var pattern = /jpg|gif|png|jpeg/i; // 정규표현식
		return fileName.match(pattern); // 규칙이 맞으면 true
	}

	// 업로드 파일 정보
	function getFileInfo(fullName) {
		var fileName, imgsrc, getLink, fileLink;
		// 이미지 파일일 경우
		if (checkImageType(fullName)) {
			// 이미지 파열 경로(썸네일)
			imgsrc = "${pageContext.request.contextPath}/upload/displayFile?fileName=" + fullName;
			console.log(imgsrc);
			// 업로드 파일명
			fileLink = fullName.substr(14);
			console.log(fileLink);
			// 날짜별 디렉토리 추출
			var front = fullName.substr(0, 12);
			console.log(front);
			// s_를 제거한 업로드이미지파일명
			var end = fullName.substr(14);
			console.log(end);
			// 원본이미지 파일 디렉토리
			getLink = "${pageContext.request.contextPath}/upload/displayFile?fileName=" + front + end;
			console.log(getLink);
			// 이미지 파일이 아닐경우
		} else {
			// UUID를 제외한 원본파일명
			fileLink = fullName.substr(12);
			console.log(fileLink);
			// 일반파일디렉토리 
			getLink = "${pageContext.request.contextPath}/upload/displayFile?fileName=" + fullName;
			console.log(getLink);
		}
		// 목록에 출력할 원본파일명
		fileName = fileLink.substr(fileLink.indexOf("_") + 1);
		console.log(fileName);
		// { 변수:값 } json 객체 리턴
		return {
			fileName : fileName,
			imgsrc : imgsrc,
			getLink : getLink,
			fullName : fullName
		};
	}
</script>

<script>
	$(document).ready(function() {

	});
</script>


</head>

<body>
	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- HEADER -->

		<%@ include file="../common/top_main2.jsp"%>

		<!-- HOME -->
		<section id="main" class="section">

			<!-- CONTAINER -->
			<div class="container ">
				<h2>AJAX File Upload</h2>
				<!-- 파일을 업로드할 영역 -->
				<div class="fileDrop"></div>
				<!-- 업로드된 파일 목록 -->
				<div class="uploadedList"></div>
			</div>
			<!-- //CONTAINER -->


		</section>
		<!-- //HOME -->

		<!-- 모달창 -->
		<%@ include file="../common/modal_msg.jsp"%>
		<!-- //모달창 끝 -->


		<!-- Footer section(하단부분) -->
		<%@ include file="../common/bottom.jsp"%>
		<!-- Footer section(하단부분) -->

	</div>
</body>
</html>
