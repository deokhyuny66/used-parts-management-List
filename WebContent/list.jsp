<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="action.actionDAO"%>
<%@ page import="action.actionDTO" %>
<%@ page import="java.util.*" %>
<%
	actionDAO actionDAO = new actionDAO();
	actionDTO actionDTO = new actionDTO();
	List<String> rs_dao = actionDAO.select();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>List</title>
</head>
<body>
	<p>List Page!</p><br/>
	<%= rs_dao.get(0) %><br/>
	<%= rs_dao.get(1) %><br/>
</body>
</html>