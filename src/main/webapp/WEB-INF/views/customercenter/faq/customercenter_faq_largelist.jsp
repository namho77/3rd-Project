<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function paging(pNum) {
		var url = "${pageContext.request.contextPath}/faq/list.do"
		$.ajax({
			url : url,
			dataType : "html",
			type : "get",
			contentType : "text/html; charset:utf-8",
			data : {
				nowPage : pNum
			},
			success : function(d) {
				$('#list').html(d);
			},
			error : function(e) {
				alert("실패" + e);
			}
		});
	}
	function deleteRow(idx) {
		var url = "${pageContext.request.contextPath}/faq/deleteRow"
		$.ajax({
			url:url,
			type:"get",
			data:{srl:idx},
			dataType:"json",
			contentType:"text/html; charset:utf-8",
			success:function(d){
				if(d.Code == 0){
					alert("게시물 삭제에 실패하였습니다.");
				}
				else if(d.Code == 1){
					alert("게시물 삭제에 성공하였습니다.");
					$("#noticeText_"+idx).hide(1000);
				}						
			},
			error:function(e){
				alert("실패:"+e.status+":"+e.statusText);
			}
		});
	}
	
	function modifyRow(idx) {
		var url = "${pageContext.request.contextPath}/faq/modifyRow"
			$.ajax({
				url:url,
				type:"get",
				data:{srl:idx},
				dataType:"html",
				contentType:"text/html; charset:utf-8",
				success:function(d){
					if(d=="notMaster"){
						alert("게시물을 수정할 수 없습니다. 관리자로 로그인해주세요.");
						location.href = "${pageContext.request.contextPath}/member/login";
					}
					else if(d=="modifyFail"){
						alert("게시물 수정을 실패하였습니다.");						
					}
					else{
						$('#list').html(d);
					}
				},
				error:function(e){
					alert("실패:"+e.status+":"+e.statusText);
				}
			});
	}
</script>
<c:forEach items="${lists }" var="row">
	<div style="font-size: 1.5em; color: black;" id="noticeText_${row.notice_srl }">
		<div class="col-xs-3 col-md-3">${row.notice_srl }</div>
		<div class="col-xs-3 col-md-3">${row.title }</div>
		<div class="col-xs-4 col-md-4">${row.contents }</div>
		<div class="col-xs-2 col-md-2">${row.postdate }</div>	
	<c:choose>
		<c:when
			test="${not empty loginUserInfo && loginUserInfo.is_admin=='Y'}">
			<div>
				<button type="button" class="btn btn-primary" onclick="javascript:modifyRow(${row.notice_srl});" style="color: black;">수정하기</button>
				<button type="button" class="btn btn-primary" onclick="javascript:deleteRow(${row.notice_srl});" style="color: black;">삭제하기</button>				
			</div>
		</c:when>
	</c:choose>
	</div>
</c:forEach>
<div class="pagination">${pagingDiv }</div>

<c:choose>
	<c:when
		test="${not empty loginUserInfo && loginUserInfo.is_admin=='Y'}">
		<div>
			<button type="button" onclick="location.href='${pageContext.request.contextPath}/faq/writeRow'" style="color: black;">글쓰기</button>			
			&nbsp;
		</div>
	</c:when>
</c:choose>