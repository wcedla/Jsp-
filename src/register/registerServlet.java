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
				regBean = new registerBean(); // 创建Javabean对象
				HttpSession session=request.getSession();
				session.setAttribute("loginBean", regBean);
			}
		} catch (Exception exp) {
			regBean = new registerBean(); // 创建Javabean对象
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
			fail(request,response,"验证码错误！","register.jsp");
		}
		else
		if (name == null || name.length() == 0||pwd == null || pwd.length() == 0||email == null || email.length() == 0)
		{
			fail(request, response, "信息获取有误，请重新注册","register.jsp");
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
			sql = con.prepareStatement("select * from 用户 where 用户名='"+name+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = sql.executeQuery();
			if (rs.next()) 
			{
				fail(request,response,"该用户名已被注册！","register.jsp");					
			}
			else {
				sql = con.prepareStatement("insert 用户 values(?,?,?)",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				sql.setString(1, name);
				sql.setString(2, pwd);
				sql.setString(3, email);
				int ok=sql.executeUpdate();
				if(ok>0) 
				{
					con.close();
					fail(request,response,"恭喜你，注册成功!点击确认按钮跳转登录界面","login.jsp");
				}
				else
				{
					con.close();
					fail(request,response,"注册失败!","register.jsp");
				}
			}
//			sql = con.prepareStatement("select 密码 from 用户 where 用户名='"+name+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
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
//				out.print("<script >alert(\"用户名或者密码有误，请确认后重新输入！\");" + "window.location.href=\"/shop/login.jsp\";</script>");
//			}
		} catch (SQLException e) {
			System.out.println(e);
			fail(request,response,"失败"+e.toString(),"register.jsp");
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
