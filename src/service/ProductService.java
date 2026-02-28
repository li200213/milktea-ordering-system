package service;

import java.util.ArrayList;
import java.util.List;

import dao.CarouselDAO;
import dao.CartDAO;
import dao.IngredientDAO;
import dao.ProductDAO;
import dao.ProductTypeDAO;
import dao.TemperatureDAO;
import model.Beverage;
import model.BeverageType;
import model.Carousel;
import model.Cart;
import model.Item;


public class ProductService {
	private ProductDAO pdao = new ProductDAO();
	private CartDAO cart_dao = new CartDAO();
	private ProductTypeDAO tdao = new ProductTypeDAO();
	private CarouselDAO carousel_dao = new CarouselDAO();
	private IngredientDAO idao = new IngredientDAO();
	private TemperatureDAO tem_dao = new TemperatureDAO();
	public Beverage getProductById(int id) {
		return pdao.fingById(id);
	}
	public void addItem(int uid,int pid,int count,String spec){
		Item item = cart_dao.findItemByUidAndPid(uid, pid);
	    if(item == null){ //如果用户的购物车中不存在这个商品
	    	cart_dao.addItem(uid, pid,count,spec);
	    }else {//如果购物车中存在这个商品，只需要数量+1即可
	    	cart_dao.updateItemCount(uid, pid, item.getAmount()+count); 
	    }
	}
	
	public void deleteItem(int uid,int pid){
		cart_dao.deleteItem(uid, pid);
	}
	
	public void updateItemCount(int uid,int pid,int count){
		cart_dao.updateItemCount(uid, pid, count);
	}
	
	public List<Item> getItemsByUidAndPids(int uid,int[] pids){
		List<Item> items = new ArrayList<>();
		for(int pid : pids) {
			items.add(cart_dao.findItemByUidAndPid(uid, pid));
		}
		return items;
	}
	public Cart getCart(int uid){
		Cart cart = null;
		List<Item> list = cart_dao.getCart(uid);
		if(list.size()!=0) {
			cart = new Cart();
			cart.setItem_list(list);
		}
		return cart;
	}
	
	public void deleteCart(int uid) {
		cart_dao.deleteCart(uid);
	}
	
	public List<BeverageType> getProductTypeList(){
		return tdao.getTypeList();
	}
	
	public List<Carousel> getCarouselList(){
		return carousel_dao.getCarouselList();
	}
	public List<String> getIngredientList(int pid){
		List<Object[]> list = idao.getIngredientList(pid);
		List<String> ingredient_list = new ArrayList<>();
		for(int i = 0;i < list.size();i++) {
			ingredient_list.add((String) list.get(i)[0]);
		}
		return ingredient_list;
	}
	public List<String> getTemperatureList(int pid){
		List<Object[]> list = tem_dao.getTemperatureList(pid);
		List<String> temperature_list = new ArrayList<>();
		for(int i = 0;i < list.size();i++) {
			temperature_list.add((String) list.get(i)[0]);
		}
		return temperature_list;
	}
}
