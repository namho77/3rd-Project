<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> --%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/resources/js/writeForm.js"/></script>

<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>

<script type="text/javascript">
$(document).ready(function(){
	   
	$('#listGO').click(function(){
		location.href = "./engineer";
	});
			
	$('#writeActionBtn').click(function(){
	//폼값 검증
		if($("input[type='text'][name='title']").val()==""){
			alert("제목을 입력해주세요");
			$("input[type='text'][name='title']").focus();
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
	/* 	
		//폼값전송
		var params = $('#writeFrm').serialize();	
		$.ajax({
			url : "./engineer/writeAction",
			dataType : "html",
			type : "get",
			contentType : "text/html; charset=utf-8",
			data : params,
			success : function(d){
				if(d == "loginFail"){
					alert("로그인후 작성해주세요")
					location.href = "../member/login";
				}
				else if(d=="writeSuccess"){
					alert("글쓰기를 성공하였습니다.")
					location.href = "./engineer";	
				}
				else {
					alert("글쓰기 실패!");
				}
			},
			error : function(e){
				alert("요청실패:"+e.status+" "+e.statusText);
			}
		});
		
		
		욕나온다 ㅡㅡㄴㅇㅁㅇㄴㅇ
		 */
	});
});
</script>

 <c:choose>
	<c:when test="${empty sessionScope.loginUserInfo }">
		<!-- 로그인 정보가 없다면 경고메시지를 띄우고 로그인 페이지로 이동한다. -->
		<script>
			alert("로그인 후 작성해주세요.");
			location.href="../member/login";
		</script>
	</c:when>
	<c:otherwise> 
	
		<!-- <form id="writeFrm"> -->
		<form action="./engineer/writeAction" method="post" id="frm">
			
			<input type="hidden" name="user_id" value="${sessionScope.loginUserInfo.user_id }" />
			<input type="hidden" name="board_type" value="E" />
		 	<input type="hidden" name="category_srl" value="1" />
			<input type="hidden" name="subcategory_srl" value="1" />
			
			<div class="row" id="row-body-write">
			
				<div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div>
				<div class="col-lg-6 col-md-6 col-sm-8 col-xs-10">
					<div class="write-body">
						<div class="title">
							<p class="p-title">제목</p>
							<input type="text" class="form-control" placeholder="제목을 입력하세요" name="title"/>
						</div>
						<div class="contents">
							<p class="p-title">서비스내용</p>
							
							
							<textarea class="form-control" name="contents" id="contents" 
								rows="10" cols="80" placeholder="서비스 내용을 입력하세요"></textarea>	
						</div>
						<div class="need-contents">
							<p class="p-title">필수사항</p>
							<div class="form-inline">
								<p>
									서비스지역 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;
									<input name="location"
										class="form-control" id="input-area" type="text"
										style="display: inline;" placeholder="지역을 입력하세요" />
								</p>
								<p>
									서비스기간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;
									<input name="service_time_start"
										class="form-control" id="input-time-s" type="text"
										placeholder="이때부터" />&nbsp; ~ &nbsp;
									<input name="service_time_end"
										class="form-control" id="input-time-e" type="text" placeholder="여기까지" />
								</p>
								<p>
									서비스비용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;
									<input name="service_cost"
										class="form-control" id="input-cost" type="text"
										placeholder="비용을 입력하세요" />
								</p>
								<p>
									연락가능시간 &nbsp;&nbsp;: &nbsp;&nbsp;
									<input name="contact_time_start"
										class="form-control" id="input-call" type="text" 
										placeholder="연락가능시간을 입력하세요" />
										
										~
										
									<input name="contact_time_end"
										class="form-control" id="input-call" type="text" 
										placeholder="연락가능시간을 입력하세요" />
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
						<button type="button" class="btn btn-success" id="listGO">목록보기</button>
						<button type="button" class="btn btn-success" id="writeActionBtn">글쓰기</button>
						<input type="submit" id="addBtn" value="글쓰기" />
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-2 col-xs-1"></div>
			</div>
		</form>
 	</c:otherwise>
</c:choose>	 