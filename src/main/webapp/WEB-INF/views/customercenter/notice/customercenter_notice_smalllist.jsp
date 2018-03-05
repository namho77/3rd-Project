<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
function paging(pNum) {
	 var url = "${pageContext.request.contextPath}/notice/smallABoard";
	$.ajax({
		url:url,
		dataType:"html",
		type:"get",
		contentType:"text/html; charset:utf-8",
		data:{nowPage:pNum},
		success:function(d){
			$('#smallABoard').html(d);
		},
		error:function(e){
			alert("실패다" + e);
		}
	});
}
</script>   
<c:forEach items="${lists }" var="row">
	<input type="hidden" value="${row.notice_srl }" />
	<a href="./notice/ViewRow?srl=${row.notice_srl }" style="font-size: 15px;">${row.title }&nbsp;&nbsp;</a>${pagingDiv }
</c:forEach>
