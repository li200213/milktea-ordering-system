package servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.loginFormBean;
import service.UserService;
import exception.LoginException;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	private UserService service = new UserService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		//1. 获取登录页面的用户名和密码
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    
	    //2. 将表单数据封装到loginFormBean类中,对其进行格式检查
	    loginFormBean formBean = new loginFormBean();
	    formBean.setUsername(username);
	    formBean.setPassword(password);
	    if(!formBean.isValidate()) {//如果不符合要求，返回登录页面显示提示信息
	    	request.setAttribute("formBean", formBean);
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
			return;
	    }
	    
	    //3. 调用service类完成登录操作
		try {
			User user = service.login(username, password);
			//登录成功，将用户存储在session中
			request.getSession().setAttribute("user", user);
			response.getWriter().print("登录成功！3秒后跳转到首页");
			response.setHeader("refresh", "3;url="+request.getContextPath()+"/indexServlet");
			return;
		}catch (LoginException e) {
			//如果出现问题，将错误信息存储到request，并跳转到登陆页面显示错误信息
			e.printStackTrace();
			request.setAttribute("login_message", e.getMessage());
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
		}
	}
}
