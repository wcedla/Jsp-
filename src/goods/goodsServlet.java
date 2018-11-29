package goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import goods.goodsBean;

public class goodsServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		goodsBean gBean = null;
		try {
			gBean = (goodsBean)request.getSession().getAttribute("gBean");
			if (gBean == null) {
				gBean = new goodsBean(); // 创建Javabean对象
				HttpSession session=request.getSession();
				session.setAttribute("gBean", gBean);
			}
		} catch (Exception exp) {
			gBean = new goodsBean(); // 创建Javabean对象
			HttpSession session=request.getSession();
			session.setAttribute("gBean", gBean);
		}
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (Exception e) {
		}
		request.setCharacterEncoding("GB18030");
		response.setCharacterEncoding("GB18030");
		String searchtext=request.getParameter("searchtext");
		String pagestr=request.getParameter("page");		
		int page;
		if(pagestr==null)
		{
			page=1;
		}
		else
		{
			page=Integer.valueOf(pagestr);
		}
		gBean.setQueryName(searchtext);
		//fail(request,response,searchtext,"search.jsp");
		if(searchtext==null)
		{
			searchtext="~";
			String[][] tableRecord = new String[1][1] ;
			gBean.setTableRecord(tableRecord); // 更新Javabean数据模型
			response.sendRedirect(response.encodeURL("search.jsp?st="+searchtext+"&page="+String.valueOf(page)));
			//fail(request,response,searchtext,"search.jsp");
		}
		else {
		Connection con;
		PreparedStatement sql;
		ResultSet rs;
		String correctpwd="";
		try {
			String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=shop" ;
			String user="sa";
			String password="296173741aa";
			con = DriverManager.getConnection(uri,user,password);
			sql = con.prepareStatement("select * from 商品 where 名字 like'%"+searchtext+"%'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs = sql.executeQuery();
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount(); // 得到结果集的列数
			String[] columnName = new String[columnCount];
			for (int i = 0; i < columnName.length; i++) {
				columnName[i] = metaData.getColumnName(i + 1); // 得到列名
			}
			gBean.setColumnName(columnName); // 更新Javabean数据模型
			rs.last();
			int rowNumber = rs.getRow(); // 得到记录数
			String[][] tableRecord = gBean.getTableRecord();
			tableRecord = new String[rowNumber][columnCount];
			rs.beforeFirst();
			int i = 0;
			while (rs.next()) {
				for (int k = 0; k < columnCount; k++)
					tableRecord[i][k] = rs.getString(k + 1);
				i++;
			}
			gBean.setTableRecord(tableRecord); // 更新Javabean数据模型
			response.sendRedirect("search.jsp?st="+URLEncoder.encode(searchtext,"utf-8")+"&page="+String.valueOf(page));
			//response.sendRedirect("showRecord.jsp");
			//fail(request,response,gBean.getTableRecord()[0][1],"search.jsp");
//				RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
//				dispatcher.forward(request, response);
		} catch (SQLException e) {
			System.out.println(e);
			fail(request,response,"失败"+e.toString(),"search.jsp");
		}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGet(request, response);
	}
	public void fail(HttpServletRequest request, HttpServletResponse response, String backNews,String url) {
		response.setCharacterEncoding("GB18030");
		try {
			PrintWriter out = response.getWriter();
			out.println("<script language='javascript' charset='GB18030'>");
			out.println("alert('"+backNews+"');");
			out.println("window.location.href='/shop/"+url+"';");
			out.println("</script>");
		} catch (IOException exp) {
		}
	}	

}
