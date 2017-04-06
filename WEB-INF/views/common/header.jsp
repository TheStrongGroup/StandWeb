<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- BEGIN TOP NAVIGATION BAR -->
<div class="header-inner">

	<a class="navbar-brand" href="#">能耗管理系统</a>

	<!-- BEGIN RESPONSIVE MENU TOGGLER -->
	<a href="javascript:;" class="navbar-toggle" data-toggle="collapse"
		data-target=".navbar-collapse"> <img
		src="assets/img/menu-toggler.png" alt="" />
	</a>
	<!-- --------------------------------- -->
	<ul class="nav navbar-nav pull-right">
        <li>
            <acronym title="地图">
                <a href="rest/map"><img alt="" src="app/img/map.png"/></a>
            </acronym>
        </li>
        <li class="dropdown message">
          <!--  <a href="#" data-toggle="dropdown"> -->
          <a href="rest/user/logout">
               <acronym title="退出">
				    <img src="app/img/people.png"/>
               </accronym>
		   </a>
			<!-- <ul class="dropdown-menu">
				<li><a href="javascript:;" id="trigger_fullscreen"> <i
						class="fa fa-move"></i> 全屏
				    </a>
			                </li>
				
				<li>
			                    <a href="rest/user/logout"> <i class="fa fa-key"></i>
						    退出
				    </a>
			                </li>
			</ul> -->
          </li>
        </li>
     		<!-- END USER LOGIN DROPDOWN -->
	</ul>
	<!-- END TOP NAVIGATION MENU -->
</div>
<!-- END TOP NAVIGATION BAR -->
