/**
 * 
 */
function loadimage()
{
	document.getElementById("randImage").src = "image.jsp?"+Math.random();//杩欏彞鍔犱簡闅忔満鏁版槸鍥犱负鍟ュ憿锛屾槸鍥犱负鍦╥mage.jsp椤甸潰宸茬粡璁剧疆浜嗕笉鍏佽缂撳瓨浜嗭紝閭ｄ箞鍐嶆璇锋眰鐨勬椂鍊欏氨闇�瑕侀噸鏂扮粰涓�涓湴鍧�缁檌mage.jsp锛屼娇寰楀緱鍒版柊鐨勯獙璇佺爜鍥剧墖
}

function check()
{
	var name=document.getElementById('username');
	var email=document.getElementById('email');
	 var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
	 var password=document.getElementById('password');	 
	if(name.value==null||name.value.length<3||name.value.length>20)
	{
		alert("用户名不符合规则！");
		return false;
	}
	else if(email.value == ""||!reg.test(email.value)) //姝ｅ垯楠岃瘉涓嶉�氳繃锛屾牸寮忎笉瀵�
	{
        alert("邮箱不符合规则！");
        return false;
    }
	else if(password.value==null||password.value.length<6||password.value.length>20)
	{
		 alert("密码不符合规则!");
	        return false;
	}
	return true;
}

