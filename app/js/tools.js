var Stand={
	dateFormat:function(date){
		var year = date.getFullYear();
		var month =date.getMonth()+1;
		var dayOfMonth = date.getDate();

		if(month<10)
			month="0"+month;
		if(dayOfMonth<10)
			dayOfMonth="0"+dayOfMonth;

		return (year+"-"+month+"-"+dayOfMonth);
	},
	//填充select标签
	selectAppender:function(data,$select,displayName,valueName){
		$select.html("");
		$.each(data,function(key,val){
			console.log(val);
			$select.append("<option value="+val[valueName]+">"+val[displayName]+"</option>");
		});
		return this;//允许使用连缀方式对多个select标签进行填充
	},
	initDateTimePicker:function(type,curDate,$Date,$Box){
		var dayOfWeek=curDate.getDay();//0~6 :周日到周六（本周表示周一到周日）
		var dateOfMonth=curDate.getDate();//1~31:
		var month=curDate.getMonth();//0~11:1月到12月
		var year=curDate.getFullYear();

		var endDate;
		var getTypeDate;

		switch(type){
			case "WEEKSTART":
				getTypeDate=Stand.dateFormat(new Date(year,month,dateOfMonth-dayOfWeek+1));
			break;
			case "WEEKEND":
				getTypeDate=Stand.dateFormat(new Date(year,month,dateOfMonth+7-dayOfWeek));
			break;
			case "CURRENTDATE":
				getTypeDate=Stand.dateFormat(new Date(year,month,dateOfMonth));
			break;
			case "SEVENAGO":
				getTypeDate=Stand.dateFormat(new Date(year,month,dateOfMonth-6));
			break;
			case "THREEDAYAGO":
				getTypeDate=Stand.dateFormat(new Date(year,month,dateOfMonth-2));
			break;
		}

		$Box.val(getTypeDate);

		$Date.datetimepicker({
			format:'yyyy-mm-dd',
	        language: 'zh-CN',
	        weekStart: 1,
	        todayBtn: 1,
	 		todayHighlight: 1,
	        autoclose: 1,
	        startView: 2,
	        minView: 2,
	        forceParse: 0,
	        pickerPosition: "bottom-left"
		});

		return this;
	}
};