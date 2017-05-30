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
               <div id="yearChose" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input id="yearcalendar" class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
            </div>
          <div class="row">
            <div class="select-width">结束日期：</div>
              <div class="filter-calc">
               <div id="yearChose" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input id="yearcalendar" class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
            </div>
            <h5>筛选</h5>

            </div>
        </div>

      <div class="col-md-9 col-xs-12">
         <div class="main-box class-h">
           <h5>能耗对比分析图</h5>
           <div class="col-md-9 col-xs-12 load-calc">

           </div>
         </div>
      </div>
    </div>      
    <div class="col-md-6 stati-bottom">
       <div class="main-box class-bottom">
         <h5>2017.6.1-2017.8.1分项用能饼图</h5>
         <div class="col-md-6 col-xs-12">
          b
         </div>
       </div>
    </div>
    <div class="col-md-6 stati-bottom2">
       <div class="main-box class-bottom">
         <h5>路灯</h5>
         <div class="col-md-6 col-xs-12">
          b
         </div>
       </div>
    </div>
  </div>
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="app/js/resize.js"></script>
<script type="text/javascript" src="app/js/te_survey.js"></script>

