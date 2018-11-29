<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>会员注册页</title>
<link href="./CSS/register.css" type="text/css" rel="stylesheet">
<script src="./JS/register.js" type="text/javascript" charset="GB18030"></script>
<body>
<div class="header">
        <a href="main.jsp" title="返回首页">
        <img src="./IMAGE/logo.jpg" width="158" height="58" class="Logo">
        </a>
        <span class=headertitle>欢迎注册</span>
</div>  
<div class="mb">
      <div class="kuang">
            <div class="reg_title">注册新用户<span class="hadaccount">已有帐号，<a href="login.jsp" style="color:#F00; font-size:14px;">登录</a></span></div>
            <form id="regForm" action="regServlet" method="post">
            <table border="0" align="center" cellpadding="3" cellspacing="0" class="zhuce">
            <tbody>
            <tr>
            <td height="45" width="200" align="right">用户名：</td>
            <td>
            <input type="text" id="username" name="username" class="register_input" required="true">
            </td>
            <td>
            <span class="gray">用户名由3到20位的中文字符、英文字母、数字组成。</span>
            </td>
            </tr>
            <tr>
            <td height="45" width="" align="right">Email：</td>
            <td><input type="text" name="email" id="email" class="register_input" required="true"></td>
            <td><span class="gray">输入有效邮箱地址并成功激活，可用此邮箱做为登录账号及找回密码</span></td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">密码：</td>
            <td><input name="password" type="password" class="register_input" id="password" required="true"></td>
            <td><span class="gray">6－20位字符，可由大小写英文、数字或符号组成 </span></td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">确认密码：</td>
            <td><input type="password" class="register_input" id="aginpwd" required="true"></td>
            <td><span class="gray">再次输入相同密码</span></td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">验证码：</td>
            <td colspan="2"><input type="text" name="checkcode" class="register_input" id="yzm" required="true">
            <img src="image.jsp" height="30" id="randImage" onclick="javascript:loadimage()">
            <a href="javascript:loadimage()" style="line-height:30px;">看不清，换一张 </a>
            </td>
            </tr>
            <tr>
            <td height="45" width="200" align="right">&nbsp;</td>
            <td colspan="2">
            <input type="checkbox" id="contract" name="contract" checked="checked">
            <a href="" onclick="" class="xieyi">已阅读并接受《 JSPGOU协议 》</a></td>
            </tr>
            <tr>
            <td height="50" width="200" align="right">&nbsp;</td>
            <td colspan="2"><input type="submit" value="注册" class="reg_button" onClick=" return check();">
            </td>
            </tr>
            </tbody></table>
          </form>
        </div>
</div>
<div class="Copyright">
    <div class="foottext">Copyright © zWz 2018，All Rights Reserved</div>
</div>
</body>
</html>