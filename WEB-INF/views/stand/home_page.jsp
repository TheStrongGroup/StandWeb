<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <div class="main-container">
    <div class="row">
      <div class="col-md-6 col-sm-12 main-left-pr">
        <div class="col-sm-4 main-date-pl">
          <div class="main-1">
            <span class="main-dateicon"></span>
            <div id="ElecValue" class="main-date">
              <h4>电</h4>
              <p></p>
              <p>kW·h</p>
            </div>
          </div> 
        </div>
        <div class="col-sm-4 main-date-pl">
          <div class="main-1">
            <span class="main-dateicon main-temp-icon"></span>
            <div id="WaterValue" class="main-date main-temp">
              <h4>水</h4>
              <p></p>
              <p>吨</p>
            </div>
          </div> 
        </div>
        <div class="col-sm-4 main-date-pl">
          <div id="deviceStatus" class="main-1">
            <span class="main-dateicon main-service-icon"></span>
            <div id="GasValue" class="main-date main-service">
              <h4>燃气</h4>
              <p></p>
              <p>立方米</p>
            </div>
          </div> 
        </div>
      </div>
      <div class="col-md-6 col-sm-12">
        <div id="totalConsumption" class="main-box main-total-2">
          <h5>能耗总缆</h5>
          <div id="dayConsumption" class="col-md-6">   
            <div class="main-total-left">
              <span class="main-pic1"></span>
              <div class="main-total-rig main-left3">   
                <span>当日用电量</span>
                <div class="main-rig">
                  <span class="red">12800</span>
                  <span>kW.h</span>
                </div>  
              </div>
              <div  class="main-total-rig">   
                <span>昨日用电量</span>
                <div class="main-rig">
                  <span class="grey">12800</span>
                  <span>kW.h</span>
                </div>  
              </div>
            </div>
          </div>
          <div id="weekConsumption" class="col-md-6">   
            <div class="main-total-left pink">
              <span class="main-pic1 pic-pink"></span>
              <div class="main-total-rig main-left3">   
                <span>本周用电量</span>
                <div class="main-rig">
                  <span class="red">12800</span>
                  <span>kW.h</span>
                </div>  
              </div>
              <div class="main-total-rig">   
                <span>上周用电量</span>
                <div class="main-rig">
                  <span class="grey">12800</span>
                  <span>kW.h</span>
                </div>  
              </div>
            </div>
          </div>
          <div id="monthConsumption" class="col-md-6">   
            <div class="main-total-left d-blue">
              <span class="main-pic1 d-blue2"></span>
              <div class="main-total-rig main-left3">   
                <span>当月用电量</span>
                <div class="main-rig">
                  <span class="red">12800</span>
                  <span>kW.h</span>
                </div>  
              </div>
              <div class="main-total-rig">   
                <span>上月用电量</span>
                <div class="main-rig">
                  <span class="grey">12800</span>
                  <span>kW.h</span>
                </div>  
              </div>
            </div>
          </div>
          <div id="yearConsumption" class="col-md-6">   
            <div class="main-total-left zs">
              <span class="main-pic1 zs2"></span>
              <div class="main-total-rig main-left3">   
                <span>当年用电量</span>
                <div class="main-rig">
                  <span class="red">12800</span>
                  <span>kW.h</span>
                </div>  
              </div>
              <div class="main-total-rig">   
                <span>去年用电量</span>
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
      <div class="col-md-6 col-sm-12">
        <div class="main-box daily">
          <h5>近31日用量体图（单位：千瓦时）</h5>
          <div id="dayLine"></div>
        </div>
      </div>
      <div class="col-md-6 col-sm-12">
        <div class="main-box daily">
          <h5>24小时负荷曲线（单位：千瓦）</h5>
          <div id="hourLine"></div>
        </div>
      </div>
  </div>
</div>
<script type="text/javascript" src="app/lib/echarts/echarts.min.js"></script>
<script type="text/javascript" src="app/lib/echarts/shine.js"></script>
<script type="text/javascript" src="app/js/main.js"></script>