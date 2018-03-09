<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	var editor_object = [];
	var ctx = sessionStorage.getItem("contextpath");
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : editor_object,
		elPlaceHolder : "contents",
		sSkinURI : ctx + "/resources/smarteditor/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
			fOnBeforeUnload : function() {

			}
		}
	});
	
			
	//글쓰기
	$('#modifyActionBtn').click(function(){
		
		//폼값 검증
		if($("input[type='text'][name='title']").val()==""){
			alert("제목을 입력해주세요");
			$("input[type='text'][name='title']").focus();
			return;
		}
	
		//id가 smarteditor인 textarea에 에디터에서 대입
		editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		
		// 이부분에 에디터 validation 검증
		var el = document.createElement('html');
		el.innerHTML = editor_object.getById["contents"].elPlaceHolder.value;
		
        var ir1 = $("#contents").val();

        if( ir1 == ""  || ir1 == null || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>')  {
             alert("내용을 입력하세요.");
             editor_object.getById["contents"].exec("FOCUS"); //포커싱
             return;
        }
	/* 	if($("textarea[name='contents']").val()==""){
			alert("내용을 입력해주세요");
			$("textarea[name='contents']").focus();
			return;
		} */
		if($("input[type='text'][name='service_time_start']").val()==""){
			alert("서비스 시작 기간을 입력해주세요");
			$("input[type='text'][name='service_time_start']").focus();
			return;
		}
		if($("input[type='text'][name='service_time_end']").val()==""){
			alert("서비스 종료 기간을 입력해주세요");
			$("input[type='text'][name='service_time_end']").focus();
			return;
		}
		if($("input[type='text'][name='service_cost']").val()==""){
			alert("서비스 종료 기간을 입력해주세요");
			$("input[type='text'][name='service_cost']").focus();
			return;
		}
		if($("input[type='text'][name='contact_time']").val()==""){
			alert("연락 가능 시간을 입력해주세요");
			$("input[type='text'][name='contact_time']").focus();
			return;
		}
		
		//폼값 전송
		var params = $('#modifyFrm').serialize();
		
		$.ajax({
			url : "./myplan/modifyAction",
			dataType : "json",
			type : "post",
			//contentType : "text/html; charset=utf-8",
			data : params,
			success : function(d) {
				if(d.code == "SUCCESS"){
					alert(d.message);
					location.href = "./myplan";
				}
				else if(d.code == "login"){
					alert(d.message);
					location.href = "../member/login";
				}
				else{
					alert(d.message);
				}
			},
			error : function(e){
				alert("요청실패:"+e.status+" "+e.statusText);
			}
		});
	});
});
</script>

<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

	
		<!-- <form id="writeFrm"> -->
		<form id="modifyFrm">
			
			<input type="hidden" name="user_id" value="${sessionScope.loginUserInfo.user_id }" />
			<input type="hidden" name="board_srl" value="${vo.board_srl }" />
			<input type="hidden" name="board_type" value="E" />
		 	<input type="hidden" name="category_srl" value="1" />
			<input type="hidden" name="subcategory_srl" value="1" />
			
			<div class="row" id="row-body-write" style="margin-top: 0px; padding-bottom: 0px; padding-left: 15px; padding-right: 15px; text-align: left;">
			
				
					<div class="write-body">
						<div class="title">
							<p class="p-title">제목</p>
							<input type="text" class="form-control" placeholder="제목을 입력하세요" name="title" value="${vo.title }"/>
						</div>
						<div class="contents">
							<p class="p-title">서비스내용</p>
							
							
							<textarea class="form-control" name="contents" id="contents" 
								rows="10" cols="80" placeholder="서비스 내용을 입력하세요">${vo.contents }</textarea>	
						</div>
						<div class="need-contents">
							<p class="p-title">필수사항</p>
							<div class="form-inline">
								<p>
									서비스지역 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;
									<input name="location"
										class="form-control" id="input-area" type="text"
										style="display: inline;" placeholder="지역을 입력하세요" value="${vo.location }"/>
								</p>
								<p>
									서비스기간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;
									<input name="service_time_start"
										class="form-control" id="input-time-s" type="text"
										placeholder="이때부터" value="${vo.service_time_start }"/>&nbsp; ~ &nbsp;
									<input name="service_time_end"
										class="form-control" id="input-time-e" type="text" placeholder="여기까지" value="${vo.service_time_end }"/>
								</p>
								<p>
									서비스비용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;
									<input name="service_cost"
										class="form-control" id="input-cost" type="text"
										placeholder="비용을 입력하세요" value="${vo.service_cost }"/>
								</p>
								<p>
									연락가능시간 &nbsp;&nbsp;: &nbsp;&nbsp;
									<input name="contact_time_start"
										class="form-control" id="input-call" type="text" 
										placeholder="연락가능시간을 입력하세요" value="${vo.contact_time_start }"/>
										
										~
										
									<input name="contact_time_end"
										class="form-control" id="input-call" type="text" 
										placeholder="연락가능시간을 입력하세요" value="${vo.contact_time_end }"/>
								</p>
							</div>
						</div>
						<div class="images">
							<!-- <p class="p-title">
								<img src="" alt="메인 이미지" id="main_image"/>
							</p>
							
							<p class="p-title">
								<img src="" alt="컨텐츠 이미지" id="contents_image"/>
							</p> -->
						</div>
					</div>
					<div class="write-btn">
						<button type="button" class="btn btn-success" style="height: 35px; width: 100px; border-radius: 0px; margin-bottom: 120px;"
						id="modifyActionBtn">수정하기</button>
					</div>
				
				
			</div>
		</form>
  