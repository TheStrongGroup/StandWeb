
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
		<li id="mappage" class="">
		    <a href="rest/map" id="btn-dashboard"> 
			   <i class="fa fa-map-marker"></i>
			   <span class="title">	能耗概况</span>
		    </a>
	    </li>
		<li id="flenergy" class="">
		    <a href="javascript:;"> 
		        <i class="fa fa-sitemap"></i>
			    <span class="title">统计分析 </span>
			    <span class="arrow "> </span>
		    </a>
			<ul class="sub-menu" id="tenergy">
				<li id="trunk" class="">
				  <a href="rest/tes"><i class="fa fa-caret-right"></i>分类</a>
				</li>
				<li id="count" class="">
				  <a href="rest/tec"><i class="fa fa-caret-right" ></i>分项</a>
				</li>
				<li id="table" class="">
				  <a href="rest/teca"><i class="fa fa-caret-right" ></i>区域</a>
				</li>
			</ul>
		</li>
		<li id="seenergy" class="">
		  <a href="javascript:;"> 
		    <i class="fa fa-list-alt" ></i>
				<span class="title">统计报表</span>
				<span class="arrow "> </span>
		  </a>
		  <ul class="sub-menu" id="tenergy">
			 <li id="se_trunk" class="">
			   <a href="rest/ses"><i class="fa fa-caret-right"></i>分类</a>
			 </li>
			<li id="se_count" class="">
			  <a href="rest/sec"><i class="fa fa-caret-right"></i>分项</a>
			</li>
			<li id="se_compare" class="">
			  <a href="rest/seca"><i class="fa fa-caret-right"></i>区域</a>
			</li>
		   </ul>
		 </li>
		<li id="deenergy" class="">
		  <a href="javascript:;"> 
		    <i class="fa fa-group"></i>
		    <span class="title">历史曲线</span>
		    <span class="arrow "> </span>
		  </a>
		  <ul class="sub-menu" id="">
				<li id="de_survey" class="">
				  <a href="rest/des"><i class="fa fa-caret-right"></i>分类</a>
				</li>
				<li id="de_count" class="">
				  <a href="rest/dec"><i class="fa fa-caret-right"></i>分项</a>
				</li>
				<li id="de_compare" class="">
				  <a href="rest/deca"><i class="fa fa-caret-right"></i>区域</a>
				</li>
			</ul>
	    </li>
		<li id="leenergy" class="">
		  <a href="javascript:;"> 
		     <i class="fa fa-flag"></i>
		     <span class="title">用户设置 </span>
		     <span class="arrow "> </span>
		  </a>
			<ul class="sub-menu" id="tenergy">
				<li id="le_survey" class="">
				  <a href="rest/les"><i class="fa fa-caret-right"></i>更新</a>
				</li>
				<li id="le_count" class="">
				  <a href="rest/lec"><i class="fa fa-caret-right"></i>分类添加</a>
				</li>
				<li id="le_compare" class="">
				  <a href="rest/leca"><i class="fa fa-caret-right"></i>设备添加</a>
				</li>
				<li id="le_compare" class="">
				  <a href="rest/leca"><i class="fa fa-caret-right"></i>自定义分类</a>
				</li>
				<li id="le_compare" class="">
				  <a href="rest/leca"><i class="fa fa-caret-right"></i>密码修改</a>
				</li>
			</ul>
		</li>	
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

