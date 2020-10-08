<%@page import="models.Usuario"%>
<%
	if ( request.getParameter("idUsuario") != null ){
		int idUsuario 		= Integer.parseInt( request.getParameter("idUsuario"));
		int idNivelUsuario 	= Integer.parseInt( request.getParameter("idNivelUsuario"));
		String nome 		= request.getParameter("nome");	
		String email 		= request.getParameter("email");
		String senha 		= request.getParameter("senha");
		
		Usuario usuarioWrite = new Usuario(idUsuario, idNivelUsuario, nome, email, senha, "");
		
		if(usuarioWrite.save()){
			response.getWriter().write("<div class='alert alert-success alert-dismissible fade show' role='alert' style='margin:10px'>" +
					 " <strong>Usuário inserido com sucesso!</strong>" +
					 " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
					  "  <span aria-hidden='true'>&times;</span>" +
					 " </button> " +
					"</div>");
		}
	}																									

%>

<form class="text-center border border-light p-5" action="" style="background:white; border:1px solid gray;" method="post">
   <p class="h4 mb-4">Cadastrar Novo Usuário</p>

   <input type="text" id="defaultRegisterFormFirstName" class="form-control mb-4" placeholder="Nome" name="nome">

   <input type="email" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="E-mail" name="email">

   <input type="password" id="defaultRegisterFormPassword" class="form-control" placeholder="Senha" name="senha">
   
   <input type="hidden" name="idUsuario" value="0" name="idUsuario">
   <input type="hidden" name="idNivelUsuario" value="0" name="idNivelUsuario">

   <button class="btn btn-info my-4 btn-block" type="submit">Cadastrar</button>

   <hr>
</form>
<!-- Default form register -->