<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>��Աע��ҳ</title>
<link href="./CSS/register.css" type="text/css" rel="stylesheet">
<script src="./JS/register.js" type="text/javascript" charset="GB18030"></script>
<body>
<div class="header">
        <a href="main.jsp" title="������ҳ">
        <img src="./IMAGE/logo.jpg" width="158" height="58" class="Logo">
        </a>
        <span class=headertitle>��ӭע��</span>
</div>  
<div class="mb">
      <div class="kuang">
            <div class="reg_title">ע�����û�<span class="hadaccount">�����ʺţ�<a href="login.jsp" style="color:#F00; font-size:14px;">��¼</a></span></div>
            <form id="regForm" action="regServlet" method="post">
            <table border="0" align="center" cellpadding="3" cellspacing="0" class="zhuce">
            <tbody>
            <tr>
            <td height="45" width="200" align="right">�û�����</td>
            <td>
            <input type="text" id="username" name="username" class="register_input" required="true">
            </td>
            <td>
            <span class="gray">�û�����3��20λ�������ַ���Ӣ����ĸ��������ɡ�</span>
            </td>
            </tr>
            <tr>
            <td height="45" width="" align="right">Email��</td>
            <td><input type="text" name="email" id="email" class="register_input" required="true"></td>
            <td><span class="gray">������Ч�����ַ���ɹ�������ô�������Ϊ��¼�˺ż��һ�����</span></td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">���룺</td>
            <td><input name="password" type="password" class="register_input" id="password" required="true"></td>
            <td><span class="gray">6��20λ�ַ������ɴ�СдӢ�ġ����ֻ������� </span></td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">ȷ�����룺</td>
            <td><input type="password" class="register_input" id="aginpwd" required="true"></td>
            <td><span class="gray">�ٴ�������ͬ����</span></td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">��֤�룺</td>
            <td colspan="2"><input type="text" name="checkcode" class="register_input" id="yzm" required="true">
            <img src="image.jsp" height="30" id="randImage" onclick="javascript:loadimage()">
            <a href="javascript:loadimage()" style="line-height:30px;">�����壬��һ�� </a>
            </td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">&nbsp;</td>
            <td colspan="2">
            <input type="checkbox" id="contract" name="contract" checked="checked">
            <a href="" onclick="" class="xieyi">���Ķ������ܡ� JSPGOUЭ�� ��</a></td>
            </tr>
            <tr>
            <td height="50" width="200" align="right">&nbsp;</td>
            <td colspan="2"><input type="submit" value="ע��" class="reg_button" onClick=" return check();">
            </td>
            </tr>
            </tbody></table>
          </form>
        </div>
</div>
<div class="Copyright">
    <div class="foottext">Copyright �0�8 zWz 2018��All Rights Reserved</div>
</div>
</body>
</html>