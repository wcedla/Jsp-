package goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.getLoginArgs;

public class mybillServlet extends HttpServlet {

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
								
								
								mybillBean mybill = null;
								try {
									mybill = (mybillBean)request.getSession().getAttribute("mybill");
									if (mybill == null) {
										mybill = new mybillBean(); // 创建Javabean对象
										HttpSession session=request.getSession();
										session.setAttribute("mybill", mybill);
									}
								} catch (Exception exp) {
									mybill = new mybillBean(); // 创建Javabean对象
									HttpSession session=request.getSession();
									session.setAttribute("mybill", mybill);
								}
								try {
									Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
								} catch (Exception e) {
								}
								request.setCharacterEncoding("GB18030");
								response.setCharacterEncoding("GB18030");
								//数据库连接位置
								
								Connection con;
								PreparedStatement sql;
								ResultSet rs;
								//int isnew=0;
								String username=loginBean.getUsername();
								try {
									
									String uri = "jdbc:sqlserver://localhost:1433;DatabaseName=shop" ;
									String user="sa";
									String password="296173741aa";
									con = DriverManager.getConnection(uri,user,password);
									sql = con.prepareStatement("select * from 订单 where 购买用户='"+username+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
									rs = sql.executeQuery();
									
									ResultSetMetaData metaData = rs.getMetaData();
									int columnCount = metaData.getColumnCount(); // 得到结果集的列数
//									String[] columnName = new String[columnCount];
//									for (int i = 0; i < columnName.length; i++) {
//										columnName[i] = metaData.getColumnName(i + 1); // 得到列名
//									}
//									gBean.setColumnName(columnName); // 更新Javabean数据模型
									rs.last();
									int rowNumber = rs.getRow(); // 得到记录数
									if(rowNumber<=0)
									{
										fail(request,response,"你买没有订单呢！","search.jsp");
									}else
									{
									String[][] tableRecord = mybill.getBillRecord();
									tableRecord = new String[rowNumber][columnCount];
									rs.beforeFirst();
									int i = 0;
									while (rs.next()) {
										for (int k = 0; k < columnCount; k++)
											tableRecord[i][k] = rs.getString(k + 1);
										i++;
									}
//									if(mybill.getBillRecord().length==tableRecord.length)
//									{
//										isnew=0;
//										for(int p=0;p<mybill.getBillRecord().length;p++)
//										{
//											if(mybill.getBillRecord()[p].length>6)
//											{
//												if(mybill.getBillRecord()[p][6]!=tableRecord[p][6])
//												{
//													isnew=0;
//												}
//											}
//											
//										}
//									}									
									mybill.setBillRecord(tableRecord); // 更新Javabean数据模型
									//fail(request,response,"成功","showRecord.jsp");
									//上面已经把订单信息读取出来了，包括购买用户，订单编号，购买的商品对应的id，购买数量，总价格，购买时间
									
									
									
									ArrayList<String[][]> idlist=mybill.getGoodsRecordList(); 									
									String[] ids=new String[tableRecord.length];
									for(int c=0;c<tableRecord.length;c++)
									{
										ids[c]=tableRecord[c][2];
									}
									for(int n=0;n<ids.length;n++)
									{																			
										sql = con.prepareStatement("select * from 商品 where id="+ids[n],ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
										rs = sql.executeQuery();
									
										ResultSetMetaData metaData2 = rs.getMetaData();
										int columnCount2 = metaData2.getColumnCount(); // 得到结果集的列数
//										String[] columnName = new String[columnCount];
//										for (int i = 0; i < columnName.length; i++) {
//											columnName[i] = metaData.getColumnName(i + 1); // 得到列名
//										}
//										gBean.setColumnName(columnName); // 更新Javabean数据模型
										rs.last();
										int rowNumber2 = rs.getRow(); // 得到记录数
										String[][] tableRecord2 = new String[1][1];
										tableRecord2 = new String[rowNumber2][columnCount2];
										rs.beforeFirst();
										int t = 0;
										while (rs.next()) {
											for (int y = 0; y < columnCount2; y++)
												tableRecord2[t][y] = rs.getString(y + 1);
											t++;
										}
										idlist.add(tableRecord2);
										
										//mybill.setGoodsRecord(tableRecord2); // 更新Javabean数据模型
									}
									mybill.setGoodsRecordList(idlist);
									//mybill.setIsnew(isnew);
									response.sendRedirect("mybill.jsp");
									}
								}catch(Exception e)
								{
									fail(request,response,"参数错误"+e.toString(),"search.jsp");
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
