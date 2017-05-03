package cn.com.loan.vo;

import java.util.List;

public class DataGridVO<T extends Object> {
	private int total;
	private List<T> rows;
	
	public DataGridVO(){
		
	}
	
	public DataGridVO(int _total,List<T> _rows){
		total = _total;
		rows = _rows;
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
	
}
