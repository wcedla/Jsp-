/**
 * 
 */

window.onload=function()
{
	var islogin=document.getElementById('islogin');
	if(islogin.value==0)
	{
		alert("还没有登录呢");
		window.location.href='login.jsp';
	}
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


function checkset(a)
{
	var checkcounts=document.forms['cform'];
	var allselect=document.getElementById('selectall');
	var checkbox=document.getElementById(a);
	var singlepricetotal =document.getElementById('jiage');
	var zuihou=document.getElementById('zhprice');
	if(a!="selectall")
	{
		if(isSelectAll(checkcounts))
		{
			
			allselect.checked=true;
		}
		else
		{
			allselect.checked=false;
		}
		var singleprice=getprice(a);		
		if(checkbox.checked)
		{
			var tmp=(Number(singlepricetotal.innerHTML)+Number(singleprice.innerHTML)).toString();
			singlepricetotal.innerHTML=tmp;
			zuihou.innerHTML=tmp;
		}
		else
		{
			var tmp=(Number(singlepricetotal.innerHTML)-Number(singleprice.innerHTML)).toString();
			singlepricetotal.innerHTML=tmp;
			zuihou.innerHTML=tmp;
		}
	}
	else if(a=="selectall")
	{
		var i=0;
		if(isSelectAll(checkcounts))
		{
			for(i;i<checkcounts.length;i+=4)
			{
				checkcounts[i].checked=false;
			}
			singlepricetotal.innerHTML=0;
			zuihou.innerHTML=0;
		}
		else
		{
			var totalprices=0;
			for(i;i<checkcounts.length;i+=4)
			{
				checkcounts[i].checked=true;
				totalprices+=Number(getprice(checkcounts[i].id).innerHTML);
			}
			
			singlepricetotal.innerHTML=totalprices;
			zuihou.innerHTML=totalprices;
		}
	}
	}


function getprice(id)
{
	var index=id.split("_")[1];
	var price=document.getElementById("total_"+index);		
	return price;
}



function isSelectAll(a)
{
	var i=0;
	var flag=1;
	for(i;i<a.length;i+=4)
	{
		if(!a[i].checked)
		{
			flag=0;
		}
	}
		return flag;
	}


function countdel(id)
{
	var index=id.split("_")[1];
	var counttext=document.getElementById("count_"+index);
	var checkbox=document.getElementById("isselect_"+index);
	if(Number(counttext.value)-1<1)
	{
		alert("不能再减了!");
	}
	else
	{
		var zuihou=document.getElementById('zhprice');
		var totaljg=document.getElementById("jiage");
		var xianjia=document.getElementById("xj_"+index);
		var dgzj=document.getElementById("total_"+index);
		counttext.value=Number(counttext.value)-1;
		dgzj.innerHTML=Number(dgzj.innerHTML)-Number(xianjia.innerHTML);
		if(checkbox.checked)
		{
			totaljg.innerHTML=Number(totaljg.innerHTML)-Number(xianjia.innerHTML);
			zuihou.innerHTML=totaljg.innerHTML;
		}
		
	}
}
	
	function countadd(id)
	{
		var index=id.split("_")[1];
		var counttext=document.getElementById("count_"+index);
		var checkbox=document.getElementById("isselect_"+index);
		var maxcount=document.getElementById("shuliang_"+index);
		if(Number(counttext.value)+1>Number(maxcount.innerHTML))
		{
			alert("给别人一点机会!");
		}
		else
		{
			var zuihou=document.getElementById('zhprice');
			var totaljg=document.getElementById("jiage");
			var xianjia=document.getElementById("xj_"+index);
			var dgzj=document.getElementById("total_"+index);
			counttext.value=Number(counttext.value)+1;
			dgzj.innerHTML=Number(dgzj.innerHTML)+Number(xianjia.innerHTML);
			if(checkbox.checked)
			{
				totaljg.innerHTML=Number(totaljg.innerHTML)+Number(xianjia.innerHTML);
				zuihou.innerHTML=totaljg.innerHTML;
			}
			
		}
	
	}
	
	
	
function getbillnow()
{
	var i=0;
	var idstr="";
	var countstr="";
	var pricestr="";
	var flag=1;
	var delindex="";
	var checkcounts=document.forms['cform'];
	for(i;i<checkcounts.length;i+=4)
	{

		if(checkcounts[i].checked)
		{
			var index=checkcounts[i].id.split("_")[1];
			var getid=document.getElementById('goodsid_'+index);
			var getcounts=document.getElementById('count_'+index);
			var getprice=document.getElementById('total_'+index);
			idstr+=getid.innerHTML+"*";
			countstr+=getcounts.value+"*";
			pricestr+=getprice.innerHTML+"*";
			delindex+=(i/4).toString()+"*"
		}
	}
	if(delindex!="")
	{
		flag=1;
	}
	else
	{
		flag=0;
	}		
	if(flag==0)
	{
		alert("啥都不买生成订单干嘛？");
	}
	else
	{
		//alert("billServlet?goodsid="+idstr+"&goodscount="+countstr+"&totalprice="+pricestr+"&delindex="+delindex);
	window.location.href="billServlet?goodsid="+idstr+"&goodscount="+countstr+"&totalprice="+pricestr+"&delindex="+delindex;
	}
}
	
	