package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;

import utils.DataSourceUtils;

public class IngredientDAO {
	public List<Object[]> getIngredientList(int pid) {
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	        String sql = "select ingredient from ingredients where id = ?";
	        return runner.query(sql,new ArrayListHandler(),pid);
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
		return null;
	}
}
