<%@page import="models.Usuario"%>

<%
	int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
	
	Usuario novoUsuario = new Usuario(0,0,"","","","");
	novoUsuario.deleteById(idUsuario);
	response.sendRedirect("index.jsp");
	
%>