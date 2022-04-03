<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="action.actionDAO" %>
<%@ page import="action.actionDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray" %>

<%
	request.setCharacterEncoding("utf-8");
//	List<String> list = new ArrayList<String>();
	ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>();
	actionDAO actionDAO = new actionDAO();
	actionDTO actionDTO = new actionDTO();
	list = actionDAO.selectAll();
%>
<%= list %>


