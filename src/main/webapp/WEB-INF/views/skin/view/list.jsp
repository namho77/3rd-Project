<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link href="../bootstrap3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="../bootstrap3.3.7/jquery/jquery-3.2.1.min.js"></script>
<script src="../bootstrap3.3.7/js/bootstrap.min.js"></script>

<!-- CSS작업부분 -->
<link rel="stylesheet" href="../css/commonTop_1.css" />
<link rel="stylesheet" href="../css/commonTop_2.css" />
<link rel="stylesheet" href="../css/commonBottom.css" />
<link rel="stylesheet" href="../css/list.css" />

<title>list</title>
</head>
<body>
	<!-- Top영역 1첫번째 -->
	<div class="row">
		<%@ include file="../common/commonTop_1.jsp"%>
	</div>

	<!-- Top영역 2첫번째 -->
	<div class="row">
		<%@ include file="../common/commonTop_2.jsp"%>
	</div>

	<!-- Body영역 -->
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
							<button type="button" class="btn btn-success"
								id="btn-success-write">글쓰기</button>
						</div>
					</div>
				</form>
			</div>
			<!-- 리스트부분 -->
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
						<tr>
							<td>wncks2121</td>
							<td>화장실 타일,도기 공사해드립니다.</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.02.23</td>
							<td>서울</td>
							<td>13</td>
						</tr>
						<tr>
							<td>kosmo14</td>
							<td>싱크대 공사해드립니다.</td>
							<td>2,500,000원</td>
							<td>18.03.09 ~ 18.03.13</td>
							<td>인천</td>
							<td>23</td>
						</tr>
						<tr>
							<td>love12</td>
							<td>전기 공사 해드립니다.</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.02.23</td>
							<td>대전</td>
							<td>13</td>
						</tr>
						<tr>
							<td>choose432</td>
							<td>수도설비 공사 해드립니다.!!!</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.02.23</td>
							<td>서울</td>
							<td>3</td>
						</tr>
						<tr>
							<td>cake1134</td>
							<td>가구 제작해드립니다.</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.06.13</td>
							<td>강릉</td>
							<td>0</td>
						</tr>
						<tr>
							<td>monotein</td>
							<td>타일장인이 타일붙여드립니다.</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.08.03</td>
							<td>인천</td>
							<td>77</td>
						</tr>
						<tr>
							<td>wncks2121</td>
							<td>화장실 타일,도기 공사해드립니다.</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.02.23</td>
							<td>서울</td>
							<td>13</td>
						</tr>
						<tr>
							<td>kosmo14</td>
							<td>싱크대 공사해드립니다.</td>
							<td>2,500,000원</td>
							<td>18.03.09 ~ 18.03.13</td>
							<td>인천</td>
							<td>23</td>
						</tr>
						<tr>
							<td>love12</td>
							<td>전기 공사 해드립니다.</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.02.23</td>
							<td>대전</td>
							<td>13</td>
						</tr>
						<tr>
							<td>choose432</td>
							<td>수도설비 공사 해드립니다.!!!</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.02.23</td>
							<td>서울</td>
							<td>3</td>
						</tr>
						<tr>
							<td>cake1134</td>
							<td>가구 제작해드립니다.</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.06.13</td>
							<td>강릉</td>
							<td>0</td>
						</tr>
						<tr>
							<td>monotein</td>
							<td>타일장인이 타일붙여드립니다.</td>
							<td>500,000원</td>
							<td>18.02.19 ~ 18.08.03</td>
							<td>인천</td>
							<td>77</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 페이징부분 -->
			<div class="container-fluid" align="center">
				<div class="pagination">
					<ul class="pagination pagination" id="pagination-ul">
						<li><a href="#"><span
								class="glyphicon glyphicon-backward"></span></a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-triangle-left"></span></a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#">10</a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-triangle-right"></span></a></li>
						<li><a href="#"><span class="glyphicon glyphicon-forward"></span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-sm-2 col-xs-1"></div>
	</div>

	<!-- Bottom영역 -->
	<div class="row">
		<%@ include file="../common/commonBottom.jsp"%>
	</div>
</body>
</html>





































