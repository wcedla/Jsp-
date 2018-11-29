package goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import goods.billBean;
import login.getLoginArgs;

public class getbillServlet extends HttpServlet {
	
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
								bill = new billBean(); // 创建Javabean对象
								HttpSession session=request.getSession();
								session.setAttribute("bill", bill);
							}
						} catch (Exception exp) {
							bill = new billBean(); // 创建Javabean对象
							HttpSession session=request.getSession();
							session.setAttribute("bill", bill);
						}
						try {
							Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
						} catch (Exception e) {
						}
						request.setCharacterEncoding("GB18030");
						response.setCharacterEncoding("GB18030");
						try {
						String idstr=request.getParameter("goodsid");
						String countstr=request.getParameter("goodscount");
						String totalpricestr=request.getParameter("totalprice");
						String delindex=request.getParameter("delindex");
						if(delindex!=null)
						{
							String [] indexs=delindex.split("\\*");							
							ArrayList<String> dellist=gBean.getList();
							for(int i=0;i<indexs.length;i++)
							{
								int n=Integer.valueOf(indexs[i]);
								dellist.remove(n-i);
							}
							gBean.setList(dellist);
							//fail(request,response,String.valueOf(lists.size()),"main.jsp");
						}
						if(idstr!=null)
						{
							String [] ids=idstr.split("\\*");
							String [] counts=countstr.split("\\*");
							String [] prices=totalpricestr.split("\\*");
							//fail(request,response,String.valueOf(ids.length),"search.jsp");
							ArrayList<String> list=bill.getList();
							list.clear();
							for(int i=0;i<ids.length;i++)
							{
								Connection con;
								PreparedStatement sql;
								ResultSet rs;
								String correctpwd="";
								try {
									String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=shop" ;
									String user="sa";
									String password="296173741aa";
									con = DriverManager.getConnection(uri,user,password);
									sql = con.prepareStatement("select * from 商品 where id ="+ids[i],ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
									rs = sql.executeQuery();
									if (rs.next()) 
									{
										
										String finaltext=rs.getString(5)+"#"+rs.getString(6)+"#"+rs.getString(7)+"#"+rs.getString(1)+"#"+counts[i]+"#"+prices[i];
										list.add(finaltext);
										bill.setList(list);
										fail(request,response,"生成订单成功","getbill.jsp");
										//fail(request,response,cartext,"search.jsp");
									}
								}catch(Exception e)
								{
									fail(request,response,"数据库连接失败！","main.jsp");
								}
							}
						}
						}catch(Exception e)
						{
							fail(request,response,"咋了"+e,"search.jsp");
						}
					}
				}catch(Exception e)
				{
					fail(request,response,"啥都还没搜索呢？"+e.toString(),"search.jsp");
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
