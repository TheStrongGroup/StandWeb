var Stand={
	//填充select标签
	selectAppender:function(data,$select,displayName,valueName){
		$select.html("");
		$.each(data,function(key,val){
			$select.append("<option value="+val[valueName]+">"+val[displayName]+"</option>");
		});
		return this;//允许使用连缀方式对多个select标签进行填充
	}
};