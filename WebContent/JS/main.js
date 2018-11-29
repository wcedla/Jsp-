/**
 * 
 */

var timer;
var index=0;

function a()
{

}


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
	timer= setInterval(picturesport,2000);
	var a=document.getElementById('pictures');
	var b=document.getElementById('prev');
	var c=document.getElementById('next');
	a.onmouseover=function()
	{
		clearInterval(timer);
		b.style.display="inline";
		c.style.display="inline";
		b.style.opacity=0.1;
		c.style.opacity=0.1;
		
	}
	a.onmouseout=function()
	{
		timer = setInterval(picturesport,2000);
		b.style.display="none";
		c.style.display="none";
		b.style.opacity=0;
		c.style.opacity=0;
	}
	b.onmouseover=function()
	{
		clearInterval(timer);
		b.style.display="inline";
		c.style.display="inline";
		b.style.opacity=0.7;
		c.style.opacity=0.1;
	}
	
	c.onmouseover=function()
	{
		clearInterval(timer);
		b.style.display="inline";
		c.style.display="inline";
		c.style.opacity=0.7;
		b.style.opacity=0.1;
	}
	
}

function exit()
{
	
}




function goprev()
{
	var i=index;
	i=i-1;
	if(i<0)
	{
		i=2;
	}
	showpicno(i);
	index=i;
}
function gonext()
{
	var i=index;
	i=i+1;
	if(i>2)
	{
		i=0;
	}
	showpicno(i);
	index=i;
}



function picturesport()
{
	var a=document.querySelectorAll("#pictures li");
	var b=document.querySelectorAll(".num li");
	if(a[0].style.display!='none')
		{
			a[1].style.display='list-item';
			a[0].style.display='none';
			a[2].style.display='none';
			b[1].className='on';
			b[0].className='';
			b[2].className='';
			index=1;
			
		}
	else if(a[1].style.display!='none')
	{
		a[2].style.display='list-item';
		a[1].style.display='none';
		a[0].style.display='none';
		b[2].className='on';
		b[0].className='';
		b[1].className='';
		index=2;
		
	}
	else if(a[2].style.display!='none')
	{
		a[0].style.display='list-item';
		a[2].style.display='none';
		a[1].style.display='none';
		b[0].className='on';
		b[1].className='';
		b[2].className='';
		index=0;
	}
}

function showpicno(n)
{
	var a=document.querySelectorAll("#pictures li");
	var b=document.querySelectorAll(".num li");
	switch(n)
	{
	case 0:
		{
		a[0].style.display='list-item';
		a[2].style.display='none';
		a[1].style.display='none';
		b[0].className='on';
		b[1].className='';
		b[2].className='';		
		}break;
	case 1:
		{
		a[1].style.display='list-item';
		a[0].style.display='none';
		a[2].style.display='none';
		b[1].className='on';
		b[0].className='';
		b[2].className='';
		}break;
	case 2:
		{
		a[2].style.display='list-item';
		a[1].style.display='none';
		a[0].style.display='none';
		b[2].className='on';
		b[0].className='';
		b[1].className='';
		}break;
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

function searchwhat(i)
{
	window.location.href='search.jsp?st='+encodeURI(i.toString())+'&page=1';
	}



