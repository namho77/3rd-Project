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
<!--[if lt IE 7]>      <html class="no-js sidebar-large lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js sidebar-large lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js sidebar-large lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js sidebar-large"> <!--<![endif]-->

<head>
    <!-- BEGIN META SECTION -->
    <meta charset="utf-8">
    <title>Pixit - Responsive Boostrap3 Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="" name="description" />
    <meta content="themes-lab" name="author" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/favicon.png">
    <!-- END META SECTION -->
    <!-- BEGIN MANDATORY STYLE -->
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/icons/icons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/plugins.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/pixit/admin/assets/css/style.min.css" rel="stylesheet">
    <link href="#" rel="stylesheet" id="theme-color">
    <!-- END  MANDATORY STYLE -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body data-page="members">
 
 	<!-- BEGIN TOP MENU -->
		<%@include file="common/common_top.jsp" %>
	<!-- END TOP MENU -->
	<!-- BEGIN WRAPPER -->
	<div id="wrapper">
	
	<!--  left side bar -->
	<%@include file ="common/common_left.jsp" %>

        <!-- BEGIN MAIN CONTENT -->
        <div id="main-content">
            <div class="page-title"> <i class="icon-custom-left"></i>
                <h2>Members <small>list of users registered</small></h2>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="text" id="member-finder" class="form-control" placeholder="Search a member...">
                                </div>
                                <div class="col-md-8 align-right m-t-10">
                                    <span class="c-gray m-r-20">Filter by
                                        <a href="#" class="m-l-10 m-r-5">Date</a> 
                                        <span class="c-gray-light">/</span> 
                                        <a href="#" class="m-l-5 m-r-5">Name</a> 
                                        <span class="c-gray-light">/</span> 
                                        <a href="#" class="c-blue m-l-5">City</a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar1_big.png" alt="avatar 1" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>John Snow</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> cameso@it.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/jsnow</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 6 may 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> New York</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar2_big.png" alt="avatar 2" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Bobby Brown</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> brown@gmail.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/bbrown</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 2 may 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Chicago</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar10_big.png" alt="avatar 3" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Melissa Johnson</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> m-johnson@yahoo.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/mjohnson</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 28 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Miami</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar6_big.png" alt="avatar 5" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Meggan Miller</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> m-miller@outlook.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/mmiller</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 26 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Paris</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar8_big.png" alt="avatar 4" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Scott Thomson</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> s-thomson@gmail.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/sthomson</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 24 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Boston</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar6_big.png" alt="avatar 6" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Samantha Harris</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> s-harris@yahoo.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/sharris</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 23 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Los Angeles</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar7_big.png" alt="avatar 7" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Alfred Benson</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> a-benson@it.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/abenson</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 22 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> New York</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar8_big.png" alt="avatar 8" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Kim Addams</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> k-addams@hotmail.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/kaddams</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 20 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Madrid</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar9_big.png" alt="avatar 9" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Melissa Johnson</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> m-johnson@yahoo.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/mjohnson</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 28 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Miami</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar10_big.png" alt="avatar 10" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Harold Maxwell</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> h-maxwell@yahoo.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/hmaxwell</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 22 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Chicago</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar11_big.png" alt="avatar 11" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Morris Phillip</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> m-phillip@gmail.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/mphillip</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 20 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Harlem</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 member-entry">
                                    <div class="row member">
                                        <div class="col-xs-3">
                                            <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar12_big.png" alt="avatar 12" class="pull-left img-responsive">
                                        </div>
                                        <div class="col-xs-9">
                                            <h3 class="m-t-0 member-name"><strong>Eddy Malon</strong></h3>
                                            <div class="pull-left">
                                                <p><i class="fa fa-envelope-o c-gray-light p-r-10"></i> e-malon@yahoo.com</p>
                                                <p><i class="fa fa-facebook c-gray-light p-r-10"></i> facebook.com/emalon</p>
                                            </div>
                                            <div class="pull-right align-right">
                                                <p><i class="fa fa-calendar c-gray-light p-r-10"></i> 15 april 2014</p>
                                                <p><i class="fa fa-map-marker c-gray-light p-r-10"></i> Sydney</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="m-t-30 align-center">
                               <ul class="pagination">
                                    <li><span><i class="fa fa-angle-left c-gray-light"></i></span></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><span>...</span></li>
                                    <li><a href="#">9</a></li>
                                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT -->
    </div>
    <!-- END WRAPPER -->
    <!-- BEGIN CHAT MENU -->
    <nav id="menu-right">
        <ul>
            <li class="mm-label label-big">ONLINE</li>
            <li class="img no-arrow have-message">
                <span class="inside-chat">
                    <i class="online"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/>
                    <span class="chat-name">Alexa Johnson</span>
                    <span class="pull-right badge badge-danger hide">3</span>
                    <span>Los Angeles</span>
                </span>
                <ul class="chat-messages">
                    <li class="img">
                        <span>
                            <span class="chat-detail">
                                <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/>
                                <span class="chat-bubble"><span class="bubble-inner">Hi you!</span></span>
                            </span>
                        </span>
                    </li>
                    <li class="img">
                        <span>
                            <span class="chat-detail">
                                <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/>
                                <span class="chat-bubble"><span class="bubble-inner">You there?</span></span>
                            </span>
                        </span>
                    </li>
                    <li class="img">
                        <span>
                            <span class="chat-detail">
                                <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3"/>
                                <span class="chat-bubble">
                                    <span class="bubble-inner">Let me know when you come back</span>
                                </span>
                            </span>
                        </span>
                    </li>
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="online"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar2.png" alt="avatar 2"/>
                    <span class="chat-name">Bobby Brown</span>
                    <span>New York</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="busy"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar13.png" alt="avatar 13"/>
                    <span class="chat-name">Fred Smith</span>
                    <span>Atlanta</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="away"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4.png" alt="avatar 4"/>
                    <span class="chat-name">James Miller</span>
                    <span>Seattle</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="online"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar5.png" alt="avatar 5"/>
                    <span class="chat-name">Jefferson Jackson</span>
                    <span>Los Angeles</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="mm-label label-big m-t-30">OFFLINE</li>

            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar6.png" alt="avatar 6"/>
                    <span class="chat-name">Jordan</span>
                    <span>Savannah</span>
                </span>
                <ul class="chat-messages">
                   <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar7.png" alt="avatar 7"/>
                    <span class="chat-name">Kim Addams</span>
                    <span>Birmingham</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar8.png" alt="avatar 8"/>
                    <span class="chat-name">Meagan Miller</span>
                    <span>San Francisco</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                        <i class="offline"></i>
                        <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar9.png" alt="avatar 9"/>
                        <span class="chat-name">Melissa Johnson</span>
                        <span>Austin</span>
                    </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar12.png" alt="avatar 12"/>
                    <span class="chat-name">Nicole Smith</span>
                    <span>San Diego</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar11.png" alt="avatar 11"/>
                    <span class="chat-name">Samantha Harris</span>
                    <span>Salt Lake City</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
            <li class="img no-arrow">
                <span class="inside-chat">
                    <i class="offline"></i>
                    <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar10.png" alt="avatar 10"/>
                    <span class="chat-name">Scott Thomson</span>
                    <span>Los Angeles</span>
                </span>
                <ul class="chat-messages">
                    <li>
                        <span class="chat-input">
                            <input type="text" class="form-control send-message" placeholder="Type your message" />
                        </span>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
    <!-- END CHAT MENU -->
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
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/plugins/quicksearch/jquery.quicksearch.js"></script>
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/members.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/pixit/admin/assets/js/application.js?v=155"></script>
</body>
</html>
