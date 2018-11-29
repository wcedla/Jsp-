package goods;

import java.util.ArrayList;

public class billBean {
	ArrayList<String> list;
	String price;
	String billid;
	public billBean()
	{
		list=new ArrayList<String>();
	}
	public ArrayList<String> getList() {
		return list;
	}
	public void setList(ArrayList<String> list) {
		this.list = list;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBillid() {
		return billid;
	}
	public void setBillid(String billid) {
		this.billid = billid;
	}
	
	

}
