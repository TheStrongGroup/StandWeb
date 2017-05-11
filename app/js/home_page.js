/// <reference path="../../js/jquery-1.11.3.min.js" />
/// <reference path="../../js/plugins/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" />
/// <reference path="../../js/echarts.min.js" />
/*
*	@author:ZhangBen
*	@Date:2016-04-22
*	@Content:该代码主要用来获取主界面的数据，响应相关控件的事件
*	@Method: getData() 获取整个页面数据的函数
*			 getBuildingsList() 获取建筑物的名称与Id
*			 getBuildingInfo() 获取当前选中建筑物的相关信息
*			 getBuildingEnergy() 获取建筑物综合能耗的数据，并填充table控件
*			 getPie() 获取饼图数据
*			 getLine() 获取曲线图数据
*			 getCompare() 获取环比分析数据
*
*/
var jsonBuildingData = "";
var myPie;
var myLine;
var energyType ="电";
var typeArr = new Array();//存放当前建筑物的能耗个数 2016-05-03 21:27
var version; //2016-05-13 15:36 存放版本信息，若为IE8，则进行处理

$(document).ready(function () {
    //2016-05-13 15:36 存放版本信息，若为IE8，不显示年份按钮
    version =$.browser.version;
    if(version =="8.0"){
        $("#btn_year").hide();
    }
    //当前选中菜单栏的状态
    $("#fistpage").attr("class","start active");
    $("#fistpage").attr("class","active");

    var curDate = new Date();

    var month;
    if (curDate.getMonth() < 10) {
        month = "0" + (curDate.getMonth() + 1);
    } else {
        month = curDate.getMonth();
    }

    var date;
    if(curDate.getDate()<10){
        date ="0"+(curDate.getDate());
    }else{
        date = curDate.getDate();
    }

    $("#calendar").val(curDate.getFullYear() + "-" + month + "-" + date);
    //日期时间控件
	//2016-04-28 修改endDate参数，保证最大日期只能选择当天 修改人：张奔
    $('.form_date').datetimepicker({
        format:'yyyy-mm-dd',
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
		endDate:curDate,
        forceParse: 0,
        pickerPosition: "bottom-left"
    });
    
    getData();
    

    $("#buildinglist").on('change', function () {
        getData();
    });

    $("#calendar").on('change', function () {
        getData();
    });

});

/*$(window).resize(function(){
	myLine.resize();
	myPie.resize();
});*/

$('#main_pie').resize(function() {
    /* Act on the event */
    try{
        myPie.resize();
    }
    catch(ex)
    {

    }
});
$('#main_line').resize(function() {
    try{
        myLine.resize();
    }catch(ex){}
    
});


setInterval(RefreshData,60000);

function RefreshData(){
	var curTime = new Date();
	if(curTime.getMinutes() % 15 !=1)
	{
		return;
	}

	getData();
}
//获取数据，并显示在各个部分
function getData() {
    var $build = $("#buildinglist").val();
    var firstOpen;
    if ($build == null) {
        var params = "buildId=" + "&endDate=" + $("#calendar").val();
        firstOpen = true;
    } else {
        var params = "buildId=" + $build + "&endDate=" + $("#calendar").val();
        firstOpen = false;
    }
    var $body = $('body');
    $body.showLoading();

    var url = "rest/acrel/page";
    $.getJSON(url, params ,function (data) {

        //获取本项目下所有建筑物
        getBuildingsList(data,firstOpen);

        //获取当前选中建筑的基本信息
        getBuildingInfo(data);

        //获取当前表格中的数据
        getBuildingEnergy(data);

        //显示饼图
        //getPie(data, "月");

        //响应年月切换事件
        $("#btn_year").bind("click", function () {
            $("#btn_month").removeClass("btn-month-selected");
            $("#btn_year").removeClass("btn-month-selected");
            $("#btn_year").addClass("btn-month-selected");
            getPie(data, "年");
        });
        $("#btn_month").bind("click", function () {
            $("#btn_month").removeClass("btn-month-selected");
            $("#btn_year").removeClass("btn-month-selected");
            $("#btn_month").addClass("btn-month-selected");
            getPie(data, "月");
        });
        $("#btn_month").click();
        //显示曲线数据
        getLine(data);
        //显示环比数据
        getCompare(data,"电");
        curType(energyType);
        $body.hideLoading();
    });
}

