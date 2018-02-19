<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
function paging(pNum) {
	$.ajax({
		url:"./board/smallABoard",
		dataType:"html",
		type:"get",
		contentType:"text/html; charset:utf-8",
		data:{nowPage:pNum},
		success:function(d){
			$('#smallABoard').html(d);
		},
		error:function(e){
			alert("실패" + e);
		}
	});
}
</script>   
<c:forEach items="${lists }" var="row">
<p>${row.contents }</p> <ul class="pagination">${pagingDiv }</ul>
</c:forEach>
