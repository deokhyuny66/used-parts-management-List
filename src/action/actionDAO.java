package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import util.DatabaseUtil;
import action.actionDTO;

public class actionDAO {
	Connection conn = DatabaseUtil.getConnection();
	actionDTO actionDTO = new actionDTO();
	ArrayList<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
	ArrayList<HashMap<String,String>> listOfIndex = new ArrayList<HashMap<String,String>>();
	JSONArray jsonList = new JSONArray();
	List<JSONObject> jsonObj = new ArrayList<JSONObject>();
	
    public String add(String paramName, String paramAge) throws SQLException {
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement("insert into TB_LIST_REGISTER(name,age) values(?,?)");
			pstmt.setString(1, paramName);
			pstmt.setString(2, paramAge);
			pstmt.executeUpdate();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
		return paramName;
    }
    
    public String update(String paramName, String paramaAge, String paramClickedId) throws SQLException {
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement("update TB_LIST_REGISTER set name=?, age=? WHERE id='"+ paramClickedId+"'");
			pstmt.setString(1, paramName);
			pstmt.setString(2, paramaAge);
			pstmt.executeUpdate();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
		return paramName;
    }
    
    public String delete(String paramClickedId) throws SQLException {
	    try {
	    	PreparedStatement pstmt = conn.prepareStatement("delete from TB_LIST_REGISTER WHERE id='" + paramClickedId+"'");
			pstmt.executeUpdate();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return "true";
    }
    
	public ArrayList<HashMap<String,String>> selectAll() throws SQLException {
		
    	try {
    		Statement stmt = conn.createStatement();
    		ResultSet rs = stmt.executeQuery("select id,name,age from TB_LIST_REGISTER");
    		ResultSetMetaData md = rs.getMetaData();
    		int columns = md.getColumnCount();

    		while(rs.next()) {
    			HashMap<String,String> row = new HashMap<String, String>(columns);
    			for(int i=1; i<=columns; ++i ) { //++i	
    				if(md.getColumnName(i).equals("id")){
    					row.put(md.getColumnName(i), String.valueOf(rs.getObject(i)));
    				}else {
    					row.put(md.getColumnName(i), (String) rs.getObject(i));
    				}
		        }
    			list.add(row);
    		}
    		System.out.println(list);

    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return list;
    }
	
	public JSONArray selectOfIndex(String paramItemsIndex) throws SQLException {
    	try {
    		Statement stmt = conn.createStatement();
    		System.out.println(paramItemsIndex);
    		ResultSet rs = stmt.executeQuery("select id, name, age from TB_LIST_REGISTER WHERE id='"+paramItemsIndex+"'");
    		ResultSetMetaData md = rs.getMetaData();
    		int columns = md.getColumnCount();

    		while(rs.next()) {
    			HashMap<String,String> row = new HashMap<String, String>(columns);
    			for(int i=1; i<=columns; ++i) {
    				if(md.getColumnName(i).equals("id")){
    					row.put(md.getColumnName(i), String.valueOf(rs.getObject(i)));
    				}else {
    					row.put(md.getColumnName(i), (String) rs.getObject(i));    					
    				}
		        }
    			JSONObject obj = new JSONObject(row);
    			jsonObj.add(obj);
    			jsonList.add(jsonObj);
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}

    	return jsonList;
    }
}