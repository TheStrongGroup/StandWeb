<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <div class="container-fluid main-top">
        <div class="col-lg-4 col-xs-12">
            <div class="build-info build-info-main">
                <div class="main-menu">
                    <hr>
                     <i class="fa fa-building-o"></i>建筑信息
                </div> 
                    <form role="form">
                        <div class="col-xs-6">
                            <div class="form-group">
                                <select class="form-control" id="buildinglist"> 
                                    
                                </select>
                            </div>
                        </div>
                            <div class="col-xs-6 form-group">    
                                <div class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                                    <input id="calendar" class="form-control" size="16" type="text" value="" readonly>
					                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                        </div>
                    </form>
                    <div id="buildinginfo" class="col-xs-12 acr-address">
                        <h4>安科瑞电气股份有限公司</h4>
                        <img src="app/img/address.png"/><span>上海市嘉定区马东工业园育绿路253号</span><br/>
                        <img src="app/img/area.png"/><span>建筑面积4255平方米</span>
                    </div>
                    <div class="col-xs-12 buildingicon text-center">
                        <div id="TransCnt" class="col-xs-6 col-md-3">
                            <img src="app/img/11a.png">
                                <p>主变台数</p>
                                <h4></h4>
                        </div>
                        <div id="InstallCap" class="col-xs-6 col-md-3">
                            <img src="app/img/22bb.png">
                            <p>装机容量</p>
                            <h4></h4>
                        </div>
                        <div id="OperateCap" class="col-xs-6 col-md-3">
                            <img src="app/img/33bb.png">
                            <p>运行容量</p>
                            <h4></h4>
                        </div>
                        <div id="metersTotal" class="col-xs-6 col-md-3">
                            <img src="app/img/44bb.png">
                            <p>计量点数</p>
                            <h4></h4>
                        </div>
                    </div> 
                </div>
            </div>
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="build-info build-info-main">      
                <div class="main-menu">
                    <hr>
                   <i class="fa fa-stack-overflow"></i>分类用能情况
                 </div>
                    <table id="energytable" class="main-table">
                        <thead>
                        <tr>
                            <th>分类</th>
                            <th>当月能耗</th>
                            <th>当年用能</th>
                            <th>单位</th>
                            </tr>
                            </thead>   
                        <tbody>
                            <tr>
                            <td>电</td>
                            <td>152</td>
                            <td>795327</td>
                            <td>千瓦时</td>
                            </tr>
                            <tr>
                            <td>水</td>
                            <td>65</td>
                            <td>757</td>
                            <td>吨</td>
                            </tr>
                            <tr>
                            <td>可再生能源</td>
                            <td>388</td>
                            <td>6394</td>
                            <td>千瓦时</td>
                            </tr>
                            <tr>
                            <td>综合能耗</td>
                            <td>766</td>
                            <td>10601</td>
                            <td>千克标准煤</td>
                            </tr>
                        </tbody>
                        </table>      
                </div>
                </div>
        <div class="col-lg-4 col-md-6 col-xs-12">
            <div class="build-info build-info-main"> 
            <div class="main-menu">
                <hr>
               <i class="fa fa-pie-chart"></i>分项用能占比情况
            </div>
            <div id="main_pie">
            </div>
            <button id="btn_month" class="btn btn-year" type="button">月</button>
            <button id="btn_year" class="btn btn-month btn-month-selected" type="button">年</button>
            </div>
            </div> 
        <div class="col-xs-12">
            <div class="build-info">
                <div class="main-menu">
                    <hr>
                   <i class="fa fa-line-chart"></i>当日用能
                </div>
                <div class="chart">
                    <div id="btngroup" class="col-md-1 col-xs-12 chart1">
                        <div class="col-sm-1 col-xs-2"><acronym title="电"><button class="btn btn-elc" type="button"></button></acronym></div>
                        <div class="col-sm-1 col-xs-2"><acronym title="水"><button class="btn btn-water" type="button"></button></acronym></div>
                        <div class="col-sm-1 col-xs-2"><acronym title="光伏"><button class="btn btn-solar" type="button"></button></acronym></div>
                    </div>
                    <div id="main_line" class="col-md-11 col-xs-12 padding-none">
                    </div>
                </div>
               
           
               <div class="data">
                  <div class="col-xs-12 elc-today">
                      <div class="number"><h2>01</h2><hr></div>
                      <div  id="hb_lbltoday" class="elc-today2">当日发电</div>
                      <div id="hb_today" class="elc-today3 pull-right">0.00kWh</div>
                  </div> 
                   <div class="col-xs-12 elc-yesterday">
                      <div class="number2"><h2>02</h2><hr></div>
                      <div class="elc-yesterday2">昨日同期</div>
                      <div id="hb_yesterday" class="elc-yesterday3 pull-right">0.00kWh</div>
                  </div> 
                    <div class="col-xs-12 elc-ring">
                      <div class="number3"><h2>03</h2><hr></div>
                      <div  class="elc-ring2">环比</div>
                      <div id="hb_rate" class="elc-ring3 pull-right">
                          <p class="dashed">-36.00kWh</p><p class="dashed2 pull-right">-100%</p>
                          <div id="updown" class="elc-ring4"><img src="app/img/down.png"/></div>
                      </div>
                      
                  </div> 
               </div>
              </div>
           </div>
   </div>


<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="app/js/resize.js" type="text/javascript"></script>
<script type="text/javascript" src="app/js/home_page.js"></script>