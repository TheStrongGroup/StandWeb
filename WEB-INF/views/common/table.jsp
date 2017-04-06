<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!-- <div class="container">
	<h1>Export</h1>
	<div id="toolbar">
		<select class="form-control">
			<option value="">Export Basic</option>
			<option value="all">Export All</option>
			<option value="selected">Export Selected</option>
		</select>
	</div>
	<table data-toggle="table" data-toolbar="#toolbar" data-search="true"
		data-show-refresh="true" data-show-toggle="true"
		data-show-columns="true" data-sort-name="stargazers_count"
		data-sort-order="desc" data-show-export="true"
		data-show-pagination-switch="true" data-pagination="true"
		data-show-footer="false" data-height="800"
		data-url="https://api.github.com/users/wenzhixin/repos"
		data-query-params="queryParams" data-pagination="true"
		data-search="true">
		<thead>
			<tr>
				<th data-field="state" data-checkbox="true"></th>
				<th data-field="name" data-sortable="true">Name</th>
				<th data-field="stargazers_count" data-sortable="true">Stars</th>
				<th data-field="forks_count" data-sortable="true">Forks</th>
				<th data-field="watchers_count" data-sortable="true">Watchers</th>
				<th data-field="description" data-sortable="true">Description</th>
				<th data-field="open_issues_count" data-sortable="true"
					data-visible="false">Open Issues</th>
			
			</tr>
		</thead>
	</table>
</div> -->

<div class="container">
	<table id="table" data-toggle="table" data-show-export="false"
		data-show-refresh="true" data-show-toggle="true"
		data-pagination="true" data-click-to-select="false"
		data-toolbar="#toolbar" data-url="rest/linechart"
		data-show-columns="true">
		<thead>
			<tr>
				<th data-field="state" data-checkbox="true"></th>
				<th data-field="F_EnergyItemname" data-sortable="true">Name</th>
				<th data-field="F_Hour" data-sortable="true">Hour</th>
				<th data-field="F_ThisValue" data-sortable="true">ThisValue</th>
				<th data-field="F_PreValue" data-sortable="true">PreValue</th>
				<!-- 	<th data-field="description" data-sortable="true">Description</th>
				<th data-field="open_issues_count" data-sortable="true"
					data-visible="false">Open Issues</th> -->

			</tr>
		</thead>
	</table>
</div>
<style>
.bars {
	height: 0px !important;
}
</style>


<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="app/js/table.js"></script>