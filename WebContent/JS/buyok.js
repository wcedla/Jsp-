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
			headtext.innerText="Hi "+username.value+",��ӭ����zWz�̳�";
			headopt[0].innerText="�˳���¼";
			headopt[0].href="/shop/logoutServlet";
			headopt[1].parentNode.parentNode.removeChild(headopt[1].parentNode);
			headopt[0].parentNode.parentNode.parentNode.style.width="210px";
			
		}
	}
	else
	{
		alert("�㻹û�е�¼�أ�");
		window.location.href='login.jsp';
	}
	}

function fkcg()
{
	var billid=document.getElementById('billid');
	window.location.href='okServlet?id='+billid.innerHTML;
		
	}