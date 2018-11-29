<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="loginBean" class="login.getLoginArgs" scope="session"/>
<jsp:useBean id="gBean" class="goods.goodsBean" scope="session"/>
 <jsp:useBean id="bill" class="goods.billBean" scope="session"/>
  <jsp:useBean id="mybill" class="goods.mybillBean" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>查看订单</title>
<link href="./CSS/mybill.css" rel="stylesheet" type="text/css" />
<script src="./JS/mybill.js" type="text/javascript" charset="GB18030"></script>
</head>
<body>
	<div class="logo_show">
		<div class="hi">
			<a id="headertext"href="main.jsp">Hi~欢迎来到XX商城</a>
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
<div id='headertitle'><span id='text'>我的订单<span></div>
<!-- 
<!%
	String[][] billrecord=mybill.getBillRecord();
	String[][] goodsrecord=mybill.getGoodsRecord();
	if(billrecord.length>1)
	{
		int count=1;
		int location=0;
		for(int i=0;i<billrecord.length;i=location)
		{
			String billtmpNo=billrecord[i][1];
			for(int j=i;j<billrecord.length;j++)
			{			
				if(j+1<billrecord.length)
				{
					if(billrecord[j+1][1].equals(billtmpNo))
					{
						count=count+1;
						location=j+2;//下一个不同订单号的下标
					}
					else
					{
						location=location+1;
					}
				}
				else
				{
					location=location+1;
				}
			}
			out.print("订单号是"+billrecord[i][1]);
			
			
			out.print("");
            
            
			for(int k=0;k<count;k++)
			{
				
				out.print("第"+String.valueOf(k)+"个id是"+billrecord[i][2]);
				
				out.print("");
			}	
							
		}//循环结束得到同个订单号拥有的id数量，进而可以控制循环显示的循环变量的值
		
		
	}
	


%>

 -->


<!--  	<!%
		ArrayList<String> list=bill.getList();
		int totalprice=0; 
		if(list.size()==0)
		{
			out.print("<tr><td colspan=\"9\" id='kong'>你啥也没买！</td></tr>");
		}	
		for(int i=0;i<list.size();i++)
		{
			String[] info=list.get(i).split("#");
			totalprice+=Integer.valueOf(info[5]);
			//out.print(list.get(i));
			out.print("<tr> <td>");
			out.print("<a id='jsimg' href='' target='_blank'><img src='./IMAGE/"+info[2]+"' width='60' height='60'></a>");
			out.print("</td><td><h3>");
			out.print("<a href='' target='_blank'>"+info[0]+"</a> ");
			out.print("</h3></td><td> </td><td> ");
			out.print("<strong ><span id='sl_"+(i+1)+"'>x"+info[4]+"</span></strong>");
			out.print("</td> <td></td><td>");
			out.print("<strong ><span id='zl_"+(i+1)+"'>￥"+info[5]+"</span></strong>");
			out.print("</td><td></td> <td>");
			out.print("<strong><span id='price_"+(i+1)+"'>"+df.format(new Date())+"</span></strong>");
			out.print("</td><td><a href='' id='del_"+(i+1)+"'>删除订单</a></td></tr>");

			out.print("");
		}
	
	%>
