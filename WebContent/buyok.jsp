<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="loginBean" class="login.getLoginArgs" scope="session"/>
<jsp:useBean id="gBean" class="goods.goodsBean" scope="session"/>
 <jsp:useBean id="bill" class="goods.billBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>�ɹ�����</title>
<link href="./CSS/buyok.css" rel="stylesheet" type="text/css" />
<script src="./JS/buyok.js" type="text/javascript" charset="GB18030"></script>
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
	<div class="header">
        <a href="main.jsp" title="������ҳ">
        <img src="./IMAGE/logo.jpg" width="158" height="58" class="Logo">
        </a>
</div> 
		<input type="hidden" id="hidevalue1" value="<%=loginBean.getIsLogin()%>">
		<input type="hidden" id="hidevalue2" value="<%=loginBean.getUsername()%>">
<div class="mb">
      <div class="kuang">
            <div class="heardertext"><span class="htext">����ɸ���</span></div>
            <div class="shitibf">
            <%
					out.print("<span class='fk'>"+bill.getPrice()+"</span>");        
            		out.print("<p hidden id='billid'>"+bill.getBillid()+"</p>");
            %>
            </div>
            <div><button id='fkcg' onclick="fkcg()">����ɹ�</button></div>
</div>
</div>

	<div class="Copyright">
    <div class="foottext">Copyright �0�8 zWz 2018��All Rights Reserved</div>
</div>
</body>
</html>         