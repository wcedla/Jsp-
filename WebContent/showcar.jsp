<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="loginBean" class="login.getLoginArgs" scope="session"/>
<jsp:useBean id="gBean" class="goods.goodsBean" scope="session"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./CSS/showcar.css" rel="stylesheet" type="text/css" />
<script src="./JS/showcar.js" type="text/javascript" charset="GB18030"></script>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>购物车</title>
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
					<li><a rel="nofollow" href="search.jsp" target="_self">商品搜索</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="header">
        <a href="main.jsp" title="返回首页">
        <img src="./IMAGE/logo.jpg" width="158" height="58" class="Logo">
        </a>
</div> 
<input type="hidden" id="islogin" value="<%=loginBean.getIsLogin()%>">
<input type="hidden" id="hidevalue2" value="<%=loginBean.getUsername()%>">
<div id="md">
<div id="fzk">
<form action="" method="post" name="carform" id="cform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="cftb">
<tr> 
<th width="35"></th><th width="70"></th> <th width="310">商品名称</th> 
<th width="80">单价</th> <th width="58">积 分</th> <th width="80">数 量</th>
<th width="59">重 量</th> <th width="172">商品合计</th> 
<th width="70">操 作</th> 
</tr>

<%
	ArrayList<String> lists=gBean.getList();
	int zj=0;
	if(lists.size()==0)
	{
		out.print("<tr><td colspan=\"9\" id='kong'>购物车空空如也！</td></tr>");
	}	
	for(int i=0;i<lists.size();i++)
	{
		//out.print(lists.get(i)+"<br/>");
		String[] info=lists.get(i).split("#");
		zj+=Integer.valueOf(info[1].split("\\.")[0]);
		//out.print(info[2]);
		out.print("<tr><td>");
		out.print("<input type='checkbox' name='cart2Checkbox' id='isselect_"+(i+1)+"' checked='true' onclick='checkset(this.id)''>");
		out.print("</td><td>");
		out.print("<a id='cartbimg' href='' target='_blank'><img src='./IMAGE/"+info[2]+"' width='60' height='60'></a>");
		out.print("</td> <td id='cartn'><h3>");
		out.print("<a href='' target='_blank'>"+info[0]+"</a> ");
		out.print("</h3></td><td>");
		out.print("<del>￥<span id='yj'>100</span></del><br>");
		out.print("<strong style='color:#cf000e'>￥<span id='xj_"+(i+1)+"'>"+info[1].split("\\.")[0]+"</span></strong>");
		out.print("</td> <td>");
		out.print("<span id='jifeng'>0</span>");
		out.print("</td><td>");
		out.print("<input  type='button' id='del1_"+(i+1)+"' class='jianyi' onclick='countdel(this.id)' value='-'>");
		out.print("<input id='count_"+(i+1)+"' class='shuliang'  name='goodscount_"+(i+1)+"' type='text' value='1'>");
		out.print("<input id='add1_"+(i+1)+"' class='jiayi' type='button' onclick='countadd(this.id)' value='+'> ");
		out.print("</td><td><span id='weight'>0</span>kg</td> <td> ");
		out.print("<strong style='color:#cf000e'>￥<span id='total_"+(i+1)+"'>"+info[1].split("\\.")[0]+"</span></strong>");
		out.print("</td><td class='delid'> <span> ");
		out.print("<a href='cardelServlet?index="+i+"' onclick='' id='delbtn_"+(i+1)+"' style='color:#e11001;'>删除</a>");
		out.print("</span> </td> </tr>");
		out.print("<p hidden id='shuliang_"+(i+1)+"'>"+info[4]+"</p>");
		out.print("<p hidden id='goodsid_"+(i+1)+"'>"+info[3]+"</p>");
		//out.print("");
	}
%>
<!-- 
<tr> 
<td> 
<input type="checkbox" name="cart2Checkbox" id="isselect_1" checked="true" onclick="checkset(this.id)"> 
</td> 
 <td>
