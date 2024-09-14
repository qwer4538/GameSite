package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import JoinBean.DBConnectionMgr;
import JoinBean.RegisterBean;

public class Board {
	
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	//테스트!
	public ArrayList<BoardBean> getBoardList(String board_type, int paging, int limit,String order ) {
		 
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<BoardBean> list = new ArrayList<BoardBean>();
        
        if(order.length() > 0) {
        	order = " order by "+ order +" desc ";
        }else {
        	order = " order by board_date desc, board_no desc";
        }
        if(paging <= 1) {
        	paging =0;
        }else {
        	paging = paging-1;
        }
        int page = paging * limit ;
        try {
            con = pool.getConnection();
            String strQuery = "select b.board_no, b.board_type, b.board_title, b.board_date, b.board_id, b.board_visit, b.board_secret, b.board_rename_file "
            				+ "  from board a, board_data b "
            		  		+ " where a.board_type = b.board_type"
            				+ "   and a.board_type = ? "
            				+ order + " limit "+ page +","+limit;
            System.out.println(strQuery);
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, board_type);
            rs = pstmt.executeQuery();

            while(rs.next()) {
            	BoardBean bean = new BoardBean();
            	bean.setBoard_no(rs.getString("board_no"));
            	bean.setBoard_type(rs.getString("board_type"));
            	bean.setBoard_title(rs.getString("board_title"));
            	bean.setBoard_date(rs.getString("board_date"));
            	bean.setBoard_id(rs.getString("board_id"));
            	bean.setBoard_visit(rs.getString("board_visit"));
            	bean.setBoard_secret(rs.getString("board_secret"));
            	bean.setBoard_rename_file(rs.getString("board_rename_file"));
            	list.add(bean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return list;
    }
	
	public int getBoardTotal(String board_type) {
		 
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int total = 0;

        try {
            con = pool.getConnection();
            String strQuery = "select count(*) totalCnt"
            				+ "  from board a, board_data b "
            		  		+ " where a.board_type = b.board_type"
            				+ "   and a.board_type = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, board_type);
            rs = pstmt.executeQuery();

            rs.next() ;
            total = Integer.parseInt(rs.getString("totalCnt"));
            
            
            
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return total;
    }
	
	//�Խ��Ǹ� ��������
	public String getBoardName(String board_type) {
		 
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<BoardBean> list = new ArrayList<BoardBean>();
        BoardBean bean = new BoardBean();
        String boardName = "";
        try {
            con = pool.getConnection();
            String strQuery = "select a.board_name "
            				+ "  from board a  "
            				+ " where a.board_type = ? ";
            				
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, board_type);
            rs = pstmt.executeQuery();

            rs.next();
            boardName = rs.getString("board_name");
            
            
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return boardName;
    }
	
	//�Խ��� ����
	public BoardBean getBoardView(String board_type,int board_no) {
		 
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardBean bean = new BoardBean();

        try {
            con = pool.getConnection();
            String strQuery = "select b.board_no, b.board_type, b.board_title, b.board_content, b.board_date, b.board_file, b.board_rename_file, b.board_id, b.board_secret,b.board_visit "
            				+ "  from board a, board_data b "
            		  		+ " where a.board_type = b.board_type"
            				+ "   and a.board_type = ? "
            				+ "   and b.board_no = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, board_type);
            pstmt.setInt(2, board_no);
            rs = pstmt.executeQuery();

            rs.next();
            
        	bean.setBoard_no(rs.getString("board_no"));
        	bean.setBoard_type(rs.getString("board_type"));
        	bean.setBoard_title(rs.getString("board_title"));
        	bean.setBoard_content(rs.getString("board_content"));
        	bean.setBoard_date(rs.getString("board_date"));
        	bean.setBoard_file(rs.getString("board_file"));
        	bean.setBoard_rename_file(rs.getString("board_rename_file"));
        	bean.setBoard_id(rs.getString("board_id"));
        	bean.setBoard_secret(rs.getString("board_secret"));
        	bean.setBoard_visit(rs.getString("board_visit"));
        	

           
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return bean;
    }
	
	//�Խ��� �Է�
	public void boardInsert(BoardBean bean) {
		 

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String strQuery = "insert into board_data (board_type, board_title, board_content, board_file, board_rename_file, board_date, board_id, board_secret) values(?,?,?,?,?,now(),?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setInt(1, Integer.parseInt(bean.getBoard_type()));
            pstmt.setString(2, bean.getBoard_title());
            pstmt.setString(3, bean.getBoard_content());
            pstmt.setString(4, bean.getBoard_file());
            pstmt.setString(5, bean.getBoard_rename_file());
            pstmt.setString(6, bean.getBoard_id());
            pstmt.setString(7, bean.getBoard_secret());
            pstmt.execute();
        	

           
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

    }
	
	//�Խ��� �Է�
	public void boardUpdate(BoardBean bean) {
		 

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String strQuery = "update board_data set board_title = ?, board_content = ?, board_file = ?, board_rename_file = ?, board_secret = ? where board_no = ?";
	            pstmt = con.prepareStatement(strQuery);
	           
	            pstmt.setString(1, bean.getBoard_title());
	            pstmt.setString(2, bean.getBoard_content());
	            pstmt.setString(3, bean.getBoard_file());
	            pstmt.setString(4, bean.getBoard_rename_file());
	            pstmt.setInt(5, Integer.parseInt(bean.getBoard_secret()));
	            pstmt.setInt(6, Integer.parseInt(bean.getBoard_no()));
	            pstmt.execute();
	        	
 
	           
	        } catch (Exception ex) {
	            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

    }
	
	public void boardUpdateVisit(int board_no) {
		 

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String strQuery = "update board_data set board_visit = board_visit +1 where board_no = ?";
            pstmt = con.prepareStatement(strQuery);
           
            pstmt.setInt(1, board_no);
            pstmt.execute();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

    }
	
	//�Խ��� ����
	public void boardDelete(String board_type, String board_no) {
		 
		
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = pool.getConnection();
            String strQuery = "delete from board_data where board_no = ? and board_type = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setInt(1, Integer.parseInt(board_no));
            pstmt.setInt(2, Integer.parseInt(board_type));

            pstmt.execute();
        	

           
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

    }

}
