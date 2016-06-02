<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.Guitar"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
	function quit() {
		if (confirm("确认注销吗？")) {
			window.location.href = "adminLogin.jsp";
		}
	}
</script>
<%
	Guitar form = (Guitar) session.getAttribute("guitar");
%>

<div class="sidebar-nav">
	<ul>

		<li><a href="#" data-target=".dashboard-menu" class="nav-header"
			data-toggle="collapse"><i class="fa fa-fw fa-dashboard"></i> 数据统计<i
				class="fa fa-collapse"></i></a></li>
		<li>
			<ul class="dashboard-menu nav nav-list collapse in">
				<li><a href="index.jsp"><span
						class="fa fa-caret-right"></span> 主页</a></li>
				<li><a href="GuitarAction"><span
						class="fa fa-caret-right"></span> 吉他列表</a></li>
				<li><a href="GuitarAction"><span class="fa fa-caret-right"></span>
						吉他列表</a></li>
				<li><a href="GuitarAction"><span class="fa fa-caret-right"></span>
						吉他列表</a></li>
			</ul>
		</li>

		<li data-popover="true"
			data-content="Items in this group require a <strong><a href='http://portnine.com/bootstrap-themes/aircraft' target='blank'>premium license</a><strong>."
			rel="popover" data-placement="right"><a href="GuitarAction"
			data-target=".premium-menu" class="nav-header collapsed"
			data-toggle="collapse"><i class="fa fa-fw fa-fighter-jet"></i>
				吉他列表<i class="fa fa-collapse"></i></a></li>
		<li>
			<ul class="premium-menu nav nav-list collapse">

				<li><a href="GuitarAction"><span class="fa fa-caret-right"></span>
						吉他列表</a></li>
				<li><a href="GuitarAction"><span class="fa fa-caret-right"></span>
						吉他列表</a></li>
				<li><a href="GuitarAction"><span
						class="fa fa-caret-right"></span> 吉他列表</a></li>
				<li><a href="GuitarAction"><span class="fa fa-caret-right"></span>
						吉他列表</a></li>
				<li><a href="GuitarAction"><span class="fa fa-caret-right"></span>
						吉他列表</a></li>
				<li><a href="GuitarAction"><span class="fa fa-caret-right"></span>
						吉他列表</a></li>
				<li><a href="GuitarAction"><span class="fa fa-caret-right"></span>
						吉他列表</a></li>
				<li><a href="GuitarAction"><span
						class="fa fa-caret-right"></span> 吉他列表</a></li>

			</ul>
		</li>

		<li><a href="GuitarAction" data-target=".accounts-menu"
			class="nav-header collapsed" data-toggle="collapse"><i
				class="fa fa-fw fa-briefcase"></i> 吉他列表<span
				class="label label-info">+3</span></a></li>
		<li>
			<ul class="accounts-menu nav nav-list collapse">
				<li><a href="guitarAction"><span
						class="fa fa-caret-right"></span> 吉他列表</a></li>
				<li><a href="guitarAction"><span
						class="fa fa-caret-right"></span> 吉他列表</a></li>
			</ul>
		</li>

		<li><a href="#" data-target=".legal-menu"
			class="nav-header collapsed" data-toggle="collapse"><i
				class="fa fa-fw fa-legal"></i> 法律相关<i class="fa fa-collapse"></i></a></li>
		<li>
			<ul class="legal-menu nav nav-list collapse">
				<li><a href="GuitarAction"><span
						class="fa fa-caret-right"></span> 隐私政策</a></li>
				<li><a href="terms-and-conditions.html"><span
						class="fa fa-caret-right"></span> 详情介绍</a></li>
			</ul>
		</li>

		<li><a href="GuitarAction" class="nav-header"><i
				class="fa fa-fw fa-question-circle"></i> 帮助</a></li>

	</ul>
</div>