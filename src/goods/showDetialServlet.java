package goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class showDetialServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		showdetialBean detialBean = null;
		try {
			detialBean = (showdetialBean)request.getSession().getAttribute("detialBean");
			if (detialBean == null) {
				detialBean = new showdetialBean(); // 创建Javabean对象
				HttpSession session=request.getSession();
				session.setAttribute("detialBean", detialBean);
			}
		} catch (Exception exp) {
			detialBean = new showdetialBean(); // 创建Javabean对象
			HttpSession session=request.getSession();
			session.setAttribute("detialBean", detialBean);
		}
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		String idstr=request.getParameter("id");
		int id=0;
		if(idstr==null)
		{
			idstr="";
			fail(request,response,"打开详情页面失败！",response.encodeURL(request.getHeader("REFERER")));
		}
		else
		{
			try 
			{
				id=Integer.valueOf(idstr);
			}catch(Exception e)
			{
				fail(request,response,"打开详情页面失败！",response.encodeURL(request.getHeader("REFERER")));
			}
			
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			} catch (Exception e) {
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
				sql = con.prepareStatement("select * from 商品 where id="+String.valueOf(id),ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
				rs = sql.executeQuery();
				ResultSetMetaData metaData = rs.getMetaData();
				int columnCount = metaData.getColumnCount(); // 得到结果集的列数
				String[] columnName = new String[columnCount];
				for (int i = 0; i < columnName.length; i++) {
					columnName[i] = metaData.getColumnName(i + 1); // 得到列名
				}
				//detialBean.setColumnName(columnName); // 更新Javabean数据模型
				rs.last();
				int rowNumber = rs.getRow(); // 得到记录数
				String[][] tableRecord = detialBean.getTableRecord();
				tableRecord = new String[rowNumber][columnCount];
				rs.beforeFirst();
				int i = 0;
				while (rs.next()) {
					for (int k = 0; k < columnCount; k++)
						tableRecord[i][k] = rs.getString(k + 1);
					i++;
				}
				detialBean.setTableRecord(tableRecord); // 更新Javabean数据模型
				response.sendRedirect("detial.jsp?id="+String.valueOf(id));
			}catch(Exception e)
			{
				fail(request,response,"失败"+e.toString(),"search.jsp");
			}
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
