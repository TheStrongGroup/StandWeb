
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<div class="page-sidebar navbar-collapse collapse">
	<ul class="page-sidebar-menu" id="#page-sidebar-menu">
		<li class="sidebar-toggler-wrapper">
			<div class="sidebar-toggler hidden-phone"></div>
		</li>

		<li id="fistpage" class=""><a href="rest/index"
			id="btn-dashboard"> <i class="fa fa-cog"></i><span class="title">
					用能概况 </span>
		</a></li>
		<li id="mappage" class=""><a href="rest/map"
			id="btn-dashboard"> <i class="fa fa-map-marker"></i><span class="title">
					地图导航 </span>
		</a></li>
		<li id="flenergy" class=""><a href="javascript:;"> <i
				class="fa fa-sitemap"></i><span class="title">支路用能 </span><span
				class="arrow "> </span>
		</a>
			<ul class="sub-menu" id="tenergy">
				<li id="trunk" class=""><a href="rest/tes"><i class="fa fa-caret-right"></i>支路用能概况</a></li>
				<li id="count" class=""><a href="rest/tec"><i class="fa fa-caret-right" ></i>支路用能统计</a></li>
				<li id="table" class=""><a href="rest/teca"><i class="fa fa-caret-right" ></i>同比分析</a></li>
				<!-- <li id="" class=""><a href="javascript:;"> <span style="color:#b1b0b0">趋势曲线</span></a></li> -->
				<li id="te_loss" class=""><a href="rest/tela"><i class="fa fa-caret-right"></i>损耗分析</a></li>

			</ul></li>

		<li id="seenergy" class=""><a href="javascript:;"> <i
				class="fa fa-list-alt" ></i><span class="title">分项用能</span><span
				class="arrow "> </span>
		</a>
			<ul class="sub-menu" id="tenergy">
				<li id="se_trunk" class=""><a href="rest/ses"><i class="fa fa-caret-right"></i>分项用能概况</a></li>
				<li id="se_count" class=""><a href="rest/sec"><i class="fa fa-caret-right"></i>分项用能统计</a></li>
				<li id="se_compare" class=""><a href="rest/seca"><i class="fa fa-caret-right"></i>同比分析</a></li>
			</ul></li>


		<li id="deenergy" class=""><a href="javascript:;"> <i class="fa fa-group"></i><span
				class="title">部门用能</span><span class="arrow "> </span>
		</a>
			<ul class="sub-menu" id="">
				<li id="de_survey" class=""><a href="rest/des"><i class="fa fa-caret-right"></i>部门用能概况</a></li>
				<li id="de_count" class=""><a href="rest/dec"><i class="fa fa-caret-right"></i>部门用能统计</a></li>
				<li id="de_compare" class=""><a href="rest/deca"><i class="fa fa-caret-right"></i>同比分析</a></li>
			</ul></li>
		<li id="leenergy" class=""><a href="javascript:;"> <i
				class="fa fa-flag"></i><span class="title">区域用能 </span><span
				class="arrow "> </span>
		</a>
			<ul class="sub-menu" id="tenergy">
				<li id="le_survey" class=""><a href="rest/les"><i class="fa fa-caret-right"></i>区域用能概况</a></li>
				<li id="le_count" class=""><a href="rest/lec"><i class="fa fa-caret-right"></i>区域用能统计</a></li>
				<li id="le_compare" class=""><a href="rest/leca"><i class="fa fa-caret-right"></i>同比分析</a></li>
			</ul></li>


		<li id="flenergy" class=""><a href="javascript:;"> <i
				class="fa fa-tasks" style="color:#b1b0b0"></i><span class="title" style="color:#b1b0b0">用能监测 </span><span
				class="arrow "> </span>
		</a></li>
		<li id="flenergy" class=""><a href="javascript:;"><i
				class="fa fa-gears" style="color:#b1b0b0"></i><span class="title" style="color:#b1b0b0">系统状态 </span><span
				class="arrow "> </span>
		</a>
		<ul class="sub-menu" id="tenergy">
				<li id="" class=""><a href="rest/sysstatus"><i class="fa fa-caret-right" style="color:#b1b0b0"></i><span style="color:#b1b0b0">通讯状态</span></a></li>
				
			</ul>
		</li>
		<li id="Settings" class=""><a href="javascript:;"> <i
				class="fa fa-desktop"></i><span class="title">系统设置 </span><span
				class="arrow "> </span>
		</a>
			<ul class="sub-menu">
				<li id="setPsWrd"><a  data-toggle="modal" data-target="#resetpwd"> <i class="fa fa-caret-right"></i>密码修改</a></li>
			</ul></li>
		
	</ul>
</div>
<!--   //不加进去也不影响它变白色
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
        $('#page-sidebar-menu li a').click(function(){
            $('#page-sidebar-menu li a').removeClass("open");
            $(this).addClass("open");
        })
    })
</script> -->

