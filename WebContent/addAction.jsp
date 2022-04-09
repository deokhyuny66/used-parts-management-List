<%@ page import="action.actionDAO" %>
<%@ page import="action.actionDTO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
  request.setCharacterEncoding("UTF-8"); 
  String rs = null;
  actionDAO actionDAO = new actionDAO();
  actionDTO actionDTO = new actionDTO();
  actionDTO.setName((String) request.getParameter("param1"));
  if(actionDTO.getName().equals("") || actionDTO.getName().equals(null)) response.sendRedirect("./error.jsp");
  else {
	  rs = actionDAO.add(actionDTO.getName());
	  if(!(rs.equals("") || rs.equals(null))) response.sendRedirect("./index.jsp");	  
  }
%>
    