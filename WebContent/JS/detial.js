/**
 * 
 */

window.onload=function ()
{
	var isnew=document.getElementById('jgtext');
	var tmp=document.getElementById('tmp1');
	if(isnew==null)
	{	
			window.location.href='showdetial?id=1';
	}
	else
	{
		var urlinfo=window.location.href;
		if(urlinfo.indexOf("?")>0)
		{
		var len=urlinfo.length;//获取url的长度
		var offset=urlinfo.indexOf("?");//设置参数字符串开始的位置
		var newsidinfo=urlinfo.substr(offset,len)//取出参数字符串 这里会获得类似“id=1”这样的字符串
		var newsids=newsidinfo.split("=");//对获得的参数字符串按照“=”进行分割
		var newsid=newsids[1];//得到参数值
		var newsname=newsids[0];
		if(newsid!=tmp.innerHTML)
		{
			window.location.href='showdetial?id='+newsid;
		}
		}
	}
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
	}


function putcar(a)
{
	window.location.href='goodscarServlet?id='+a;
	}


function subbtn()
{
	var text=document.getElementById('count');
	if(Number(text.value)-1>0)
	{
		text.value=(Number(text.value)-1).toString();
	}
	else
	{
		alert("不能再减了");
	}
	}

function addbtn()
{
	var text=document.getElementById('count');
	if(Number(text.value)+1<999)
	{
		text.value=(Number(text.value)+1).toString();
	}
	else
	{
		alert("库存不够了!");
	}
	}