package model;

import java.util.HashMap;
import java.util.Map;

public class loginFormBean {
	private String username;
	private String password;
	// 定义成员变量errors，用于封装表单验证时的错误信息
	private Map<String,String> errors = new HashMap<String,String>();
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Map<String, String> getErrors() {
		return errors;
	}
	public void setErrors(String err,String errMsg) {
		if((err != null) && (errMsg != null)) {
			errors.put(err, errMsg);
		}
	}
 	
 	public boolean isValidate() {
 		boolean flag = true;
 		if (username == null || username.length() == 0) {
            errors.put("username", "请输入您的手机号");
            flag = false;
        } else if (!username.matches("1[3-9]\\d{9}")) {
        	errors.put("username", "手机号格式错误");
        	flag = false;
        }
 		
 		if (password == null || password.length() == 0) {
 			errors.put("password", "请输入密码");
 			flag = false;
        } 
 		return flag;
 	}
}
