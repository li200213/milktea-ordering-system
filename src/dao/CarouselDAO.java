package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import model.Carousel;
import utils.DataSourceUtils;

public class CarouselDAO {
	public List<Carousel> getCarouselList() {
		try{
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
	        String sql = "select * from recommend";
	        return runner.query(sql, new BeanListHandler<Carousel>(Carousel.class));
		}catch(SQLException e){
	        e.printStackTrace();  
	    }
		return null;
	}
}
