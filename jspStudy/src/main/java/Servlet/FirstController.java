package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.set")
public class FirstController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		int lastSlash=uri.lastIndexOf("/");
		String commandStr=uri.substring(lastSlash);
		if(commandStr.equals("/regist.set")) {
			registFunc(request);
		}else if(commandStr.equals("/login.set")){
			loginFunc(request);
		}else if(commandStr.equals("/board.set")){
			boardFunc(request);
		}
		request.setAttribute("uri", commandStr);
		request.setAttribute("comStr", commandStr);
		request.getRequestDispatcher("/13Servlet/FirstView.jsp").forward(request, response);
	}

	 void boardFunc(HttpServletRequest request) {
		request.setAttribute("result", "<h3>게시판</h3>");
	}

	 void loginFunc(HttpServletRequest request) {
		 request.setAttribute("result", "<h3>로그인</h3>");
		
		
	}

	 void registFunc(HttpServletRequest request) {
		 request.setAttribute("result", "<h3>회원가입</h3>");
		
		
	}


}
