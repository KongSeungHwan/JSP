<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDAO" %>
<%@ page import="membership.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%    
  BoardDAO dao = new BoardDAO(application);

  String findCol=request.getParameter("findCol");
  String findWord=request.getParameter("findWord");
  Map<String,Object> param = new HashMap<String,Object>();
  if(findWord!=null){
     param.put("findCol",findCol);
     param.put("findWord",findWord);
  }
  
  int totalCount = dao.getTotalCount(param);
  List<BoardDTO> boardLists=dao.getList(param);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<style>
	tr{
		text-align: center
	}
	td{
		text-align: center;
	}
	table{
	width: 90%
	}
</style>
</head>
<body>
   <jsp:include page="../common/Top.jsp"/>
   <h2>목록 보기</h2>
   <!-- 검색 -->
   <form method="get">
      <table border="1">
         <tr>
            <td align="center">
               <select name="findCol">
                  <option value="title">제목</option>
                  <option value="content">내용</option>
               </select>
               <input type="text" name="findWord"/>
               <input type="submit" value="검색"/>         
            </td>   
         </tr>
        </table>
   </form>
   <!-- 목록 -->
   <table border="1">
      <tr>
         <th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th>
      </tr>
   <%
      if(boardLists.isEmpty()){
   %>   
      <tr>
      	<td colspan="5">등록된 게시물이 없습니다</td>
      </tr>
   <% 
      }else{
    	  for(BoardDTO dto: boardLists){
    %>
    	<tr>
    		<td><%=dto.getSequenceNum()%></td>
    		<td align="left">
    		<a href="View.jsp?num=<%=dto.getSequenceNum()%>"><%=dto.getTitle() %></a>
    		</td>
    		<td><%=dto.getId() %></td>
    		<td><%=dto.getVisitCount() %></td>
    		<td><%=dto.getPostDate() %></td>
    	</tr>
    	<%   
    	  }
      }
   %>   
   </table><br>
   <div align="center">
   		<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
   </div>
</body>
</html>