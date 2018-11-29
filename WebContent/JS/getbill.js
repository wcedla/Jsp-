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

function showbill()
{
	var timetext=document.getElementById('timetext');
	var infos=timetext.innerHTML.split(" ");
	var years=infos[0].split("-");
	var sjs=infos[1].split(":");
	var yearstr="";
	var sjstr="";
	for(var i=0;i<years.length;i++)
	{
		yearstr+=years[i]+"*";
	}
	for(var j=0;j<sjs.length;j++)
	{
		sjstr+=sjs[j]+"*";
	}
	//alert(yearstr+sjstr);
	
	var goodscount=document.querySelectorAll("#cftb tr");
	var slstr="";
	var pricestr="";
	var idstr="";
	if(goodscount<2)
	{
		alert("啥也没买，生成不了订单！");
	}
	else
	{
		for(var i=1;i<goodscount.length;i++)
		{
			var ids=document.getElementById('goodsid_'+i);
			var shuliang=document.getElementById('sl_'+i);
			var qian=document.getElementById('price_'+i);
			slstr+=shuliang.innerHTML+"*";
			pricestr+=qian.innerHTML+"*";
			idstr+=ids.innerHTML+"*";
		}
		//alert('Servlet?id='+idstr+"&sl="+slstr+"&price="+pricestr+"&sj="+yearstr+sjstr);
		window.location.href='showbillServlet?id='+idstr+"&sl="+slstr+"&price="+pricestr+"&sj="+yearstr+sjstr;
	}
	}

