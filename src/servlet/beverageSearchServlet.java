package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Page;
import service.PageService;

/**
 * Servlet implementation class cakeSearchServlet
 */
@WebServlet("/beverageSearchServlet")
public class beverageSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public beverageSearchServlet() {
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
	private PageService service = new PageService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		//1.获取请求参数
        String currentPage = request.getParameter("currentPage");
        if(currentPage == null) {
        	currentPage = "1";
        }
        String rows = request.getSession().getServletContext().getInitParameter("rows");
		String keyword = request.getParameter("keyword");
		if(keyword == null) {
			keyword = (String) request.getSession().getAttribute("keyword");
		}else {
			request.getSession().setAttribute("keyword", keyword);
		}
		Page pb = service.getPageByKeyword(keyword, currentPage, rows);
		request.setAttribute("pb",pb);
		request.getRequestDispatcher("/jsp/beverage_search.jsp").forward(request,response);
	}

}
