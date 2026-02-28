package service;

import java.util.List;

import dao.ProductDAO;
import model.Beverage;
import model.Page;

public class PageService {
	public Page getPage(String _currentPage,String _rows) {
		int currentPage = Integer.parseInt(_currentPage);
		int rows = Integer.parseInt(_rows);
		
		//1. 调用ProductDAO查询获取总数据数，并计算总页码数，获取分页列表
		ProductDAO pd = new ProductDAO();
		long totalCount = pd.getTotalCount();
		long totalPage = totalCount % rows == 0 ? totalCount / rows : totalCount / rows + 1;
	    List<Beverage> beverage_list = pd.find(currentPage, rows);
	    
		//2. 将分页数据封装到pb对象中
	    Page pb =  new Page();
	    pb.setCurrentPage(currentPage);
	    pb.setRows(rows);   
	    pb.setTotalCount(totalCount);	   
	    pb.setTotalPage(totalPage);  
	    pb.setBeverage_list(beverage_list);
	    
	    return pb;
	}
	public Page getPageByProductType(String _currentPage,String _type_id,String _rows) {
		int currentPage = Integer.parseInt(_currentPage);
		int type_id = Integer.parseInt(_type_id);
		int rows = Integer.parseInt(_rows);
		
		//1. 调用ProductDAO查询获取总数据数，并计算总页码数，获取分页列表
		ProductDAO pd = new ProductDAO();
		long totalCount = pd.getTotalCountByProductType(type_id);
		long totalPage = totalCount % rows == 0 ? totalCount / rows : totalCount / rows + 1;
	    List<Beverage> beverage_list = pd.findByTypeId(currentPage, rows , type_id);
	    
		//2. 将分页数据封装到pb对象中
	    Page pb =  new Page();
	    pb.setCurrentPage(currentPage);
	    pb.setRows(rows);   
	    pb.setTotalCount(totalCount);	   
	    pb.setTotalPage(totalPage);  
	    pb.setBeverage_list(beverage_list);
	    
	    return pb;
	}
	
	public Page getPageByKeyword(String keyword,String _currentPage,String _rows) {
		int currentPage = Integer.parseInt(_currentPage);
		int rows = Integer.parseInt(_rows);
		
		//1. 调用ProductDAO查询获取总数据数，并计算总页码数，获取分页列表
		ProductDAO pd = new ProductDAO();
		long totalCount = pd.getTotalCountByKeyword(keyword);
		long totalPage = totalCount % rows == 0 ? totalCount / rows : totalCount / rows + 1;
	    List<Beverage> beverage_list = pd.findByKeyword(currentPage, rows , keyword);
		//2. 将分页数据封装到pb对象中
	    Page pb = null;
	    if(beverage_list.size()!=0) {
	    	pb = new Page();
	    	pb.setCurrentPage(currentPage);
			pb.setRows(rows);   
			pb.setTotalCount(totalCount);	   
			pb.setTotalPage(totalPage);  
			pb.setBeverage_list(beverage_list);
	    }    
		return pb;
	}
}
