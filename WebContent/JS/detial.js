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
		var len=urlinfo.length;//��ȡurl�ĳ���
		var offset=urlinfo.indexOf("?");//���ò����ַ�����ʼ��λ��
		var newsidinfo=urlinfo.substr(offset,len)//ȡ�������ַ��� ����������ơ�id=1���������ַ���
		var newsids=newsidinfo.split("=");//�Ի�õĲ����ַ������ա�=�����зָ�
		var newsid=newsids[1];//�õ�����ֵ
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
			headtext.innerText="Hi "+username.value+",��ӭ����zWz�̳�";
			headopt[0].innerText="�˳���¼";
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
		alert("�����ټ���");
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
		alert("��治����!");
	}
	}