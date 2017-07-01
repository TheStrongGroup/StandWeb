var StandClass = (function(){

	function _standClass(){

		this.getData=function(url,params){

			initDOM();
			getByAjax(url,params);

		};

		function getByAjax(url,params){

			$.getJSON(url, params, function(data) {

				console.log(data);

				generateSelect(data[0].classlist);
				showCompare(data[1]);
				showDay(data[2]);
			});

		};

		function generateSelect(data){

			Stand.selectAppender(data,$("#buildinglist"),"className","classid");
		}

		function initDOM(){
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#yearChose"),$("#yearcalendar"));
			$(".row>.col-xs-4>h4").html("--");
		}

		function showCompare(data){
			if(data.today != "")
				$(".row>.col-xs-4>h4").eq(0).html(data.today);

			if(data.yesterday != "")
				$(".row>.col-xs-4>h4").eq(1).html(data.yesterday);

			if(data.today != "" && data.yesterday != ""){
				var today = parseFloat(data.today);
				var yesterday = parseFloat(data.yesterday);
				var diff = today-yesterday;
				$(".row>.col-xs-4>h4").eq(2).html(diff);
			}

			if(data.thismonth != "")
				$(".row>.col-xs-4>h4").eq(3).html(data.thismonth);

			if(data.lastmonth != "")
				$(".row>.col-xs-4>h4").eq(4).html(data.lastmonth);

			if(data.thismonth != "" && data.lastmonth != ""){
				var thismonth = parseFloat(data.thismonth);
				var lastmonth = parseFloat(data.lastmonth);
				var diff = thismonth-lastmonth;
				$(".row>.col-xs-4>h4").eq(5).html(diff);
			}
		}

		function showDay(data){

			var time=[];
			var values=[];

			if(data.oneday.length>0){
				$.each(data.oneday, function(key, val) {
					time.push(val.datatime);
					values.push(val.data);
				});
			}

			var width = $("#dayChart").parent('div').width();
			var height = $(".class-h").height()-36;

			initLine($("#dayChart"),time,values,width,height);

		}

		function showMultiBar(data){
			var time=[];
			var values=[];

			if(data.listData.length>0){
				$.each(data.oneday, function(key, val) {
					time.push(val.datatime);
					values.push(val.data);
				});
			}
		}

		function initLine($container,time,data,width,height){

			$container.html("");
			$container.width(width);
			$container.height(height);

			var line = echarts.init($container.get(0),'shine');

			var options = {
				tooltip:{
					trigger:'axis',
					axisPointer:{
						type:'shadow'
					}
				},
				grid:{
					left:'3%',
					right:'5%',
					bottom:'10%',
					top:10,
					containLabel:true
				},
				xAxis:[{
					type:'category',
					data:time
				}],
				yAxis:[{
					type:'value',
					axisLabel: {
			            formatter: '{value}'
			        }
				}],
				series:{
					type:'line',
					data:data
				}
			};

			line.setOption(options);
		}

	};

	return _standClass;

})();

jQuery(document).ready(function($) {
	
	var standClass = new StandClass();

	standClass.getData("rest/energy/class","startDate=&endDate=&classId=1&type=0");

});