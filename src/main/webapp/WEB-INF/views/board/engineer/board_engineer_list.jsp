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
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>board_engineer_list</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flexslider.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-icon.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/resources/css/material-demo.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/material-dashboard.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />" rel="stylesheet">
<!-- JS FILES(자바스크립트 연결부분) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.flexslider-min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fancybox.pack.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/retina.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/modernizr.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/list.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script src="${pageContext.request.contextPath}/resources/js/meterial/material.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/perfect-scrollbar.jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/arrive.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/jquery.validate.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/moment.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/chartist.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/jquery.bootstrap-wizard.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/bootstrap-notify.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/jquery.sharrre.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/bootstrap-datetimepicker.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/jquery-jvectormap.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/nouislider.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/jquery.select-bootstrap.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/jquery.datatables.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/sweetalert2.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/jasny-bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/fullcalendar.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/jquery.tagsinput.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/material-dashboard.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
<script src="${pageContext.request.contextPath}/resources/js/meterial/demo.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>
</head>
<script type="text/javascript">
    $(document).ready(function() {
        $('#datatables').DataTable({
            "pagingType": "full_numbers",
            "lengthMenu": [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
            ],
            responsive: true,
            language: {
                search: "_INPUT_",
                searchPlaceholder: "Search records",
            }

        });


        var table = $('#datatables').DataTable();

        // Edit record
        table.on('click', '.edit', function() {
            $tr = $(this).closest('tr');

            var data = table.row($tr).data();
            alert('You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.');
        });

        // Delete a record
        table.on('click', '.remove', function(e) {
            $tr = $(this).closest('tr');
            table.row($tr).remove().draw();
            e.preventDefault();
        });

        //Like record
        table.on('click', '.like', function() {
            alert('You clicked on Like button');
        });

        $('.card .material-datatables label').addClass('form-group');
    });