-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tbody>
                <tr> 
                <th width="10" align="center" bgcolor="#f5f5f5" class="line_top line_bottom line_left">&nbsp;</th>    
                <th height="40" colspan="2" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">商品名称</th>
                <th width="100" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">单价（元）</th>
                <th width="100" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">数量</th>
                <th width="100" align="center" bgcolor="#f5f5f5" class="line_top line_bottom">实付款</th>
                <th width="150" align="center" bgcolor="#f5f5f5" class="line_top line_bottom" colspan="2">支付方式</th>
                <th width="100" align="center" bgcolor="#f5f5f5" class="line_top line_bottom" >交易状态</th>
                </tr>
                
                <%
                String[][] billrecord=mybill.getBillRecord();
            	ArrayList<String[][]> goodslist=mybill.getGoodsRecordList();
            	if(billrecord.length>=1)
            	{
            		if(billrecord[0][0]==null)
            		{
            			out.print("<tr><td colspan=\"9\" id='kong' style='text-align:center;'>没有订单！</td></tr>");
            		}
            		else
            		{
            		int count=1;
            		int location=0;
            		int i;
            		for(i=0;i<billrecord.length;i=location)
            		{
            			String billtmpNo=billrecord[i][1];
            			for(int j=i;j<billrecord.length;j++)
            			{			
            				if(j+1<billrecord.length)
            				{
            					if(billrecord[j+1][1].equals(billtmpNo))
            					{
            						count=count+1;
            						location=j+2;//下一个不同订单号的下标
            					}
            				}
            			}
            			if(location==i)
            			location=location+1;
            	
                out.print("<tr>");
    			out.print("<td colspan="+"4"+" id='titletd'>订单编号:"+billrecord[i][1]+"</td>");
    			out.print("<td colspan="+"5"+" id='titletd'>订单生成时间："+billrecord[i][5]+"</td>");
    			out.print("</tr>");

    			for(int k=0;k<count;k++)
    			{
    				String[][] tmpgoods=goodslist.get(i+k);//id=tmpgoods[0][0],名字=tmpgoods[0][4],图片=tmpgoods[0][6],单价=tmpgoods[0][5]
    				//out.print("第"+String.valueOf(k)+"个id是"+billrecord[i+k][2]);
    				
    				out.print("<tr>");
    				out.print("<td height='80' colspan='2' style='border-bottom: 1px solid #ddd;border-left: 1px solid #ddd;'><img id='pic'_1 src='./IMAGE/"+tmpgoods[0][6]+"' width='60' height='60'></td>");
    				out.print("<td style='text-align:center;border-bottom: 1px solid #ddd;font-size:13px;'><span id=''name_1>"+tmpgoods[0][4]+"</span></td>");
    				out.print("<td style='border-bottom: 1px solid #ddd;'>￥<span id='price_1'>"+tmpgoods[0][5]+"</span></td>");
    				out.print("<td style='text-align:center;border-bottom: 1px solid #ddd;'><span id='count_1'>"+billrecord[i+k][3]+"</span></td>");
    				out.print("<td style='text-align:center;border-bottom: 1px solid #ddd;'>￥<span id='sfk_1'>"+billrecord[i+k][4]+"</span></td>");
    				out.print("<td style='text-align:center;border-bottom: 1px solid #ddd;font-size:13px;' colspan="+"2"+"><span id='zffs_1'>网上支付</span></td>");
    				out.print("<td style='text-align:center;border-bottom: 1px solid #ddd;border-right: 1px solid #ddd;font-size:13px;'><span id='zt_1'>");
    				if(billrecord[i+k][6].equals("1"))
    				{
    					out.print("支付完成");
    				}
    				else
    				{
    					out.print("未支付");
    				}
    				out.print("</span></td>");
    				out.print("</tr>");
    				out.print("");
    				
    			}
    				
    				
    				
    				
    			}	
    			count=1;
            		}           		 
            	}
            	else
            	{
            		out.print("<tr><td colspan=\"9\" id='kong' style='text-align:center;'>没有订单！</td></tr>");
            	}
    			
    			
    			%>
                <!--  <tr>
                <td colspan="4" id='titletd'>订单编号:20180611191225</td>
                <td colspan="5" id='titletd'>订单生成时间：2018-06-11 09:12:32</td>
                </tr>
               
                
                
                <tr>
                <td height='80' colspan='2' style='border-bottom: 1px solid #ddd;border-left: 1px solid #ddd;'><img id='pic'_1 src='./IMAGE/sms9pro.jpg' width='60' height='60'></td>
                <td style='text-align:center;border-bottom: 1px solid #ddd;font-size:13px;'><span id=''name_1>三星手机123456789</span></td>
                <td style='border-bottom: 1px solid #ddd;'>￥<span id='price_1'>9988</span></td>
                <td style='text-align:center;border-bottom: 1px solid #ddd;'><span id='count_1'>15</span></td>
                <td style='text-align:center;border-bottom: 1px solid #ddd;'>￥<span id='sfk_1'>9980</span></td>
                <td style='text-align:center;border-bottom: 1px solid #ddd;font-size:13px;' colspan="2"><span id='zffs_1'>网上支付</span></td>
                <td style='text-align:center;border-bottom: 1px solid #ddd;border-right: 1px solid #ddd;font-size:13px;'><span id='zt_1'>支付完成</span></td>
                </tr>
                 -->
                
                
</tbody>
</table>
</div>
</div>	
<div id="foot">
<div id='footer'>
<div id=pagetext>
当前显示第<span style="color:blue">1</span>页,共有<span style="color:blue">1</span>页。
</div>
<div id="pagebtn">
<input type=hidden name="currentPage"  id='totalpage' value="1">
<input type=hidden name="currentPage" value="">
<span id="btnup"><input type=button name="g" value="上一页" onclick="up()"></span>
<span id="btnnext"><input type=button name="g" value="下一页" onclick="next()"></span>
</div>
</div>
</div>

	<div class="Copyright">
    <div class="foottext">Copyright © zWz 2018，All Rights Reserved</div>
</div>
	
</body>
</html>