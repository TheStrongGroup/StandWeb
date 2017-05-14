/**
* @author Zhangben 
* @date 2017-04-23 17:15
* @description Js code for main page.
*  	name the id: "BarChart":过去31天用电,"LineChart":24小时负荷曲线
* 	"OverView":能耗概览
*/

var Home = (function(){
	function _home(){

		this.getData=function(url,params){
			initDOM();
			showDate();
			$.getJSON(url, params, function(data) {
				console.log(data);
				showCompareData(data.energySurvey);
			});
		}

		function initDOM(){
			$("#dayConsumption .red").html("--");
			$("#dayConsumption .grey").html("--");

			$("#weekConsumption .red").html("--");
			$("#weekConsumption .grey").html("--");

			$("#monthConsumption .red").html("--");
			$("#monthConsumption .grey").html("--");

			$("#yearConsumption .red").html("--");
			$("#yearConsumption .grey").html("--");
		}

		function showCompareData(data){
			if(data.hasOwnProperty('today') && data.today != null)
				$("#dayConsumption .red").html(data.today);	

			if(data.hasOwnProperty('yesterday') && data.yesterday != null)
				$("#dayConsumption .grey").html(data.yesterday);

			if(data.hasOwnProperty('thisweek') && data.thisweek != null)
				$("#weekConsumption .red").html(data.thisweek);	

			if(data.hasOwnProperty('lastweek') && data.lastweek != null)
				$("#weekConsumption .grey").html(data.lastweek);

			if(data.hasOwnProperty('thismonth') && data.thismonth != null)
				$("#monthConsumption .red").html(data.thismonth);	

			if(data.hasOwnProperty('lastmonth') && data.lastmonth != null)
				$("#monthConsumption .grey").html(data.lastmonth);

			if(data.hasOwnProperty('thisyear') && data.thisyear != null)
				$("#yearConsumption .red").html(data.thisyear);	

			if(data.hasOwnProperty('lastyear') && data.lastyear != null)
				$("#yearConsumption .grey").html(data.lastyear);

		}

		function showDate(){
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth()+1;
			var monthDay = date.getDate();
			var weekDay = date.getDay();
			var weekDayCh;

			switch(weekDay){
				case 0:
					weekDayCh="周日";
				break;
				case 1:
					weekDayCh="周一";
				break;
				case 2:
					weekDayCh="周二";
				break;
				case 3:
					weekDayCh="周三";
				break;
				case 4:
					weekDayCh="周四";
				break;
				case 5:
					weekDayCh="周五";
				break;
				case 6:
					weekDayCh="周六";
				break;
			}


			$("#currentDate>p").eq(0).html(year+"年"+month+"月"+monthDay+"日");

			$("#currentDate>p").eq(1).html(weekDayCh);
		}

	};

	return _home;
})();

jQuery(document).ready(function($) {
	
	$("#fistpage").addClass('active');

	var home = new Home();
	home.getData("rest/energysurvey/main");

});