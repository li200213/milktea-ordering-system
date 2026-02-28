package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductService;

/**
 * Servlet implementation class getDetailServlet
 */
@WebServlet("/getDetailServlet")
public class getDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getDetailServlet() {
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
		int pid = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("beverage", service.getProductById(pid));
		request.setAttribute("ingredient_list",service.getIngredientList(pid));
		request.setAttribute("temperature_list",service.getTemperatureList(pid));
		String[] sweet_degree_list = {"全糖","7分糖","5分糖","3分糖","不额外加糖"};
		request.setAttribute("sweet_degree_list",sweet_degree_list);
		request.getRequestDispatcher("/jsp/detail.jsp").forward(request,response);
	}

}
