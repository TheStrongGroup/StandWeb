<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
    <div class="main-container">
    <div class="col-md-6 col-sm-12 main-left-pr">
      <div class="col-sm-4 main-date-pl">
        <div class="main-1">
          <span class="main-dateicon"></span>
          <div class="main-date">
            <h4>日期</h4>
            <p>2017年5月2日</p>
            <p>周二</p>
          </div>
        </div> 
      </div>
      <div class="col-sm-4 main-date-pl">
        <div class="main-1">
          <span class="main-dateicon main-temp-icon"></span>
          <div class="main-date main-temp">
            <h4>天气预报</h4>
            <p>温度：8-12</p>
            <p>湿度：70%</p>
            <p>风力：中</p>
            <p>pm2.5：良</p>
          </div>
        </div> 
      </div>
      <div class="col-sm-4 main-date-pl">
        <div class="main-1">
          <span class="main-dateicon main-service-icon"></span>
          <div class="main-date main-service">
            <h4>设备状况</h4>
            <p>在线：在线在线</p>
            <p>失联：失联失联</p>
          </div>
        </div> 
      </div>
    </div>
    <div class="col-md-6 col-sm-12">
      <div class="main-box main-total-2">
        <h5>能耗总缆</h5>
        <div class="col-md-12">
            <div class="main-total">
              <span><b>累计用电量</b></span>
              <div class="main-rig">
                <span class="red">12800</span>
                <span>kW.h</span>
              </div>
            </div>
        </div>
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
            <div class="main-total-rig">   
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
    <div class="col-md-6 col-sm-12">
      <div class="main-box">
        <h5>近31日用量体图（单位：千瓦时）</h5>
      </div>
    </div>
    <div class="col-md-6 col-sm-12">
      <div class="main-box">
        <h5>24小时负荷曲线（单位：千瓦）</h5>
      </div>
    </div>
</div>

<script type="text/javascript" src="app/js/main.js"></script>