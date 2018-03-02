<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list2.css" />
<script type="text/javascript">
$(document).ready(function(){
	
	
	//글쓰기 폼이동
	$('#write').click(function(){		
		$.ajax({
			url : "./client/write",
			type : "get",
			contentType : "text/html; charset:UTF-8",
			success : function(d){
				$('#boardHTML').html(d);
			},
			error : function(e){
				alert("요청실패 : "+e.status+" : "+e.statusText);
			}
		});
	});	
});
//상세보기 폼으로 이동하기
function viewPage(board_srl){
	
	$.ajax({
		url : "./client/view",
		dataType : "html",
		type : "get",
		contentType : "text/html; charset:utf-8",
		data : {board_srl : board_srl},
		success : function(d){
			
			$('#boardHTML').html(d);
			
		},
		error : function(e){
			alert("요청실패:"+e.status+"  "+e.statusText);
		}
	});
}

function paging(pNum){
	$.ajax({
		url : "./client/list",
		dataType : "html",
		type : "get",
		contentType : "text/html; charset:UTF-8",
		data : {nowPage:pNum},
		success : function(d){
			$('#boardHTML').html(d); 
		},
		error : function(d){
			alert("실패 : "+d);
		}
	});
}
</script>


<div class="row" id="row-body">
	<div class="col-lg-3 col-sm-2 col-xs-1"></div>
	<div class="col-lg-6 col-sm-8 col-xs-10">
		<!-- 상단 버튼부분 -->
		<div class="row" id="table-btn">
			<div class="col-xs-5">
				<button type="button" class="btn btn-default" id="engineer-btn">기술자
					게시판</button>
				<button type="button" class="btn btn-default" id="customer-btn">의뢰인
					게시판</button>
			</div>
			<form class="form-inline" action="#">
				<div class="from-group col-xs-3" id="from-group">
					<select class="form-control" id="select-form-control">
						<option value="title">제목</option>
						<option value="mbid">작성자</option>
						<option value="content">내용</option>
					</select>
				</div>
				<div class="input-group col-xs-4">
					<input type="text" class="form-control" placeholder="검색어"
						name="search" id="form-control" />
					<div class="input-group-btn">
						<button class="btn btn-default" id="btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
						<button type="button" class="btn btn-success" id="write">글쓰기</button>
					</div>
				</div>
			</form>
		</div>
		
		<!-- 리스트부분 반복 -->
		<div class="table-responsive">
			<table class="table table-hover" id="table-hover">
				<thead>
					<tr class="success">
						<th>아이디</th>
						<th>제목</th>
						<th>예상비용</th>
						<th>서비스기간</th>
						<th>지역</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="lists" items="${lists }">
						<tr>
							<td>${lists.user_id }</td>
							<td><a href="javascript:viewPage(${lists.board_srl })">${lists.title }</a></td>
							<td>${lists.service_cost }</td>
							<td>${lists.service_time_start } <br /> ~ ${lists.service_time_end }</td>
							<td>${lists.location }</td>
							<td>${lists.visitcount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
	<div class="col-lg-3 col-sm-2 col-xs-1"></div>
</div>

<!-- 페이징부분 -->
<div class="row text-center">
	<ul class="pagination" >
		${pagingDiv }
	</ul>
</div>
