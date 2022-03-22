<%@page import="user.userDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.userDAO"%>
<% 
  request.setCharacterEncoding("UTF-8"); 
  String userID = null; 
  String rs = null;
  userDAO userDAO = new userDAO();
  userID = (String) request.getParameter("param1");
  if(userID.equals("") || userID.equals(null)) response.sendRedirect("./error.jsp");
  else {
	  rs = userDAO.add(userID);
	  if(!(rs.equals("") || rs.equals(null))) response.sendRedirect("./index.jsp");	  
  }//
%>
    