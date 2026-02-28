package model;

import java.util.List;

public class Page {
		private int rows; //每页的条数
	    private long totalCount;  //总的记录数
	    private long totalPage;   //总的页码
	    private List<Beverage> beverage_list;    //每页的数据
	    private int currentPage; //当前页

	    public long getTotalCount() {
	        return totalCount;
	    }

	    public void setTotalCount(long totalCount) {
	        this.totalCount = totalCount;
	    }

	    public long getTotalPage() {
	        return totalPage;
	    }

	    public void setTotalPage(long totalPage) {
	        this.totalPage = totalPage;
	    }
		public List<Beverage> getBeverage_list() {
			return beverage_list;
		}

		public void setBeverage_list(List<Beverage> beverage_list) {
			this.beverage_list = beverage_list;
		}

		public int getCurrentPage() {
	        return currentPage;
	    }

	    public void setCurrentPage(int currentPage) {
	        this.currentPage = currentPage;
	    }

		public int getRows() {
			return rows;
		}

		public void setRows(int rows) {
			this.rows = rows;
		}
	    
}
