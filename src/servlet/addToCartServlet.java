package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Beverage;
import model.Cart;
import model.User;
import service.ProductService;

/**
 * Servlet implementation class addCartServlet
 */
@WebServlet("/addToCartServlet")
public class addToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private ProductService service = new ProductService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		User user = (User)request.getSession().getAttribute("user");
		if(user == null) {
			response.getWriter().write("用户未登录");
			return;
		}
		Cart cart = null;
		if(request.getSession().getAttribute("cart")!=null) {
			cart = (Cart)request.getSession().getAttribute("cart");
		}else {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
	    
	    int pid = Integer.parseInt(request.getParameter("id"));
	    Beverage cake = service.getProductById(pid);
	    if(cake.getStock()>0) {
	    	String[] ingredients = request.getParameter("ingredients").split(",");
	    	String spec = "["+request.getParameter("sweet_degree")+";"+request.getParameter("temperature")+"]";
	    	for(String ingredient:ingredients) {
	    		spec += ingredient+";";
	    	}
	    	service.addItem(user.getId(),pid,Integer.parseInt(request.getParameter("count")),spec);
	    }else {
	    	response.getWriter().write("该商品库存不足");
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
