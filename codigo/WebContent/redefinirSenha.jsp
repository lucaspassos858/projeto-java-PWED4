<%@page import="models.Usuario"%>

<%
	String token = request.getParameter("token");
	Usuario novoUsuario = new Usuario(0,0,"","","",token);

	int idUsuario = novoUsuario.BuscarIdUsuarioToken();
	
	if(request.getParameter("atualizarSenha") != null){
		
		String senha = request.getParameter("senha");
		novoUsuario.updateSenha(idUsuario, senha);
		response.getWriter().write("<div class='alert alert-success alert-dismissible fade show' role='alert' style='margin:10px'>" +
				 " <strong>Senha atualizada com sucesso!</strong> </div>"
				 + "<script> window.setTimeout(function(){window.location.href = 'http://localhost:8080/ProjetoWeb/inicio.jsp';}, 1000); </script>");
	}
	
	
%>

<jsp:include page="include/header.jsp"/>


<div class="container w-50">
	<!-- Default form login -->
	<form class="text-center border border-light p-5 mt-3" action="" method="post">
	
	    <p class="h4 mb-4">Redefinir Senha</p>
	
	    <!-- Email -->
	    <input type="password" id="defaultLoginFormPassword" class="form-control mb-4" name="senha" placeholder="Nova Senha" required>
	
	    <!-- Password -->
	    <input type="password" id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Confirmar Nova Senha" required>
	
		<input type="hidden" name="atualizarSenha" value="0"/>
	    <button class="btn btn-info btn-block my-4" type="submit">Atualizar</button>
	
	</form>
	<!-- Default form login -->
</div>
	
