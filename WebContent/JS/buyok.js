/**
 * 
 */

window.onload=function()
{
	
	var islogin=document.getElementById('hidevalue1');
	var username=document.getElementById('hidevalue2');
	var headtext=document.getElementById('headertext');
	var headopt=document.querySelectorAll("#login_module li a");
	if(islogin.value==1)
	{
		if(username.value != null)
		{
			headtext.innerText="Hi "+username.value+",欢迎来到zWz商城";
			headopt[0].innerText="退出登录";
			headopt[0].href="/shop/logoutServlet";
			headopt[1].parentNode.parentNode.removeChild(headopt[1].parentNode);
			headopt[0].parentNode.parentNode.parentNode.style.width="210px";
			
		}
	}
	else
	{
		alert("你还没有登录呢！");
		window.location.href='login.jsp';
	}
	}

function fkcg()
{
	var billid=document.getElementById('billid');
	window.location.href='okServlet?id='+billid.innerHTML;
		
	}