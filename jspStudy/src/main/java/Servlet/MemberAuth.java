package Servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;


@SuppressWarnings("serial")
@WebServlet(urlPatterns="/13Servlet/MemberAuth.mvc",initParams= {@WebInitParam(name="manager", value="admin")})
public class MemberAuth extends HttpServlet {
	MemberDAO dao;
	@Override
		public void init() throws ServletException{
			ServletContext application = this.getServletContext();
			dao= new MemberDAO(application.getInitParameter("OracleDriver"),application.getInitParameter("OracleUrl"),application.getInitParameter("OracleId"),application.getInitParameter("OraclePw"));
		}
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String manager = this.getInitParameter("manager");
    	String id= req.getParameter("id");
    	String pw = req.getParameter("pass");
    	MemberDTO dto = dao.getMember(id, pw);
    	String name= dto.getName();
    	if((name!=null) && (!id.equals(manager))) {
    		req.setAttribute("authMsg", name+"(이)가 왔다.");
    	}else if(id.equals(manager)) {
    		req.setAttribute("authMsg", name+" 쉑 일해라이");
    	}
    	else {
    		req.setAttribute("authMsg", "가입부터 해라 개자슥아");
    	}
    	req.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(req, resp);
    }
    @Override
    public void destroy(){
    	dao.close();
    }
}
