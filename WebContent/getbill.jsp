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
<title>生成订单</title>
<link href="./CSS/getbill.css" rel="stylesheet" type="text/css" />
<script src="./JS/getbill.js" type="text/javascript" charset="GB18030"></script>
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
	<div class="header">
        <a href="main.jsp" title="返回首页">
        <img src="./IMAGE/logo.jpg" width="158" height="58" class="Logo">
        </a>
</div> 
		<input type="hidden" id="hidevalue1" value="<%=loginBean.getIsLogin()%>">
		<input type="hidden" id="hidevalue2" value="<%=loginBean.getUsername()%>">
<div id="md">
<div id="fzk">
<form action="" method="post" name="carform" id="cform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="cftb">
<div id="time">
<%
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
String date=df.format(new Date());
String[] tmp=date.split("\\-| |\\:");
String id=tmp[0]+tmp[1]+tmp[2]+tmp[3]+tmp[4]+tmp[5];
out.println("订单生成时间:"+"<span id='timetext'>"+date+"</span><span style='float:right;'>订单编号:"+id+"</span>");// new Date()为获取当前系统时间
%>
</div>
<div id='headertitle'><span id='text'>确认订单</span></div>
<tr> 
<th width="70"></th> <th width="310">商品名称</th><th width="35"></th>
<th width="80">数量</th> <th width="58"></th> <th width="80">重 量</th>
<th width="59"></th> <th width="172">金额总计</th> 
<th width="70"></th> 
</tr>
	<%
		ArrayList<String> list=bill.getList();
		int totalprice=0; 
		int i=0;
		if(list.size()==0)
		{
			out.print("<tr><td colspan=\"9\" id='kong'>你啥也没买！</td></tr>");
		}	
		for(i=0;i<list.size();i++)
		{
			String[] info=list.get(i).split("#");
			totalprice+=Integer.valueOf(info[5]);
			//out.print(list.get(i));
			out.print("<tr> <td>");
			out.print("<a id='jsimg' href='' target='_blank'><img src='./IMAGE/"+info[2]+"' width='60' height='60'></a>");
			out.print("</td><td><h3>");
			out.print("<a href='' target='_blank' style='color:black'>"+info[0]+"</a> ");
			out.print("</h3></td><td> </td><td> ");
			out.print("<strong ><span id='sl_"+(i+1)+"'>"+info[4]+"</span></strong>");
			out.print("</td> <td></td><td>");
			out.print("<strong ><span id='zl_"+(i+1)+"'>0</span>kg</strong>");
			out.print("</td><td></td> <td>");
			out.print("<strong style='color:#cf000e'>￥<span id='price_"+(i+1)+"'>"+info[5]+"</span></strong>");
			out.print("</td><td> </td></tr>");
			
			out.print("<p hidden id='goodsid_"+(i+1)+"'>"+info[3]+"</p>");
			out.print("");
		}
			out.print("<p hidden id='goodscount'>"+i+"</p>");
	%>

<!--  
<tr> 
 <td>
<a id="jsimg" href="" target="_blank"><img src="./IMAGE/sms9pro.jpg" width="60" height="60"></a>
</td> 
<td>
<h3>
<a href="" target="_blank">小米手环2蓝牙&nbsp;</a> 
</h3>
</td>
<td> 
</td>
<td> 
<strong ><span id="xj_1">1</span></strong>
</td> 
<td>
</td>
<td>
<strong ><span id="total_1">0</span>kg</strong>
</td>
<td></td> 
<td> 
<strong style="color:#cf000e">￥<span id="total_1">100</span></strong>
</td>
<td> 
</td> 
</tr>
-->



</table>
</form>

<div id="jiesuankuang" style="overflow:hidden">
<div class="title"><h2>结算信息</h2></div>
<div id="box">
<ul>
<li><span>商品金额：￥<strong><span id="totalprice"><%=totalprice %></span></strong>元</span>&nbsp;+ 运费：￥<strong id="yunfei">0</strong>元
&nbsp;&nbsp;&nbsp;<span>重量：<strong><span>0</span></strong>kg</span>
</li>
<li>
<div id="shishoukuang">
<span>应付金额:<strong><span id="ssprice"><%=totalprice %></span></strong>元</span>
</div>
</li>
</ul>
<div id='tj'>
<div id="btn">
<input type="button" id="tjbtn" value="提交订单" onclick="showbill()">
</div>
</div>
</div>
</div>


	<div class="Copyright">
    <div class="foottext">Copyright © zWz 2018，All Rights Reserved</div>
</div>

</div>
</div>	
	
</body>
</html>