<a id="cartbimg" href="" target="_blank"><img src="./IMAGE/sms9pro.jpg" width="60" height="60"></a>
</td> 
<td id="cartn">
<h3>
<a href="" target="_blank">小米手环2蓝牙&nbsp;</a> 
</h3>
</td>
<td> 
<del>￥<span id="yj">100</span></del><br>
<strong style="color:#cf000e">￥<span id="xj_1">100</span></strong>
</td> 
<td>
<span id="jifeng">0</span>
</td>
<td>
<input  type="button" id="del1_1" class="jianyi" onclick="countdel(this.id)" value="-">
<input id="count_1" class="shuliang"  name="goodscount_1" type="text" value="1">
<input id="add1_1" class="jiayi" type="button" onclick="countadd(this.id)" value="+"> 
</td>
<td><span id="weight">0</span>kg</td> 
<td> 
<strong style="color:#cf000e">￥<span id="total_1">100</span></strong>
</td>
<td class="delid"> 
<span> 
<a href="" onclick="" id="delbtn_1" style="color:#e11001;">删除</a>
</span> 
</td> 
</tr>
<tr> 
<td> 
<input type="checkbox" name="cart2Checkbox" id="isselect_2" checked="true" onclick="checkset(this.id)"> 
</td> 
 <td>
<a id="cartbimg" href="" target="_blank"><img src="./IMAGE/sms9pro.jpg" width="60" height="60"></a>
</td> 
<td id="cartn">
<h3>
<a href="" target="_blank">小米手环2蓝牙&nbsp;</a> 
</h3>
</td>
<td> 
<del>￥<span id="yj">100</span></del><br>
<strong style="color:#cf000e">￥<span id="xj_2">100</span></strong>
</td> 
<td>
<span id="jifeng">0</span>
</td>
<td>
<input  type="button" id="del1_2" class="jianyi" onclick="countdel(this.id)" value="-">
<input id="count_2" class="shuliang" name="goodscount_1" type="text" value="1">
<input id="add1_2" class="jiayi" type="button" onclick="countadd(this.id)" value="+"> 
</td>
<td><span id="weight">0</span>kg</td> 
<td> 
<strong style="color:#cf000e">￥<span id="total_2">100</span></strong>
</td>
<td class="delid"> 
<span> 
<a href="" onclick="" id="delbtn_2" style="color:#e11001;">删除</a>
</span> 
</td> 
</tr>
<tr> 
<td> 
<input type="checkbox" name="cart2Checkbox" id="isselect_3" checked="true" onclick="checkset(this.id)"> 
</td> 
 <td>
<a id="cartbimg" href="" target="_blank"><img src="./IMAGE/sms9pro.jpg" width="60" height="60"></a>
</td> 
<td id="cartn">
<h3>
<a href="" target="_blank">小米手环2蓝牙&nbsp;</a> 
</h3>
</td>
<td> 
<del>￥<span id="yj">100</span></del><br>
<strong style="color:#cf000e">￥<span id="xj_3">100</span></strong>
</td> 
<td>
<span id="jifeng">0</span>
</td>
<td>
<input  type="button" id="del1_3" class="jianyi" onclick="countdel(this.id)" value="-">
<input id="count_3" class="shuliang"  name="goodscount_1" type="text" value="1">
<input id="add1_3" class="jiayi" type="button" onclick="countadd(this.id)" value="+"> 
</td>
<td><span id="weight">0</span>kg</td> 
<td> 
<strong style="color:#cf000e">￥<span id="total_3">100</span></strong>
</td>
<td class="delid"> 
<span> 
<a href="" onclick="" id="delbtn_3" style="color:#e11001;">删除</a>
</span> 
</td> 
</tr>
 -->


</table>
</form>



<p id="zongji">
<span id="wt"> 重量总计：<span id="weighttotal">0</span>kg;
共节省：<span id="jiesheng">0</span>元 ; 
预计可获积分：<span id="getjifeng">0</span> </span> 
<strong>运费：</strong> (以结算时为准)<strong class="darkgray"> 商品金额：</strong>
<strong><span id="jiage" style="color:#cf000e"><%=zj %></span></strong>元 
</p>


<div id="zjkuang">
<div id="rightview">
<strong> 商品总价（未包含运费）： <span style="color:#cf000e" id="zhprice"><%=zj %></span>元 </strong>
<button id="jxgw" onclick="window.location.href='search.jsp'">继续购物</button>
<input type="button" id="confirmToPay" onclick="getbillnow()" value="确认结账 ">
</div>
<div id="option">
<input type="checkbox" id="selectall" onclick="checkset(this.id)" checked="">
<label for="selallbtn">全选</label>
<a href="cardelServlet?index=all" onclick="">清空购物车</a>
</div>
</div>
	<div class="Copyright">
    <div class="foottext">Copyright © zWz 2018，All Rights Reserved</div>
</div>


<% %>
</div>
</div>
</body>
</html>