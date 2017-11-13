<%--
  能耗概况分类
  Created by IntelliJ IDEA.
  User: yangc
  Date: 2017-05-14
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>




<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="main-container">
    <div class="row">
        <div class="col-lg-3 col-md-4 col-xs-12 servey-left">
          <div class="servey-left-t">
          <div class="row">
             <div class="select-width">类别：</div>
             <div class="filter-calc">
               <form role="form">
                <div class="form-group">
                  <select class="form-control" id="buildinglist">
                  </select>
                </div>
               </form>
            </div>
          </div>
          <div class="row">
            <div class="select-width">日期：</div>
              <div class="filter-calc">
               <div id="yearChose" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input id="yearcalendar" class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
            </div>
            <button id="yearSearch" type="button" class="btn-count5"><span>查询</span></button>
            </div>
            <div class="main-box class-t">
               <h5>环比单位：kWh</h5>
               <div class="row">
                 <div class="col-xs-4">
                    <span class="class-1"></span>
                    <p>当日用电</p>
                    <h4>602</h4>
                 </div>
                 <div class="col-xs-4">
                    <span class="class-2"></span>
                    <p>昨日同期</p>
                    <h4>602</h4>
                 </div>
                 <div class="col-xs-4">
                    <span class="class-3"></span>
                    <p>趋势</p>
                    <h4 class="red">602</h4>
                 </div>
               </div>
               <div class="row">
                 <div class="col-xs-4">
                    <span class="class-4"></span>
                    <p>当月用电</p>
                    <h4>602</h4>
                 </div>
                 <div class="col-xs-4">
                    <span class="class-5"></span>
                    <p>上月同期</p>
                    <h4>602</h4>
                 </div>
                 <div class="col-xs-4">
                    <span class="class-6"></span>
                    <p>趋势</p>
                    <h4 class="red">602</h4>
                 </div>
               </div>
            </div>
        </div>

      <div class="col-lg-9 col-md-8 col-xs-12">
         <div class="main-box class-h">
           <h5>日能耗折线图</h5>
           <div class="col-md-8 col-xs-12 load-calc">
            <div id="dayChart"></div>
           </div>
           <div class="col-md-4 col-xs-12 load">
             <div class="col-md-12 col-xs-4 load1">
               <p>最大值</p>
               <span>a</span>
             </div>
             <div class="col-md-12 col-xs-4 load2">
               <p>最小值</p>
               <span>a</span>
             </div>
             <div class="col-md-12 col-xs-4 load3">
               <p>平均值</p>
               <span>a</span>
             </div>
           </div>
         </div>
      </div>
    </div>      
    <div class="col-lg-12 bar-diagram">
       <div class="main-box class-bottom">
         <h5>区间能耗棒图</h5>
         <div class="col-lg-3 col-md-4 col-xs-12 class-b-left">
         <div class="row">
                <div class="select-width">筛选条件：</div>
                  <div class="filter-calc EnergyBar">
                   <select>
                    <option>小时</option>
                    <option>日</option>
                    <option>周</option>
                    <option>月</option>
                    <option>年</option>
                   </select>
                  </div>
                </div>
            <div class="row">
              <div class="select-width">起始日期：</div>
              <div class="filter-calc">
                          <div id="StartDate" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                              <input id="StartBox" class="form-control" size="16" type="text" value="" readonly>
                              <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                          </div>
              </div>
          </div>
            <div class="row" style="margin-top:10px;margin-bottom:10px;">
              <div class="select-width">截止日期：</div>
              <div class="filter-calc">
                          <div id="EndDate" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                              <input id="EndBox" class="form-control" size="16" type="text" value="" readonly>
                              <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                          </div>
              </div>
            </div>
            <button type="button" class="class-search">查 询</button>
         </div>
         <div class="col-lg-9 col-md-8 col-xs-12 chartBar">
            <div id="chartBar"></div>
         </div>
       </div>
    </div>
  </div>
  <script type="text/javascript" src="app/lib/echarts/echarts.min.js"></script>
<script type="text/javascript" src="app/lib/echarts/shine.js"></script>
<script type="text/javascript" src="app/js/stand/stand_class.js"></script>

