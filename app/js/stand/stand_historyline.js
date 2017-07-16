var History = (function(){

	function _history(){

		this.getData = function(url,params,type){
			getByAjax(url,params,type);
		};

		this.init = function(){
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#startDate"),$("#startBox"));
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#endDate"),$("#endBox"));
			
		};

		function getByAjax(url,params,type){

			$.getJSON(url,params, function(data) {
				console.log(data);
				if(type==0){
					showTree(data[0].classlist);
				}
			});

		}

		function showLine(){
			
		}

		function showTree(data){
			var treeString = JSON.stringify(data);
			treeString= treeString.replace(/sub/g,'nodes')
						.replace(/className/g,'text')
						.replace(/devId/g,'id')
						.replace(/devName/g,'text');

			var treeData = JSON.parse(treeString);
			var option={
				data: treeData,
				showIcon: true,
				selectedColor:"#cee4f9",
				highlightSelected:true,
				showBorder:true,
				levels:2
			};

			Stand.generateTree(treeData,$("#treeview"),option);

			$("#treeview").on('nodeSelected',function(event,node){
				if(node.hasOwnProperty("classId")){
					$("#treeview").treeview('unselectNode', [ node.nodeId, { silent: true } ]);
				}
				
			});
		}
	};

	return _history;

})();

jQuery(document).ready(function($) {
	
	var history = new History();
	history.init();
	history.getData("rest/history/line","type=0",0);

	$("#startDate").datetimepicker().on('changeDate',function(e){
		var date = e.date;
		var year = date.getFullYear();
		var month = date.getMonth()+1;

		month<10?(month ="0"+month):(month);
		var currentDay = date.getDate();

		currentDay<10?(currentDay = "0"+currentDay):currentDay;

		var lastDayofCurrentMonth = new Date(year,month,0).getDate();
		var startDate = new Date(year+"/"+month+"/"+currentDay);
		var endDate = new Date(year+"/"+month+"/"+lastDayofCurrentMonth);

		$("#endDate").datetimepicker('setStartDate',year+"-"+month+"-"+currentDay);
		$("#endDate").datetimepicker('setEndDate',year+"-"+month+"-"+lastDayofCurrentMonth);

	});

	$("#yearSearch").click(function(event) {
		var node = $("#treeview").treeview('getSelected');
		var param = $("#ElecParam").val();
		var startDate = $("#startBox").val();
		var endDate = $("#endBox").val();
		console.log(param);
		if(node.length==0){
			alert("请选中需要查询的设备！");
			return;
		}
		history.getData("rest/history/line","startDate="+startDate+" 00:00:00"
			+"&endDate="+endDate+" 23:59:00"
			+"&lineType="+param+"&devId="+node[0].id+"&type=1",1);
	});


});