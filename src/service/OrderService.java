package service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dao.CartDAO;
import dao.OrderDAO;
import model.Item;
import model.Order;

public class OrderService {
	private OrderDAO odao = new OrderDAO();
	private CartDAO cdao = new CartDAO();
	public void submitOrder(int uid,int[] pids,double total,String pay_way,Timestamp order_time) {
		int oid = odao.addOrder(uid,total,pay_way,order_time);
		cdao.updateItemOidAndJoinorder(uid, pids, oid);
	}
	public List<Order> getOrderList(int uid) {
		List<Order> order_list = new ArrayList<>();
		List<Object[]> list = odao.getOrdersByUid(uid);
		for(int i = 0;i < list.size();i++) {
			Order order = new Order();
			order.setId((int)list.get(i)[0]);
			order.setOrder_time((LocalDateTime)list.get(i)[1]);
			order.setState((String) list.get(i)[2]);
			order.setTotal((double)list.get(i)[3]);
			List<Item> item_list = cdao.getItemByOid((int)list.get(i)[0]);
			order.setItem_list(item_list);
			order_list.add(order);
		}
		return order_list;
	}
}
