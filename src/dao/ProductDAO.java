package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import model.Beverage;
import utils.DataSourceUtils;

public class ProductDAO {
	//返回全部商品的商品总数
	public long getTotalCount() {
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = " select count(*) from goods";
	    	return (long) runner.query(sql,new ScalarHandler());
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
		return 0;
	}
	//根据商品品类返回商品总数
	public long getTotalCountByProductType(int type_id) {
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	        String sql = " select count(*) from type where type_id = ?";
	        return (long) runner.query(sql, new ScalarHandler(),type_id);
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
		return 0;
	}
	
		//根据关键字返回商品总数
		public long getTotalCountByKeyword(String keyword) {
			try{
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				String s = "%"+keyword+"%";
				String sql = "select count(*) from goods where name like ? ";
		        return (long) runner.query(sql, new ScalarHandler(),s);
			}catch(SQLException e){
		        e.printStackTrace();  
		    }
			return 0;
		}
		
		//根据当前页号获取相应的cake_list
		public List<Beverage> find(int currentPage,int rows){
			try{
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				String sql = "select * from goods limit ?,?";
		        return runner.query(sql,new BeanListHandler<Beverage>(Beverage.class),new Object[] {(currentPage-1)*rows,rows});
			}catch(SQLException e){
	            e.printStackTrace();  
	        }
			return null;
		}
		//根据蛋糕的类别和当前页号获取相应的cake_list
		public List<Beverage> findByTypeId(int currentPage,int rows,int type_id){
			try{
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				String sql = "select g.* from goods g,type t where t.type_id = ? and t.id = g.id limit ?,?";
		        return runner.query(sql,new BeanListHandler<Beverage>(Beverage.class),new Object[] {type_id,(currentPage-1)*rows,rows});
			}catch(SQLException e){
	            e.printStackTrace();  
	        }
			return null;
		}
	
		//根据关键字和当前页号获取相应的cake_list
		public List<Beverage> findByKeyword(int currentPage,int rows,String keyword){
			try{
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				String s = "%"+keyword+"%";
				String sql = "select * from goods where name like ? limit ?,?";
		        return runner.query(sql,new BeanListHandler<Beverage>(Beverage.class),new Object[] {s,(currentPage-1)*rows,rows});
			}catch(SQLException e){
	            e.printStackTrace();  
	        }
			return null;
		}
		
		//根据id查找指定的Cake
		public Beverage fingById(int id) {
			try{
				QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
				String sql = "select * from goods where id=?";
				return runner.query(sql,new BeanHandler<Beverage>(Beverage.class),id);
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
}
