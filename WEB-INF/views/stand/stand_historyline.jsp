<%--
  历史曲线
  Created by IntelliJ IDEA.
  User: yangc
  Date: 2017-05-14
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<style>

    tr th {
        vertical-align: middle !important;
        text-align: center !important
    }
</style>
<%@ page language="java" pageEncoding="utf-8" %>
<div class="main-container">
    <div class="row stati-left">
        <div class="col-md-3 col-xs-12 servey-left">
            <div class="servey-left-t statistical-left report">
                <h5>查询日期</h5>
                <div class="row stati-date">
                    <div class="select-width">开始日期：</div>
                    <div class="filter-calc">
                        <div id="startDate" class="input-group date form_date" data-date=""
                             data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                            <input id="startBox" class="form-control" size="16" type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="select-width">截止日期：</div>
                    <div class="filter-calc">
                        <div id="endDate" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy"
                             data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                            <input id="endBox" class="form-control" size="16" type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                    </div>
                </div>
                <h5>曲线种类</h5>
                <select id="ElecParam">
                    <option value="1">电压曲线</option>
                    <option value="2">电流曲线</option>
                    <option value="3">功率曲线</option>
                    <option value="4">功率因数</option>
                    <option value="5">频率曲线</option>
                </select>
                <button id="yearSearch" type="button" class="btn-count5 btn-history"><span>查询</span></button>
                <h5>选择分类</h5>
                <div id="treeview" class="history-tree"></div>
            </div>
        </div>

        <div class="col-md-9 col-xs-12 report2">
            <div class="main-box history-h">
                <h5>历史曲线</h5>
                <div class="col-md-9 col-xs-12 load-calc">
                    <div id="chartLine"></div>
                </div>
            </div>
            <div class="main-box history-h">
                <h5>历史曲线报表</h5>

                <table class="table table-bordered table-striped table-hover text-center">
                    <thead>
                    <tr>
                        <th id="ParamName" rowspan="2"style="width: 22%"></th>
                        <th colspan="2"style="width: 28%">最大</th>
                        <th colspan="2"style="width: 28%">最小</th>
                        <th rowspan="2"style="width: 22%">平均值</th>
                    </tr>
                    <tr>
                        <th style="width: 14%">时间</th>
                        <th style="width: 14%">值</th>
                        <th style="width: 14%">时间</th>
                        <th style="width: 14%">值</th>
                    </tr>
                    </thead>
                    <tbody id="tableBody">
                    </tbody>

                </table>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="app/js/stand/stand_historyline.js"></script>
<script type="text/javascript" src="app/lib/echarts/echarts.min.js"></script>
<script type="text/javascript" src="app/lib/echarts/shine.js"></script>