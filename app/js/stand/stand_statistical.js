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
			
		}

		function showLineAndPie(data){
			var time=[];
			var series=[];
			var legend=[];
			var piedata=[];
			for (var i = 0; i <data.length-1; i++) {

				if(data[i].hasOwnProperty('sumData')){
					var serie={
								type:'line',
								data:[]
							};
					$.each(data[i], function(index, val) {

						if(index != "sumData"){
							serie.name=index;
							legend.push(index);
							$.each(val, function(key, value) {
								
								serie.data.push(value.data);
								if($.inArray(value.datatime, time)<0){
									time.push(value.datatime);
								}
								
							});
						}
						if(index=="sumData"){

							piedata.push({value:val,name:legend[i]});
						}
					});

					series.push(serie);
				}
				
			}

			console.log(piedata);
			var width=$(".class-h").width();
			var height=$(".class-h").height()-36;
			initLine($("#chartLine"),width,height,time,series);
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
				        formatter: "{a} <br/>{b} : {c} ({d})"
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

		function initLine($container,width,height,time,series){

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
					left:'5%',
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
			            formatter: '{value} k·Wh'
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
	
	var static = new Static();
	static.getData("rest/statistical/analysis","startDate&endDate&devIds&type=0",0);

	$("#run").click(function(event) {
		var arr = static.getObj();
		var devIds = arr.join(',');
		static.getData("rest/statistical/analysis","startDate=2017-03-02&endDate=2017-03-25&devIds="+devIds+"&type=1",1);
		console.log(arr);
	});
});