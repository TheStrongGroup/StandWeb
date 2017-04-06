<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras"
	prefix="tilesx"%>
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
<title>Acrel5000</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta name="MobileOptimized" content="320">

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="assets/plugins/bootstrap-table-develop/dist/bootstrap-table.css">
<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN THEME STYLES -->
<link
	href="assets/plugins/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css" />
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
<link href="app/css/main.css" rel="stylesheet" type="text/css" />
<link href="assets/plugins/bootstrap-treeview/css/bootstrap-treeview.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="assets/css/fontawesome-4.2.0_ie7/4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/plugins/jQuery-loading/dist/showLoading.css" />

<!-- END THEME STYLES -->

<link rel="shortcut icon" href="app/img/logo.ico" />


</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body class="page-header-fixed">

	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<tiles:insertAttribute name="menu"></tiles:insertAttribute>
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
					<!--<div class="toggler"></div>
					<div class="toggler-close"></div>-->
					<tiles:insertAttribute name="setting"></tiles:insertAttribute>
				</div>
				<!-- END STYLE CUSTOMIZER -->
				<!-- BEGIN PAGE HEADER-->
				<div class="row">
					<div id="main-content">
						<tiles:insertAttribute name="maincontent"></tiles:insertAttribute>
					</div>
				</div>
				<!-- END PORTLET-->
			</div>
		</div>
		
		
		<div class="modal fade" id="resetpwd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel"><span id="curname" style="display:none;">${userInfo.username}</span>密码修改</h4>
			  </div>
			<form>
				  <div class="form-group">
					<label for="recipient-name" class="col-sm-3 control-label no-padding-right">当前密码 :</label>
					<div class="col-sm-9">
					    <input id="curpwd" type="password" class="col-xs-10 col-sm-5 form-control" >
					</div>
				  </div>
				  <div class="form-group">
					<label for="message-text" class="col-sm-3 control-label no-padding-right">新密码 :</label>
					<div class="col-sm-9">
						<input id="newpwd" type="password" class="col-xs-10 col-sm-5 form-control" >
					</div>
				  </div>
				  <div class="form-group">
					<label for="message-text" class="col-sm-3 control-label no-padding-right">确认新密码 :</label>
					<div class="col-sm-9">
						<input id="confirmpwd" type="password" class="col-xs-10 col-sm-5 form-control">
					</div>
				  </div>
			</form>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				<button id="confirm" type="button" class="btn btn-primary">确定</button>
			  </div>
			</div>
		  </div>
	</div>

		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer" align="center">
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
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

	<script
		src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="assets/plugins/select2/select2.min.js"></script>

	<script src="app/js/index.js" type="text/javascript"></script>
	<script src="assets/scripts/app.js" type="text/javascript"></script>
	<script src="assets/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
	<script src="assets/plugins/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="assets/plugins/echarts3/echarts.min.js"></script>
	<script src="assets/plugins/echarts3/macarons.js"></script>
	<script src="assets/plugins/echarts3/shine.js"></script>
	<!-- <script type="text/javascript" src="assets/plugins/echarts/build/source/echarts.js"></script> -->
	<script src="assets/plugins/bootstrap-treeview/js/bootstrap-treeview.js" type="text/javascript"></script>
	<script type="text/javascript" src="app/js/acrel_functioncollection.js"></script>
	<script type="text/javascript" src="app/js/equipment.js"></script>
	<script type="text/javascript" src="assets/plugins/jQuery-loading/dist/jquery.showLoading.js"></script>
	<script type="text/javascript" src="app/lib/security/sha256.js"></script>
	<script type="text/javascript" src="app/js/reset_password.js"></script>
</body>
</html>