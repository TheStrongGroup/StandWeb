var Static=(function(){

	function _static(){

		var nodesArr=[];

		this.getObj=function(){
			return nodesArr;
		}

		this.getData=function(url,params,type){
			getByAjax(url,params,type)
		};

		function getByAjax(url,params,type){

			$.getJSON(url, params, function(data) {
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
			//console.log(treeData);
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

	return _static;

})();

jQuery(document).ready(function($) {
	
	var static = new Static();
	static.getData("rest/statistical/analysis","startDate&endDate&devIds&type=0",0);

	$("#run").click(function(event) {
		var arr = static.getObj();
		var devIds = arr.join(',');
		static.getData("rest/statistical/analysis","startDate=2017-03-02&endDate=2017-03-25&devIds="+devIds+"&type=1",1);
		console.log(arr);
	});
});