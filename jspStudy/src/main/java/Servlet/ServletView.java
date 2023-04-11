package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/ServletView")
public class ServletView extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter wr = response.getWriter();
		wr.println("<html>");
		wr.println("<head><title>Servlet View</title></head>");
		wr.println("<body><h2>jsp없이 직접 출력 get방식</h2></body>");
		wr.println("</html>");
		wr.close();
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter wr = resp.getWriter();
		wr.println("<html>");
		wr.println("<head><title>Servlet View</title></head>");
		wr.println("<body><h2>jsp없이 직접 출력 post방식</h2></body>");
		wr.println("</html>");
		wr.close();
	}
}