//记录判断当前选中的能源类型 2016-05-03 21:20 修改
function curType(type){
    //判断数组中是否包含当前选中的分类能耗，若不包含，重新赋值 2016-05-03 21:50
    if($.inArray(type, typeArr) == -1){
        type=typeArr[0];
    }
    switch(type){
        case '电':
            $("#elc").click();
        break;
        case '水':
            $("#water").click();
        break;
        case '可再生能源':
            $("#solar").click();
        break;
    }
}

function IsExist(val){
    var count =0;
    for(var i=0;i<typeArr.length;i++){
        if(val==typeArr[i]){
            return true;
        }else{
            count++;
        }
    }
    if(count == typeArr.length){
        return false;
    }else{
        return true;
    }
}

//获取建筑名称及其ID并填充到下拉框中
function getBuildingsList(data, firstopen) {
    //判断是否是第一次运行软，若第一次运行就执行获取建筑物List
    //保证值加载一次建筑物信息
    if (firstopen) {
        var $builds = $("#buildinglist");
        //清空当前下拉框中所有的信息
        $builds.html("");

        //获取数据集中的建筑物的json对象
        var jsonBuildings = data[0].BuildNameID;

        $.each(jsonBuildings, function (key, val) {
            //每一轮的循环中将buildId和buildName添加到buildingslist下拉框中
            $builds.append("<option value=" + val["buildId"] + ">" + val["buildName"] + "</option>");
        });
        //修改地图连接后，当前建筑物为地图默认选中的建筑物 2016-05-04 14:59
        var selectBuild = data[0].BuildBaseInfo;
        $builds.val(selectBuild[0].fBuildId);
    }
}

//获取当前选中建筑的建筑基本信息：建筑名称，建筑地址，建筑面积等
function getBuildingInfo(data) {
    //清除建筑物基本信息
    var $title = $("#buildinginfo>h4");
    $title.html("");

    var $name = $("#buildinginfo>span:first");
    $name.html("");

    var $squre = $("#buildinginfo>span:last");
    $squre.html("");
    //2016-05-17 从数据库中获取主变台数等信息，此处先清除当前DOM中的相关数据
    var $Trans = $("#TransCnt>h4");
    $Trans.html("");

    var $Install = $("#InstallCap>h4");
    $Install.html("");

    var $Operating = $("#OperateCap>h4");
    $Operating.html("");

    var $Meters = $("#metersTotal>h4");
    $Meters.html("");

    var jsonbuildingInfo = data[0].BuildBaseInfo[0];

    $title.html(jsonbuildingInfo.fBuildname);
    $name.html(jsonbuildingInfo.fBuildaddr);
    if (jsonbuildingInfo.fTotalarea == 0) {
        $squre.html('建筑面积<span style="color:red;">未设置</span>');
    }else {
        $squre.html("建筑面积"+jsonbuildingInfo.fTotalarea+"平方米");
    }
    //2016-05-17 从后台获取数据，放到对应的DOM中进行显示
    $Trans.text(jsonbuildingInfo.fTransCountea + "台");
    $Install.text(jsonbuildingInfo.fInstallCapacity + "kVA");
    $Operating.text(jsonbuildingInfo.fOperateCapacity + "kVA");
    $Meters.text(jsonbuildingInfo.fDesignMeters +"个");
}

