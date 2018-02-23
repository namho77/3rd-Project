<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(document).ready(function() {
	$('#modifyAction').click(function(){
		if ($("textarea[name='contents']").val() == "") {
			alert("내용을 입력해주세요.");
			$("textarea[name='contents']").focus();
			return;
		} else if ($("input[name='title']").val() == "") {
			alert("제목을 입력해주세요.");
			$("input[name='title']").focus();
			return;
		}

		var params = $('#modifyFrm').serialize();
		var url = "${pageContext.request.contextPath}/notice/modifyRowAction";

		$.ajax({
					url : url,
					dataType : "json",
					type : "get",
					contentType : "text/html; charset=utf-8",
					data : params,
					success : function(d) {
						if (d.modifyCode == 1) {
							alert("글입력완료");
							location.href = "${pageContext.request.contextPath}/notice/aBoard";
						} else if (d.modifyCode == 0) {
							alert("글입력실패");
						} else if (d.modifyCode == 2) {
							alert("관리자로그인을 하세요.");
							location.href = "${pageContext.request.contextPath}/member/login";
						}
					},
					error : function(e) {
						alert("작성실패:" + e.status + ":" + e.statusText);
					}
				});
	});	
});
</script>
<!-- test용 시작-->
<div class="col-xs-4 col-md-4"></div>
<div class="col-xs-6 col-md-6">
	<form id="modifyFrm">
		<input type="hidden" value="${modify.notice_srl }" name="srl" />
		<table>
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" style="width: 100px" name="title"
						value="${modify.title }" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="contents" rows="10" style="color: black;">${modify.contents }</textarea></td>
				</tr>
			</tbody>
		</table>
		<button type="button" id="modifyAction" style="color: black;">글수정하기</button>
		<button type="reset" style="color: red;">Reset</button>
	</form>
</div>

<div class="col-xs-2 col-md-2"></div>
<!-- test용 끝 -->