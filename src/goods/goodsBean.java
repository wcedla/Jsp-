package goods;

import java.util.ArrayList;

public class goodsBean 
{
		ArrayList<String> List = new ArrayList<String>(); 
		public ArrayList<String> getList() {
			return List;
		}
		public void setList(ArrayList<String> list) {
			List = list;
		}
		String queryName ;   
		String []columnName ;  //�������
		String [][] tableRecord=null;   //��Ų�ѯ���ļ�¼
	   int pageSize=1;                      //ÿҳ��ʾ�ļ�¼��
	   int totalPages=1;                     //��ҳ�����ҳ��
	   int currentPage =1   ;                 //��ǰ��ʾҳ 
	   public goodsBean() {
	      tableRecord = new String[1][1];
	      queryName =""; 
	      columnName = new String[1]; 
	   }
	   public String getQueryName() 
	   {
		   return queryName;
	   }
	   public void setQueryName(String queryName) 
	   {
		   this.queryName = queryName;
	   }
	   public String[] getColumnName() {
			return columnName;
		}
		public void setColumnName(String[] columnName) {
			this.columnName = columnName;
		}
	   public void setTableRecord(String [][] s)
	   {
	      tableRecord=s;
	   }
	   public String [][] getTableRecord(){
		   return tableRecord;
	   }
	   public int getPageSize() {
		   return pageSize;
	   }
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getColumnNameIndex(String name)
	{
		if(this.columnName[0]==null||this.columnName==null||this.columnName[0]=="")
		{
			return -1;
		}
		else
		{
			int index=-1;
			for(int i=0;i<columnName.length;i++)
			{
				if(columnName[i].equals(name))
				{
					index=i;
				}
			}
			return index;
		}
	}
	   
}
