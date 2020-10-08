<%@page import="models.Usuario"%>
<%@page import="mail.TesteEmail"%>
<%@page import="utils.RandomCode" %>

<%
	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	        		  
	Usuario novoUsuario = new Usuario(0,0,"",email,senha,"");
	
	if(request.getParameter("tokenLogin") != null){
		if(novoUsuario.login(email, senha)){
			
			if(email!=null && senha!=null && !email.isEmpty() && !senha.isEmpty()){
				String nome = novoUsuario.BuscarNome(email);
				String idNivelUsuario = novoUsuario.BuscarIdNivelUsuario(email);
				session.setAttribute("nome", nome);
				session.setAttribute("idNivelUsuario", idNivelUsuario);
				session.setAttribute("email", email);	
			}
			
		} else {
			response.getWriter().write("<div class='alert alert-danger alert-dismissible fade show' role='alert' style='margin:10px'>" +
				 " <strong>Falha no login, dados não encontrados!</strong>" +
				 " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
				 " <span aria-hidden='true'>&times;</span>" +
				 " </button> " +
				"</div>");
		}
		response.setHeader("REFRESH", "0");
	}
	
	if(request.getParameter("tokenSenha") != null){
		
		RandomCode rand = new RandomCode();
		String token = rand.generate(20);
		//response.getWriter().write(token);
		//response.getWriter().write(email);
		novoUsuario.updateToken(email, token);
		String[] args = {"lucas.passos@edi-labs.com", email, "MoviesDB - Refinição de Senha", "Clique no link abaixo para redefinir sua senha:\n\n http://localhost:8080/ProjetoWeb/redefinirSenha.jsp?token=" + token};		TesteEmail teste = new TesteEmail();
		teste.testarEmail(args);
		response.getWriter().write("<div class='alert alert-warning alert-dismissible fade show' role='alert' style='margin:10px'>" +
				 " Enviamos um email para <strong> " + email + ". </strong>" +
				 " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
				 " <span aria-hidden='true'>&times;</span>" +
				 " </button> " +
				 "</div>");
	}
%>