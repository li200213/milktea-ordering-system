package model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class Order {
	private int id;
	private String order_time;
	private String state;
	private double total;
	private List<Item> item_list = new ArrayList<>();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(LocalDateTime order_time) {
		this.order_time = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(order_time);
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public List<Item> getItem_list() {
		return item_list;
	}
	public void setItem_list(List<Item> item_list) {
		this.item_list = item_list;
	}
}
