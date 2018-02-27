<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/view.css" />
<script type="text/javascript">

</script>

	<!-- Body영역 -->
	<div class="row" id="row-body-view">
		<div class="col-lg-4 col-md-3 col-sm-2 col-xs-1"></div>
		<div class="col-lg-4 col-md-6 col-sm-8 col-xs-10">
			<!-- 뷰 머리 -->
			<div class="view-head">
				<p class="p-title">시공사례 대표이미지</p>
				<img class="img-responsive" src="../images/tile4.jpg"
					style="height: 500px; width: 100%;" /> <br />
				<div class="title">
					<p class="p-title">제목</p>
					<h4>${view.title }</h4>
				</div>
			</div>
			<!-- 뷰 별평가 -->
			<div class="view-star">
				<img src="../images/star.png" /> <img src="../images/star.png" />
				<img src="../images/star.png" /> <img src="../images/star.png" />
				<img src="../images/star.png" />
				<p>15개의 평가</p>
			</div>
			<!-- 뷰 상세내용 -->
			<div class="view-body">
				<div class="contents">
					<p class="p-title">서비스내용</p>
					<div class="textarea">
						${view.contents }
					</div>
				</div>
				<div class="need-contents">
					<p class="p-title">필수사항</p>
					<div class="form-inline">
						<p>서비스지역 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp; ${view.location }
						</p>
						<p>서비스기간 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;
							${view.service_time_start } ~ ${view.service_time_end }</p>
						<p>서비스비용 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;
							${view.service_cost }원</p>
						<p>연락가능시간 &nbsp;&nbsp;: &nbsp;&nbsp; ${view.contact_time_start } ~ ${view.contact_time_end }</p>
					</div>
				</div>
				<div class="images">
					<p class="p-title">시공사례 이미지</p>
					<img class="img-responsive" src="../images/tile1.jpg" /><br /> <img
						class="img-responsive" src="../images/tile2.jpg" /><br /> <img
						class="img-responsive" src="../images/tile3.jpg" /><br />
				</div>
			</div>

			<!-- 뷰페이지 버튼부분 -->
			<div class="view-btn">
				<button type="button" class="btn btn-success" id="btn-modify">수정하기</button>
				<button type="button" class="btn btn-success" id="btn-delete">삭제하기</button>
				<button type="button" class="btn btn-success" id="btn-list">목록보기</button>
			</div>


			<!-- 요청&댓글부분 -->
			<div class="view-comment-head">
				<div class="container">
					<ul class="nav nav-tabs" id="nav-tabs">
						<li class="active"><a data-toggle="tab" href="#home">채택요청</a></li>
						<li><a data-toggle="tab" href="#menu1">댓글후기</a></li>
					</ul>
					<div class="tab-content">
						<!-- 요청리스트부분 -->
						<div id="home" class="tab-pane fade in active">
							<div class="write-comment">
								<div class="table-responsive">
									<table class="table table-hover" id="table-hover">
										<thead>
											<tr class="success">
												<th>아이디</th>
												<th colspan="2">채택내용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>wncks2121</td>
												<td>6평짜리 화장실 타일공사 부탁드려요 기술자님</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>
											<tr>
												<td>kosmo14</td>
												<td>싱크대 타일좀 공사해주세요 채택부탁드립니다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>
											<tr>
												<td>love12</td>
												<td>저희집 부탁드립니다. 평당 10만원에 가능하나요?</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>
											<tr>
												<td>choose432</td>
												<td>수도설비 공사 해드립니다.!!!</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>
											<tr>
												<td>cake1134</td>
												<td>싱크대 타일좀 공사해주세요. 저희 동네는 강원도입니다. 자꾸 타일이 떨어지네요
													빠른공사부탁드려요</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>
											<tr>
												<td>monotein</td>
												<td>타일장인이 타일붙여드립니다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>
											<tr>
												<td>wncks2121</td>
												<td>화장실 타일,도기 공사해드립니다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>
											<tr>
												<td>kosmo14</td>
												<td>돈 더 드리겠습니다. 빨리 해주세요!! 지역은 인천이고요 6평짜리 화장실과 주방벽타일
													공사부탁드립니다. 2배로 돈드리겠습니다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>
											<tr>
												<td>love12</td>
												<td>싱크대 타일좀 공사해주세요.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>
											<tr>
												<td>choose432</td>
												<td>저희집 부탁드립니다.@@@!</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">채택하기</button>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
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
											<li><a href="#"><span
													class="glyphicon glyphicon-forward"></span></a></li>
										</ul>
									</div>
								</div>
								<div class="view-comment-write">
									<div class="form-inline">
										<textarea class="form-control" placeholder="채택요청을 입력하세요"></textarea>
										<button type="button" class="btn">등록</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 댓글후기 리스트 -->
						<div id="menu1" class="tab-pane fade">
							<div class="write-comment">
								<div class="table-responsive">
									<table class="table table-hover" id="table-hover">
										<thead>
											<tr class="info">
												<th>아이디</th>
												<th colspan="2">댓글내용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>wncks2121</td>
												<td>공사 잘 마무리를 해주십니다. 별 5개짜리 기술자입니다. 강추해드려요!!</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>
											<tr>
												<td>kosmo14</td>
												<td>저희 집공사 해주셨는데 그저 그래요 그래도 친절하긴합니다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>
											<tr>
												<td>love12</td>
												<td>매너 좋으시고 자기 집처럼 공사해주십니다.!!! 강추드려요</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>
											<tr>
												<td>choose432</td>
												<td>아!!! 강 력 추 천 입 니 다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>
											<tr>
												<td>cake1134</td>
												<td>사진보세요. 깔끔하게 줄눈이 예술적으로 떨어집니다. 감탄밖에 나오지 않아요
													빠른공사감사드립니다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>
											<tr>
												<td>monotein</td>
												<td>굿굿굿 좋습니다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>
											<tr>
												<td>wncks2121</td>
												<td>별로예요. 전 별로였습니다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>
											<tr>
												<td>kosmo14</td>
												<td>음.. 남편을 마음에 들어하지만 전 별로예요.. 싼맛에 했습니다.</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>
											<tr>
												<td>love12</td>
												<td>굿잡입니다. 굿굿</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>
											<tr>
												<td>choose432</td>
												<td>잘 공사해주셨서 감사해요!</td>
												<td>
													<button type="button" class="btn btn-default"
														id="btn-select">댓글삭제</button>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
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
											<li><a href="#"><span
													class="glyphicon glyphicon-forward"></span></a></li>
										</ul>
									</div>
								</div>
								<div class="view-comment-write">
									<div class="form-inline">
										<textarea class="form-control" placeholder="채택요청을 입력하세요"></textarea>
										<button type="button" class="btn">등록</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-3 col-sm-2 col-xs-1"></div>
	</div>