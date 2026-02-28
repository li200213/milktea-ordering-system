package dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import utils.DataSourceUtils;

public class OrderDAO {
	public int addOrder(int uid,double total,String pay_way,Timestamp order_time) {
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "insert into orders(user_id,total,pay_way,datetime) values(?,?,?,?)";
			//如果需要返回插入的该条数据的主键，就用insert方法
			return Integer.parseInt(runner.insert(sql,new ScalarHandler<>(), new Object[] {uid,total,pay_way,order_time}).toString());
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
		return 0;
	}
	
	public List<Object[]> getOrdersByUid(int uid) {
		try {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select id,datetime,state,total from orders where user_id = ?";
			return runner.query(sql,new ArrayListHandler(),uid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
