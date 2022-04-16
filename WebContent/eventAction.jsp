<%@page import="sun.invoke.empty.Empty"%>
<%@ page import="action.actionDAO" %>
<%@ page import="action.actionDTO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
  request.setCharacterEncoding("UTF-8"); 
  actionDAO actionDAO = new actionDAO();
  actionDTO actionDTO = new actionDTO();

  if(request.getParameter("delete") != null){
	  if(request.getParameter("clickedId").equals("") || request.getParameter("clickedId").equals(null)){
			response.sendRedirect("./error.jsp");
	  }else {
			actionDTO.setId((String) request.getParameter("clickedId"));
			actionDAO.delete(actionDTO.getId());
			response.sendRedirect("./pages-account-settings-notifications.jsp");
	  }
  }else if(request.getParameter("update") != null){
	  if(request.getParameter("selitemParam0").equals("") || request.getParameter("selitemParam0").equals(null)
			  || request.getParameter("selitemParam2").equals("") || request.getParameter("selitemParam2").equals(null) 
			  || request.getParameter("clickedId").equals("") || request.getParameter("clickedId").equals(null)){
		  response.sendRedirect("./error.jsp");
	  }else {
		  actionDTO.setName((String) request.getParameter("selitemParam0"));
		  actionDTO.setAge((String) request.getParameter("selitemParam2"));
		  actionDTO.setId((String) request.getParameter("clickedId"));
	  	  actionDAO.update(actionDTO.getName(), actionDTO.getAge(), actionDTO.getId());
	  	  response.sendRedirect("./pages-account-settings-notifications.jsp");
	  }
  }
%>
    