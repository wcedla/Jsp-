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

public class showBillServlet extends HttpServlet {

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
								try {
									Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
								} catch (Exception e) {
								}
								request.setCharacterEncoding("GB18030");
								response.setCharacterEncoding("GB18030");
								try {
								String idstr=request.getParameter("id");
								String countstr=request.getParameter("sl");
								String totalpricestr=request.getParameter("price");
								String sjstr=request.getParameter("sj");
								if(idstr!=null)
								{
									if(idstr!=null)
									{
										String username=loginBean.getUsername();
										String [] ids=idstr.split("\\*");
										String [] counts=countstr.split("\\*");
										String [] prices=totalpricestr.split("\\*");
										String [] sjs=sjstr.split("\\*");
										String sj=sjs[0]+"-"+sjs[1]+"-"+sjs[2]+" "+sjs[3]+":"+sjs[4]+":"+sjs[5];
										String billid=sjs[0]+sjs[1]+sjs[2]+sjs[3]+sjs[4]+sjs[5];
										//fail(request,response,sj,"getbill.jsp");
										Connection con;
										PreparedStatement sql;
										ResultSet rs;
										int price=0;
										try {
											String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=shop" ;
											String user="sa";
											String password="296173741aa";
											con = DriverManager.getConnection(uri,user,password);
											for(int i=0;i<ids.length;i++)
											{
											price+=	Integer.valueOf(prices[i]);
											sql = con.prepareStatement("insert 订单 values(?,?,?,?,?,?,?)",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
											sql.setString(1, username);
											sql.setString(2, billid);
											sql.setString(3, ids[i]);
											sql.setString(4, counts[i]);
											sql.setString(5, prices[i]);
											sql.setString(6, sj);
											sql.setString(7, "0");
											int ok=sql.executeUpdate();
											if(ok>0) 
											{
												if(i==ids.length-1)
												{
													con.close();
													bill.setPrice(String.valueOf(price));
													//这边再来个订单编号
													bill.setBillid(billid);
													fail(request,response,"下单成功！","buyok.jsp");
												}
											}
											else
											{
												con.close();
												fail(request,response,"购买失败！","register.jsp");
											}
											}
								}catch(Exception e)
										{
									fail(request,response,"数据库连接失败！","getbill.jsp");
										}
									}
										}
										
								}catch(Exception e)
								{
									fail(request,response,"参数错误","search.jsp");
								}
							}
						} catch (Exception exp) {
							fail(request,response,"啥都还买呢？"+"e","search.jsp");
						}
						}
					}catch(Exception e)
						{
							fail(request,response,"啥都还没搜索呢？"+"e","search.jsp");
						}
			}
							}catch(Exception e){
								fail(request,response,"你还没有登录呢！","search.jsp");
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
