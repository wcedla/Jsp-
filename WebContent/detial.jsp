<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<jsp:useBean id="loginBean" class="login.getLoginArgs" scope="session"/>
<jsp:useBean id="gBean" class="goods.goodsBean" scope="session"/>
<jsp:useBean id="detialBean" class="goods.showdetialBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>��Ʒ����</title>
<link href="./CSS/detial.css" rel="stylesheet" type="text/css" />
<script src="./JS/detial.js" type="text/javascript" charset="GB18030"></script>
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
			<a style="cursor: pointer;" id="one" href="login.jsp" class="gray">�ֻ�</a> <a
				style="cursor: pointer;" id="second" onclick="" class="gray">����</a>
			<a style="cursor: pointer;" id="thrid" onclick="" class="gray">����</a>
			<a style="cursor: pointer;" id="fourth" onclick="" class="gray">Ь</a>
			<a style="cursor: pointer;" id="fifth" onclick="" class="gray">���ðٻ�</a>
			<a style="cursor: pointer;" id="sixth" onclick="" class="gray">����</a>
		</div>
	</div>
		<div class="Nav">
		<ul class="allgoods">
			<li class="Nav-item first"><a href="">��ҳ</a></li>
			<li class="Nav-item"><a href="" id="nav1">����</a></li>
			<li class="Nav-item"><a href="" id="nav2">��װ</a></li>
			<li class="Nav-item"><a href="" id="nav3">Ь������</a></li>
			<li class="Nav-item"><a href="" id="nav4">���ðٻ�</a></li>
			<li class="Nav-item"><a href="" id="nav5">�Ҿӽ���</a></li>
			<li class="Nav-item"><a href="" id="nav6">�鱦�ֱ�</a></li>
		</ul>
	</div>
	
	<%
		String [][] record=detialBean.getTableRecord();
		if(record.length<1||record[0][0]==null)
		{
			out.print("<center><h1>��ȡ��Ϣ����!</h1></center>");
		}
		else{
		out.print("<p hidden id='tmp1'>"+record[0][0]+"</p>");
		//out.print("");
		
	%>
	
	
	
<div id="md">
<div id="kuang">


<div>
<div id=headertext><span id="mstext"><%=record[0][2] +record[0][3] %>��Ʒ���� ></span></div>
</div>
<div id="pickuang">
<div id="pic">
<img  src="./IMAGE/<%=record[0][6] %>" width="300" height="300">
</div>
<div>
<img  src="./IMAGE/<%=record[0][6] %>" width="50" height="50" id="sp1">
<img  src="./IMAGE/<%=record[0][6] %>" width="50" height="50"  id="sp1">
<img  src="./IMAGE/<%=record[0][6] %>" width="50" height="50"  id="sp1">
</div>
</div>
<div id="textdetial">
<div id="texttile"><strong id="goodsname"><%=record[0][4] %></strong></div>
<div id=textsc style="text-align:center"><span id="goodsxc">���ۻ� ���������ţ�����������</span></div>
<div id="textjg">������: <span id="jgtext"><%=record[0][5] %></span></div>
<div id='textys'>��ɫ<button id="btn1"></button><button id="btn2"></button></div>
<div id="textys">�汾<span id="ver1">�汾һ</span><span id="ver2">�汾��</span></div>
<div id='textys'>����<button id="btnsub" onclick="subbtn()">-</button><input type="text" value='1' id='count'><button id='btnplus' onclick='addbtn()'>+</button></div>
<div><input type="button" id="add2car" value="���빺�ﳵ" onclick="putcar(<%=record[0][0]%>)"></div>
</div>



<!--  
<div>
<div id=headertext><span id="mstext">����s9+������� ></span></div>
</div>
<div id="pickuang">
<div id="pic">
<img  src="./IMAGE/sms9pro.jpg" width="300" height="300">
</div>
<div>
<img  src="./IMAGE/sms9pro.jpg" width="50" height="50" id="sp1">
<img  src="./IMAGE/sms9pro.jpg" width="50" height="50"  id="sp1">
<img  src="./IMAGE/sms9pro.jpg" width="50" height="50"  id="sp1">
</div>
</div>
<div id="textdetial">
<div id="texttile"><strong id="goodsname">����s9+</strong></div>
<div id=textsc style="text-align:center"><span id="goodsxc">���ۻ� ���������ţ�����������</span></div>
<div id="textjg">������: <span id="jgtext">��9999</span></div>
<div id='textys'>��ɫ<button id="btn1"></button><button id="btn2"></button></div>
<div id="textys">�汾<span id="ver1">�汾һ</span><span id="ver2">�汾��</span></div>
<div id='textys'>����<button id="btnsub" onclick="subbtn()">-</button><input type="text" value='1' id='count'><button id='btnplus' onclick='addbtn()'>+</button></div>
<div><input type="button" id="add2car" value="���빺�ﳵ" onclick=""></div>
</div>

-->

<div id="showdetial">
<ul id='headertle'>
<li class='detialheader'>��Ʒ����</li>
<li class='detialheader'>������</li>
<li class='detialheader'>��Ʒ����</li>
<li class='detialheader'>��Ʒ��ѯ</li>
<li class='detialheader'>�ɽ���¼</li>
</ul>
<ul id='picshowdetial'>
<li id='bigpic1'><img src="./IMAGE/<%=record[0][6] %>"></li>
</ul>
</div>
<%} %>
</div>
</div>
	<div class="Copyright">
    <div class="foottext">Copyright �0�8 zWz 2018��All Rights Reserved</div>
</div>

</body>
</html>