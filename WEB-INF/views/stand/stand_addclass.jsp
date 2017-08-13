<%--
  新增分类
  Created by IntelliJ IDEA.
  User: yangc
  Date: 2017-05-14
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<div class="main-container">
    <div class="col-lg-12">
        <div class="main-box adddev-h">
            <form class="navbar-form navbar-left">
                <div class="form-group"><label>分类名称：</label><input id="KindAdd" type="text" class="form-control">
                    <button type="button" id="AddBtn" class="btn btn-success">添加</button>
                </div>
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

<div class="modal fade" id="updateClass" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel"
     data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel"><span id="curname"
                                                                     style="display:none;"></span>分类名更新
                </h4>
            </div>
            <form>
                <div class="form-group" style="display:none;">
                    <label class="col-sm-3 control-label no-padding-right">分类ID :</label>
                    <div class="col-sm-9">
                        <input id="classId" type="text" class="col-xs-10 col-sm-5 form-control" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">当前分类名 :</label>
                    <div class="col-sm-9">
                        <input id="className" type="text" class="col-xs-10 col-sm-5 form-control"
                               disabled="disabled" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">新分类名 :</label>
                    <div class="col-sm-9">
                        <input id="newClassName" type="text" class="col-xs-10 col-sm-5 form-control" value="">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button id="confirm" type="button" class="btn btn-primary">确定</button>
                </div>
        </div>
    </div>
</div>

<script src="app/js/stand/stand_addclass.js" type="text/javascript"></script>