var StandClass = (function(){

	function _standClass(){

		this.getData=function(url,params,type){

			getByAjax(url,params,type);

		};

		this.init=function(){
			initDOM();
		}

		function getByAjax(url,params,type){

			$.getJSON(url, params, function(data) {

				if(type==0){
					generateSelect(data[0].classlist);
					showCompare(data[1]);
					showDay(data[2]);
					showMultiBar(data[3]);
				}else if(type==1){
					showDay(data[0]);
				}else if(type==2){
					showMultiBar(data[0]);
				}
				
			});

		};

		function generateSelect(data){

			Stand.selectAppender(data,$("#buildinglist"),"className","classId");
		}

		function initDOM(){
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#yearChose"),$("#yearcalendar"));
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#StartDate"),$("#StartBox"));
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#EndDate"),$("#EndBox"));
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
				$(".row>.col-xs-4>h4").eq(2).html(diff.toFixed(2));
			}

			if(data.thismonth != "")
				$(".row>.col-xs-4>h4").eq(3).html(data.thismonth);

			if(data.lastmonth != "")
				$(".row>.col-xs-4>h4").eq(4).html(data.lastmonth);

			if(data.thismonth != "" && data.lastmonth != ""){
				var thismonth = parseFloat(data.thismonth);
				var lastmonth = parseFloat(data.lastmonth);
				var diff = thismonth-lastmonth;
				$(".row>.col-xs-4>h4").eq(5).html(diff.toFixed(2));
			}
		}

		function showDay(data){

			var time=[];
			var values=[];

			var maxValue=0;
			var minValue=9999;
			var sum=0;
			var obj ={};
			if(data.oneday.length>0){
				$.each(data.oneday, function(key, val) {
					time.push(val.datatime);
					values.push(val.data);

					if(maxValue<parseFloat(val.data))
						maxValue=parseFloat(val.data);

					if(minValue>parseFloat(val.data))
						minValue=parseFloat(val.data);

					sum += parseFloat(val.data);
				});
			}

			obj.max = maxValue;
			obj.min = minValue;
			obj.avg = sum/data.oneday.length;

			var width = $("#dayChart").parent('div').width();
			var height = $(".class-h").height()-36;

			initLine($("#dayChart"),'line',time,values,width,height);
			showMaxMinInfo(obj);

		}

		function showMultiBar(data){
			var time=[];
			var values=[];
			
			if(data.listData.length>0){
				$.each(data.listData, function(key, val) {
					time.push(val.datatime);
					values.push(val.data);
				});
			}

			var width = $("#chartBar").parent('div').width();
			var height = $(".class-bottom").height()-36;
			initLine($("#chartBar"),'bar',time,values,width,height);

		}

		function initLine($container,serieType,time,data,width,height){

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
					type:serieType,
					data:data
				}
			};

			line.setOption(options);
		}

		function showMaxMinInfo(value){

			$(".class-h span").html("--");
			$(".class-h span").css("color","black");

			$(".class-h span").eq(0).html(value.max);
			$(".class-h span").eq(1).html(value.min);
			$(".class-h span").eq(2).html(value.avg.toFixed(2));

		}

	};

	return _standClass;

})();

jQuery(document).ready(function($) {

	$("#energysubery").addClass('active');
	$("#calssfi").addClass('active');
	
	var standClass = new StandClass();
	standClass.init();
	standClass.getData("rest/energy/class","startDate=&endDate=&classId=1&type=0",0);

	$("#yearSearch").click(function(event) {
		var day=$("#yearcalendar").val();
		var classId=$("#buildinglist").val();
		
		standClass.getData("rest/energy/class","startDate="+day+"&endDate=&classId="+classId+"&type=1",1);

	});

	$(".class-search").click(function(event) {
		var startDate=$("#StartBox").val();
		var endDate=$("#EndBox").val();
		var classId=$("#buildinglist").val();

		standClass.getData("rest/energy/class","startDate="+startDate+"&endDate="+endDate+"&classId="+classId+"&type=2",2);
	});


});