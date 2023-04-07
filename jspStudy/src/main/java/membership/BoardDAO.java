package membership;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO(String driver,String url,String id,String pw) {
		super(driver,url,id,pw);
	}
	public BoardDAO(ServletContext application) {
		super(application);
	}
	public int getTotalCount(Map<String,Object> param) {
		String sql="select count(1) from board";
		if(param.get("findWord")!=null){
			sql +=" where "+param.get("findCol") +" like "+" '%"+param.get("findWord") +"%'";
		}
		int toCount;
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			rs.next();
			toCount=rs.getInt(1);
		}catch(SQLException e) {
			System.out.println("DB연결실패 또는 sql구문 오류");
			e.printStackTrace();
			toCount=0;
		}
		return toCount;
	}
	public List<BoardDTO> getList(Map<String,Object> param){
		List<BoardDTO> bl = new Vector<>();
		String sql="select * from board";
		if(param.get("findWord")!=null){
			sql +=" where "+param.get("findCol") +" like "+" '%"+param.get("findWord") +"%'";
		}
		sql+=" order by num desc";
		BoardDTO board;
		
		
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				board=new BoardDTO();				
				board.setSequenceNum(rs.getInt("num"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setContent(rs.getString("content"));
				board.setPostDate(rs.getDate("postdate"));
				board.setVisitCount(rs.getInt("visitcount"));
				bl.add(board);
			}
		} catch (SQLException e) {
			System.out.println("DB연결실패 또는 sql구문 오류");
			e.printStackTrace();
		}
		return bl;
	}
	public List<BoardDTO> getListPage(Map<String,Object> param){
		List<BoardDTO> bl = new Vector<>();
		 String sql="select * from("
		            +"   select rownum pnum, s.* from("
		            +"      select b.* from board b";   
		            
		      if(param.get("findWord")!=null) {
		         sql += " where "+param.get("findCol")+" like '%"
		               +param.get("findWord")+"%'";
		      }
		      sql += "    order by num desc "
		            +"   )s"
		            + ")"
		            + "where pnum between ? and ?";
				BoardDTO board;
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, param.get("start").toString());
			psmt.setString(2, param.get("end").toString());
			rs=psmt.executeQuery();
			while(rs.next()) {
				board=new BoardDTO();				
				board.setSequenceNum(rs.getInt("num"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setContent(rs.getString("content"));
				board.setPostDate(rs.getDate("postdate"));
				board.setVisitCount(rs.getInt("visitcount"));
				bl.add(board);
			}
		} catch (SQLException e) {
			System.out.println("DB연결실패 또는 sql구문 오류");
			e.printStackTrace();
		}
		return bl;
	}
	public int insertWrite(BoardDTO dto) {
		String sql="insert into board(num,title,content,id,visitcount) values(SEQ_BOARD_NUM.NEXTVAL,?,?,?,0)";
		
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			return psmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("DB연결실패 또는 sql구문 오류");
			e.printStackTrace();
			return 0;
		}
	}
	public BoardDTO getView(String num){
		BoardDTO dto = new BoardDTO();
		String sql="select b.*,m.name from board b join member m on b.id=m.id where num="+num;
		try {
			rs= con.prepareStatement(sql).executeQuery();
			if(rs.next()){
				dto.setSequenceNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostDate(rs.getDate("postdate"));
				dto.setVisitCount(rs.getInt("visitcount"));
				dto.setName(rs.getString("name"));
				return dto;
			}
			else {
				return dto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public void updateVisitCount(String num) {
		String sql="update board set visitcount=visitcount+1 where num= "+num;
		try {
			con.prepareStatement(sql).executeUpdate();
		}catch(SQLException e){
			System.out.println("연결 실패또는 sql구문 오류");
			e.printStackTrace();
		}
	}
	
	public int deletePost(String num) {
		String sql="delete from board where num= "+num;
		try {
			return con.prepareStatement(sql).executeUpdate();
		}catch(SQLException e){
			System.out.println("연결 실패또는 sql구문 오류");
			e.printStackTrace();
			return 0;
		}
	}
	public int updateEdit(BoardDTO dto) {
		String sql="update board set title= '"+dto.getTitle()+"' ,content= '"+dto.getContent()+"' where num="+dto.getSequenceNum();
		try {
			return con.prepareStatement(sql).executeUpdate();
		} catch (Exception e) {
			System.out.println("연결 실패 또는 sql구문 오류");
			e.printStackTrace();
		}
		return 0;
	}
	
}
