/**
 * 
 */
var flag;


window.onload=function() 
{
	var urlinfo=decodeURI(window.location.href);
	var isnew=document.getElementById('title1');
	if(urlinfo.indexOf("st=")>0)
	{
		if(urlinfo.indexOf("&page=")>0)
		{
			var start1=urlinfo.indexOf("st=")+3;
			var len1=urlinfo.indexOf("&page=")-start1;
			var start2=urlinfo.indexOf("&page=")+6;
			var len2=urlinfo.length-start2;
			var sttext=urlinfo.substr(start1,len1);
			var pagetext=urlinfo.substr(start2,len2);			
			if(isnew.innerText!=sttext)
			{
				window.location.href='/shop/goodsServlet?searchtext='+sttext+'&page='+pagetext;
			}
		}
	}
	else
	{
		window.location.href='/shop/goodsServlet?searchtext=~';
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


function check()
{
	var isnew=document.getElementById('search_form_input');
	if(isnew.value=="请输入关键词"||isnew.value=="")
		{
			alert("没输入搜索条件怎么搜索？");
			return false;
		}else
			return true;
	}


function putcar(a)
{
	window.location.href='goodscarServlet?id='+a;
	}


function up()
{
	var urlinfo=window.location.href; //
	var number;
	var totalpagestr=document.getElementById('totalpage').value;
	if(totalpagestr!=null)		
	var totalpage=Number(totalpagestr);
	if(urlinfo.indexOf("?")>0&&urlinfo.indexOf("&")>0)
	{
		var len=urlinfo.length;//
		var offset=urlinfo.indexOf("?");//
		var argsinfo=urlinfo.substr(offset+1,len)//
		var args=argsinfo.split("&");//
		var arg=args[1].split("=");
		if(arg[0]=="page")
		{
			number=Number(arg[1])-1;		
			if(number<1)
				number=Number(totalpage);
			var stockoffset=urlinfo.indexOf("&");
			var stockurl=urlinfo.substr(0,stockoffset+1)
			window.location.href=stockurl+'page='+number.toString();
		}
	}
}

function next()
{
	var urlinfo=window.location.href; 
	var totalpagestr=document.getElementById('totalpage').value;
	if(totalpagestr!=null)		
	var totalpage=Number(totalpagestr);
	if(urlinfo.indexOf("?")>0&&urlinfo.indexOf("&")>0)
	{
		var len=urlinfo.length;
		var offset=urlinfo.indexOf("?");
		var argsinfo=urlinfo.substr(offset+1,len)
		var args=argsinfo.split("&");
		var arg=args[1].split("=");
		if(arg[0]=="page")
		{
			number=Number(arg[1])+1;

			if(number>totalpage)
				number=Number(1);
			var stockoffset=urlinfo.indexOf("&");
			var stockurl=urlinfo.substr(0,stockoffset+1)
			window.location.href=stockurl+'page='+number.toString();
		}
	}
}

function searchwhat(i)
{
	window.location.href='search.jsp?st='+encodeURI(i.toString())+'&page=1';
	}