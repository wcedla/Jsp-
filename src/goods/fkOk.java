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
				fail(request,response,"�㻹û�е�¼�أ�","login.jsp");
			}else
			{
				goodsBean gBean = null;
				try {
					gBean = (goodsBean)request.getSession().getAttribute("gBean");
					if (gBean == null) {
						fail(request,response,"ɶ����û�����أ�"+"e","search.jsp");
					}else
					{
						billBean bill = null;
						try {
							bill = (billBean)request.getSession().getAttribute("bill");
							if (bill == null) {
								fail(request,response,"ɶ�������أ�"+"e","search.jsp");
							}
							else
							{
								fkokBean okBean = null;
								try {
									okBean = (fkokBean)request.getSession().getAttribute("bill");
									if (okBean == null) {
										okBean = new fkokBean(); // ����Javabean����
										HttpSession session=request.getSession();
										session.setAttribute("okBean", okBean);
									}
								} catch (Exception exp) {
									okBean = new fkokBean(); // ����Javabean����
									HttpSession session=request.getSession();
									session.setAttribute("okBean", okBean);
								}
								//okBean.setOk(1);
								String billid=request.getParameter("id");
								if(billid==null)
								{
									fail(request,response,"����ʧ�ܣ�","main.jsp");
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
											sql = con.prepareStatement("update ���� set ֧�����='1' where ������="+billid,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
											int ok=sql.executeUpdate();
											if(ok>0) 
											{
												fail(request,response,"����ɹ�����Ʒ����ɹ���","mybillServlet");
											}
											else
											{
												fail(request,response,"����ʧ�ܣ�","main.jsp");
											}
									}catch(Exception e)
									{
										fail(request,response,"���ݿ�����ʧ��!","search.jsp");
									}
								}
								
							}
						}catch(Exception e)
						{
							fail(request,response,"ɶ�������أ�"+"e","search.jsp");
						}
					}
				}catch(Exception e)
				{
					fail(request,response,"ɶ����û�����أ�"+"e","search.jsp");
				}
			}
		}catch(Exception e)
		{
			fail(request,response,"�㻹û�е�¼�أ�","login.jsp");
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
