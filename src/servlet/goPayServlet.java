package servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Item;
import model.User;
import service.ProductService;

/**
 * Servlet implementation class goPayServlet
 */
@WebServlet("/goPayServlet")
public class goPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public goPayServlet() {
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
	private ProductService service = new ProductService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取购物车中被选中的商品id
		String[] strings = request.getParameter("checked_pids").split(",");
		int[] checked_pids = Arrays.stream(strings).mapToInt(Integer::parseInt).toArray();
		double total = Double.parseDouble(request.getParameter("total"));
		//根据用户id和商品id获取购物车中的商品信息，在订单页展示
		User user = (User)request.getSession().getAttribute("user");
		List<Item> checked_list = service.getItemsByUidAndPids(user.getId(), checked_pids);
		request.getSession().setAttribute("checked_pids", checked_pids);
		request.getSession().setAttribute("checked_list", checked_list);
		request.getSession().setAttribute("total", total);
	}

}
