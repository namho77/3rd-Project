<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	//ajax json데이터 캐쉬 방지
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="메인">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>기술자 게시판|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_1.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonTop_2.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonBottom.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="http://abusinesstheme.com/demo/voyo/assets/images/favicon.ico">
<link rel="apple-touch-icon" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="144x144" href="http://abusinesstheme.com/demo/voyo/assets/images/apple-touch-icon-144x144.png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list2.css" />
<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>





<script type="text/javascript">
$(document).ready(function(){
	
	getBoardList(1,'E',"${category_srl}","${subcategory_srl}");
	
	//글쓰기 폼이동
	$('#write').click(function(){		
		$.ajax({
			url : "${pageContext.request.contextPath}/board/engineer/write",
			type : "get",
			contentType : "text/html; charset:UTF-8",
			success : function(d){
				$('#row-body').html(d);
			},
			error : function(e){
				alert("요청실패 : "+e.status+" : "+e.statusText);
			}
		});
	});	
});

function boardPaging(nowPage, board_type, category_srl, subcategory_srl) {
	getListFAQ(nowPage, board_type, category_srl, subcategory_srl);
}

//세자리 콤마
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function getBoardList(nowPage, board_type, category_srl, subcategory_srl) {
	   nowPage = typeof nowPage !== 'undefined' ? nowPage : 1;

	   //service_srl = typeof service_srl !== 'undefined' ? service_srl : 1;

	   var url = "${pageContext.request.contextPath}/board/engineer/json/board_list.json";
	   
	   var inHTML = "";

	   //inHTML += "<div class=\"table-responsive\">";
	      inHTML += "<table class=\"table table-hover\">";
	         inHTML += "<colgroup>";
	            inHTML += "<col width=\"12%\">";
	            inHTML += "<col width=\"*%\">";
	            inHTML += "<col width=\"12%\">";
	            inHTML += "<col width=\"14%\">";
	            inHTML += "<col width=\"10%\">";
	            inHTML += "<col width=\"10%\">";
	         inHTML += "</colgroup>"
	         inHTML += "<thead>";
	         inHTML += "<tr>";
	            inHTML += "<th>아이디</th>";
	            inHTML += "<th>제목</th>";
	            inHTML += "<th>예상비용</th>";
	            inHTML += "<th>서비스기간</th>";
	            inHTML += "<th>지역</th>";
	            inHTML += "<th>조회수</th>";
	         inHTML += "</tr>";
	         inHTML += "</thead>";
	         inHTML += "<tbody>";
	      
	   var inHTMLPaging = "";
	   $("#boardBody").empty();
	   var params = "nowPage="+nowPage+"&board_type="+board_type+"&category_srl="+category_srl+"&subcategory_srl="+subcategory_srl;
	   var service_cost;
	   //alert(url); 디버깅용
	   //alert(params); 디버깅용
	   $.ajax({
	      url : url,
	      dataType : "json",
	      type : "get",
	      data : params,
	      contentType : "text/html; charset=utf-8",
	      success : function(data) {
	         $.each(data.boardLists, function(index, lists) { // each로 모든 데이터 가져와서 items 배열에 넣고
         
	            inHTML += "<tr>";
	               inHTML += "<td>"+lists.user_id+"</td>";
	               inHTML += "<td><a href=\"javascript:viewPage("+lists.board_srl+")\">"+lists.title+"</a></td>";
	               
	               service_cost = numberWithCommas(lists.service_cost);
	               
	               inHTML += "<td>"+service_cost+"</td>";
	               inHTML += "<td>"+lists.service_time_start+"<br/> ~ "+lists.service_time_end+"</td>";
	               inHTML += "<td>"+lists.location+"</td>";
	               inHTML += "<td>"+lists.visitcount+"</td>";
	            inHTML += "</tr>";

	         });//each끝
	         inHTML += "</tbody>";
	      inHTML += "</table>";
	      
	      inHTML += "<div class=\"row text-center\">";
	      inHTML += "<ul class=\"pagination\" id=\"boardPagingDiv\">";
	      inHTML += "</ul></div>";
	   //inHTML += "</div>";
	      
	      if (jQuery.isEmptyObject(data.boardLists)) {
	         $('#boardBody').html("<div class=\"row\"><br/><br/><br/><br/><br/><br/><br/><b>해당 하는 검색 결과가 없습니다.</b><br/><br/><br/><br/><br/><br/><br/><br/></div>");
	      } else {
	         $('#boardBody').html(inHTML);
	      }
	         $("#boardPagingDiv").html(data.pagingDiv);
	      },
	      error : function(e) {
	         alert("AJAX Error 발생" + e.status + ":" + e.statusText);
	      }
	   });
	}

//글 읽기
function viewPage(board_srl){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/board/engineer/"+board_srl,
		dataType : "html",
		type : "get",
		contentType : "text/html; charset:utf-8",
		success : function(d){
			
			$('#row-body').html(d);
			
		},
		error : function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
 
/* function paging(pNum){
	$.ajax({
		url : "./engineer/list",
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
} */
</script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
</head>
<body>
<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div id="wrapper" class="preloader_hide">

		<!-- header section -->
			<%@ include file="../../common/commonTop_1.jsp"%>
		<!--// header section -->
		<!-- header section -->
			<%@ include file="../../common/commonTop_2.jsp"%>
		<!--// header section -->
		

		<!-- 모달창 메시지 -->
			<%@ include file="../../common/modal_msg.jsp"%>
		<!--// 모달창 메시지 -->


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
		<div class="table-responsive" id="boardBody">
			<%-- <table class="table table-hover" id="table-hover">
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
							<td><fmt:formatNumber value="${lists.service_cost }"/></td>
							<td>${lists.service_time_start } <br /> ~ ${lists.service_time_end }</td>
							<td>${lists.location }</td>
							<td>${lists.visitcount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table> --%>
		</div>
		
	</div>
	<div class="col-lg-3 col-sm-2 col-xs-1"></div>
</div>
<!-- Bottom영역 -->
	<div class="row">
		<%@ include file="../../common/commonBottom.jsp"%>
	</div>
	</div>
</body>
</html>
