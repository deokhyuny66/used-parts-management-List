<%@ page import="action.actionDAO" %>
<%@ page import="action.actionDTO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
  request.setCharacterEncoding("UTF-8"); 
  String rs = null;
  actionDAO actionDAO = new actionDAO();
  actionDTO actionDTO = new actionDTO();
  actionDTO.setName((String) request.getParameter("selitemParam0"));
  actionDTO.setAge((String) request.getParameter("selitemParam1"));
  actionDTO.setId((String) request.getParameter("clickedId"));
  System.out.println(actionDTO.getAge());
  System.out.println(actionDTO.getId());
  
  
  if(actionDTO.getName().equals("") || actionDTO.getName().equals(null)) response.sendRedirect("./error.jsp");
  if(actionDTO.getAge().equals("") || actionDTO.getAge().equals(null)) response.sendRedirect("./error.jsp");
  if(actionDTO.getId().equals("") || actionDTO.getId().equals(null)) response.sendRedirect("./error.jsp");
  else {
	  rs = actionDAO.update(actionDTO.getName(), actionDTO.getAge(), actionDTO.getId());
	  if(!(rs.equals("") || rs.equals(null))) response.sendRedirect("./index.jsp");	  
  }
%>
    