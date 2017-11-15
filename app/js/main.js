/**
 * @date 2017-04-23 17:15
 * @description Js code for main page.
 *    name the id: "BarChart":过去31天用电,"LineChart":24小时负荷曲线
 *    "OverView":能耗概览
 */

var Home = (function () {
    function _home() {

        this.getData = function (url, params) {
            initDOM();
            $.getJSON(url, params, function (data) {
                //console.log(data);

                showEnergyData(data);
                showCompareData(data.energySurvey);
                showHours(data);
                showDays(data);

                showTypeButton(data.energyTypeId);
            });
        }

        function initDOM() {
            $("#dayConsumption .red").html("--");
            $("#dayConsumption .grey").html("--");

            $("#weekConsumption .red").html("--");
            $("#weekConsumption .grey").html("--");

            $("#monthConsumption .red").html("--");
            $("#monthConsumption .grey").html("--");

            $("#yearConsumption .red").html("--");
            $("#yearConsumption .grey").html("--");

            $("#ElecValue>h3").html("--");
            $("#ElecValue>p").html("千瓦时(kW·h)");

            $("#WaterValue>h3").html("--");
            $("#WaterValue>p").html("吨(t)");

            $("#GasValue>h3").html("--");
            $("#GasValue>p").html("立方米(m³)");

            $('.btnType button').css('backgroundColor','#969696');
            $("#Elec button").css('backgroundColor','#3DBDF5');
        }

        function showTypeButton(data){
            if(!data.hasOwnProperty('elecId'))
                $("#Elec").hide();
            else{
                $("#Elec button").click(function(){
                    btnClickFunction(data.elecId,$(this),"elec");
                });
            }

            if(!data.hasOwnProperty('waterId'))
                $("#Water").hide();
            else{
                $("#Water button").click(function(){
                    btnClickFunction(data.waterId,$(this),"water");
                });
            }

            if(!data.hasOwnProperty('gasId'))
                $("#Gas").hide();
            else{
                $("#Gas button").click(function(){
                    btnClickFunction(data.gasId,$(this),"gas");
                });
            }
        }

        function btnClickFunction(type,$btn,typename){
            $('.btnType button').css('backgroundColor','#969696');
            $btn.css('backgroundColor','#3DBDF5');

            switch(typename){
                case "elec":
                    $('.daily').eq(0).children('h5').html("月用电量图（单位：kW·h）");
                    $('.daily').eq(1).children('h5').html("日负荷曲线（单位：kW.h）");
                    break;
                case "water":
                    $('.daily').eq(0).children('h5').html("月用水量图（单位：t）");
                    $('.daily').eq(1).children('h5').html("月用电量图（单位：t）");
                    break;
                case "gas":
                    $('.daily').eq(0).children('h5').html("月用气量图（单位：m³）");
                    $('.daily').eq(1).children('h5').html("月用电量图（单位：m³）");
                    break;
            }

            $.getJSON('rest/energysurvey/typeData', {tableId: type}, function(data) {
                showHours(data);
                showDays(data);
            });
        }

        function showEnergyData(data){

            if(!data.hasOwnProperty('energySurvey'))
                return;

            if(data.energySurvey.hasOwnProperty('sumelecenergy'))
                $("#ElecValue>h3").html(data.energySurvey.sumelecenergy);


            if(data.energySurvey.hasOwnProperty('sumwaterenergy'))
                $("#WaterValue>h3").html(data.energySurvey.sumwaterenergy);

            if(data.energySurvey.hasOwnProperty('sumgasenergy'))
                $("#GasValue>h3").html(data.energySurvey.sumgasenergy);
        }

        function showCompareData(data) {

            if (data.hasOwnProperty('sumenergy') && data.sumenergy != null)
                $("#totalConsumption .red").html(data.sumenergy.toFixed(2));

            if (data.hasOwnProperty('today') && data.today != null)
                $("#dayConsumption .red").html(data.today.toFixed(2));

            if (data.hasOwnProperty('yesterday') && data.yesterday != null)
                $("#dayConsumption .grey").html(data.yesterday.toFixed(2));

            if (data.hasOwnProperty('thisweek') && data.thisweek != null)
                $("#weekConsumption .red").html(data.thisweek.toFixed(2));

            if (data.hasOwnProperty('lastweek') && data.lastweek != null)
                $("#weekConsumption .grey").html(data.lastweek.toFixed(2));

            if (data.hasOwnProperty('thismonth') && data.thismonth != null)
                $("#monthConsumption .red").html(data.thismonth.toFixed(2));

            if (data.hasOwnProperty('lastmonth') && data.lastmonth != null)
                $("#monthConsumption .grey").html(data.lastmonth.toFixed(2));

            if (data.hasOwnProperty('thisyear') && data.thisyear != null)
                $("#yearConsumption .red").html(data.thisyear.toFixed(2));

            if (data.hasOwnProperty('lastyear') && data.lastyear != null)
                $("#yearConsumption .grey").html(data.lastyear.toFixed(2));


        }

        function showHours(data) {
            var times = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23];
            var datas1;
            var datas2;

            $.each(data["tweentyfourhours"], function (key, val) {
                    if (key == 'today') {
                        datas1 = val;
                    }
                    else {
                        datas2 = val;
                    }
                }
            );
            var color=['#61B2F0','#B0A5C9'];
            initLine($("#hourLine"), times, datas1, datas2, '今日', '昨日', 'line',color);
        }


        function showDays(data) {
            var times = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
            var datas1;
            var datas2;

            $.each(data["thityonedays"], function (key, val) {
                if (key == 'thismonth') {
                    datas1 = val;
                }
                else {
                    datas2 = val;
                }
            });

            var color=['#6EB5FF','#FFC244'];
            initLine($("#dayLine"), times, datas1, datas2, '当月', '上月', 'bar',color);
        }

        function initLine($container, time, data1, data2, name1, name2, type,color) {

            $container.html("");
            $container.width($container.parent('div').width());
            $container.height($(".daily").height()-36);
            var line = echarts.init($container.get(0), 'shine');
            var options = {
                tooltip: {
                    trigger: 'axis'
                    // axisPointer: {
                    //     type: 'shadow'
                    // }
                },
                legend:{
                    data:[name1,name2]
                },
                grid: {
                    left: '5%',
                    right: '5%',
                    bottom: '10%',
                    top: 20,
                    containLabel: true
                },
                xAxis: [{
                    type: 'category',
                    data: time
                }],
                yAxis: [{
                    type: 'value',
                    axisLabel: {
                        formatter: '{value}'
                    }
                }],
                series: [{
                    type: type,
                    name: name1,
                    smooth:true,
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data: data1
                }, {
                    type: type,
                    smooth:true,
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    name: name2,
                    data: data2
                }],
                color:color


            };

            line.setOption(options);
        }

        function showDate() {
            var date = new Date();
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var monthDay = date.getDate();
            var weekDay = date.getDay();
            var weekDayCh;

            switch (weekDay) {
                case 0:
                    weekDayCh = "周日";
                    break;
                case 1:
                    weekDayCh = "周一";
                    break;
                case 2:
                    weekDayCh = "周二";
                    break;
                case 3:
                    weekDayCh = "周三";
                    break;
                case 4:
                    weekDayCh = "周四";
                    break;
                case 5:
                    weekDayCh = "周五";
                    break;
                case 6:
                    weekDayCh = "周六";
                    break;
            }


            $("#currentDate>p").eq(0).html(year + "年" + month + "月" + monthDay + "日");

            $("#currentDate>p").eq(1).html(weekDayCh);
        }


    };

    return _home;
})
();

jQuery(document).ready(function ($) {

    $("#fistpage").addClass('active');

    var home = new Home();
    home.getData("rest/energysurvey/main");

});