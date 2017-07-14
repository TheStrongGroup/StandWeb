<%--
  新增分类
  Created by IntelliJ IDEA.
  User: yangc
  Date: 2017-05-14
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="main-container">
      <div class="col-lg-12">
         <div class="main-box adddev-h">
           <form class="navbar-form navbar-left">
             <div class="form-group"><label>分类名称：</label><input id="KindAdd" type="text" class="form-control">
             <button type="button" id="AddBtn" class="btn btn-success">添加</button></div>
         </div>
      </div>     
    <div class="col-lg-12">
       <div class="main-box adddev-bottom">
         <table class="table table-striped">
            <thead>
              <tr class="success">
                <th>设备编号</th>
                <th>设备名称</th>
                <th>操作</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>1</td>
                <td>
                  <button type="button" class="btn btn-warning">更新</button>
                  <button type="button" class="btn btn-danger">删除</button>
                </td>
              </tr>
              <tr>
                <td>1</td>
                <td>1</td>
                <td>
                  <button type="button" class="btn btn-warning">更新</button>
                  <button type="button" class="btn btn-danger">删除</button>
                </td>
              </tr>
            </tbody>
         </table>
         
       </div>
    </div>
  </div>
<script src="app/js/stand/stand_addclass.js" type="text/javascript"></script>