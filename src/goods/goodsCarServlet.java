package goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.getLoginArgs;
import goods.goodsBean;

public class goodsCarServlet extends HttpServlet {

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
						fail(request,response,"ɶ����û�����أ�","search.jsp");
					}
					else
					{
						request.setCharacterEncoding("GB18030");
						response.setCharacterEncoding("GB18030");
						String idstr = request.getParameter("id");
						int id=-1;
						if(idstr==null)
						{ 
							idstr="";
							fail(request,response,"���빺�ﳵʧ��!",response.encodeURL(request.getHeader("REFERER")));
						}
						else
						{
							try 
							{
								id=Integer.valueOf(idstr);
							}catch(Exception e)
							{
								fail(request,response,"���빺�ﳵʧ��!",response.encodeURL(request.getHeader("REFERER")));
							}
							
							try {
								Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							} catch (Exception e) {
							}
							Connection con;
							PreparedStatement sql;
							ResultSet rs;
							try {
								String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=shop" ;
								String user="sa";
								String password="296173741aa";
								con = DriverManager.getConnection(uri,user,password);
								sql = con.prepareStatement("select * from ��Ʒ where id="+String.valueOf(id)+"",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
								rs = sql.executeQuery();
								if (rs.next()) 
								{
									ArrayList<String> list=gBean.getList();
									String cartext=rs.getString(5)+"#"+rs.getString(6)+"#"+rs.getString(7)+"#"+rs.getString(1)+"#"+rs.getString(8);
									if(list.indexOf(cartext)>-1)
									{
										fail(request,response,"����Ʒ�Ѿ��ٹ��ﳵ�ˣ�",response.encodeURL(request.getHeader("REFERER")));
									}else
									{
										list.add(cartext);
										gBean.setList(list);
										fail(request,response,"���빺�ﳵ�ɹ�",response.encodeURL(request.getHeader("REFERER")));
									}
									//fail(request,response,cartext,"search.jsp");
								}
							
							} catch (SQLException e) {
								System.out.println(e);
								fail(request,response,"ʧ��"+e.toString(),"login.jsp");
							}
						}
						
					}
				} catch (Exception exp) {
					fail(request,response,"ɶ����û�����أ�","search.jsp");
				}
				
			}
		} catch (Exception exp) {
			fail(request,response,"�㻹û�е�¼�أ�","login.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
