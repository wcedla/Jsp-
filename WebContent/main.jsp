<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<jsp:useBean id="loginBean" class="login.getLoginArgs" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>zWz�̳�</title>
<link href="./CSS/header.css" rel="stylesheet" type="text/css" />
<script src="./JS/main.js" type="text/javascript" charset="GB18030"></script>
<script>
</script>
</head>
<body>
	<div class="logo_show">
		<div class="hi">
			<a id="headertext"href="main.jsp">Hi~��ӭ����zWz�̳�</a>
		</div>
		<div class="lbl">
			<div id="login_module">
				<ul>
					<li class="login_b"><a rel="nofollow" href="login.jsp"
						target="_self">���¼</a></li>
					<li class="login_b"><a rel="nofollow" href="register.jsp"
						target="_blank">ע������</a></li>
					<li class="login_b"><a rel="nofollow" href="mybill.jsp" target="_self">�ҵĶ���</a></li>
					<li><a rel="nofollow" href="showcar.jsp" target="_self">���ﳵ</a></li>
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
				name="searchtext" value="������ؼ���"
				onfocus="if(this.value=='������ؼ���')this.value=''"
				onblur="if(this.value=='')this.value='������ؼ���'">
				<input class="Search-submit" value="���� " onclick="return check()" type="submit">
		</form>
		<div class="Search-hot">
			<a style="cursor: pointer;" id="one" onclick="searchwhat(this.innerHTML)" class="gray">�ֻ�</a>
			 <a style="cursor: pointer;" id="second"  onclick="searchwhat(this.innerHTML)" class="gray">����</a>
			<a style="cursor: pointer;" id="thrid" onclick="searchwhat(this.innerHTML)" class="gray">����</a>
			<a style="cursor: pointer;" id="fourth" onclick="searchwhat(this.innerHTML)" class="gray">Ь</a>
			<a style="cursor: pointer;" id="fifth" onclick="searchwhat(this.innerHTML)" class="gray">���ðٻ�</a>
			<a style="cursor: pointer;" id="sixth" onclick="searchwhat(this.innerHTML)" class="gray">����</a>
		</div>
	</div>
	<!-- ȫ����Ʒ��Ŀ-->
	<div class="Nav">
		<ul class="allgoods">
			<li id="Kuang" class="kuang">
				<h2>ȫ����Ʒ����</h2>
				<ul class="goodslist">
					<li class="listitem">
						<ul class="littleitem">
							<li><a target="_blank"  onclick="searchwhat(this.innerHTML)">�ֻ�</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�ʼǱ�</a></li>
							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>
											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">�ֻ�</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">����</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">ƻ��</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��Ϊ</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">�ʼǱ�</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">����</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">��������</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">ƽ�����</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">̨ʽ��</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">�칫</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�ľ�</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��ӡ��</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">��Ӱ����</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">���</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">����</a></li>
										</ul>
									</li>
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">Ůװ</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��װ</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">ͯװ</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">Ůװ</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">����ȹװ</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��ѡ��װ</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">��װ</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��ʿ����</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��ʿ��װ</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">ͯװ</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">����װ</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��װ</a></li>
										</ul>
									</li>									
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">Ů��</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��Ь</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">ͯЬ</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">Ů��</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�����</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">˫���</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">��Ь</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">����ƤЬ</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��Ь</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">ͯЬ</a>
										</h4>
										<ul class="detaillist">
										<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��Ь</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�˶�Ь</a></li>
										</ul>
									</li>									
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�������</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">�������</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">ƽ�����</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�յ�</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">ϴ�»�</a></li>
										</ul>
									</li>
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��𹤾�</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">���ҼҾ�</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">��𹤾�</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">���ز���</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">������</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">���ҼҾ�</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�¹�</a></li>
										</ul>
									</li>
								</div>
							</ul>
						</ul>
					</li>
					<li class="listitem">
						<ul class="littleitem">

							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�ƽ�����</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��ʯ�ʱ�</a></li>
							<li><a target="_blank" onclick="searchwhat(this.innerHTML)">���</a></li>


							<ul class="extenitem">
								<div class="list">
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">�ƽ�����</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�ƽ�����</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">�����Ʒ</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">��ʯ�ʱ�</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">������</a></li>
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��ʯ����</a></li>
										</ul>
									</li>
									<li>
										<h4>

											<a target="_blank" class="submenu" onclick="searchwhat(this.innerHTML)">���</a>
										</h4>
										<ul class="detaillist">
											<li><a target="_blank" onclick="searchwhat(this.innerHTML)">��ʿ����</a></li>
										</ul>
									</li>
								</div>
							</ul>
						</ul>
					</li>
				</ul>
			</li>
			<li class="Nav-item first"><a href=main.jsp>��ҳ</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav1">����</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav2">��װ</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav3">Ь������</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav4">���ðٻ�</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav5">�Ҿӽ���</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav6">�鱦�ֱ�</a></li>
		</ul>
	</div>
<!--�м���ͼƬstart  -->
	<div class="pickuang">
		<ul id="pictures" style="position: relative; width: 1536px; height: 440px;">
                   <li style="position: absolute; width: 1536px; left: 0px; top: 0px; display: list-item;"><a onclick="searchwhat('��')" target="_blank"><img src="./IMAGE/1.jpg" width="1624" height="440"></a></li>
                   <li style="position: absolute; width: 1536px; left: 0px; top: 0px; display: none;"><a onclick="searchwhat('�·�')"target="_blank"><img src="./IMAGE/2.jpg" width="1624" height="440"></a></li>
                   <li style="position: absolute; width: 1536px; left: 0px; top: 0px; display: none;"><a onclick="searchwhat('����')" target="_blank"><img src="./IMAGE/3.jpg" width="1624" height="440"></a></li>          
		</ul>
		<a id="prev" href="javascript:goprev()" style="opacity: 0; display: none;"></a> <a id="next" href="javascript:gonext()" style="opacity: 0; display: none;"></a>
		<div class="num">
			<ul><li class="on">1</li><li>2</li><li>3</li></ul>
		</div>
	</div>
 <!--�м���ͼƬend  -->
	<div class="adpic">
		<div class="text">
			<p id="bigtext">����</p>
			<span id="commontext">ȫ������ �׼��һ�</span>
		</div>
		<a target="_blank" onclick="searchwhat('�Ҿ�')"><img src="./IMAGE/a1.jpg"></a>
	</div>
	
		<div class="adpic">
		<div class="text">
			<p id="bigtext">�߿���</p>
			<span id="commontext">��ʱ�����</span>
		</div>
		<a target="_blank" onclick="searchwhat('�ֻ�')"><img src="./IMAGE/a2.jpg"></a>
	</div>
	
		<div class="adpic">
		<div class="text">
			<p id="bigtext">��Ʒ</p>
			<span id="commontext">�ļ���Ʒ ��ʱ����</span>
		</div>
		<a target="_blank" onclick="searchwhat('�·�')"><img src="./IMAGE/a3.jpg"></a>
	</div>
	
		<div class="adpic">
		<div class="text">
			<p id="bigtext">����</p>
			<span id="commontext">����ѪҺ �����ഺ</span>
		</div>
		<a target="_blank" onclick="searchwhat('����')"><img src="./IMAGE/a4.jpg"></a>
	</div>
		
		
	<div class="Copyright">
    <div class="foottext">Copyright �0�8 zWz 2018��All Rights Reserved</div>
</div>
 
</body>
</html>
