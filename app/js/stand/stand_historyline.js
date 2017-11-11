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
				if(type==0){
					showTree(data[0].classlist);
				}else if(type==1){
					showLine(data);
				}
			});

		}

		function showLine(data){
			if(data.length<=0)
				return;
			var series=[];
			var time=[];
			var legend=[];
			for (var i =0;i< data.length ; i++) {
				legend.push(data[i].linename);
				var serie = {
					name:data[i].linename,
					type:'line',
					data:[]
				}
				$.each(data[i].linedata, function(index, val) {
					 serie.data.push(val.data);
					if($.inArray(val.datatime, time)<0){
						time.push(val.datatime);
					}
				});

				series.push(serie);
			}

            var width=$(".history-h").width();
            var height=$(".history-h").height()-36;
			initLine($("#chartLine"),width,height,time,series,legend);
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

		function initLine($container,width,height,time,series,label){

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
				legend: {

				        //orient: 'vertical',
				        align: 'auto',
				        data: label
				    },
				grid:{
					left:'2%',
					right:'2%',
					bottom:'10%',
					top:'5%',
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
				series:series
			};

			line.setOption(options);
		}
	};

	return _history;

})();

jQuery(document).ready(function($) {

    $("#historyline").addClass('active');
    $("#s_historyline").addClass('active');
    //$("#s_historyline").css('cssText','background-color:#1D9F2B!important;');
	$("#s_historyline>a").css('cssText','color:white!important;');

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
		if(node.length==0){
			alert("请选中需要查询的设备！");
			return;
		}
		history.getData("rest/history/line","startDate="+startDate+" 00:00:00"
			+"&endDate="+endDate+" 23:59:00"
			+"&lineType="+param+"&devId="+node[0].id+"&type=1",1);
	});


});