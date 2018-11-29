<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<jsp:useBean id="loginBean" class="login.getLoginArgs" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>zWz商城</title>
<link href="./CSS/header.css" rel="stylesheet" type="text/css" />
<script src="./JS/main.js" type="text/javascript" charset="GB18030"></script>
<script>
</script>
</head>
<body>
	<div class="logo_show">
		<div class="hi">
			<a id="headertext"href="main.jsp">Hi~欢迎来到zWz商城</a>
		</div>
		<div class="lbl">
			<div id="login_module">
				<ul>
					<li class="login_b"><a rel="nofollow" href="login.jsp"
						target="_self">请登录</a></li>
					<li class="login_b"><a rel="nofollow" href="register.jsp"
						target="_blank">注册有礼</a></li>
					<li class="login_b"><a rel="nofollow" href="mybill.jsp" target="_self">我的订单</a></li>
					<li><a rel="nofollow" href="showcar.jsp" target="_self">购物车</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="Header">
		<a href="main.jsp">
			<div class="Logo">
				<img src="./IMAGE/logo.jpg" width="158" height="58">
			</div>
		</a>
		<form class="Search" id="searchForm" action="goodsServlet" method="post">
		<input type="hidden" id="hidevalue1" value="<%=loginBean.getIsLogin()%>">
		<input type="hidden" id="hidevalue2" value="<%=loginBean.getUsername()%>">
			<input id="search_form_input" class="Search-input" type="text"
				name="searchtext" value="请输入关键词"
				onfocus="if(this.value=='请输入关键词')this.value=''"
				onblur="if(this.value=='')this.value='请输入关键词'">
				<input class="Search-submit" value="搜索 " onclick="return check()" type="submit">
		</form>
		<div class="Search-hot">
			<a style="cursor: pointer;" id="one" onclick="searchwhat(this.innerHTML)" class="gray">手机</a>
			 <a style="cursor: pointer;" id="second"  onclick="searchwhat(this.innerHTML)" class="gray">数码</a>
			<a style="cursor: pointer;" id="thrid" onclick="searchwhat(this.innerHTML)" class="gray">电脑</a>
			<a style="cursor: pointer;" id="fourth" onclick="searchwhat(this.innerHTML)" class="gray">鞋</a>
			<a style="cursor: pointer;" id="fifth" onclick="searchwhat(this.innerHTML)" class="gray">日用百货</a>
			<a style="cursor: pointer;" id="sixth" onclick="searchwhat(this.innerHTML)" class="gray">电脑</a>
		</div>
	</div>
	<!-- 全部商品栏目-->
	<div class="Nav">
		<ul class="allgoods">
			<li id="Kuang" class="kuang">
				<h2>全部商品分类</h2>
				<ul class="goodslist">
					<li class="listitem">
						<ul class="littleitem">
							<li><a target="_blank"  onclick="searchwhat(this.innerHTML)">手机</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">笔记本</a></li>
							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>
											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">手机</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">三星</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">苹果</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">华为</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">笔记本</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">联想</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">电脑整机</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">平板电脑</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">台式机</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">办公</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">文具</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">打印机</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">摄影摄像</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">相机</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">单反</a></li>
										</ul>
									</li>
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">女装</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">男装</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">童装</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">女装</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">浪漫裙装</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">精选上装</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">男装</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">男士外套</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">男士裤装</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">童装</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">亲子装</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">套装</a></li>
										</ul>
									</li>									
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">女包</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">男鞋</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">童鞋</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">女包</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">单肩包</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">双肩包</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">男鞋</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">休闲皮鞋</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">板鞋</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">童鞋</a>
										</h4>
										<ul class="detaillist">
										<li><a target="_blank" onclick="searchwhat(this.innerHTML)">凉鞋</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">运动鞋</a></li>
										</ul>
									</li>									
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">生活电器</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">生活电器</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">平板电视</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">空调</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">洗衣机</a></li>
										</ul>
									</li>
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">五金工具</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">卧室家具</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">五金工具</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">开关插座</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">工具箱</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">卧室家具</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">床</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">衣柜</a></li>
										</ul>
									</li>
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">黄金首饰</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">钻石彩宝</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">腕表</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">黄金首饰</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">黄金项链</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">足金饰品</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">钻石彩宝</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">结婚钻戒</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">钻石耳饰</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">腕表</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">瑞士名表</a></li>
										</ul>
									</li>
								</div>
							</ul>
						</ul>
					</li>
				</ul>
			</li>
			<li class="Nav-item first"><a href=main.jsp>首页</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav1">数码</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav2">服装</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav3">鞋包配饰</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav4">日用百货</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav5">家居建材</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav6">珠宝手表</a></li>
		</ul>
	</div>
<!--中间广告图片start  -->
	<div class="pickuang">
		<ul id="pictures" style="position: relative; width: 1536px; height: 440px;">
                   <li style="position: absolute; width: 1536px; left: 0px; top: 0px; display: list-item;"><a onclick="searchwhat('包')" target="_blank"><img src="./IMAGE/1.jpg" width="1624" height="440"></a></li>
                   <li style="position: absolute; width: 1536px; left: 0px; top: 0px; display: none;"><a onclick="searchwhat('衣服')"target="_blank"><img src="./IMAGE/2.jpg" width="1624" height="440"></a></li>
                   <li style="position: absolute; width: 1536px; left: 0px; top: 0px; display: none;"><a onclick="searchwhat('电器')" target="_blank"><img src="./IMAGE/3.jpg" width="1624" height="440"></a></li>          
		</ul>
		<a id="prev" href="javascript:goprev()" style="opacity: 0; display: none;"></a> <a id="next" href="javascript:gonext()" style="opacity: 0; display: none;"></a>
		<div class="num">
			<ul><li class="on">1</li><li>2</li><li>3</li></ul>
		</div>
	</div>
 <!--中间广告图片end  -->
	<div class="adpic">
		<div class="text">
			<p id="bigtext">热卖</p>
			<span id="commontext">全场满减 底价钜惠</span>
		</div>
		<a target="_blank" onclick="searchwhat('家具')"><img src="./IMAGE/a1.jpg"></a>
	</div>
	
		<div class="adpic">
		<div class="text">
			<p id="bigtext">高考季</p>
			<span id="commontext">限时大回馈</span>
		</div>
		<a target="_blank" onclick="searchwhat('手机')"><img src="./IMAGE/a2.jpg"></a>
	</div>
	
		<div class="adpic">
		<div class="text">
			<p id="bigtext">新品</p>
			<span id="commontext">夏季新品 限时限量</span>
		</div>
		<a target="_blank" onclick="searchwhat('衣服')"><img src="./IMAGE/a3.jpg"></a>
	</div>
	
		<div class="adpic">
		<div class="text">
			<p id="bigtext">焕新</p>
			<span id="commontext">新鲜血液 焕发青春</span>
		</div>
		<a target="_blank" onclick="searchwhat('电器')"><img src="./IMAGE/a4.jpg"></a>
	</div>
		
		
	<div class="Copyright">
    <div class="foottext">Copyright © zWz 2018，All Rights Reserved</div>
</div>
 
</body>
</html>
