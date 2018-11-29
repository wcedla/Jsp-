<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<jsp:useBean id="loginBean" class="login.getLoginArgs" scope="session"/>
<jsp:useBean id="gBean" class="goods.goodsBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>搜索商品</title>
<link href="./CSS/search.css" rel="stylesheet" type="text/css" />
<script src="./JS/search.js" type="text/javascript" charset="GB18030"></script>
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
		<div class="Nav">
		<ul class="allgoods">
			<li class="Nav-item first"><a href=main.jsp>首页</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav1">数码</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav2">服装</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav3">鞋包配饰</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav4">日用百货</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav5">家居建材</a></li>
			<li class="Nav-item"><a onclick="searchwhat(this.innerHTML)" id="nav6">珠宝手表</a></li>
		</ul>
	</div>
<%
request.setCharacterEncoding ("GB18030");
response.setCharacterEncoding ("GB18030");
%>
	<div id="titletext">
	您搜索的<span id="title1"><%=gBean.getQueryName() %></span>，共有<span id="title2"><%=gBean.getTableRecord().length%></span>条记录。
	</div>
	<div id="picshow">
	<div id="kuang">
	<table id="goods">
  <%
		String [][] table=gBean.getTableRecord();
    if(table==null) {
        out.print("没有记录");
        return;
     }
	 	int totalRecord = table.length;
	 	String currentpagestr=request.getParameter("page") ;
	 	  int pageSize=8;  //每页显示的记录数
	      int totalPages = gBean.getTotalPages();
	      int currentpage;
	 	  if(currentpagestr!=null)
	 	  {
	      	currentpage=Integer.parseInt(currentpagestr);	      	
	 	  }else
	 	  {
	 		 	 currentpage=1;
	 	  }
	      if(totalRecord%pageSize==0)
	           totalPages = totalRecord/pageSize;//总页数
	      else
	           totalPages = totalRecord/pageSize+1;
	      gBean.setTotalPages(totalPages);
	      if(totalPages>=1) 
	      {
	          if(currentpage<1)
	         	 currentpage=gBean.getTotalPages();
	          if(currentpage>gBean.getTotalPages())
	         	 currentpage=1;
	      }
	      int index=(currentpage-1)*pageSize;
	         int start=index;  //table的currentPage页起始位置
	         int showrow=0;
	         if((totalRecord-index)>4)
	         {
	        	 showrow=2;
	         }
	         else if((totalRecord-index)>=0)
	         {
	        	 showrow=1;
	         }	         
	        	 for(int i=0;i<showrow;i++)
	        	 {
		        	 out.print("<tr>");
		        	 if(table==null||table.length==0||table[0].length==0||table[0][0]==null)
	        		  {
		        		out.print("<center>很抱歉，未查到相关数据！</center>");
	        		  }
		        	 else{
		        		 //out.print("<center>"+String.valueOf(table.length)+"</center>");
		        		  for(int j=(index+(4*i));j<(index+(4*i)+4);j++)
		        	 {
		        		  if(j==totalRecord)
		                      break;	        			 
		        		  out.print("<td  id='connect' width='250'>");
		        		  out.print("<a href='showdetial?id="+table[j][0]+"' id='everygoods'><img alt='我是图片' src='./IMAGE/"+table[j][gBean.getColumnNameIndex("图片id")]+"' id='innerpic'>");
		        		  out.print("<p id='price'>￥"+table[j][gBean.getColumnNameIndex("价格")]+"</p>");
		        		  out.print("<p id='name'>"+table[j][gBean.getColumnNameIndex("名字")]+"</p></a>");
		        		 out.print("<p id='carkuang'><a href='javascript:putcar("+table[j][0]+")' id='goodscar'><img src='./IMAGE/goodscar.jpg' id='gcar'>加入购物车</a></p></td>");
		        		 //out.print("<td>"+table[j][k]+"</td>");
		        		  }
		        	
		        	 }
		        	 out.print("</tr>");
	        	 }
	%>
</table>
</div>
</div>
<div id="foot">
<div id='footer'>
<div id=pagetext>
当前显示第<span style="color:blue"><%=currentpage %></span>页,共有<span style="color:blue"><%=totalPages %></span>页。
</div>
<div id="pagebtn">
<input type=hidden name="currentPage"  id='totalpage' value="<%=totalPages%>">
<input type=hidden name="currentPage" value="">
<span id="btnup"><input type=button name="g" value="上一页" onclick="up()"></span>
<span id="btnnext"><input type=button name="g" value="下一页" onclick="next()"></span>
</div>
</div>
</div>
<div class="Copyright">
    <div class="foottext">Copyright © zWz 2018，All Rights Reserved</div>
</div>
<!--  
	<div id="picshow">
	<div id="kuang">
	<table id="goods">
	<tr>
	<td id="connect" width="250">
	<a href="" id="everygoods"><img alt="手机" src="./IMAGE/a.jpg" id="innerpic">
	<p id="price">￥655</p>
	<p id="name">小米5</p>
	</a>
	</td>
	</tr>
	</table>
	</div>
	</div>
-->
</body>
</html>