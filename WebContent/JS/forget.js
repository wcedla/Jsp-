/**
 * 
 */
function loadimage()
{
	document.getElementById("randImage").src = "image.jsp?"+Math.random();//这句加了随机数是因为啥呢，是因为在image.jsp页面已经设置了不允许缓存了，那么再次请求的时候就霄1�7要重新给丄1�7个地坄1�7给image.jsp，使得得到新的验证码图片
}

function check()
{
	var name=document.getElementById('username');
	var email=document.getElementById('email');
	 var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
	 var password=document.getElementById('password');	 
	if(name.value==null||name.value.length<3||name.value.length>20)
	{
		alert("�û��������Ϲ���");
		return false;
	}
	else if(email.value == ""||!reg.test(email.value)) //正则验证不�1�7�过，格式不寄1�7
	{
        alert("���䲻���Ϲ���");
        return false;
    }
	else if(password.value==null||password.value.length<6||password.value.length>20)
	{
		 alert("���벻���Ϲ���!");
	        return false;
	}
	return true;
}

