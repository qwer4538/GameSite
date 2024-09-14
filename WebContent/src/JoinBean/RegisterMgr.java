package JoinBean;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;


public class RegisterMgr {

    private DBConnectionMgr pool = null;

    public RegisterMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }

    public boolean checkId(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select memberid from members where memberid=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return checkCon;
    }
    
	public boolean check(String id) { // id 중복 검사
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement("select memberid from members");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(rs.getString("memberid").equals(id)) {
					return false;
				}
			}
	} catch (Exception ex) {
		ex.printStackTrace();
	}
		return true;
	}	

    public boolean memberInsert(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into members (memberid, password, password2, nicname, email, level)values(?,?,?,?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getMemberid());
            pstmt.setString(2, regBean.getPassword());
            pstmt.setString(3, regBean.getPassword2());
            pstmt.setString(4, regBean.getNicname());
            pstmt.setString(5, regBean.getEmail());
            pstmt.setString(6, "1");
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public RegisterBean getMember(String mem_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RegisterBean regBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from members where memberid=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                regBean = new RegisterBean();
                regBean.setMemberid(rs.getString("memberid"));
                regBean.setPassword(rs.getString("password"));
                regBean.setPassword2(rs.getString("password2"));
                regBean.setNicname(rs.getString("nicname"));
                regBean.setEmail(rs.getString("email"));
                System.out.print(rs.getString("id"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return regBean;
    }

    public ArrayList<RegisterBean> getMemberList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<RegisterBean> list = new ArrayList<RegisterBean>();
        
        try {
            con = pool.getConnection();
            String strQuery = "select no,memberid, password, password2, nicname, email, level from members order by level desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                RegisterBean regBean = new RegisterBean();
                regBean.setNo(rs.getString("no"));
                regBean.setMemberid(rs.getString("memberid"));
                regBean.setPassword(rs.getString("password"));
                regBean.setPassword2(rs.getString("password2"));
                regBean.setNicname(rs.getString("nicname"));
                regBean.setEmail(rs.getString("email"));
                regBean.setLevel(rs.getString("level"));
                list.add(regBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return list;
    }

    public boolean memberUpdate(RegisterBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update members set memberid=?, password=?,";
            strQuery = strQuery + " password2=?, nicname=?, email=?";
            strQuery = strQuery + " where memberid=? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getMemberid());
            pstmt.setString(2, regBean.getPassword());
            pstmt.setString(3, regBean.getPassword2());
            pstmt.setString(4, regBean.getNicname());
            pstmt.setString(5, regBean.getEmail());
            pstmt.setString(6, regBean.getMemberid());
            
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public RegisterBean loginCheck(String id, String password) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        RegisterBean bean = new RegisterBean();
        try {
            con = pool.getConnection();
            String strQuery = "select memberid, level from members where memberid = ? and password = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();
            rs.next();
            
            bean.setMemberid(rs.getString("memberid"));
            bean.setLevel(rs.getString("level"));
            
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return bean;
    }

    public boolean adminCheck(String admin_id, String admin_passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select admin_id, admin_passwd from admin where admin_id=? and admin_passwd=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, admin_id);
            pstmt.setString(2, admin_passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
}
