var Static=(function(){

	function _static(){

		this.getData=function(url,params,type){
			getByAjax(url,params,type)
		};

		function getByAjax(url,params,type){

			$.getJSON(url, params, function(data) {
				console.log(data);
				showTree(data[0].classlist);
			});
		};

		function showTree(data){
			var treeString = JSON.stringify(data);
			treeString= treeString.replace(/sub/g,'nodes')
						.replace(/classId/g,'id')
						.replace(/className/g,'text')
						.replace(/devId/g,'id')
						.replace(/devName/g,'text');
			console.log(treeString);
		}

	};

	return _static;

})();

jQuery(document).ready(function($) {
	
	var static = new Static();
	static.getData("rest/statistical/analysis","startDate&endDate&devIds&type=0",0);

});