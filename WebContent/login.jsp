<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%
request.setCharacterEncoding ("GB18030");
response.setCharacterEncoding ("GB18030");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>��Ա��¼ҳ</title>
<link href="./CSS/login.css" type="text/css" rel="stylesheet">
<script src="./JS/login.js" type="text/javascript"></script>
<body>
<div class="header">
        <a href="main.jsp" title="������ҳ">
        <img src="./IMAGE/logo.jpg" width="158" height="58" class="Logo">
        </a>
</div>  
<div class="mb">
    <img src="./IMAGE/login_pic.jpg" class="tuxiang">
    <div class="kuang">
        <form id="loginForm" action="loginServlet" method="post">
            <div class="formtable">
                <table width="335" border="0" align="center" cellpadding="2" cellspacing="0">
                <tbody>
                <tr>
                <td height="70">
                <div class="tabletile">�˻���¼</div>
                <a href="register.jsp" style="color:#cf1e1e; font-size:14px;" class="tablereg">���ע��</a>
                </td>
                </tr>
                <tr>
                <td height="75">
                <input type="text" name="username" id="username" class="loginInput" required="true" placeholder="�û���">
                </td>
                </tr>
                <tr>
                <td height="75">
                <input type="password" name="password" id="" class="loginInput" required="true" placeholder="����">
                </td>
                </tr>
                <tr>
                <td height="30">
                <a href="forgetPassword.jsp" target="_self" class="forget">��������</a> 
                </td>
                </tr>
                
                <tr>
                <td height="75"><input type="submit" value="�� ¼" class="loginbtn"></td>
                </tr>
                </tbody></table>        
            </div>    
        </form>
    </div>
</div>

<div class="Copyright">
    <div class="foottext">Copyright �0�8 zWz 2018��All Rights Reserved</div>
</div>
</body>
</html>