<%--统计分析
  Created by IntelliJ IDEA.
  User: yangc
  Date: 2017-05-14
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>


<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="main-container">
    <div class="row stati-left">
        <div class="col-md-3 col-xs-12 servey-left">
          <div class="servey-left-t statistical-left">
          <h5>查询日期</h5>
          <div class="row stati-date">
            <div class="select-width">开始日期：</div>
              <div class="filter-calc">
               <div id="startDate" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input id="startBox" class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
            </div>
          <div class="row">
            <div class="select-width">截止日期：</div>
              <div class="filter-calc">
               <div id="endDate" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input id="endBox" class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
            </div>
            <h5>筛选</h5>
              <div id="treeview"></div>
            </div>
        </div>

      <div class="col-md-9 col-xs-12">
         <div class="main-box class-h">
           <h5>能耗对比分析图</h5>
           <div class="col-md-9 col-xs-12 load-calc">
            <div id="chartLine"></div>
           </div>
         </div>
      </div>
    </div>      
    <div class="col-md-6 stati-bottom">
       <div class="main-box class-bottom">
         <h5>2017.6.1-2017.8.1分项用能饼图</h5>
         <div class="col-md-6 col-xs-12">
            <div id="chartPie"></div>
         </div>
       </div>
    </div>
    <div class="col-md-6 stati-bottom2">
       <div class="main-box class-bottom">
         <h5>路灯</h5>
         <div class="col-md-6 col-xs-12">
            <div id="chartBar"></div>
         </div>
       </div>
    </div>
  </div>
   <button id="run">查询</button>
  <script type="text/javascript" src="app/lib/echarts/echarts.min.js"></script>
<script type="text/javascript" src="app/lib/echarts/shine.js"></script>
<script type="text/javascript" src="app/js/stand/stand_statistical.js"></script>

