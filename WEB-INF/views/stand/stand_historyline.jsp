<%--
  ��ʷ����
  Created by IntelliJ IDEA.
  User: yangc
  Date: 2017-05-14
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="main-container">
    <div class="row stati-left">
        <div class="col-md-3 col-xs-12 servey-left">
          <div class="servey-left-t statistical-left report">
          <h5>��ѯ����</h5>
          <div class="row stati-date">
            <div class="select-width">��ʼ���ڣ�</div>
              <div class="filter-calc">
               <div id="startDate" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input id="startBox" class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
            </div>
          <div class="row">
            <div class="select-width">��ֹ���ڣ�</div>
              <div class="filter-calc">
               <div id="endDate" class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                  <input id="endBox" class="form-control" size="16" type="text" value="" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
              </div>
            </div>
            <h5>��������</h5>
            <select id="ElecParam" class="form-control">
      			  <option value="1">��ѹ����</option>
      			  <option value="2">��������</option>
      			  <option value="3">��������</option>
      			  <option value="4">��������</option>
              <option value="5">Ƶ������</option>
      			</select>
            <h5>ѡ�����</h5>
            <div id="treeview" class="history-tree"></div>
            <button id="yearSearch" type="button" class="btn-count5"><span>��ѯ</span></button>
            </div>
        </div>

      <div class="col-md-9 col-xs-12 report2">
         <div class="main-box history-h">
           <div class="col-md-9 col-xs-12 load-calc">

           </div>
         </div>
         <div class="main-box history-h">
           <div class="col-md-9 col-xs-12 load-calc">
            <div id="chartLine"></div>
           </div>
         </div>
      </div>
    </div>      
  </div>
<script type="text/javascript" src="app/js/stand/stand_historyline.js"></script>
