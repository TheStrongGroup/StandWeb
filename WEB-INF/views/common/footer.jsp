	<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<div class="footer-inner"><span id="year">2016</span>&copy;</div>
	<div class="footer-tools">
		<span class="go-top"><i class="fa fa-angle-up"></i></span>
	</div>
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$("#year").html(new Date().getFullYear());
		});
	</script>