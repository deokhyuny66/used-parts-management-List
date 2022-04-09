<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="action.actionDAO" %>
<%@ page import="action.actionDTO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map "%>;
<%@ page import="java.util.HashMap "%>;
<%@ page import="java.util.ArrayList "%>;
<%@ page import="org.json.simple.JSONArray "%>;
<%@ page import="org.json.simple.JSONObject "%>;

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	ArrayList<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
	JSONArray jsonList = new JSONArray();
	actionDAO actionDAO = new actionDAO();
	actionDTO actionDTO = new actionDTO();
	jsonList = actionDAO.selectOfIndex(name);
%>
<%= jsonList %>

