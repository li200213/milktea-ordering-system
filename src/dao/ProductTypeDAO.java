package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import model.BeverageType;
import utils.DataSourceUtils;

public class ProductTypeDAO {
	public List<BeverageType> getTypeList() {
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	        String sql = "select * from type_item";
	        return runner.query(sql, new BeanListHandler<BeverageType>(BeverageType.class));
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
		return null;
	}
}
