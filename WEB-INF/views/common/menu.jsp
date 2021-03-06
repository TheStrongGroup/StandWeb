<%@ page language="java" pageEncoding="utf-8" %>

<div class="page-sidebar navbar-collapse collapse">
    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 1100px;">
        <ul class="page-sidebar-menu" id="page-sidebar-menu">
            <li class="sidebar-toggler-wrapper">
                <div class="sidebar-toggler hidden-phone"></div>
            </li>

            <li id="fistpage" class="">
                <a href="rest/index" id="btn-dashboard">
                    <i class="fa fa-cog"></i>
                    <span class="title">用能概况</span>
                </a>
            </li>
            <li id="energysubery" class="">
                <a href="javascript:;">
                    <i class="fa fa-sitemap"></i>
                    <span class="title">能耗概况 </span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu" id="subery">
                    <li id="calssfi" class=""><a href="rest/class"><i class="fa fa-caret-right"></i>分类</a></li>
                </ul>
            </li>

            <li id="statistical" class="">
                <a href="javascript:;">
                    <i class="fa fa-list-alt"></i>
                    <span class="title">统计分析</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu" id="m_statistical">
                    <li id="s_statistical" class=""><a href="rest/statistical"><i class="fa fa-caret-right"></i>统计分析</a>
                    </li>
                </ul>
            </li>

            <li id="statisticalreport" class="">
                <a href="javascript:;">
                    <i class="fa fa-list-alt"></i>
                    <span class="title">报表</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu" id="m_statisticalreport">
                    <li id="s_statisticalreport" class=""><a href="rest/statisticalreport"><i
                            class="fa fa-caret-right"></i>统计报表</a></li>
                </ul>
            </li>


            <li id="historyline" class="">
                <a href="javascript:;">
                    <i class="fa fa-group"></i>
                    <span class="title">历史曲线</span>
                    <span class="arrow"> </span>
                </a>
                <ul class="sub-menu" id="m_historyline">
                    <li id="s_historyline" class=""><a href="rest/historyline"><i class="fa fa-caret-right"></i>历史曲线</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="app/js/stand/reset_password.js"></script>
<script type="text/javascript" src="app/lib/security/sha256.js"></script>