<%@ page import="action.actionDAO" %>
<%@ page import="action.actionDTO" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
  request.setCharacterEncoding("UTF-8"); 
  actionDAO actionDAO = new actionDAO();
  actionDTO actionDTO = new actionDTO();
  boolean rs;

  if(request.getParameter("delete").equals("삭제")){
	  actionDTO.setId((String) request.getParameter("clickedId"));
	  rs = actionDAO.delete(actionDTO.getId());
	  if(rs == true) response.sendRedirect("./pages-account-settings-notifications.jsp");
	  else response.sendRedirect("./error.jsp");
  }else if(request.getParameter("update").equals("수정")){
	  actionDTO.setName((String) request.getParameter("selitemParam0"));
	  actionDTO.setAge((String) request.getParameter("selitemParam1"));
	  actionDTO.setId((String) request.getParameter("clickedId"));
	  if(actionDTO.getId().equals("") || actionDTO.getId().equals(null)) response.sendRedirect("./error.jsp");
	  if(actionDTO.getName().equals("") || actionDTO.getName().equals(null)) response.sendRedirect("./error.jsp");
	  if(actionDTO.getAge().equals("") || actionDTO.getAge().equals(null)) response.sendRedirect("./error.jsp");
	  rs = actionDAO.update(actionDTO.getName(), actionDTO.getAge(), actionDTO.getId());
	  if(rs == true) response.sendRedirect("./pages-account-settings-notifications.jsp");
	  else response.sendRedirect("./error.jsp");
  }
%>
    