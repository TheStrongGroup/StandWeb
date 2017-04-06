<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
<title>Dashboard, Free HTML5 Admin Template</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width">

<link href="assets/css/templatemo_main.css" rel="stylesheet"
	type="text/css" />
<!--<link
	href="http://cdn.bootcss.com/twitter-bootstrap/2.2.2/css/bootstrap.min.css"
	rel="stylesheet">-->
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="assets/plugins/bootstrap-datetimepicker/css/datetimepicker.css"
	rel="stylesheet" type="text/css" />
<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="assets/css/prettify-1.0.css" rel="stylesheet">
<link href="assets/css/base.css" rel="stylesheet">
<link href="assets/css/default.css" rel="stylesheet" type="text/css" />
<style>
body {
	padding-top: 70px;
}

.active {
	margin-bottom: 5px;
}

.table {
	width: 100%;
	max-width: 100%;
	height: 50%;
	max-height: 80%;
	margin-bottom: 10px;
}

#templatemo-line-chart {
	height: 300px !important;
}

.form_datetime3 {
	height: 34px !important;
}

#enddate {
	width: 150px ! important;
	height: 34px !important;
}

span.add-on {
	height: 34px !important;
}

#datacompare p {
	margin: 0px auto;
	font-size: 20px;
	overflow: hidden;
	color: blue;
	text-align: right;
}

.input-append .add-on:last-child, .input-append .btn:last-child,
	.input-append .btn-group:last-child>.dropdown-toggle {
	-webkit-border-radius: 0 4px 4px 0;
	-moz-border-radius: 0 4px 4px 0;
	border-radius: 0 4px 4px 0;
}

.input-append.date .add-on i, .input-prepend.date .add-on i {
	cursor: pointer;
	width: 14px;
	height: 14px;
}

.input-append .add-on {
	display: inline-block;
	width: auto;
	height: 20px;
	min-width: 16px;
	padding: 4px 5px;
	font-size: 14px;
	font-weight: normal;
	line-height: 20px;
	text-align: center;
	text-shadow: 0 1px 0 #fff;
	background-color: #eee;
	border: 1px solid #ccc;
}

.input-append input, .input-append select, .input-append .uneditable-input
	{
	-webkit-border-radius: 4px 0 0 4px;
	-moz-border-radius: 4px 0 0 4px;
	border-radius: 4px 0 0 4px;
	margin-bottom: 0;
	vertical-align: top;
}

[class^="icon-"], [class*=" icon-"] {
	display: inline-block;
	width: 14px;
	height: 14px;
	margin-top: 1px;
	line-height: 14px;
	vertical-align: text-top;
	background-image:
		url("http://cdn.bootcss.com/twitter-bootstrap/2.2.2/img/glyphicons-halflings.png");
	background-position: 14px 14px;
	background-repeat: no-repeat;
}

.icon-calendar {
	background-position: -192px -120px;
}

.top-menu1 #power {
	border-left: 0px solid #F7464A;
	border-top: 0px solid #F7464A;
	padding: 0em 0em;
	text-decoration: none;
}

.top-menu1  #power {
	background: #46BFBD;
	width: 20px !important;
	height: 20px !important;
}

.top-menu1 #specil {
	background: #F7464A;
	width: 20px !important;
	height: 20px !important;
}

.top-menu1  #air {
	background: #FDE45C;
	width: 20px !important;
	height: 20px !important;
}

.top-menu1  #light {
	background: #FDB45C;
	width: 20px !important;
	height: 20px !important;
}

