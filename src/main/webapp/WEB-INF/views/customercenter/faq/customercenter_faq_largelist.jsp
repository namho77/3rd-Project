<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function paging(pNum) {
		var url = "${pageContext.request.contextPath}/customercenter/faq/list.do"
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
	function deleteFAQ(faq_srl) {
		var url = "${pageContext.request.contextPath}/customercenter/faq/"+faq_srl
		$.ajax({
			url:url,
			type : 'delete',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			/* data : JSON.stringify({
				replytext : replytext
			}), */
			dataType:"json",
			contentType:"text/html; charset:utf-8",
			success:function(d){
				if(d.result == "fail"){
					alert("게시물 삭제에 실패하였습니다.");
				}
				else if(d.result == "success"){
					alert("게시물 삭제에 성공하였습니다.");
					$("#noticeText_"+faq_srl).hide(1000);
				}						
			},
			error:function(e){
				alert("실패:"+e.status+":"+e.statusText);
			}
		});
	}
	
	function modifyRow(faq_srl) {
		var url = "${pageContext.request.contextPath}/faq/"+faq_srl+"/edit"
			$.ajax({
				url:url,
				type:"get",
				//data:{nowPage:faq_srl},
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
	<div style="font-size: 1.5em; color: black;" id="noticeText_${row.faq_srl }">
		<div class="col-xs-3 col-md-2">${row.faq_srl }</div>
		<div class="col-xs-3 col-md-2">${row.category }</div>
		<div class="col-xs-4 col-md-2">${row.service }</div>
		<div class="col-xs-2 col-md-2">${row.title }</div>
		<div class="col-xs-2 col-md-4">${row.contents }</div>	
	<c:choose>
		<c:when
			test="${not empty loginUserInfo && loginUserInfo.is_admin=='Y'}">
			<div>
				<button type="button" class="btn btn-primary" onclick="javascript:modifyRow(${row.faq_srl});" style="color: black;">수정하기</button>
				<button type="button" class="btn btn-primary" onclick="javascript:deleteRow(${row.faq_srl});" style="color: black;">삭제하기</button>				
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