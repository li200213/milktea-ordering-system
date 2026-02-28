package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Order;
import model.User;
import service.OrderService;

/**
 * Servlet implementation class getOrderServlet
 */
@WebServlet("/getOrderListServlet")
public class getOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getOrderListServlet() {
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
	private OrderService service = new OrderService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Order> order_list = null;
		User user = (User)request.getSession().getAttribute("user");
		if(user!=null) {
			order_list = service.getOrderList(user.getId());
		}
		request.setAttribute("order_list", order_list);
    	request.getRequestDispatcher("/jsp/show_order.jsp").forward(request,response);
	}

}
