package action;

import java.lang.ProcessBuilder.Redirect;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DatabaseUtil;
import action.actionDTO;

public class actionDAO {
	Connection conn = DatabaseUtil.getConnection();
	actionDTO actionDTO = new actionDTO();
	List<String> items = new ArrayList<String>();
	
    public String add(String paramName) {
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement("insert into TB_LIST_REGISTER(name) values(?)");
			pstmt.setString(1, paramName);
			pstmt.executeUpdate();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
		return paramName;
    }
    
	public List<String> select() {
    	try {
    		Statement stmt = conn.createStatement();
    		ResultSet rs = stmt.executeQuery("select * from TB_LIST_REGISTER");
    		while(rs.next()) {
    			items.add(rs.getString(1));
    		}

    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return items;
    }
    
    
}