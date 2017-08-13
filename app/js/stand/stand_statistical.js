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

				if(type==0){
					showTree(data[0].classlist);
				}else if(type==1){
					showLineAndPie(data);
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

		this.init = function(){
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#startDate"),$("#startBox"));
			Stand.initDateTimePicker("CURRENTDATE",new Date(),$("#endDate"),$("#endBox"));
		}

		function showLineAndPie(data){
			var time=[];
			var series=[];
			var barSeries=[];
			var legend=[];
			var piedata=[];
			var sumData=0;
			for (var i = 0; i <data.length-1; i++) {

				legend.push(data[i].devName);
				var serie={
								name:data[i].devName,
								type:'line',
								data:[]
							};
				var bar={
								name:data[i].devName,
								type:'bar',
								data:[]
							};
				$.each(data[i].data, function(index, value) {
					if($.inArray(value.datatime, time)<0){
						time.push(value.datatime);
					}

					serie.data.push(value.data);
					bar.data.push(value.data);
					sumData+=value.data;
				});

				barSeries.push(bar);
				series.push(serie);

				piedata.push({value:sumData,name:data[i].devName});
				
			}

			//console.log(piedata);
			var width=$(".class-h").width();
			var height=$(".class-h").height()-36;
			var barW = $("#chartBar").parent('div').parent('div').width();
			var barH = $("#chartBar").parent('div').parent('div').height()-36;
			initLine($("#chartLine"),width,height,time,series,legend);
			initLine($("#chartBar"),barW,barH,time,barSeries,legend);
			showPie(legend,piedata);
		}

		function showPie(legend,data){
			$("#chartPie").html("");
			$("#chartPie").width($("#chartPie").parent('div').parent('div').width());
			$("#chartPie").height($("#chartPie").parent('div').parent('div').height());

			var pie = echarts.init($("#chartPie").get(0),'shine');
			var option = {
				    
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c}"
				    },
				    legend: {
				        orient: 'vertical',
				        left: 'left',
				        data: legend
				    },
				    series : [
				        {

				            type: 'pie',
				            radius : '55%',
				            center: ['50%', '50%'],
				            data:data,
				            itemStyle: {
				                emphasis: {
				                    shadowBlur: 10,
				                    shadowOffsetX: 0,
				                    shadowColor: 'rgba(0, 0, 0, 0.5)'
				                }
				            }
				        }
				    ]
				};
			pie.setOption(option);
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
				series:series
			};

			line.setOption(options);
		}

	};

	return _static;

})();

jQuery(document).ready(function($) {
	

	$("#statistical").addClass('active');
	$("#s_statistical").addClass('active');


	var static = new Static();
	static.init();
	static.getData("rest/statistical/analysis","startDate&endDate&devIds&type=0",0);

	$("#run").click(function(event) {
		var arr = static.getObj();
		var devIds = arr.join(',');
		var startDate = $("#startBox").val();
		var endDate = $("#endBox").val();
		if(devIds==''){
			alert("请选择设备！");
			return;
		}
		static.getData("rest/statistical/analysis","startDate="+startDate+"&endDate="+endDate+"&devIds="+devIds+"&type=1",1);
	
	});

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

	
});