<%@page import="models.Post"%>

<%
	int idPost = Integer.parseInt(request.getParameter("idPost"));
	
	Post post = new Post(0,"","","","","",0);
	post.deleteById(idPost);
	response.sendRedirect("postagens.jsp");
	
%>