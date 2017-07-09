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
				console.log(data);

				if(type==0){
					showTree(data[0].classlist);
				}
			});

		};

		function showTree(data){
			var treeString = JSON.stringify(data);
			treeString= treeString.replace(/sub/g,'nodes')
						.replace(/className/g,'text')
						.replace(/devId/g,'id')
						.replace(/devName/g,'text');

			var treeData = JSON.parse(treeString);
			console.log(treeData);
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

});
