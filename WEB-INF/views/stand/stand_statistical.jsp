<%--统计分析
  Created by IntelliJ IDEA.
  User: yangc
  Date: 2017-05-14
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="container-fluid main-top">
    <div class="col-xs-12">
        <div class="filter-width">
            建筑名称：
        </div>
        <div class="se-right">
            <form role="form">  
                <div class="form-group">
                    <select class="form-control" id="buildinglist">  
                    </select>
                </div>
            </form>
        </div>
    </div>
    <div class="col-lg-3 col-sm-5">
        <div class="build-info">
            <div class="main-menu">
                <hr>
                <i class="fa fa-calendar"></i>日部门用能同比分析
            </div>
            <div id="compareBar" class="se-yet"></div>
        </div>
    </div>
    <div class="col-lg-9 col-sm-7">
        <div class="build-info">
            <div class="main-menu">
                <hr>
                <i class="fa fa-calendar-o"></i>本年部门绩效考核
            </div>
            <div id="planChart" class="se-yet">
            
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-sm-5 se-padding2">
        <div class="build-info">
            <div class="main-menu">
                <hr>
                <i class="fa fa-pie-chart"></i>过去31天部门用能饼图
            </div>
            <div id="monthPie" class="se-yet">

            </div>
        </div>
    </div>
    <div class="col-lg-9 col-sm-7">
        <div class="build-info">
            <div class="main-menu">
                <hr>
                <i class="fa fa-bar-chart"></i>过去31天部门用能趋势
            </div>
            <div id="monthStackBar" class="se-yet">

            </div>
        </div>
    </div>
</div>
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="app/js/resize.js"></script>
<script type="text/javascript" src="app/js/de_survey.js"></script> 
