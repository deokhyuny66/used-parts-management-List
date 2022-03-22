package user;

import java.lang.ProcessBuilder.Redirect;
import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class userDAO {
	 Connection conn = DatabaseUtil.getConnection();
	 int rs_cnt = 0;
	    public String add(String userID) {
	    try {
	      PreparedStatement pstmt = conn.prepareStatement("insert into TB_LIST_REGISTER(name) values(?)");
	      pstmt.setString(1, userID);
	      rs_cnt = pstmt.executeUpdate();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
		return userID;
	    
	    }
}
//
