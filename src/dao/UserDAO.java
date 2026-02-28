package dao;

import java.sql.SQLException;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.DataSourceUtils;
import model.User;

public class UserDAO {
	//添加用户的操作
	public boolean addUser(User user){
		try {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "insert into user(username,password) values(?,?)";
			int row = runner.update(sql,new Object[] {user.getUsername(),user.getPassword()});
			if(row > 0)
				return true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//查询该账号是否已存在
	public boolean isUsernameExist(String username){
		try {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select * from user where username=?";
			User user = runner.query(sql, new BeanHandler<User>(User.class),username);
			if(user != null)
				return true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//根据账号和密码查找用户
	public User findUserByUsernameAndPassword(String username,String password){
		try {
			QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
			String sql = "select * from user where username=? and password=?";
			return runner.query(sql, new BeanHandler<User>(User.class),new Object[] {username,password});
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	/*
	//修改用户
	public boolean update(User user) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update user set username=?,password=? where id=?";
		int num = runner.update(sql,new Object[] {user.getUsername(),user.getPassword(),user.getId()});
		if(num > 0) 
			return true;
		return false;
	}
	//删除用户的操作
	public boolean delete(int id) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from user where id=?";
		int num = runner.update(sql,id);
		if(num > 0) 
			return true;
		return false;
	}
	*/
}
