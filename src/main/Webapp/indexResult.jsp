<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="model.Guitar"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>吉他查询</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

<script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>



<link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="stylesheets/premium.css">
</head>

<body class=" theme-blue">

	<!-- Demo page code -->

	<script type="text/javascript">
		$(function() {
			var match = document.cookie.match(new RegExp('color=([^;]+)'));
			if (match)
				var color = match[1];
			if (color) {
				$('body').removeClass(function(index, css) {
					return (css.match(/\btheme-\S+/g) || []).join(' ')
				})
				$('body').addClass('theme-' + color);
			}

			$('[data-popover="true"]').popover({
				html : true
			});

		});
	</script>
	<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
	color: #fff;
}
</style>

	<script type="text/javascript">
		$(function() {
			var uls = $('.sidebar-nav > ul > *').clone();
			uls.addClass('visible-xs');
			$('#main-menu').append(uls.clone());
		});
	</script>

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

	<!-- Le fav and touch icons -->
	<link rel="shortcut icon" href="../assets/ico/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144"
		href="../assets/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114"
		href="../assets/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72"
		href="../assets/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed"
		href="../assets/ico/apple-touch-icon-57-precomposed.png">


	<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
	<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
	<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
	<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
	<!--[if (gt IE 9)|!(IE)]><!-->

	<!--<![endif]-->
	<!--顶部导航栏 -->
	<jsp:include page="adminTop.jsp" flush="true" />

	<!--左边导航栏 -->
	<jsp:include page="adminLeft.jsp" flush="true" />

	<!--右边正文 -->
	<div class="content">
		<div class="header">

			<h1 class="page-title">吉他查询</h1>
			<ul class="breadcrumb">
				<li><a href="index.jsp">首页</a></li>
				<li class="active">吉他查询</li>
			</ul>

		</div>

		<div class="main-content">

			<div class="btn-toolbar list-toolbar">
				<a href="guitarInsert.jsp"><button class="btn btn-primary">
						<i class="fa fa-plus"></i> 添加吉他
					</button></a>
			</div>


			<!-- 搜索条件 -->
			<div>
				<form action="GuitarAction" method="post">
					<label>Builder:</label> <select name="builder">
						<option value=""></option>
						<option value="FENDER">Fender</option>
						<option value="MARTIN">Martin</option>
						<option value="GIBSON">Gibson</option>
						<option value="COLLINGS">Collings</option>
						<option value="OLSON">Olson</option>
						<option value="RYAN">Ryan</option>
						<option value="PRS">Prs</option>
					</select> <label>Type:</label> <select name="type">
						<option value=""></option>
						<option value="ACOUSTIC">Acoustic</option>
						<option value="ELECTRIC">Electric</option>
					</select> <label>BackWood:</label> <select name="backwood">
						<option value=""></option>
						<option value="INDIAN_ROSEWOOD">Indian_Rosewood</option>
						<option value="BRAZILIAN_ROSEWOOD">Brazilian_Rosewood</option>
						<option value="MAHOGANY">Mahogany</option>
						<option value="MAPLE">Maple</option>
						<option value="COCOBOLO">Cocobolo</option>
						<option value="CEDAR">Cedar</option>
						<option value="ADIRONDACK">Adirondack</option>
						<option value="ALDER">Alder</option>
						<option value="SITKA">Sitka</option>
					</select> <label>TopWood:</label> <select name="topwood">
						<option value=""></option>
						<option value="INDIAN_ROSEWOOD">Indian_Rosewood</option>
						<option value="BRAZILIAN_ROSEWOOD">Brazilian_Rosewood</option>
						<option value="MAHOGANY">Mahogany</option>
						<option value="MAPLE">Maple</option>
						<option value="COCOBOLO">Cocobolo</option>
						<option value="CEDAR">Cedar</option>
						<option value="ADIRONDACK">Adirondack</option>
						<option value="ALDER">Alder</option>
						<option value="SITKA">Sitka</option>
					</select> <input type="submit" name="search" value="Search" />
				</form>
			</div>


			<div class="btn-group"></div>
			<table class="table">
				<thead>
					<tr>
						<th>序列号</th>
						<th>价格</th>
						<th>制造商</th>
						<th>型号</th>
						<th>类型</th>
						<th>正面</th>
						<th>反面</th>
						<th>序号</th>
						<th style="width: 3.5em;"></th>

					</tr>
				</thead>
				<tbody>
	 	<c:forEach var="matchingGuitar" items="${requestScope.matchingGuitar}"> 
					<tr bgcolor="#FFFFFF">
						<td height="30"><div align="center">${matchingGuitar.serialNumber}</div></td>
						<td><div align="center">${matchingGuitar.price}</div></td>
						<td><div align="center">${matchingGuitar.spec.builder}</div></td>
						<td><div align="center">${matchingGuitar.model}</div></td>
						<td><div align="center">${matchingGuitar.spec.type}</div></td>
						<td><div align="center">${matchingGuitar.spec.topWood}</div></td>
						<td><div align="center">${matchingGuitar.spec.backWood}</div></td>
						<td><div align="center">${matchingGuitar.numStrings}</div></td>
					</tr>
	 	</c:forEach>
				</tbody>
			</table>




			<!-- 页面底部 -->
			<jsp:include page="adminFooter.html" flush="true" />
		</div>
	</div>


	<script src="lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
		});
	</script>


</body>
</html>