//获取数据，填充综合能耗表格
function getBuildingEnergy(data) {
    //清除表格内的数据
    var $tbody = $("#energytable>tbody");
    $tbody.html("");

    var jsonTableData = data[0].BuildEnergy;
    $.each(jsonTableData, function (key, val) {
        $tbody.append('<tr><td>' + val["fEnergyitemname"] + "</td>" + '<td>' + val["fMonthValue"] + "</td>"
            + '<td>' + val["fYearValue"] + "</td>" + "<td>" + val["fEnergyitemunit"] + "</td></tr>");
    });
}

//获取数据，填充饼图
function getPie(data,type) {
    //清空pie所在的div
    var $pie = $("#main_pie");
    //IE8下不清除饼图的DIV
    if(version != "8.0")
            $pie.html("");

    var jsonPieData = data[0].CakeData;
   
    var piedata = "[";
    var piename = "[";
    if (type == "月") {
        $.each(jsonPieData, function (key, val) {
            if (key < jsonPieData.length - 1) {
                piedata += '{"name":' + '"' + val["name"] + '",' + '"value":' + val["monthvalue"] + '},';
                piename += '"' + val["name"] + '",';
            } else {
                piedata += '{"name":' + '"' + val["name"] + '",' + '"value":' + val["monthvalue"] + '}]'
                piename += '"' + val["name"] + '"]';
            }
        });
    } else if(type=="年"){
        $.each(jsonPieData, function (key, val) {
            if (key < jsonPieData.length - 1) {
                piedata += '{"name":' + '"' + val["name"] + '",' + '"value":' + val["yearvalue"] + '},';
                piename += '"' + val["name"] + '",';
            } else {
                piedata += '{"name":' + '"' + val["name"] + '",' + '"value":' + val["yearvalue"] + '}]'
                piename += '"' + val["name"] + '"]';
            }
        });
    }
    
    myPie = echarts.init($pie.get(0), 'macarons');//主题设置

    var option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'horizontal',
            bottom: 'bottom',
            data: JSON.parse(piename)
        },
        
        series: [{
                name: '访问来源',
                type: 'pie',
                radius: '70%',
                center: ['50%', '50%'],
                data: JSON.parse(piedata),
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }],
		color:['#FF0000','#FF8C00', '#1E90FF', '#9ACD32', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3']
    };
    myPie.setOption(option);

}

//获取曲线的数据
//2016-05-03 修改改变建筑物，按钮选中状态保持
function getLine(data) {
    var $line = $("#main_line");
    var $btns = $("#btngroup");

    //$btns.html("");
    clearHtml($btns);

    typeArr=[];

    var jsonLineData = data[0].LineChart;

    var btnsData = jsonLineData[jsonLineData.length - 1].option;

    $.each(btnsData, function (key, val) {
        
        switch (val["option"])
        {
            case "电":
                $btns.append('<div id="div_elec" class="col-lg-12 col-md-12 col-sm-2 col col-xs-2"><acronym title="电"><button id="elc" class="btn btn-elc btn-elc-selected" type="button"></button></acronym></div>');
                BindEnergyClick("elc", jsonLineData, key,data,"电");
                typeArr.push("电");
                break;
            case "水":
                $btns.append('<div class="col-lg-12 col-md-12 col-sm-2 col col-xs-2"><acronym title="水"><button id="water" class="btn btn-water" type="button"></button></acronym></div>');
                BindEnergyClick("water", jsonLineData, key, data, "水");
                typeArr.push("水");
                break;
            case "可再生能源":
                $btns.append('<div class="col-lg-12 col-md-12 col-sm-2 col col-xs-2"><acronym title="光伏"><button id="solar" class="btn btn-solar" type="button"></button></acronym></div>');
                BindEnergyClick("solar", jsonLineData, key, data, "可再生能源");
                typeArr.push("可再生能源");
                break;
        }
    });

}

