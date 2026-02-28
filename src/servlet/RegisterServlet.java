package servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

import exception.RegisterException;
import model.User;
import model.registerFormBean;
import service.UserService;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	private UserService service = new UserService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		// 1. 获取表单信息
		Map<String, String[]> user_msg = request.getParameterMap();
		
		// 2. 将表单数据封装到formBean对象中,检查表单格式
		registerFormBean formBean = new registerFormBean();
		try {
			BeanUtils.copyProperties(formBean, user_msg);
		} catch (IllegalAccessException e1) {
			e1.printStackTrace();
		} catch (InvocationTargetException e1) {
			e1.printStackTrace();
		}
		if(!formBean.isValidate()) { // 如果不符合要求，重新跳转到登录页面并显示提示信息信息
			request.setAttribute("formBean", formBean);
			request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
			return;
		}

		//3. 将用户信息封装到user对象中
		User user = new User();
		try {
			BeanUtils.copyProperties(user,user_msg); 
		} catch (IllegalAccessException e2) {
			e2.printStackTrace();
		} catch (InvocationTargetException e2) {
			e2.printStackTrace();
		}
		
		//4. 调用service类完成注册操作
		try {
			service.register(user);
			response.getWriter().print("恭喜你注册成功！3秒后跳转到登录页面");
			response.setHeader("refresh", "3;url="+request.getContextPath()+"/jsp/login.jsp");
		}catch (RegisterException e) {
			//如果出现问题，返回注册页面显示错误信息
			e.printStackTrace();
			request.setAttribute("register_message", e.getMessage());
			request.getRequestDispatcher("/jsp/register.jsp").forward(request, response);
		}
	}

}
