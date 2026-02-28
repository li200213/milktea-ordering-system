package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cart;
import model.User;
import service.ProductService;

/**
 * Servlet implementation class getCartServlet
 */
@WebServlet("/getCartServlet")
public class getCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getCartServlet() {
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
		Cart cart = null;
		User user = (User) request.getSession().getAttribute("user");
		if(user != null) {
			cart = service.getCart(user.getId());
		}
		request.getSession().setAttribute("cart", cart);
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
	}
}
