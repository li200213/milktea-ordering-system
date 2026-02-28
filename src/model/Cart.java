package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Item> item_list = new ArrayList<>();
	
	public List<Item> getItem_list() {
		return item_list;
	}
	public void setItem_list(List<Item> item_list) {
		this.item_list = item_list;
	}
}