.sub1 {
	width: 70px !important;
	height: 20px !important;
}
</style>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Acrel5000</a>
			</div>



			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">安科瑞能耗分析管理系统 <span
							class="sr-only">(current)</span></a></li>
					<li><a href="http://www.acrel.cn/">安科瑞首页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">菜单 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">能耗概况</a></li>
							<li><a href="#">支路用能</a></li>
							<li><a href="#">分项用能</a></li>
							<!-- 	<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
							<li role="separator" class="divider"></li> -->
							<li><a href="#">部门用能</a></li>
							<li><a href="#">区域用能</a></li>
							<li><a href="#">用能检测</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
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
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>


	



	<div class="page-content-wrapper">
		<div class="col-xs-12  col-lg-12 col-sm-12  col-md-12 main">
			<div class="row placeholders">
				<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 placeholder">
					<div class="panel panel-primary">
						<div class="panel-heading">建筑信息</div>
					</div>
					<div class="row">
						<div class="col-sm-6 col-xs-12">
							<form role="form">
								<div class="form-group">
									<select id="sect" class="form-control">
										<option value="000001G001">上海安科瑞新大楼</option>
										<option value="000001G001">上海安科瑞老大楼</option>
										<option value="000001G001">江阴安科瑞新大楼</option>
									</select>
								</div>
							</form>
						</div>
						<div class='col-sm-6 col-xs-12' align='center'>
							<div class="form-group">
								<div class="input-append date form_datetime3">
									<input id="enddate" size="20" type="text" readonly=""
										onchange="getdata()"> <span class="add-on"><i
										class="icon-calendar"></i></span>
								</div>

							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<img class="img-rounded" src="assets/img/acrel.png"
							alt="Generic placeholder thumbnail" width="467.656" height="250"
							align="center">
						<div align="center">
							<h4>安科瑞研发中心</h4>
						</div>
					</div>

				</div>

				<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12 placeholder">
					<!-- 	<ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active"><a href="#">当年用能情况</a></li>
				</ul> -->

					<div class="panel panel-success">
						<div class="panel-heading">当年用能情况</div>
					</div>

					<div id="dynamicP"></div>
					<div class="col-md-12 col-sm-12 ">
						<div class="panel panel-success">
							<div class="panel-body">
								<pseudo:before></pseudo:before>
								<table id="energydata"
									class="table table-striped table-condensed ">
									<thead>
										<tr>
											<th>分类</th>
											<th>当月用能</th>
											<th>当年用能</th>
											<th>单位</th>
										</tr>
									</thead>

								</table>
								<pseudo:after></pseudo:after>
							</div>
						</div>
					</div>
				</div>


				<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12  placeholder">
					<!-- <ul class="nav nav-pills nav-stacked">
					<li role="presentation" class="active"><a href="#">当月用电分项比</a></li>
				</ul> -->
					<div class="panel panel-danger">
						<div class="panel-heading">当月用电分项比</div>
					</div>
					<div class="row templatemo-chart-row">
						<div class="templatemo-charts">
							<div class="row">
								<div id="canvaspie"
									class="templatemo-chart-box col-lg-9 col-md-9 col-sm-9 col-xs-9">
								</div>

								<div
									class="templatemo-chart-box col-lg-3 col-md-3 col-sm-3 col-xs-3">
									<ul class="top-menu1">
										<li id="power">
											<ul class="sub1">
												<span style="width: 100px; height: 20px; font-size: 15px;">特殊</span>
											</ul>
										</li>

										<li id="specil">
											<ul class="sub1">
												<span style="font-size: 15px;">动力</span>
											</ul>
										</li>

										<li id="light"><ul class="sub1">
												<span style="font-size: 15px;">照明</span>
											</ul></li>

										<li id="air"><ul class="sub1">
												<span style="font-size: 15px;">空调</span>
											</ul></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="col-xs-12  col-lg-12 col-sm-12  col-md-12 main">
			<!-- 	<ul class="nav nav-pills nav-stacked">
			<li role="presentation" class="active"><a href="#">当日用能</a></li>
		</ul> -->
			<div class="panel panel-info">
				<div class="panel-heading">当日用能</div>
			</div>
			<div class="row">
				<div class="col-md-1 col-sm-1 " align="center">
					<div class="btn-group-vertical" role="group" aria-label="...">
						<button type="button" class="btn btn-default " value="水">水</button>
						<button type="button" class="btn btn-default" value="电">电</button>
						<button type="button" class="btn btn-default" value="可再生能源">光伏</button>
					</div>
				</div>
				<div class="col-md-7 col-sm-7" offset-height="200">
					<div id="canvasdata" class="panel panel-success">
						<!-- <canvas id="templatemo-line-chart"></canvas> -->
					</div>

				</div>
				<div class="col-md-4 col-sm-4">
					<table id="datacompare" class="table table-striped table-condensed">
					</table>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/plugins/jquery-1.10.2.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

	<script src="assets/plugins/chart/Chart.js"></script>
	<script src="assets/scripts/templatemo_script.js"
		type="text/javascript"></script>



	<!-- <script
			src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
			type="text/javascript"></script>
		<script
			src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
			type="text/javascript"></script> -->
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
	<script src="assets/scripts/app.js" type="text/javascript"></script>
	<script type="text/javascript" src="app/js/index.js"></script>
	<script src="assets/plugins/moment-with-locales.js"></script>





	<script type="text/javascript">
		var lineChartData = ""; // lineChartData
		var pieChartData = "";
		var jsondata = "";
		var chartdata = "";

		$('#sect').on('change', function(e) {
			getdata();

		})

		function getdata() {
			var params = "buildId=" + document.getElementById("sect").value
					+ "&endDate=" + document.getElementById("enddate").value;
			$.ajax({
				type : "get",
				dataType : "html",
				url : 'rest/acrel/page',
				data : params,
				async : false,
				cache : false,
				success : function(data) {
					jsondata = eval(data);
					getBuildinfo(jsondata);
					getEnergyData(jsondata);
					getPieData(jsondata);
					getThisDayEnergy('水', jsondata);

				},
				error : function(data) {
					alert("页面提交 失败，请重新提交.");
					clear()
					return false;
				}
			});

			var ctx_pie = document.getElementById("templatemo-pie-chart")
					.getContext("2d");
			var ctx_line = document.getElementById("templatemo-line-chart")
					.getContext("2d");

			window.myLine = new Chart(ctx_line).Line(lineChartData, {
				responsive : true
			});

			window.myPie = new Chart(ctx_pie).Pie(pieChartData, {
				responsive : true

			});
			/* 	var legend = myPie.generateLegend(); */
			alert(myPie.generateLegend());

		}

		function clear() {
			jsondata = "";
			var canvasdata = $("#canvasdata");
			$("#canvasdata").find("canvas").remove();

			var con = $("#dynamicP");
			var trlength = $("#dynamicP").find("p").length;
			for (var i = trlength; i >= 0; i--) {
				$("#dynamicP").find("p").eq(i).remove();
			}

			var trlength = $("#energydata").find("tbody").length;
			for (var i = trlength; i >= 0; i--) {
				$("#energydata").find("tbody").eq(i).remove();
			}

			$("#canvaspie").find("canvas").remove();
			$("#datacompare").remove();
		}

		$(function() {
			$(".btn").click(

					function() {
						getThisDayEnergy($(this).val(), jsondata);
						var ctx_line = document.getElementById(
								"templatemo-line-chart").getContext("2d");

						window.myLine = new Chart(ctx_line).Line(lineChartData,
								{
									responsive : true
								});

					});
		})
		function getThisDayEnergy(type, jsondata) {

			var dayhour = new Date().getHours();
			lineChartData = "";

			var canvasdata = $("#canvasdata");
			$("#canvasdata").find("canvas").remove();

			canvasdata.append('<canvas id="templatemo-line-chart"></canvas>');

			var table = $("#datacompare");
			$("#datacompare").find("tbody").remove();
			var tbody = $("<tbody></tbody>");

			var dayenergydata = jsondata[0].LineChart;
			var blockdata = jsondata[0].BlockData;
			var thisdata = "[";
			var predata = "[";
			j = 0;
			for (i = 0; i < 72; i++) {
				if (type == dayenergydata[i].F_EnergyItemname) {
					if (j == 23) {
						var F_PreValue = "";
						var F_ThisValue = "";
						var name = "";
						for (ii = 0; ii < 3; ii++) {
							if (type == blockdata[ii].F_EnergyItemname) {
								F_ThisValue = (blockdata[ii].F_ThisValue)
										.toFixed(2);

								F_PreValue = (blockdata[ii].F_PreValue)
										.toFixed(2);
								name = blockdata[ii].F_EnergyItemname;
								if (name.length > 3) {
									name = "发电";
								} else {
									name = "用" + name;
								}
								cycle = (F_ThisValue - F_PreValue) / F_PreValue;
								cycle = (cycle * 100).toFixed(2);
								if (blockdata[ii].F_EnergyItemname == "水") {
									F_PreValue = F_PreValue + "T";
									F_ThisValue = F_ThisValue + "T";
								} else {
									F_PreValue = F_PreValue + "kW·h";
									F_ThisValue = F_ThisValue + "kW·h";
								}
							}
						}

						thisdata += dayenergydata[i].F_ThisValue;

						predata += (dayenergydata[i].F_PreValue).toFixed(2);
						var table = $("#datacompare");
						tbody.append("<tr><td><h3>当日" + name + "</h3><p>"
								+ F_ThisValue + "</p></td></tr>"
								+ "+<tr><td><h3>昨日同期</h3><p>" + F_PreValue
								+ "</p></td></tr>" + "<tr><td><h3>环比</h3><p>"
								+ cycle + "%</p></td></tr>");
						table.append(tbody);
					} else {
						if (dayenergydata[i].F_ThisValue != null) {
							thisdata += (dayenergydata[i].F_ThisValue)
									.toFixed(2)
									+ ",";
							predata += (dayenergydata[i].F_PreValue).toFixed(2)
									+ ",";
						} else {
							thisdata += dayenergydata[i].F_ThisValue + ",";
							predata += (dayenergydata[i].F_PreValue).toFixed(2)
									+ ",";
						}

					}
					j++;

				}
			}
			thisdata += "]";
			predata += "]";
			var todaydata = "[";

			var d = new Date;
			var month;
			if (d.getMonth() < 10) {

				month = "0" + (d.getMonth() + 1);
			} else {
				month = d.getMonth() + 1;
			}

			if (document.getElementById("enddate").value == (d.getFullYear()
					+ "-" + month + "-" + d.getDate())) {
				for (i = 0; i < dayhour; i++) {
					if (i == dayhour - 1) {
						todaydata += eval(thisdata)[i] + "]";
					} else {
						todaydata += eval(thisdata)[i] + ",";
					}
				}
			} else {
				todaydata = thisdata;
			}

			lineChartData = {
				labels : [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
						"10", "11", "12", "13", "14", "15", "16", "17", "18",
						"19", "20", "21", "22", "23" ],
				datasets : [ {
					label : "昨日同期",
					fillColor : "rgba(220,220,220,0.2)",
					strokeColor : "rgba(220,220,220,1)",
					pointColor : "rgba(220,220,220,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(220,220,220,1)",
					data : eval(predata)
				}, {
					label : "当日情况",
					fillColor : "rgba(151,187,205,0.2)",
					strokeColor : "rgba(151,187,205,1)",
					pointColor : "rgba(151,187,205,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rgba(151,187,205,1)",
					data : eval(todaydata)
				} ]

			}

		}

		$(".img-responsive").addClass(
				"carousel-inner img-responsive img-rounded");

		window.onload = function() {
			getdata();
		}
		$(function() {
			$(".form_datetime3").datetimepicker({
				endDate : new Date(),
				minView : "month",
				format : "yyyy-mm-dd",
				autoclose : true
			}).on('changeDate', function() {
			});

		})
		$(".img-responsive").addClass(
				"carousel-inner img-responsive img-rounded");

		window.onload = function() {
			var d = new Date;
			var month;
			if (d.getMonth() < 10) {

				month = "0" + (d.getMonth() + 1);
			} else {
				month = d.getMonth() + 1;
			}
			$("#enddate")
					.val(d.getFullYear() + "-" + month + "-" + d.getDate());
			getdata();

		}

		function getBuildinfo(jsondata) {
			var con = $("#dynamicP");
			var trlength = $("#dynamicP").find("p").length;
			for (var i = trlength; i >= 0; i--) {
				$("#dynamicP").find("p").eq(i).remove();
			}

			con
					.append("<p>&nbsp;&nbsp;&nbsp;"
							+ jsondata[0].BuildBaseInfo[0].fBuildname
							+ "</p><p><span style='color:blue;'>&nbsp;&nbsp;&nbsp;位于</span>"
							+ jsondata[0].BuildBaseInfo[0].fBuildaddr
							+ "</p><p><span style='color:blue;'>&nbsp;&nbsp;&nbsp;建筑总面积</span>"
							+ jsondata[0].BuildBaseInfo[0].fTotalarea
							+ "平方米</p>");
		}

		function getEnergyData(jsondata) {

			var trlength = $("#energydata").find("tbody").length;
			for (var i = trlength; i >= 0; i--) {
				$("#energydata").find("tbody").eq(i).remove();
			}
			var table = $("#energydata");
			var body = $("<tbody></tbody>");

			var energydata = jsondata[0].BuildEnergy;
			for (i = 0; i < energydata.length; i++) {
				var row = $("<tr></tr>");
				row.append("<td>" + energydata[i].fEnergyitemname + "</td><td>"
						+ energydata[i].fMonthValue + "</td><td>"
						+ energydata[i].fYearValue + "</td><td>"
						+ energydata[i].fEnergyitemunit + "</td>");
				body.append(row);
			}
			table.append(body);

		}

		function getPieData(jsondata) {
			var canvasdata = $("#canvaspie");
			$("#canvaspie").find("canvas").remove();
			$("#canvaspie").find("h4").remove();
			canvasdata.append('<canvas id="templatemo-pie-chart"></canvas>');
			var piedata = jsondata[0].CakeData;

			pieChartData = [ {
				value : piedata[0].value,
				color : "#F7464A",
				highlight : "#FF5A5E",
				label : piedata[0].name
			}, {
				value : piedata[1].value,
				color : "#46BFBD",
				highlight : "#5AD3D1",
				label : piedata[1].name
			}, {
				value : piedata[2].value,
				color : "#FDB45C",
				highlight : "#FFC870",
				label : piedata[2].name
			}, {
				value : piedata[3].value,
				color : "#FDE45C",
				highlight : "#FFC870",
				label : piedata[3].name
			} ];

		}
	</script>
</body>
</html>