var Report = (function(){
	function _report(){

		var nodesArr=[];

		this.getNodes=function(){
			return nodesArr;
		};

		this.getData=function(url,params,type){
			getByAjax(url,params,type);
		};

		this.init = function(){
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#startDate"),$("#startBox"));
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#endDate"),$("#endBox"));
			
		};

		function getByAjax(url,params,type){

			$.getJSON(url,params, function(data) {

				if(type==0){
					showTree(data[0].classlist);
				}else if(type==1){
					showTable(data);
				}
			});

		};

		function showTable(data){
			$("#report").html("<table></table>");
			//$("#report>table").height($(".report-h").height()-36);
			$("#report>table").width($(".report-h").width());
			var column=[
			{field:'devName',title:'设备名称'},{field:'energy',title:'区间能耗'},
			{field:'cash',title:'能耗金额'},{field:'startValue',title:'起始电能'},
			{field:'endValue',title:'结束电能'}
			];
			var tableData=[];
			$.each(data, function(key, val) {
				
				var row={};
				row.devName = val.meterName;
				row.energy = val.energyData;
				row.cash = val.price;
				row.startValue = val.startEnergy;
				row.endValue = val.endEnergy;

				tableData.push(row);
			});
			generateTable($("#report>table"),column,tableData);
		}

		function generateTable($table,columns,data){

			$table.bootstrapTable({
				striped:true,
				classes:'table table-bordered',
				columns:columns,
				data:data
			});

		}

		function showTree(data){
			var treeString = JSON.stringify(data);
			treeString= treeString.replace(/sub/g,'nodes')
						.replace(/className/g,'text')
						.replace(/devId/g,'id')
						.replace(/devName/g,'text');

			var treeData = JSON.parse(treeString);
			$("#treeview").width($(".statistical-left").width());
			$("#treeview").height($(".statistical-left").height()-140);

			Stand.generateTree(treeData,$("#treeview"));

			$("#treeview").on('nodeChecked',function(event,node){
				if(node.hasOwnProperty("classId")){

					$("#treeview").treeview('uncheckNode',[node.nodeId,{silent:true}]);
				}else{
					nodesArr.push(node.id);
				}
				
			});

			$("#treeview").on('nodeUnchecked',function(event,node){
				if(!node.hasOwnProperty("classId")){
					if(node.id==nodesArr[0])
						nodesArr.shift();
					else if($.inArray(node.id, nodesArr)){
						var id=$.inArray(node.id, nodesArr);
						nodesArr.splice(id,1);
					}
				}

			});
		}

	};

	return _report;
})();

jQuery(document).ready(function($) {
	

	$("#statisticalreport").addClass('active');
	$("#s_statisticalreport").addClass('active');

	var report = new Report();
	report.init();
	report.getData("rest/statistical/report","startDate=&endDate=&devIds=&type=0",0);

	$("#yearSearch").click(function(event) {
		var startDate = $("#startBox").val();
		var endDate = $("#endBox").val();
		var devIds= report.getNodes().join(",");
		report.getData("rest/statistical/report","startDate="+startDate+"&endDate="+
			endDate+"&devIds="+devIds+"&type=1",1);
	});

	$("#export").click(function(event) {
		var startDate = $("#startBox").val();
		var endDate = $("#endBox").val();
		var devIds= report.getNodes().join(",");
		window.location = "rest/statistical/report?"+"startDate="+startDate+"&endDate="+endDate+
		"&devIds="+devIds+"&type=2";
		
	});

});
