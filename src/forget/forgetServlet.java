package forget;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import forget.forgetBean;;

public class forgetServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		forgetBean fBean = null;
		try {
			fBean = (forgetBean)request.getSession().getAttribute("fBean");
			if (fBean == null) {
				fBean = new forgetBean(); // ����Javabean����
				HttpSession session=request.getSession();
				session.setAttribute("fBean", fBean);
			}
		} catch (Exception exp) {
			fBean = new forgetBean(); // ����Javabean����
			HttpSession session=request.getSession();
			session.setAttribute("fBean",fBean );
		}
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (Exception e) {
		}
		request.setCharacterEncoding("GB18030");
		String name = request.getParameter("username").trim();
		String email=request.getParameter("email").trim();
		String pwd = request.getParameter("password").trim();
		String yzm=request.getParameter("checkcode").trim();
		String realyzm=(String)request.getSession().getAttribute("sRand");
		if(!yzm.equals(realyzm))
		{
			fail(request,response,"��֤�����","forgetPassword.jsp");
		}
		else if (name == null || name.length() == 0||pwd == null || pwd.length() == 0)
		{
			fail(request, response, "�û����������벻��Ϊ��","forgetPassword.jsp");
			return;
		}
		Connection con;
		PreparedStatement sql;
		ResultSet rs;
		String correctemail="";
		try {
			String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=shop" ;
			String user="sa";
			String password="296173741aa";
			con = DriverManager.getConnection(uri,user,password);
			sql = con.prepareStatement("select email from �û� where �û���='"+name+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = sql.executeQuery();
			if (rs.next()) 
			{
					correctemail=rs.getString(1);					
			}
			if(email.equals(correctemail))
			{
				sql = con.prepareStatement("update �û� set ����=? where �û���=?",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				sql.setString(1, pwd);
				sql.setString(2, name);
				int ok=sql.executeUpdate();
				if(ok>0) 
				{
					con.close();
					fail(request,response,"�����޸ĳɹ���","login.jsp");
				}
				else
				{
					con.close();
					fail(request,response,"�����޸�ʧ��!","forgetPassword.jsp");
				}
//				RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
//				dispatcher.forward(request, response);
			}
			else
			{
				fail(request, response, "�������û�����ƥ�䣡","forgetPassword.jsp");
			}
		} catch (SQLException e) {
			System.out.println(e);
			fail(request,response,"ʧ��"+e.toString(),"forgetPassword.jsp");
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
