<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="main-container">
  <div class="row">
    <div class="col-lg-6 col-md-12 main-left-pr">
      <div class="col-sm-4 main-date-pl">
        <div class="main-1">
          <span class="main-dateicon"></span>
          <h4>电</h4>
          <h3>5487215</h3>
          <p>千瓦时(kW.h)</p>
        </div>
      </div>
      <div class="col-sm-4 main-date-pl">
        <div class="main-1">
          <span class="main-dateicon main-temp-icon"></span>
          <h4>水</h4>
          <h3>6587152</h3>
          <p>吨(t)</p>
        </div>
      </div>
      <div class="col-sm-4 main-date-pl">
        <div id=" " class="main-1">
          <span class="main-dateicon main-service-icon"></span>
          <h4>气</h4>
          <h3>242513</h3>
          <p>立方米(m³)</p>
        </div>
      </div>
    </div>
    <div class="col-lg-6 col-md-12">
      <div id="totalConsumption" class="main-box main-total-2">
        <h5>能耗总缆(用电量)</h5>
        <div id="dayConsumption" class="col-md-6 col-xs-12">
          <div class="main-total-left">
            <span class="main-pic1"></span>
            <div class="main-total-rig main-left3">
              <span>当日</span>
              <div class="main-rig">
                <span class="red">12800</span>
                <span>kW.h</span>
              </div>
            </div>
            <div  class="main-total-rig">
              <span>昨日</span>
              <div class="main-rig">
                <span class="grey">12800</span>
                <span>kW.h</span>
              </div>
            </div>
          </div>
        </div>
        <div id="weekConsumption" class="col-md-6 col-xs-12">
          <div class="main-total-left pink">
            <span class="main-pic1 pic-pink"></span>
            <div class="main-total-rig main-left3">
              <span>本周</span>
              <div class="main-rig">
                <span class="red">12800</span>
                <span>kW.h</span>
              </div>
            </div>
            <div class="main-total-rig">
              <span>上周</span>
              <div class="main-rig">
                <span class="grey">12800</span>
                <span>kW.h</span>
              </div>
            </div>
          </div>
        </div>
        <div id="monthConsumption" class="col-md-6 col-xs-12">
          <div class="main-total-left d-blue">
            <span class="main-pic1 d-blue2"></span>
            <div class="main-total-rig main-left3">
              <span>当月</span>
              <div class="main-rig">
                <span class="red">12800</span>
                <span>kW.h</span>
              </div>
            </div>
            <div class="main-total-rig">
              <span>上月</span>
              <div class="main-rig">
                <span class="grey">12800</span>
                <span>kW.h</span>
              </div>
            </div>
          </div>
        </div>
        <div id="yearConsumption" class="col-md-6 col-xs-12">
          <div class="main-total-left zs">
            <span class="main-pic1 zs2"></span>
            <div class="main-total-rig main-left3">
              <span>当年</span>
              <div class="main-rig">
                <span class="red">12800</span>
                <span>kW.h</span>
              </div>
            </div>
            <div class="main-total-rig">
              <span>去年</span>
              <div class="main-rig">
                <span class="grey">12800</span>
                <span>kW.h</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-6 col-md-12">
      <div class="main-box daily">
        <h5>月用量图（单位：kW）</h5>
        <div class="col-md-1 col-xs-12 chart1">
          <div class="col-lg-12 col-md-12 col-sm-2 col-xs-2">
            <acronym title="电">
              <button class="btn btn-elc btn-elc-selected"></button>
            </acronym>
          </div>
          <div class="col-lg-12 col-md-12 col-sm-2 col-xs-2">
            <acronym title="水">
              <button class="btn btn-water"></button>
            </acronym>
          </div>
          <div class="col-lg-12 col-md-12 col-sm-2 col-xs-2">
            <acronym title="气">
              <button class="btn btn-solar"></button>
            </acronym>
          </div>
        </div>
        <div id="" class="col-md-11 col-xs-12 main-line">
          <!--dayLine-->
          <div id="dayLine"></div>
        </div>
      </div>
    </div>
    <div class="col-lg-6 col-md-12">
      <div class="main-box daily">
        <h5>日负荷曲线（单位：kW.h）</h5>
        <div id="hourLine"><!--hourLine--></div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="app/lib/echarts/echarts.min.js"></script>
<script type="text/javascript" src="app/lib/echarts/shine.js"></script>
<script type="text/javascript" src="app/js/main.js"></script>