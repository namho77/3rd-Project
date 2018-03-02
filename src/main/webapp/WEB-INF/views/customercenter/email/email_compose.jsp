<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico">

    <!-- BEGIN MANDATORY STYLE -->
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/icons/icons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/plugins.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/style.min.css" rel="stylesheet">
    <link href="#" rel="stylesheet" id="theme-color">
    <!-- END  MANDATORY STYLE -->
    <!-- BEGIN PAGE LEVEL STYLE -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/summernote/summernote.css">
    <!-- END PAGE LEVEL STYLE -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    
    


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script>
	$(document).ready(function() {

	});
</script>

</head>

<body>
	<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- HEADER -->

		<%@ include file="../../common/top_main2.jsp"%>

		<!-- HOME -->
		<section id="main" class="section">

			<!-- CONTAINER -->
			<div class="container ">
				    <!-- BEGIN WRAPPER -->
 
            <div class="page-title"> <i class="icon-custom-left"></i>
                <h3><strong>New</strong> Message</h3>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="border-bottom">
                                        <div class="pull-left">
                                            <a href="#" class=" btn btn-default"><i class="fa fa-arrow-left fa-fw"></i> back</a> 
                                        </div>
                                        <div class="pull-left p-l-20">
                                            <a href="#" class=" btn btn-success"><i class="fa fa-floppy-o fa-fw"></i> Save Draft</a>
                                        </div>
                                        <div class="clearfix m-b-20"></div>
                                    </div>
                                    <form class="form-horizontal p-t-20" role="form">
                                        <div class="form-group">
                                            <label for="to" class="col-sm-2 control-label">To:</label>
                                            <div class="col-sm-10">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="to" />
                                                    <span class="input-group-addon bg-white cursor-pointer" data-toggle="collapse" data-target="#cc">
                                                        CC/BCC <span class="caret"></span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="cc" class="collapse">
                                            <div class="form-group">
                                                <label for="Cc" class="col-sm-2 control-label">Cc:</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="Cc" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Bcc" class="col-sm-2 control-label">Bcc:</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" id="Bcc">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Bcc" class="col-sm-2 control-label">From:</label>
                                            <div class="col-sm-6">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default dropdown-toggle width-230" data-toggle="dropdown">
                                                        <i class="fa fa-ellipsis-horizontal"></i><span class="float-left"><strong>contact@Pixit.com</strong></span>
                                                        <span class="float-right"><i class="fa fa-angle-down"></i></span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li>
                                                            <a href="#">contact@Pixit.com</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="Bcc" class="col-sm-2 control-label">Signature:</label>
                                            <div class="col-sm-6">
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-default dropdown-toggle width-230" data-toggle="dropdown">
                                                        <i class="fa fa-ellipsis-horizontal"></i><span class="float-left"><strong>Signature</strong></span> 
                                                        <span class="float-right"><i class="fa fa-angle-down"></i></span>
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li>
                                                            <a href="#">Signature</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </form>
                                    <div class="summernote"></div>
                                    <div class="text-center footer-message">
                                        <a href="#" class="btn btn-default"><i class="fa fa-times-circle"></i> Cancel</a>
                                        <a href="#" class="btn btn-primary"><i class="fa fa-share fa-fw"></i> Send email</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        <!-- END MAIN CONTENT -->


    </div>
			</div>
			<!-- //CONTAINER -->


		</section>
		<!-- //HOME -->

		<!-- 모달창 -->
		<%@ include file="../../common/modal_msg.jsp"%>
		<!-- //모달창 끝 -->


		<!-- Footer section(하단부분) -->
		<%@ include file="../../common/bottom.jsp"%>
		<!-- Footer section(하단부분) -->

	</div>
	
	 <!-- BEGIN MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-1.11.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-migrate-1.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-ui/jquery-ui-1.10.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery-mobile/jquery.mobile-1.4.2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/bootstrap-dropdown/bootstrap-hover-dropdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/bootstrap-select/bootstrap-select.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/mmenu/js/jquery.mmenu.min.all.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/nprogress/nprogress.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/charts-sparkline/sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/breakpoints/breakpoints.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/numerator/jquery-numerator.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
    <!-- END MANDATORY SCRIPTS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/summernote/summernote.min.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js"></script>
</body>
</html>
