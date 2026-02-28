package dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import model.Item;
import utils.DataSourceUtils;

public class CartDAO {
	public void addItem(int uid,int pid,int count,String spec) {	
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "insert into cart(user_id,goods_id,amount,spec) values(?,?,?,?)";
			runner.update(sql,new Object[] {uid,pid,count,spec});
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
	}
	public void deleteItem(int uid,int pid) {
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "delete from cart where user_id=? and goods_id=?";
			runner.update(sql,new Object[] {uid,pid});
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
	}

	public void updateItemCount(int uid,int pid,int count) {
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "update cart set amount = ? where user_id = ? and goods_id = ?";
			runner.update(sql,new Object[] {count,uid,pid});
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
	}
	public void updateItemOidAndJoinorder(int uid,int pids[],int oid) {
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "update cart set joinorder = 1,order_id = ? where user_id = ? and goods_id = ?";
			Object[][] params = new Object[pids.length][3];
			for(int i = 0;i < pids.length;i++) {
				params[i][0] = oid;
				params[i][1] = uid;
				params[i][2] = pids[i];
			}
			runner.batch(sql, params);
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
	}
	public Item findItemByUidAndPid(int uid,int pid) {
		try {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select c.goods_id,g.name,g.price,c.amount,c.spec,g.image from cart c,goods g where c.goods_id=g.id and c.user_id=? and c.goods_id=?";
			return runner.query(sql, new BeanHandler<Item>(Item.class),new Object[] {uid,pid});
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<Item> getItemByOid(int oid){
		try {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select c.goods_id,g.name,g.price,c.amount,c.spec,g.image from cart c,goods g where c.goods_id=g.id and c.order_id=?";
			return runner.query(sql, new BeanListHandler<Item>(Item.class),oid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<Item> getCart(int uid){
		try {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select c.goods_id,g.name,g.price,c.spec,c.amount,g.image from cart c,goods g where c.goods_id=g.id and c.joinorder=0 and c.user_id=?";
			return runner.query(sql, new BeanListHandler<Item>(Item.class),uid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public void deleteCart(int uid) {
		try {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "delete from cart where user_id = ?";
			runner.update(sql, uid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
