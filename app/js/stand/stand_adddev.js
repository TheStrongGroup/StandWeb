var Device = (function(){

	function _device(){

		this.load = function(url,params,type){
			getByAjax(url,params,type);
		};

		this.add = function(url,params){
			$.getJSON(url,params, function(data) {
				console.log(data);
			});
		}

		function getByAjax(url,params,type){
			$.getJSON(url, params, function(data) {
				console.log(data);
				if(type==0){
					showSelect(data.classlist.classlist);
					showTable(data.classdata);
				}
			});
		}

		function showSelect(data){
			Stand.selectAppender(data,$("#Select"),"className","classId");
		}

		function showTable(data){
			$("#mainTable").html("<table></table>");
			//$("#report>table").height($(".report-h").height()-36);
			$("#mainTable>table").width($("#mainTable").width());
			var column=[
				{field:'devId',title:'设备编号'},{field:'devName',title:'设备名称'},
				{field:'commId',title:'通讯表号'},{field:'price',title:'能源单价'},
				{field:'className',title:'分类分项'}
			];
			var tableData=[];
			$.each(data, function(key, val) {
				
				var row={};
				row.devId = val.devId;
				row.devName = val.devName;
				row.commId = val.devAddr;
				row.price = val.devPrice;
				row.className = val.devClass;

				tableData.push(row);
			});
			generateTable($("#mainTable>table"),column,tableData);
		}


		function generateTable($table,columns,data){

			$table.bootstrapTable({
				striped:true,
				classes:'table table-bordered',
				columns:columns,
				data:data
			});

		}

	};

	return _device;

})();
jQuery(document).ready(function($) {
	var device = new Device();

	device.load("rest/device/add","type",0);

	$("#Add").click(function(event) {
		var devName = $("#devName").val();
		var devAddr = $("#devAddr").val();
		var devPrice = $("#devPrice").val();
		var classId = $("#Select").val();

		if(devName == null || devName == ""){
			alert("仪表名称不能为空！");
			return;
		}

		if(devAddr == null || devAddr == ""){
			alert("通讯表号不能为空");
			return;
		}

		if(devPrice == null || devAddr==""){
			alert("能源单价不能为空！");
			return;
		}

		if(classId == undefined || classId == ""){
			alert("请选择分类分项！");
			return;
		}

		console.log(devName+"_"+devAddr+"_"+devPrice+"_"+classId);

		device.add("rest/device/add","devName="+devName+"&devId="+devAddr
			+"&devPrice="+devPrice+"&devClass="+classId+"&type=1");

	});

	$("#Reset").click(function(){

		$("#devName").val("");
		$("#devAddr").val("");
		$("#devPrice").val("");
		$("#remark").val("");
	});
});