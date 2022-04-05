package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import util.DatabaseUtil;
import action.actionDTO;

public class actionDAO {
	Connection conn = DatabaseUtil.getConnection();
	actionDTO actionDTO = new actionDTO();
	ArrayList<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
    public String add(String paramName, String paramId) {
	    try {
	    	System.out.println(paramName);
	    	PreparedStatement pstmt = conn.prepareStatement("insert into TB_LIST_REGISTER(name,id) values(?,?)");
			pstmt.setString(1, paramName);
			pstmt.setString(2, paramId);
			pstmt.executeUpdate();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
		return paramName;
    }
    
	public ArrayList<HashMap<String,String>> selectAll() throws SQLException {
	
    	try {
    		Statement stmt = conn.createStatement();
    		ResultSet rs = stmt.executeQuery("select * from TB_LIST_REGISTER");
    		ResultSetMetaData md = rs.getMetaData();
    		int columns = md.getColumnCount();
    		
    		while(rs.next()) {
    			//Map<String, Object> m = new HashMap<String, Object>(columns);
    			HashMap<String,String> row = new HashMap<String, String>(columns);
    			for(int i=1; i<=columns; ++i) {
    		            row.put(md.getColumnName(i), (String) rs.getObject(i));
		        }
		        list.add(row);
    		}
    		

    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return list;
    }
    
    
}