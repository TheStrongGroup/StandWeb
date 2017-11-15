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
                //console.log(data);
                if(type==0){
                    generateSelect(data[0].classlist);
                    showCompare(data[1]);
                    showDay(data[2]);
                    showMultiBar(data[3]);
                }else if(type==1){
                    showCompare(data[0]);
                    showDay(data[1]);
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

            if(data.hasOwnProperty('today')&&data.hasOwnProperty('yesterday')){
                if(data.today != "" && data.yesterday != ""){
                    var today = parseFloat(data.today);
                    var yesterday = parseFloat(data.yesterday);
                    var diff = today-yesterday;
                    $(".row>.col-xs-4>h4").eq(2).html(diff.toFixed(2));
                }
            }

            if(data.thismonth != "")
                $(".row>.col-xs-4>h4").eq(3).html(data.thismonth);

            if(data.lastmonth != "")
                $(".row>.col-xs-4>h4").eq(4).html(data.lastmonth);

            if(data.hasOwnProperty('thismonth')&&data.hasOwnProperty('lastmonth')){
                if(data.thismonth != "" && data.lastmonth != ""){
                    var thismonth = parseFloat(data.thismonth);
                    var lastmonth = parseFloat(data.lastmonth);
                    var diff = thismonth-lastmonth;
                    $(".row>.col-xs-4>h4").eq(5).html(diff.toFixed(2));
                }
            }

        }

        function showDay(data){

            var time=[];
            var values=[];

            var maxValue=0;
            var minValue=999999;
            var sum=0;
            var avg=0;
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
            }else{
                if(minValue > maxValue){
                    if(maxValue == 0){
                        maxValue ="--";
                    }

                    if(minValue == 999999)
                        minValue="--";
                }

                avg="--";

            }



            obj.max = maxValue;
            obj.min = minValue;
            if(avg != "--"){
                obj.avg = (sum/data.oneday.length).toFixed(2);
            }else{
                obj.avg = avg;
            }



            var width = $("#dayChart").parent('div').width();
            var height = $(".class-h").height()-36;
            var color=['#FFC244','#6EB5FF'];
            initLine($("#dayChart"),'line',time,values,width,height,color);
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
            var color=['#61B2F0','#B0A5C9'];
            var width = $("#chartBar").parent('div').width();
            var height = $(".class-bottom").height()-36;
            initLine($("#chartBar"),'bar',time,values,width,height,color);

        }

        function initLine($container,serieType,time,data,width,height,color){

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
                },
                color:color
            };

            line.setOption(options);
        }

        function showMaxMinInfo(value){

            $(".class-h span").html("--");
            $(".class-h span").css("color","black");

            $(".class-h span").eq(0).html(value.max);
            $(".class-h span").eq(1).html(value.min);
            $(".class-h span").eq(2).html(value.avg);

        }

    };

    return _standClass;

})();

jQuery(document).ready(function($) {

    $("#energysubery").addClass('active');
    $("#calssfi").addClass('active');
    //$("#calssfi").css('cssText','background-color:#1D9F2B!important;');
    $("#calssfi>a").css('cssText','color:white!important;');

    var standClass = new StandClass();
    standClass.init();
    standClass.getData("rest/energy/class","startDate=&endDate=&classId=1&type=0&typeCode=1",0);

    $("#yearSearch").click(function(event) {
        var day=$("#yearcalendar").val();
        var classId=$("#buildinglist").val();

        standClass.getData("rest/energy/class","startDate="+day+"&endDate=&classId="+classId+"&type=1",1);

    });

    $(".class-search").click(function(event) {
        var startDate=$("#StartBox").val();
        var endDate=$("#EndBox").val();
        var classId=$("#buildinglist").val();
        var typeCode=$("#TypeCode").val();

        standClass.getData("rest/energy/class","startDate="+startDate+"&endDate="+endDate+"&classId="+classId+"&type=2"+"&typeCode="+typeCode,2);
    });


});