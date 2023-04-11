package membership;

import java.sql.SQLException;

import common.JDBConnect;

public class MemberDAO extends JDBConnect{
	public MemberDAO(String driver,String url,String id,String pw) {
		super(driver,url,id,pw);
	}
	public MemberDTO getMember(String uid,String upw){
		String sql="select * from member where id=? and pw=?";
		MemberDTO dto = new MemberDTO();
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, upw);
			rs=psmt.executeQuery();
		if(rs.next()) {
			dto.setId(rs.getString("id"));
			dto.setPw(rs.getString("pw"));
			dto.setName(rs.getString("name"));
			dto.setRegDate(rs.getString("regdate"));
			return dto;
		}else {
			System.out.println("결과 값 없음");
			return null;
		}
		} catch (SQLException e) {
			System.out.println("연결 실패 또는 sql구문 오류");
			e.printStackTrace();
			return null;
		}
	}
	
	
	
}
