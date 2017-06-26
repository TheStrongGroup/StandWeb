/**
* 实现菜单栏功能
* @author Ben
* @Date 2017.05.14
*/
jQuery(document).ready(function($) {


	$(".page-sidebar-menu>li").click(function(event) {
		
		var menu = $(".page-sidebar-menu");
		var li = menu.find('li.active').removeClass('active');

		// 添加选中 打开的样式
		$(this).addClass('active');
	});

	$("#page-sidebar-menu li a").click(function(event) {
		event.preventDefault();

		var url = this.href;
		if (url != null && url != 'javascript:;') {
			window.location = url;
		}
	});

});