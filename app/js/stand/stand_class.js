var StandClass = (function(){

	function _standClass(){

		this.getData=function(url,params){

			getByAjax(url,params);

		};

		function getByAjax(url,params){

			$.getJSON(url, params, function(data) {
				

				console.log(data);

			});

		};

		function generateSelect(data){
			Stand.selectAppender(data,$("#buildinglist"),);
		}

	};

	return _standClass;

})();

jQuery(document).ready(function($) {
	
	var standClass = new StandClass();

	standClass.getData("rest/energy/class","startDate=&endDate=&classId=1&type=0");

});