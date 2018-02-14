<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>file</title>
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/plugins/jQuery/jquery-3.2.1.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
</script>
</head>
<body>
	<div class="container">
		<div class="row" style="border: 1px solid #dddddd; padding: 15px;">
			<c:forEach items="${lists }" var="row">
				<!-- 반복스타트 -->
				<div class="media" id="guest_${row.notice_srl }">

					<div class="media-body">
						<h4 class="media-heading">[${row.notice_srl }] 제목:
							${row.title } 날짜: ${row.postdate }</h4>
						<p>${row.contents }</p>
					</div>
				</div>
				<div class="media-right" style="width: 100px;">
					<button type="button" class="btn btn-primary"
						onclick="javascript:modifyRow(${row.idx});">수정하기</button>
					<button type="button" class="btn btn-success"
						onclick="javascript:deleteRow(${row.idx});">삭제하기</button>
				</div>
				<hr id="guest_line_${row.notice_srl }" />
				<!-- 반복끝 -->
			</c:forEach>
		</div>
		<!-- 페이지 번호 추가하기 -->
		<div class="row text-center">
			<ul class="pagination">
				${pagingDiv }
			</ul>
		</div>
	</div>
</body>
</html>