</script>
<body>
<!-- PRELOADER -->
	<img id="preloader" src="${pageContext.request.contextPath}/resources/images/preloader.gif" alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">
	<!-- header section -->
		<!-- header navigation(탑1 부분) -->
			<%@ include file="../../common/top1.jsp"%>
		<!-- header navigation(탑1 부분) -->
		
		<!-- 네비게이션 탑2 부분 -->
			<header id="header" class="fixed">
				<div class="header-content clearfix">
					<nav class="navigation" role="navigation">
						<ul class="primary-nav">
							<li><a href="#works" class="field">건축</a></li>
							<li><a href="#teams" class="field">IT</a></li>
							<li><a href="#testimonials" class="field">자동차</a></li>
							<li><a href="#contact" class="field">교육</a></li>
						</ul>
					</nav>
				</div>
			</header>
	
	<!-- 내용 -->
	

	
	<div class="container">
    
    <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-icon" data-background-color="purple">
                                    <i class="material-icons">assignment</i>
                                </div>
                                <div class="card-content">
                                    <h4 class="card-title">DataTables.net</h4>
                                    <div class="toolbar">
                                        <!--        Here you can write extra buttons/actions for the toolbar              -->
                                    </div>
                                    <div class="material-datatables">
                                        <div id="datatables_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                        	<div class="row"><div class="col-sm-6"><div class="dataTables_length" id="datatables_length">
                                        	<!-- <label class="form-group form-group-sm">Show <select name="datatables_length" aria-controls="datatables" class="form-control"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="-1">All</option></select> 
                                        	entries<span class="material-input"></span>
                                        	</label> -->
                                        	</div></div><div class="col-sm-6"><div id="datatables_filter" class="dataTables_filter"><label class="form-group form-group-sm is-empty">
                                        	<!-- <input type="search" class="form-control" placeholder="Search records" aria-controls="datatables"> -->
                                        	<span class="material-input"></span></label></div></div></div><div class="row"><div class="col-sm-12"><table id="datatables" class="table table-striped table-no-bordered table-hover dataTable dtr-inline" cellspacing="0" width="100%" style="width: 100%;" role="grid" aria-describedby="datatables_info">
                                            <thead>
                                                <tr role="row"><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 185px;" aria-label="Name: activate to sort column ascending">Name</th><th class="sorting_desc" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 271px;" aria-label="Position: activate to sort column ascending" aria-sort="descending">Position</th><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 139px;" aria-label="Office: activate to sort column ascending">Office</th><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 62px;" aria-label="Age: activate to sort column ascending">Age</th><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 119px;" aria-label="Date: activate to sort column ascending">Date</th><th class="disabled-sorting text-right sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 133px;" aria-label="Actions: activate to sort column ascending">Actions</th></tr>
                                            </thead>
                                            <tfoot>
                                                <tr><th rowspan="1" colspan="1">Name</th><th rowspan="1" colspan="1">Position</th><th rowspan="1" colspan="1">Office</th><th rowspan="1" colspan="1">Age</th><th rowspan="1" colspan="1">Start date</th><th class="text-right" rowspan="1" colspan="1">Actions</th></tr>
                                            </tfoot>
                                            <tbody>
                                            
                                            <tr role="row" class="odd">
                                                    <td class="" tabindex="0">adsfa</td>
                                                    <td class="sorting_1">Technical Author</td>
                                                    <td>London</td>
                                                    <td>27</td>
                                                    <td>2011/05/07</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="even">
                                                    <td class="" tabindex="0">rqrdsafg</td>
                                                    <td class="sorting_1">Team Leader</td>
                                                    <td>San Francisco</td>
                                                    <td>22</td>
                                                    <td>2008/10/26</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr>
                                                
                                                <tr role="row" class="odd">
                                                    <td class="" tabindex="0">erwtwrtt</td>
                                                    <td class="sorting_1">Technical Author</td>
                                                    <td>London</td>
                                                    <td>27</td>
                                                    <td>2011/05/07</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="even">
                                                    <td class="" tabindex="0">vbnfgd</td>
                                                    <td class="sorting_1">Team Leader</td>
                                                    <td>San Francisco</td>
                                                    <td>22</td>
                                                    <td>2008/10/26</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr>
                    	
                                            <tr role="row" class="odd">
                                                    <td class="" tabindex="0">Prescott Bartlett</td>
                                                    <td class="sorting_1">Technical Author</td>
                                                    <td>London</td>
                                                    <td>27</td>
                                                    <td>2011/05/07</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="even">
                                                    <td class="" tabindex="0">Gavin Cortez</td>
                                                    <td class="sorting_1">Team Leader</td>
                                                    <td>San Francisco</td>
                                                    <td>22</td>
                                                    <td>2008/10/26</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="odd">
                                                    <td class="" tabindex="0">Gloria Little</td>
                                                    <td class="sorting_1">Systems Administrator</td>
                                                    <td>New York</td>
                                                    <td>59</td>
                                                    <td>2009/04/10</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="even">
                                                    <td tabindex="0" class="">Tiger Nixon</td>
                                                    <td class="sorting_1">System Architect</td>
                                                    <td>Edinburgh</td>
                                                    <td>61</td>
                                                    <td>2011/04/25</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="odd">
                                                    <td class="" tabindex="0">Quinn Flynn</td>
                                                    <td class="sorting_1">Support Lead</td>
                                                    <td>Edinburgh</td>
                                                    <td>22</td>
                                                    <td>2013/03/03</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="even">
                                                    <td class="" tabindex="0">Bradley Greer</td>
                                                    <td class="sorting_1">Software Engineer</td>
                                                    <td>London</td>
                                                    <td>41</td>
                                                    <td>2012/10/13</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="odd">
                                                    <td class="" tabindex="0">Brenden Wagner</td>
                                                    <td class="sorting_1">Software Engineer</td>
                                                    <td>San Francisco</td>
                                                    <td>28</td>
                                                    <td>2011/06/07</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="even">
                                                    <td tabindex="0" class="">Sonya Frost</td>
                                                    <td class="sorting_1">Software Engineer</td>
                                                    <td>Edinburgh</td>
                                                    <td>23</td>
                                                    <td>2008/12/13</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="odd">
                                                    <td class="" tabindex="0">Haley Kennedy</td>
                                                    <td class="sorting_1">Senior Marketing Designer</td>
                                                    <td>London</td>
                                                    <td>43</td>
                                                    <td>2012/12/18</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr><tr role="row" class="even">
                                                    <td tabindex="0" class="">Cedric Kelly</td>
                                                    <td class="sorting_1">Senior Javascript Developer</td>
                                                    <td>Edinburgh</td>
                                                    <td>22</td>
                                                    <td>2012/03/29</td>
                                                    <td class="text-right">
                                                        <a href="#" class="btn btn-simple btn-info btn-icon like"><i class="material-icons">favorite</i></a>
                                                        <a href="#" class="btn btn-simple btn-warning btn-icon edit"><i class="material-icons">dvr</i></a>
                                                        <a href="#" class="btn btn-simple btn-danger btn-icon remove"><i class="material-icons">close</i></a>
                                                    </td>
                                                </tr></tbody>
                                        </table></div></div><div class="row"><div class="col-sm-5">
                                        <!-- <div class="dataTables_info" id="datatables_info" role="status" aria-live="polite">
                                        Showing 1 to 10 of 40 entries</div> -->
                                        </div><div class="col-sm-7"><div class="dataTables_paginate paging_full_numbers" id="datatables_paginate">
                                        <!-- <ul class="pagination"><li class="paginate_button first disabled" id="datatables_first">
                                        <a href="#" aria-controls="datatables" data-dt-idx="0" tabindex="0">First</a></li><li class="paginate_button previous disabled" id="datatables_previous"><a href="#" aria-controls="datatables" data-dt-idx="1" tabindex="0">Previous</a></li><li class="paginate_button active"><a href="#" aria-controls="datatables" data-dt-idx="2" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="3" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="4" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="5" tabindex="0">4</a></li><li class="paginate_button next" id="datatables_next"><a href="#" aria-controls="datatables" data-dt-idx="6" tabindex="0">Next</a></li><li class="paginate_button last" id="datatables_last"><a href="#" aria-controls="datatables" data-dt-idx="7" tabindex="0">Last</a></li>
                                        </ul> -->
                                        </div></div></div></div>
                                    </div>
                                </div>
                                <!-- end content-->
                            </div>
                            <!--  end card  -->
                        </div>
                        <!-- end col-md-12 -->
                    </div>
                    <!-- end row -->
                </div>
            </div>
            
                </div>
	
	<!-- Footer section(하단부분) -->
	<footer class="footer">
		<%@ include file="../../common/bottom.jsp"%>
	</footer>
	<!-- Footer section(하단부분) -->
</div>
</body>
</html>
