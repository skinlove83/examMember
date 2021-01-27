package jsp.member;

import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {

	private static MemberDAO instance;

	// 싱글톤 패턴
	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

	int count = 0;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection con = null;

	String url = "jdbc:mysql://localhost:3306/examloginDB?useSSL = false";
	String driver = "com.mysql.jdbc.Driver";
	String user = "root";
	String pwd = "mysql";

	// 접속
	private void connect() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, pwd);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 닫기
	private void disconnect() {

		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				con = null;
			}
		}
	}

	// 저장
	public void UserInsert(MemberDTO memberdto) {

		String sql = "insert into members values(?,?,?,?,?,?,?)";
		connect();
		System.out.println("DB연결성공");

		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, memberdto.getId());
			pstmt.setString(2, memberdto.getPw());
			pstmt.setString(3, memberdto.getMbname());
			pstmt.setString(4, memberdto.getEmail());
			pstmt.setString(5, memberdto.getEmail_dns());
			pstmt.setString(6, memberdto.getAddr());
			pstmt.setString(7, memberdto.getTel());

			count = pstmt.executeUpdate();

			if (count > 0) {
				System.out.println("인서트 성공");

			} else {
				System.out.println("인서트 실패");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			disconnect();
		}

	}

	// 특정주소록읽어오기
	public MemberDTO getUserInfo(String id) {

		MemberDTO member = null;
		String sql = "select * from members where id=?";
		connect();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setMbname(rs.getString("mbname"));
				member.setEmail(rs.getString("email"));
				member.setEmail_dns(rs.getString("email_dns"));
				member.setAddr(rs.getString("addr"));
				member.setTel(rs.getString("tel"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return member;
	} // end getUserInfo

	// 수정 : modify
	public void updateMember(MemberDTO memberdto) {
		String sql = "update members set pw=?, mbname=?, email=?, email_dns=?, addr=?, tel=? where id=?";

		connect();

		try {

			pstmt = con.prepareStatement(sql);
			/* rs.next(); */
			pstmt.setString(1, memberdto.getPw());
			pstmt.setString(2, memberdto.getMbname());
			pstmt.setString(3, memberdto.getEmail());
			pstmt.setString(4, memberdto.getEmail_dns());
			pstmt.setString(5, memberdto.getAddr());
			pstmt.setString(6, memberdto.getTel());
			pstmt.setString(7, memberdto.getId());

			count = pstmt.executeUpdate();

			if (count > 0) {
				System.out.println("인서트 성공");

			} else {
				System.out.println("인서트 실패");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	// 삭제 : delete
	public int deleteMember(String id, String pw) {
		String dbpw = "";
		
		int res = 0;
		
		connect();
		
		try {
			String query = "select pw from members where id=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String delsql = "delete from members where id=?";
				pstmt = con.prepareStatement(delsql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				res = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return res;
	}

	// 로그인 체크
	public int loginChank(String id, String pw) {
		String dbpw = "";
		int x = -1;
		connect();
		try {
			String sql = "select pw from members where id=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpw = rs.getString("pw");
				if (dbpw.equals(pw)) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1;
			}
			return x;
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (con != null) {
					con.close();
					con = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end loginCheck()

	// 회원가입로그인체크
	public boolean confirmId(String id) {
		boolean result = false;
		String sql = "select id from members where id=?";

		connect();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
		return result;
	}

}
