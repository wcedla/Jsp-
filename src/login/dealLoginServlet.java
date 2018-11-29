package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.getLoginArgs;

public class dealLoginServlet extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException 
	{
		super.init(config);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		getLoginArgs loginBean = null;
		try {
			loginBean = (getLoginArgs)request.getSession().getAttribute("loginBean");
			if (loginBean == null) {
				loginBean = new getLoginArgs(); // 创建Javabean对象
				HttpSession session=request.getSession();
				session.setAttribute("loginBean", loginBean);
			}
		} catch (Exception exp) {
			loginBean = new getLoginArgs(); // 创建Javabean对象
			HttpSession session=request.getSession();
			session.setAttribute("loginBean", loginBean);
		}
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (Exception e) {
		}
		request.setCharacterEncoding("GB18030");
		String name = request.getParameter("username").trim();
		String pwd = request.getParameter("password").trim();
		if (name == null || name.length() == 0||pwd == null || pwd.length() == 0)
		{
			fail(request, response, "用户名或者密码不可为空","login.jsp");
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
			sql = con.prepareStatement("select 密码 from 用户 where 用户名='"+name+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = sql.executeQuery();
			if (rs.next()) 
			{
					correctpwd=rs.getString(1);					
			}
			if(pwd.equals(correctpwd))
			{
				loginBean.setIsLogin(1);
				loginBean.setUsername(name);
				con.close();
				response.sendRedirect("main.jsp");
//				RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
//				dispatcher.forward(request, response);
			}
			else
			{
				fail(request, response, "用户名或者密码有误，请确认后重新输入!","login.jsp");
			}
		} catch (SQLException e) {
			System.out.println(e);
			fail(request,response,"失败"+e.toString(),"login.jsp");
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
