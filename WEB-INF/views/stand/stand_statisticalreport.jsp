<%--
  统计报表
  Created by IntelliJ IDEA.
  User: yangc
  Date: 2017-05-14
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>


<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="main-container">
    <div class="row stati-left">
        <div class="col-md-3 col-xs-12 servey-left">
          <div class="servey-left-t statistical-left report">
          <h5>查询日期</h5>
          <div class="row stati-date">
            <div class="select-width">开始日期：</div>
              <div class="filter-calc">
               <div id="yearChose" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input id="yearcalendar" class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
            </div>
          <div class="row">
            <div class="select-width">截止日期：</div>
              <div class="filter-calc">
               <div id="yearChose" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input id="yearcalendar" class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
            </div>
            <h5>筛选</h5>
            <button id="yearSearch" type="button" class="btn-count5"><span>查询</span></button>
            </div>
        </div>

      <div class="col-md-9 col-xs-12 report2">
         <button type="button"><img src="app/img/excel2.png"> 导 出</button>
         <div class="main-box class-h">
           <h5>能耗对比分析图</h5>
           <div class="col-md-9 col-xs-12 load-calc">

           </div>
         </div>
      </div>
    </div>      
  </div>
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="app/js/resize.js"></script>
<script type="text/javascript" src="app/js/te_survey.js"></script>