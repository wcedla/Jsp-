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
<title>���ɶ���</title>
<link href="./CSS/getbill.css" rel="stylesheet" type="text/css" />
<script src="./JS/getbill.js" type="text/javascript" charset="GB18030"></script>
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
<div id="md">
<div id="fzk">
<form action="" method="post" name="carform" id="cform">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="cftb">
<div id="time">
<%
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//�������ڸ�ʽ
String date=df.format(new Date());
String[] tmp=date.split("\\-| |\\:");
String id=tmp[0]+tmp[1]+tmp[2]+tmp[3]+tmp[4]+tmp[5];
out.println("��������ʱ��:"+"<span id='timetext'>"+date+"</span><span style='float:right;'>�������:"+id+"</span>");// new Date()Ϊ��ȡ��ǰϵͳʱ��
%>
</div>
<div id='headertitle'><span id='text'>ȷ�϶���</span></div>
<tr> 
<th width="70"></th> <th width="310">��Ʒ����</th><th width="35"></th>
<th width="80">����</th> <th width="58"></th> <th width="80">�� ��</th>
<th width="59"></th> <th width="172">����ܼ�</th> 
<th width="70"></th> 
</tr>
	<%
		ArrayList<String> list=bill.getList();
		int totalprice=0; 
		int i=0;
		if(list.size()==0)
		{
			out.print("<tr><td colspan=\"9\" id='kong'>��ɶҲû��</td></tr>");
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
			out.print("<strong style='color:#cf000e'>��<span id='price_"+(i+1)+"'>"+info[5]+"</span></strong>");
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
<a href="" target="_blank">С���ֻ�2����&nbsp;</a> 
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
<strong style="color:#cf000e">��<span id="total_1">100</span></strong>
</td>
<td> 
</td> 
</tr>
-->



</table>
</form>

<div id="jiesuankuang" style="overflow:hidden">
<div class="title"><h2>������Ϣ</h2></div>
<div id="box">
<ul>
<li><span>��Ʒ����<strong><span id="totalprice"><%=totalprice %></span></strong>Ԫ</span>&nbsp;+ �˷ѣ���<strong id="yunfei">0</strong>Ԫ
&nbsp;&nbsp;&nbsp;<span>������<strong><span>0</span></strong>kg</span>
</li>
<li>
<div id="shishoukuang">
<span>Ӧ�����:<strong><span id="ssprice"><%=totalprice %></span></strong>Ԫ</span>
</div>
</li>
</ul>
<div id='tj'>
<div id="btn">
<input type="button" id="tjbtn" value="�ύ����" onclick="showbill()">
</div>
</div>
</div>
</div>


	<div class="Copyright">
    <div class="foottext">Copyright �0�8 zWz 2018��All Rights Reserved</div>
</div>

</div>
</div>	
	
</body>
</html>