//显示曲线图
function showLine(data, type) {
    var thisdata = [];
    var predata = [];

    $.each(data[type], function (key, val) {
        thisdata.push(val["F_ThisValue"]);
        predata.push(val["F_PreValue"]);
    });

      
    myLine = echarts.init($("#main_line").get(0),'macarons');//主题设置

        var option = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['昨日', '今日'],
                bottom:'bottom'
            },
            grid: {
                left: 50,
                right: 10,
                top:5,
                bottom:'20%'
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['0时', '1时', '2时', '3时', '4时', '5时', '6时', '7时', '8时', '9时', '10时', '11时', '12时', '13时', '14时', '15时', '16时', '17时', '18时', '19时', '20时', '21时', '22时', '23时']
            },
            yAxis: {
                type: 'value',
                axisLabel: {
                formatter: '{value}'
            }
        },
            series: [
                {
                    name: '昨日',
                    type: 'line',
                    data: predata,

                },
                {
                    name: '今日',
                    type: 'line',
                    data: thisdata,
                }
            ],
            color:['#1E90FF','#FF8C00','#FF0000','#9ACD32', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3']
        };

        myLine.setOption(option);
	
}

//分类能耗的点击事件（包含数据过滤与按钮选中）
function BindEnergyClick(id,linedata,type,comparedata,comparetype) {
    $("#" + id).bind("click", function () {
        //加载前先清空当数据 2016-05-03: 21:55
        $("#main_line").html("");

        //新增：2016-05-03 15:24 记录当前选中的能耗类型
        energyType = comparetype;
        showLine(linedata, type);
        getCompare(comparedata, comparetype);
        
        $("#btngroup button").each(function () {
            var $btn = $(this);
            var curId =$btn.attr("id");
           
            $btn.removeClass("btn-" + curId + "-selected");
        });

        $("#" + id).addClass("btn-" + id + "-selected");
        
    });
}

//获取并显示环比分析的数据
function getCompare(data,type) {
    var $today = $("#hb_today");
    var $yesterday = $("#hb_yesterday");

    var $compare_diff = $("#hb_rate p:first");
    var $compare_rate = $("#hb_rate p:last");

    var $lbl = $("#hb_lbltoday");
    var $pic = $("#updown");

    clearHtml($pic);
    
    clearHtml($today);
    clearHtml($yesterday);
    clearHtml($compare_diff);
    clearHtml($compare_rate);
    clearHtml($lbl);

    var dataCur;
    var dataPre;
    var unit = "";

    var jsonCompareData = data[0].BlockData;
    
    $.each(jsonCompareData, function (key, val) {
        if (val["F_EnergyItemname"] == type) {
            dataCur = val["F_ThisValue"];
            dataPre = val["F_PreValue"];
            switch (type) {
                case "电":
                    unit = '<span style="font-size:20px;"> kW·h</span>'
                    $lbl.html("当日用电");
                    break;
                case "水":
                    unit = '<span style="font-size:20px;"> t</span>'
                    $lbl.html("当日用水");
                    break;
                case "可再生能源":
                    unit = '<span style="font-size:20px;"> kW·h</span>'
                    $lbl.html("当日发电");
                    break;
            }
        }
    });

	//解决某一分项没有数据时，程序报错的问题 修改与 2016-04-28 9:56 张奔
	if(dataCur == undefined)
	{
		dataCur =0;
	}
	if(dataPre == undefined)
	{
		dataPre =0;
	}
	
    $today.html(dataCur.toFixed(0)+unit);
    $yesterday.html(dataPre.toFixed(0) + unit);
    $compare_diff.html((dataCur.toFixed(0) - dataPre.toFixed(0)) + unit);
	if(dataPre ==0)
	{
		$compare_rate.html("")
	}
	else{
		$compare_rate.html(((dataCur - dataPre) * 100 / dataPre).toFixed(0) + "%");
	}

    //判断趋势是增加还是减少，增加：向上的图标，减少：向下的图标
    if ((dataCur - dataPre) > 0) {
        $pic.append('<img src="app/img/up.png"  />');
    }
    else {
        $pic.append('<img src="app/img/down.png" />');
    }
}

//清空jquery对象中的数据
function clearHtml($id) {
    $id.html("");
}
