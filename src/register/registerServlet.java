package register;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import register.registerBean;

public class registerServlet extends HttpServlet {

	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		registerBean regBean = null;
		try {
			regBean = (registerBean)request.getSession().getAttribute("regBean");
			if (regBean == null) {
				regBean = new registerBean(); // ����Javabean����
				HttpSession session=request.getSession();
				session.setAttribute("loginBean", regBean);
			}
		} catch (Exception exp) {
			regBean = new registerBean(); // ����Javabean����
			HttpSession session=request.getSession();
			session.setAttribute("loginBean", regBean);
		}
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (Exception e) {
		}
		request.setCharacterEncoding("GB18030");
		String name = request.getParameter("username").trim();
		String pwd = request.getParameter("password").trim();
		String email= request.getParameter("email").trim();
		String yzm=request.getParameter("checkcode").trim();
		String realyzm=(String)request.getSession().getAttribute("sRand");
		//regBean.setYzm(realyzm);
		if(!yzm.equals(realyzm))
		{
			fail(request,response,"��֤�����","register.jsp");
		}
		else
		if (name == null || name.length() == 0||pwd == null || pwd.length() == 0||email == null || email.length() == 0)
		{
			fail(request, response, "��Ϣ��ȡ����������ע��","register.jsp");
			return;
		}
		Connection con;
		PreparedStatement sql;
		ResultSet rs;
		String correctpwd="";
		try {
			String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=shop" ;
			String user="sa";
			String password="296173741aa";
			con = DriverManager.getConnection(uri,user,password);
			sql = con.prepareStatement("select * from �û� where �û���='"+name+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = sql.executeQuery();
			if (rs.next()) 
			{
				fail(request,response,"���û����ѱ�ע�ᣡ","register.jsp");					
			}
			else {
				sql = con.prepareStatement("insert �û� values(?,?,?)",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				sql.setString(1, name);
				sql.setString(2, pwd);
				sql.setString(3, email);
				int ok=sql.executeUpdate();
				if(ok>0) 
				{
					con.close();
					fail(request,response,"��ϲ�㣬ע��ɹ�!���ȷ�ϰ�ť��ת��¼����","login.jsp");
				}
				else
				{
					con.close();
					fail(request,response,"ע��ʧ��!","register.jsp");
				}
			}
//			sql = con.prepareStatement("select ���� from �û� where �û���='"+name+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
//			rs = sql.executeQuery();
//			if (rs.next()) 
//			{
//					correctpwd=rs.getString(1);					
//			}
//			if(pwd.equals(correctpwd))
//			{
//				regBean.setIsLogin(1);
//				regBean.setUsername(name);
//				con.close();
//				response.sendRedirect("main.jsp");
////				RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
////				dispatcher.forward(request, response);
//			}
//			else
//			{
//				response.setCharacterEncoding("gb2312");
//				PrintWriter out = response.getWriter();
//				out.print("<script >alert(\"�û�����������������ȷ�Ϻ��������룡\");" + "window.location.href=\"/shop/login.jsp\";</script>");
//			}
		} catch (SQLException e) {
			System.out.println(e);
			fail(request,response,"ʧ��"+e.toString(),"register.jsp");
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
			out.println("window.location.href='/shop/"+url+"';");
			out.println("</script>");
		} catch (IOException exp) {
		}
	}	

}
