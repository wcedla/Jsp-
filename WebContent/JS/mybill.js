/**
 * 
 */
window.onload=function ()
{
	var flag=document.getElementById('titletd');
	if(flag==null)
	{
		window.location.href='mybillServlet';
	}
	var islogin=document.getElementById('hidevalue1');
	var username=document.getElementById('hidevalue2');
	var headtext=document.getElementById('headertext');
	var headopt=document.querySelectorAll("#login_module li a");
	if(islogin.value==1)
	{
		if(username.value != null)
		{
			headtext.innerText="Hi "+username.value+",��ӭ����zWz�̳�";
			headopt[0].innerText="�˳���¼";
			headopt[0].href="/shop/logoutServlet";
			headopt[1].parentNode.parentNode.removeChild(headopt[1].parentNode);
			headopt[0].parentNode.parentNode.parentNode.style.width="210px";
			
		}
	}
	}