package goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.getLoginArgs;

public class fkOk extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		getLoginArgs loginBean = null;
		try {
			loginBean = (getLoginArgs)request.getSession().getAttribute("loginBean");
			if (loginBean == null||loginBean.getUsername()==null||loginBean.getUsername().length()==0) {
				fail(request,response,"你还没有登录呢！","login.jsp");
			}else
			{
				goodsBean gBean = null;
				try {
					gBean = (goodsBean)request.getSession().getAttribute("gBean");
					if (gBean == null) {
						fail(request,response,"啥都还没搜索呢？"+"e","search.jsp");
					}else
					{
						billBean bill = null;
						try {
							bill = (billBean)request.getSession().getAttribute("bill");
							if (bill == null) {
								fail(request,response,"啥都还买呢？"+"e","search.jsp");
							}
							else
							{
								fkokBean okBean = null;
								try {
									okBean = (fkokBean)request.getSession().getAttribute("bill");
									if (okBean == null) {
										okBean = new fkokBean(); // 创建Javabean对象
										HttpSession session=request.getSession();
										session.setAttribute("okBean", okBean);
									}
								} catch (Exception exp) {
									okBean = new fkokBean(); // 创建Javabean对象
									HttpSession session=request.getSession();
									session.setAttribute("okBean", okBean);
								}
								//okBean.setOk(1);
								String billid=request.getParameter("id");
								if(billid==null)
								{
									fail(request,response,"付款失败！","main.jsp");
								}
								else
								{
									Connection con;
									PreparedStatement sql;
									ResultSet rs;
									int price=0;
									try {
										String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=shop" ;
										String user="sa";
										String password="296173741aa";
										con = DriverManager.getConnection(uri,user,password);
											sql = con.prepareStatement("update 订单 set 支付完成='1' where 订单号="+billid,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
											int ok=sql.executeUpdate();
											if(ok>0) 
											{
												fail(request,response,"付款成功，商品购买成功！","mybillServlet");
											}
											else
											{
												fail(request,response,"付款失败！","main.jsp");
											}
									}catch(Exception e)
									{
										fail(request,response,"数据库连接失败!","search.jsp");
									}
								}
								
							}
						}catch(Exception e)
						{
							fail(request,response,"啥都还买呢？"+"e","search.jsp");
						}
					}
				}catch(Exception e)
				{
					fail(request,response,"啥都还没搜索呢？"+"e","search.jsp");
				}
			}
		}catch(Exception e)
		{
			fail(request,response,"你还没有登录呢！","login.jsp");
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
