<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="main-container">
      <div class="col-lg-12">
         <div class="main-box adddev-h">
           <form class="navbar-form navbar-left">
             <div class="adddev-top1">
               <div class="col-xs-12 form-group">
                 <label>设备名称：</label>
                 <input id="devName" type="text" class="form-control">
               </div>
               <div class="col-xs-12 form-group">
                 <label>通讯表号：</label>
                 <input id="devAddr" type="text" class="form-control">
               </div>
             </div>
             <div class="adddev-top1">
                <div class="col-xs-12 form-group">
                 <label>能耗单价：</label>
                 <input id="devPrice" type="text" class="form-control">
               </div>
               <div class="col-xs-12 form-group">
                 <label>自定义分类：</label>
                 <select id="Select"></select>
               </div>
             </div>
             <div class="adddev-top1">
               <div class="form-group">
                 <label>备注：</label>
                 <textarea id="remark" class="form-control" row="3"></textarea>
               </div>
             </div>
             <div class="adddev-top1">
               <button type="button" id="Add" class="btn btn-success">添加</button>
               <button type="button" id="Reset" class="btn btn-success">重置</button>
             </div>
         </div>
      </div>     
    <div class="col-lg-12">
       <div id="mainTable" class="main-box adddev-bottom">
        
       </div>
    </div>
  </div>
<script type="text/javascript" src="app/js/stand/stand_adddev.js"></script>