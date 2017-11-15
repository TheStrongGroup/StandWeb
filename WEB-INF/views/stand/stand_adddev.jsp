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
               <div class="col-xs-12 form-group adddev-margin">
                 <label>通讯表号：</label>
                 <input id="devAddr" type="text" class="form-control">
               </div>
             </div>
             <div class="adddev-top1">
                <div class="col-xs-12 form-group">
                 <label>能耗单价：</label>
                 <input id="devPrice" type="text" class="form-control">
               </div>
               <div class="col-xs-12 form-group adddev-margin">
                 <label>自定义分类：</label>
                 <select id="Select"></select>
               </div>
             </div>
             <div class="adddev-top1">
               <div class="form-group">
                 <label class="adddev-set">设备描述：</label>
                 <textarea id="remark" class="form-control" row="1"></textarea>
               </div>
             </div>
             <div class="adddev-top1 adddev-button">
               <button type="button" id="Add" class="btn btn-success">添加</button>
               <button type="button" id="Reset" class="btn btn-success btn-adddev">重置</button>
             </div>
         </div>
      </div>     
    <div class="col-lg-12">
       <div id="mainTable" class="main-box adddev-bottom">
        
       </div>
    </div>
  </div>
<script type="text/javascript" src="app/js/stand/stand_adddev.js"></script>