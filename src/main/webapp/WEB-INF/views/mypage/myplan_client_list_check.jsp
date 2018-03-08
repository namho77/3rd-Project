<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="table-responsive">
	<table class="table table-hover" id="table-hover">
		<thead>
			<tr class="warning">
				<th>서브카테고리</th>
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
	</table>
</div>