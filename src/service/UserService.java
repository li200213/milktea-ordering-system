package service;

import dao.UserDAO;
import exception.LoginException;
import exception.RegisterException;
import model.User;

public class UserService {
	private UserDAO dao = new UserDAO();
	public void register(User user) throws RegisterException{
		//查询数据库中是否已存在此用户名
		if(dao.isUsernameExist(user.getUsername())) 
			throw new RegisterException("用户已存在");
		dao.addUser(user);
	}
	public User login(String username,String password) throws LoginException{
		User user = dao.findUserByUsernameAndPassword(username, password);
		if(user == null) 
			throw new LoginException("用户名或密码错误");
		return user;
	}
}
