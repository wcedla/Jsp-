package goods;

import java.util.ArrayList;

public class mybillBean {
	
	String [][] billRecord=null; 
	ArrayList<String[][]> goodsRecordList=null;
	int isnew;
	
	public mybillBean()
	{
		   billRecord = new String[1][1];
		   goodsRecordList = new ArrayList<String[][]>();
	}

	public String[][] getBillRecord() {
		return billRecord;
	}

	public void setBillRecord(String[][] billRecord) {
		this.billRecord = billRecord;
	}

	public ArrayList<String[][]> getGoodsRecordList() {
		return goodsRecordList;
	}

	public void setGoodsRecordList(ArrayList<String[][]> goodsRecordList) {
		this.goodsRecordList = goodsRecordList;
	}

	public int getIsnew() {
		return isnew;
	}

	public void setIsnew(int isnew) {
		this.isnew = isnew;
	}

}
