<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade " id="layer_msg" tabindex="-1" role="dialog" aria-labelledby="layer_msg_title" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="layer_msg_title">알림</h4>
			</div>
			<div class="modal-body" id="layer_msg_content">...</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
	//레이어 팝업창 (alert 왠만하면 쓰지말자.. 사용자가 짜증나니깐)
	var modalVerticalCenterClass = ".modal";

	function popModal(modalSelector) {
		$(modalSelector).modal();
	}

	function centerModals($element) {
		var $modals;
		if ($element.length) {
			$modals = $element;
		} else {
			$modals = $(modalVerticalCenterClass + ':visible');
		}
		$modals.each(function(i) {
			var $clone = $(this).clone().css('display', 'block').appendTo(
					'body');
			var top = Math.round(($clone.height() - $clone.find(
					'.modal-content').height()) / 2);
			top = top > 0 ? top : 0;
			$clone.remove();
			$(this).find('.modal-content').css("margin-top", top);
		});
	}

	function popLayerMsg(msg) {
		$("#layer_msg_content").empty();
		$("#layer_msg_content").append("<p>" + msg + "</p>");
		$("#layer_msg").modal();

	}

	$(modalVerticalCenterClass).on('show.bs.modal', function(e) {
		centerModals($(this));
	});

	$(window).on('resize', centerModals);
</script>

<c:if test="${not empty layer_msg}">

	<c:choose>
		<c:when test="${not empty error_msg}">
			<script>
				$(document).ready(function() {
					popLayerMsg("${layer_msg} <br/> ${error_msg}");
				});
			</script>
		</c:when>

		<c:otherwise>
			<script>
				$(document).ready(function() {
					popLayerMsg("${layer_msg}");
				});
			</script>
		</c:otherwise>
	</c:choose>

</c:if>