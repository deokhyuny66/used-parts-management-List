<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="action.actionDAO" %>
<%@ page import="action.actionDTO" %>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("utf-8");
	actionDAO actionDAO = new actionDAO();
	actionDTO actionDTO = new actionDTO();
	List<String> rs_dao = actionDAO.select();
%>
<%= rs_dao.get(0) %>

