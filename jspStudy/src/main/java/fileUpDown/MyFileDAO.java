package fileUpDown;

import java.sql.SQLException;
import java.util.ArrayList;


public class MyFileDAO extends common.JDBConnect{
	
	
	public int insertFile(MyFileDTO dto){
		int apresult = 0;
		String sql= "INSERT INTO myfile("
				+ " idx, name, title, cate, ofile, nfile )"
				+ " VALUES( "
				+ " SEQ_BOARD_NUM.NEXTVAL,?,?,?,?,?) ";
		try {
			psmt = con.prepareStatement(sql);
		psmt.setString(1,dto.getName());
		psmt.setString(2,dto.getTitle());
		psmt.setString(3,dto.getCate());
		psmt.setString(4,dto.getOfile());
		psmt.setString(5,dto.getNfile());
		
		apresult= psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return apresult;
	}
	public ArrayList<MyFileDTO> myFileList(){
		ArrayList<MyFileDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM MYFILE ORDER BY IDX DESC";
		try {
			psmt = con.prepareStatement(sql);
			rs= psmt.executeQuery();
			while(rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setNfile(rs.getString(6));
				dto.setRegdate(rs.getString(7));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
