<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function paging(pNum) {				
	$.ajax({
		url: "./aBoard.do",
		dataType:"html",
		type:"get",
		contentType:"text/html; charset:utf-8",
		data:{nowPage:pNum},
		success:function(d){				
			$('#list').html(d);
		},
		error:function(e){
			alert("실패" + e);
		}
	});
}	
</script>
<c:forEach items="${lists }" var="row">
	<div style="font-size: 1.5em; color: black;">
		<div class="col-xs-3 col-md-3">${row.notice_srl }</div>
		<div class="col-xs-3 col-md-3">${row.title }</div>
		<div class="col-xs-4 col-md-4">${row.contents }</div>
		<div class="col-xs-2 col-md-2">${row.postdate }</div>
	</div>	
</c:forEach>
<div class="pagination">${pagingDiv }</div>
<%-- <c:choose>
<c:when test="${sessionScope.loginUserInfo.user_id eq 'admin' }">
<div>
	<button type="button" onclick="location.href='./writeRow'">글쓰기</button>&nbsp;
	<button type="button" onclick="javascript:deleteRow(${row.notice_srl})">삭제하기</button>&nbsp;	
</div>
</c:when>
</c:choose> --%>