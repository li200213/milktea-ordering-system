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
 * Servlet implementation class getCakeListServlet
 */
@WebServlet("/getBeverageListServlet")
public class getBeverageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getBeverageListServlet() {
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
        String type_id = request.getParameter("type_id");
        String rows = request.getSession().getServletContext().getInitParameter("rows");
        
        //2.调用service进行分页操作
        Page pb = null;
        if(("").equals(type_id)) {
        	pb = service.getPage(currentPage, rows);
        }else {
        	pb = service.getPageByProductType(currentPage,type_id,rows);
        }
        request.setAttribute("pb",pb);
    	request.setAttribute("type_id", type_id);
    	request.getRequestDispatcher("/jsp/line.jsp").forward(request,response);	
    }

}
