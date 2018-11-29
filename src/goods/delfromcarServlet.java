package goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class delfromcarServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		goodsBean gBean = null;
		try {
				gBean = (goodsBean)request.getSession().getAttribute("gBean");
				if (gBean == null) 
				{
					fail(request,response,"³öÏÖ´íÎó","search.jsp");
				}
				else
				{
					request.setCharacterEncoding("GB18030");
					response.setCharacterEncoding("GB18030");
					String istr=request.getParameter("index");
					if(istr==null)
					{						
							istr="";
							fail(request,response,"É¾³ýÊ§°Ü!",response.encodeURL(request.getHeader("REFERER")));
						
					}
					else 
					{
						try
						{
							int index=Integer.valueOf(istr.trim());
							ArrayList<String> list=gBean.getList();
							list.remove(index);
							gBean.setList(list);
							fail(request,response,"É¾³ý³É¹¦!",response.encodeURL(request.getHeader("REFERER")));
						}catch(Exception e)
						{
							if(istr.equals("all"))
							{
								ArrayList<String> list=gBean.getList();
								list.clear();
								gBean.setList(list);
								fail(request,response,"ok",response.encodeURL(request.getHeader("REFERER")));
							}
							else
							{
								fail(request,response,"É¾³ýÊ§°Ü!",response.encodeURL(request.getHeader("REFERER")));
							}
						}
					}
				}
		}catch(Exception e)
		{
			fail(request,response,"³öÏÖ´íÎó","search.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
	public void fail(HttpServletRequest request, HttpServletResponse response, String backNews,String url) {
		response.setCharacterEncoding("gb2312");
		try {
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('"+backNews+"');");
			if(url!="")
			out.println("window.location.href='"+url+"'");
			out.println("</script>");
		} catch (IOException exp) {
		}
	}	

}
