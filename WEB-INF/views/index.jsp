<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title>Quick4j</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta name="MobileOptimized" content="320">

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN THEME STYLES -->
<link href="assets/css/style-metronic.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="assets/css/style-responsive.css" rel="stylesheet"
	type="text/css" />
<link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="assets/css/pages/tasks.css" rel="stylesheet" type="text/css" />
<link href="assets/css/themes/default.css" rel="stylesheet"
	type="text/css" id="style_color" />
<link href="assets/css/custom.css" rel="stylesheet" type="text/css" />

<link href="assets/css/templatemo_main.css" rel="stylesheet"
	type="text/css" />

<!-- END THEME STYLES -->

<link rel="shortcut icon" href="app/img/favicon.ico" />
</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body class="page-header-fixed">

	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="header-inner">
			<!-- BEGIN LOGO -->
			<a class="navbar-brand" href="javascript:;"> <img
				src="assets/img/logo.png" alt="logo" class="img-responsive" />
			</a>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse"> <img
				src="assets/img/menu-toggler.png" alt="" />
			</a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav navbar-nav pull-right">
				<li class="dropdown user"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" data-hover="dropdown"
					data-close-others="true"> <img alt=""
						src="assets/img/avatar1_small.jpg" /> <span class="username">
							${userInfo.username } </span> <i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="javascript:;" id="trigger_fullscreen"> <i
								class="fa fa-move"></i> 全屏
						</a></li>
						<li><a href="extra_lock.html"> <i class="fa fa-lock"></i>
								锁屏
						</a></li>
						<li><a href="rest/user/logout"> <i class="fa fa-key"></i>
								退出
						</a></li>
					</ul></li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<div class="page-sidebar navbar-collapse collapse">
				<!-- BEGIN SIDEBAR MENU -->
				<ul class="page-sidebar-menu" id="page-sidebar-menu">
					<li class="sidebar-toggler-wrapper">
						<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
						<div class="sidebar-toggler hidden-phone"></div> <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					</li>

					<li class="start active"><a href="rest/page/dashboard"
						id="btn-dashboard"> <i class="fa fa-home"></i><span
							class="title"> 首页 </span><span class="selected"> </span>
					</a></li>

					<li class=""><a href="javascript:;"> <i
							class="fa fa-gears"></i><span class="title"> 系统管理 </span><span
							class="arrow "> </span>
					</a>
						<ul class="sub-menu">
							<li><a href="javascript:;"> 用户管理 </a></li>
							<li><a href="javascript:;"> 角色管理 </a></li>
							<li><a href="javascript:;"> 权限管理 </a></li>
						</ul></li>

					<li class=""><a href="javascript:;"> <i class="fa fa-user"></i><span
							class="title"> 个人中心 </span><span class="arrow "> </span>
					</a>
						<ul class="sub-menu">
							<li><a href="javascript:;"> 信息修改 </a></li>
							<li><a href="javascript:;"> 密码修改 </a></li>

							<!-- 测试权限控制 -->
							<shiro:hasAnyRoles name="super_admin">
								<li><a href="javascript:;">super_admin 拥有此角色</a></li>
							</shiro:hasAnyRoles>

							<shiro:hasPermission name="user:create">
								<li><a href="javascript:;">user:create 拥有此权限</a></li>
							</shiro:hasPermission>

							<shiro:hasPermission name="user:update">
								<li><a href="javascript:;">user:update 拥有此权限</a></li>
							</shiro:hasPermission>

						</ul></li>

				</ul>
				<!-- END SIDEBAR MENU -->
			</div>
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
				<div class="modal fade" id="portlet-config" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true"></button>
								<h4 class="modal-title">Modal title</h4>
							</div>
							<div class="modal-body">Widget settings form goes here</div>
							<div class="modal-footer">
								<button type="button" class="btn blue">Save changes</button>
								<button type="button" class="btn default" data-dismiss="modal">
									Close</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
				<!-- BEGIN STYLE CUSTOMIZER -->
				<div class="theme-panel hidden-xs hidden-sm">
					<div class="toggler"></div>
					<div class="toggler-close"></div>
					<div class="theme-options">
						<div class="theme-option theme-colors clearfix">
							<span> 主题颜色 </span>
							<ul>
								<li class="color-black current color-default"
									data-style="default"></li>
								<li class="color-blue" data-style="blue"></li>
								<li class="color-brown" data-style="brown"></li>
								<li class="color-purple" data-style="purple"></li>
								<li class="color-grey" data-style="grey"></li>
								<li class="color-white color-light" data-style="light"></li>
							</ul>
						</div>
						<div class="theme-option">
							<span> 布局 </span> <select
								class="layout-option form-control input-small">
								<option value="fluid">顺序</option>
								<option value="boxed">盒状</option>
							</select>
						</div>
						<div class="theme-option">
							<span> 标题 </span> <select
								class="header-option form-control input-small">
								<option value="fixed">固定</option>
								<option value="default">默认</option>
							</select>
						</div>
						<div class="theme-option">
							<span> 工具栏 </span> <select
								class="sidebar-option form-control input-small">
								<option value="fixed">固定</option>
								<option value="default">默认</option>
							</select>
						</div>
						<div class="theme-option">
							<span> 工具栏位置 </span> <select
								class="sidebar-pos-option form-control input-small">
								<option value="left">左边</option>
								<option value="right">右边</option>
							</select>
						</div>
						<div class="theme-option">
							<span> 页脚 </span> <select
								class="footer-option form-control input-small">
								<option value="fixed">固定</option>
								<option value="default">默认</option>
							</select>
						</div>
					</div>
				</div>
				<!-- END STYLE CUSTOMIZER -->

				<!-- BEGIN PAGE HEADER-->
				<div class="row">
					<div class="col-md-12">
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h3 class="page-title" id="index-page-title">Dashboard</h3>
						<ul class="page-breadcrumb breadcrumb">
							<li><i class="fa fa-home"></i> <a href="javascript:;">
									首页 </a> <i class="fa fa-angle-right"></i></li>
							<li><a href="javascript:;"> Dashboard </a></li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->

				<!-- BEGIN DASHBOARD STATS -->
				<div id="main-content"></div>
				<div class="templatemo-charts">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="panel panel-info">
								<div class="panel-heading">Pie Chart &amp; Doughnut Chart</div>
							</div>
							<div class="row templatemo-chart-row">
								<div
									class="templatemo-chart-box col-lg-3 col-md-3 col-sm-4 col-xs-12">
									<canvas id="templatemo-pie-chart"></canvas>
									<h4>Pie Chart</h4>
									<span class="text-muted">Maecenas non</span>
								</div>

								<div
									class="templatemo-chart-box col-lg-3 col-md-3 col-sm-4 col-xs-12">
									<canvas id="templatemo-doughnut-chart"></canvas>
									<h4>Doughnut Chart</h4>
									<span class="text-muted">Sodales orci aliquet</span>
								</div>

								<div
									class="templatemo-chart-box col-lg-3 col-md-3 col-sm-4 col-xs-12">
									<canvas id="templatemo-radar-chart"></canvas>
									<h4>Radar Chart</h4>
									<span class="text-muted">Lorem sed</span>
								</div>

								<div
									class="templatemo-chart-box col-lg-3 col-md-3 col-sm-4 col-xs-12">
									<canvas id="templatemo-polar-chart"></canvas>
									<h4>Polar Area Chart</h4>
									<span class="text-muted">Curabitur</span>
								</div>

							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="panel panel-success">
								<div class="panel-heading">Line Chart</div>
								<canvas id="templatemo-line-chart"></canvas>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<div class="panel panel-primary">
								<div class="panel-heading">Bar Chart</div>
								<canvas id="templatemo-bar-chart"></canvas>
							</div>
						</div>
					</div>
				</div>


				<!-- END PORTLET-->
			</div>
		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">2014 &copy; Quick4j By Eliteams.</div>
		<div class="footer-tools">
			<span class="go-top"><i class="fa fa-angle-up"></i></span>
		</div>
	</div>
	<!--[if lt IE 9]>
        <script src="assets/plugins/respond.min.js"></script>
        <script src="assets/plugins/excanvas.min.js"></script>
        <![endif]-->
	<script src="assets/plugins/jquery-1.10.2.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/jquery.blockui.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
	<script src="assets/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<script src="assets/scripts/Chart.min.js" type="text/javascript"></script>
	<script src="assets/scripts/templatemo_script.js"
		type="text/javascript"></script>

	<script
		src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="assets/plugins/select2/select2.min.js"></script>

	<script src="assets/scripts/app.js" type="text/javascript"></script>
	<script type="text/javascript" src="app/js/index.js"></script>

	<!-- <script data-main="app/js/main" src="app/lib/requirejs/require.js"></script> -->

	<script type="text/javascript">
		// Line chart
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100)
		};
		var lineChartData = {
			labels : [ "January", "February", "March", "April", "May", "June",
					"July" ],
			datasets : [
					{
						label : "My First dataset",
						fillColor : "rgba(220,220,220,0.2)",
						strokeColor : "rgba(220,220,220,1)",
						pointColor : "rgba(220,220,220,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(220,220,220,1)",
						data : [ randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor() ]
					},
					{
						label : "My Second dataset",
						fillColor : "rgba(151,187,205,0.2)",
						strokeColor : "rgba(151,187,205,1)",
						pointColor : "rgba(151,187,205,1)",
						pointStrokeColor : "#fff",
						pointHighlightFill : "#fff",
						pointHighlightStroke : "rgba(151,187,205,1)",
						data : [ randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor() ]
					} ]

		} // lineChartData

		var pieChartData = [ {
			value : 300,
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "Red"
		}, {
			value : 50,
			color : "#46BFBD",
			highlight : "#5AD3D1",
			label : "Green"
		}, {
			value : 100,
			color : "#FDB45C",
			highlight : "#FFC870",
			label : "Yellow"
		} ] // pie chart data

		// radar chart
		var radarChartData = {
			labels : [ "Eating", "Drinking", "Sleeping", "Designing", "Coding",
					"Cycling", "Running" ],
			datasets : [ {
				label : "My First dataset",
				fillColor : "rgba(220,220,220,0.2)",
				strokeColor : "rgba(220,220,220,1)",
				pointColor : "rgba(220,220,220,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(220,220,220,1)",
				data : [ 65, 59, 90, 81, 56, 55, 40 ]
			}, {
				label : "My Second dataset",
				fillColor : "rgba(151,187,205,0.2)",
				strokeColor : "rgba(151,187,205,1)",
				pointColor : "rgba(151,187,205,1)",
				pointStrokeColor : "#fff",
				pointHighlightFill : "#fff",
				pointHighlightStroke : "rgba(151,187,205,1)",
				data : [ 28, 48, 40, 19, 96, 27, 100 ]
			} ]
		}; // radar chart

		// polar area chart
		var polarAreaChartData = [ {
			value : 300,
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "Red"
		}, {
			value : 50,
			color : "#46BFBD",
			highlight : "#5AD3D1",
			label : "Green"
		}, {
			value : 100,
			color : "#FDB45C",
			highlight : "#FFC870",
			label : "Yellow"
		}, {
			value : 40,
			color : "#949FB1",
			highlight : "#A8B3C5",
			label : "Grey"
		}, {
			value : 120,
			color : "#4D5360",
			highlight : "#616774",
			label : "Dark Grey"
		}

		];

		window.onload = function() {
			var ctx_line = document.getElementById("templatemo-line-chart")
					.getContext("2d");
			var ctx_bar = document.getElementById("templatemo-bar-chart")
					.getContext("2d");
			var ctx_pie = document.getElementById("templatemo-pie-chart")
					.getContext("2d");
			var ctx_doughnut = document.getElementById(
					"templatemo-doughnut-chart").getContext("2d");
			var ctxRadar = document.getElementById("templatemo-radar-chart")
					.getContext("2d");
			var ctxPolar = document.getElementById("templatemo-polar-chart")
					.getContext("2d");

			window.myLine = new Chart(ctx_line).Line(lineChartData, {
				responsive : true
			});
			window.myBar = new Chart(ctx_bar).Bar(lineChartData, {
				responsive : true
			});
			window.myPieChart = new Chart(ctx_pie).Pie(pieChartData, {
				responsive : true
			});
			window.myDoughnutChart = new Chart(ctx_doughnut).Doughnut(
					pieChartData, {
						responsive : true
					});
			var myRadarChart = new Chart(ctxRadar).Radar(radarChartData, {
				responsive : true
			});
			var myPolarAreaChart = new Chart(ctxPolar).PolarArea(
					polarAreaChartData, {
						responsive : true
					});
		}
	</script>
</body>
</html>