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
								
								
								mybillBean mybill = null;
								try {
									mybill = (mybillBean)request.getSession().getAttribute("mybill");
									if (mybill == null) {
										mybill = new mybillBean(); // ����Javabean����
										HttpSession session=request.getSession();
										session.setAttribute("mybill", mybill);
									}
								} catch (Exception exp) {
									mybill = new mybillBean(); // ����Javabean����
									HttpSession session=request.getSession();
									session.setAttribute("mybill", mybill);
								}
								try {
									Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
								} catch (Exception e) {
								}
								request.setCharacterEncoding("GB18030");
								response.setCharacterEncoding("GB18030");
								//���ݿ�����λ��
								
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
									sql = con.prepareStatement("select * from ���� where �����û�='"+username+"'",ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
									rs = sql.executeQuery();
									
									ResultSetMetaData metaData = rs.getMetaData();
									int columnCount = metaData.getColumnCount(); // �õ������������
//									String[] columnName = new String[columnCount];
//									for (int i = 0; i < columnName.length; i++) {
//										columnName[i] = metaData.getColumnName(i + 1); // �õ�����
//									}
//									gBean.setColumnName(columnName); // ����Javabean����ģ��
									rs.last();
									int rowNumber = rs.getRow(); // �õ���¼��
									if(rowNumber<=0)
									{
										fail(request,response,"����û�ж����أ�","search.jsp");
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
									mybill.setBillRecord(tableRecord); // ����Javabean����ģ��
									//fail(request,response,"�ɹ�","showRecord.jsp");
									//�����Ѿ��Ѷ�����Ϣ��ȡ�����ˣ����������û���������ţ��������Ʒ��Ӧ��id�������������ܼ۸񣬹���ʱ��
									
									
									
									ArrayList<String[][]> idlist=mybill.getGoodsRecordList(); 									
									String[] ids=new String[tableRecord.length];
									for(int c=0;c<tableRecord.length;c++)
									{
										ids[c]=tableRecord[c][2];
									}
									for(int n=0;n<ids.length;n++)
									{																			
										sql = con.prepareStatement("select * from ��Ʒ where id="+ids[n],ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
										rs = sql.executeQuery();
									
										ResultSetMetaData metaData2 = rs.getMetaData();
										int columnCount2 = metaData2.getColumnCount(); // �õ������������
//										String[] columnName = new String[columnCount];
//										for (int i = 0; i < columnName.length; i++) {
//											columnName[i] = metaData.getColumnName(i + 1); // �õ�����
//										}
//										gBean.setColumnName(columnName); // ����Javabean����ģ��
										rs.last();
										int rowNumber2 = rs.getRow(); // �õ���¼��
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
										
										//mybill.setGoodsRecord(tableRecord2); // ����Javabean����ģ��
									}
									mybill.setGoodsRecordList(idlist);
									//mybill.setIsnew(isnew);
									response.sendRedirect("mybill.jsp");
									}
								}catch(Exception e)
								{
									fail(request,response,"��������"+e.toString(),"search.jsp");
								}
							}
						} catch (Exception exp) {
							fail(request,response,"ɶ�������أ�"+"e","search.jsp");
						}
						}
					}catch(Exception e)
						{
							fail(request,response,"ɶ����û�����أ�"+"e","search.jsp");
						}
			}
							}catch(Exception e){
								fail(request,response,"�㻹û�е�¼�أ�","search.jsp");
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
