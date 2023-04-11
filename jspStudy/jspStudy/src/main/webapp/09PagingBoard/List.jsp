<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="membership.BoardDAO" %>
<%@ page import="membership.BoardDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="utils.PagingUtil" %>
<%    
  BoardDAO dao = new BoardDAO(application);

  	String findCol=request.getParameter("findCol");
  	String findWord=request.getParameter("findWord");
  	String pageTemp=request.getParameter("pageNum");
  	Map<String,Object> param = new HashMap<String,Object>();
  	if(findWord!=null){
     	param.put("findCol",findCol);
     	param.put("findWord",findWord);
  	}
  	int totalCount = dao.getTotalCount(param);
  
  	int pageSize=Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
  	int blockSize=Integer.parseInt(application.getInitParameter("PAGING_BLOCK"));
  	int totalPage = (int)(Math.ceil((double)(totalCount/pageSize)));
  
  	int pageNum = 1;
  	if(pageTemp!=null && !pageTemp.equals(""))pageNum=Integer.parseInt(pageTemp);
  	int start=(pageNum-1)*pageSize+1;
  	int end=pageNum*pageSize;
	param.put("start",start);
	param.put("end",end);
  	List<BoardDTO> boardLists=dao.getListPage(param);
  	dao.close();
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
    		<a href="View.jsp?num=<%=dto.getSequenceNum()%>&pageNum=<%=pageNum%>"><%=dto.getTitle() %></a>
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
   <table border = "1">
   		<tr align="center">
   			<td>
   				<%=PagingUtil.pagingBlock(totalCount, pageSize, blockSize, pageNum, request.getRequestURI()) %>
   			</td>
   		</tr>
   </table>
   <div align="center">
   		<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
   </div>
</body>
</html>