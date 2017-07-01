<%--
  Created by IntelliJ IDEA.
  User: yangc
  Date: 2017-05-14
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="main-container">
      <div class="col-lg-12">
         <div class="main-box adddev-h">
           <form class="navbar-form navbar-left">
             <div class="adddev-top1">
               <div class="col-xs-12 form-group">
                 <label>设备名称：</label>
                 <input type="text" class="form-control">
               </div>
               <div class="col-xs-12 form-group">
                 <label>通讯表号：</label>
                 <input type="text" class="form-control">
               </div>
             </div>
             <div class="adddev-top1">
                <div class="col-xs-12 form-group">
                 <label>能耗单价：</label>
                 <input type="text" class="form-control">
               </div>
               <div class="col-xs-12 form-group">
                 <label>自定义分类：</label>
                 <input type="text" class="form-control">
               </div>
             </div>
             <div class="adddev-top1">
               <div class="form-group">
                 <label>备注：</label>
                 <textarea class="form-control" row="3"></textarea>
               </div>
             </div>
             <div class="adddev-top1">
               <button type="button" class="btn btn-success">添加</button>
               <button type="button" class="btn btn-success">重置</button>
             </div>
         </div>
      </div>     
    <div class="col-lg-12">
       <div class="main-box adddev-bottom">

       </div>
    </div>
  </div>
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="app/js/resize.js"></script>
<script type="text/javascript" src="app/js/te_survey.js"></script>
