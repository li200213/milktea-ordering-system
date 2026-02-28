package servlet;

import java.io.IOException;
import java.util.Date;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import service.OrderService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/submitOrderServlet")
public class submitOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitOrderServlet() {
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
	private OrderService oservice = new OrderService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		if(request.getParameter("pay_way")==null) {
			request.setAttribute("error_info", "请选择支付方式");
			request.getRequestDispatcher("/jsp/order.jsp").forward(request, response);
			return;
		}		
		
		//调用server类进行提交订单操作
		User user = (User)request.getSession().getAttribute("user");
		oservice.submitOrder(user.getId(),
				(int[])request.getSession().getAttribute("checked_pids"),
				(double)request.getSession().getAttribute("total"),
				request.getParameter("pay_way"),
				new Timestamp(new Date().getTime()));
		response.sendRedirect(request.getContextPath()+"/jsp/order_submit_success.jsp");
	}

}
