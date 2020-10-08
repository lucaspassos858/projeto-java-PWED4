<%@page import="models.Usuario"%>
<%
	if ( request.getParameter("idUsuario") != null ){
		int idUsuario 		= Integer.parseInt( request.getParameter("idUsuario"));
		int idNivelUsuario 	= Integer.parseInt( request.getParameter("idNivelUsuario"));
		String nome 		= request.getParameter("nome");	
		String email 		= request.getParameter("email");
		String senha 		= request.getParameter("senha");
		
		Usuario usuarioWrite = new Usuario(idUsuario, idNivelUsuario, nome, email, senha,"");
		
		if(!usuarioWrite.verificarEmail(email)){
			usuarioWrite.save();
			response.getWriter().write("<div class='alert alert-success alert-dismissible fade show' role='alert' style='margin:10px'>" +
					 " <strong>Cadastro realizado com sucesso!</strong> Por favor, realize o login no sistema!" +
					 " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
					 " <span aria-hidden='true'>&times;</span>" +
					 " </button> " +
					"</div>");
		} else {
			response.getWriter().write("<div class='alert alert-danger alert-dismissible fade show' role='alert' style='margin:10px'>" +
					 " <strong>Este email já está cadastrado!</strong>" +
					 " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
					 " <span aria-hidden='true'>&times;</span>" +
					 " </button> " +
					"</div>");
		}
		
	}																									
	
	//Usuario usuarioRead = new Usuario();
	//String outToHtml = usuarioRead.listAll();
%>
	
<form action="" method="post">
	<div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	  aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header text-center">
	        <h4 class="modal-title w-100 font-weight-bold">Cadastre-se</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body mx-3">
	         <div class="md-form mb-5">
	          <i class="fas fa-user prefix grey-text"></i>
	          <input type="text" id="orangeForm-name" class="form-control validate" name="nome" required>
	          <label data-error="wrong" data-success="right" for="orangeForm-name">Nome</label>
	        </div>
	        <div class="md-form mb-5">
	          <i class="fas fa-envelope prefix grey-text"></i>
	          <input type="email" id="orangeForm-email" class="form-control validate" name="email" required>
	          <label data-error="wrong" data-success="right" for="orangeForm-email">Email</label>
	        </div>
	
	        <div class="md-form mb-4">
	          <i class="fas fa-lock prefix grey-text"></i>
	          <input type="password" id="orangeForm-pass" class="form-control validate" name="senha" required>
	          <label data-error="wrong" data-success="right" for="orangeForm-pass">Senha</label>
	        </div>
			
			<input type="hidden" name="idUsuario" value="0">
			<input type="hidden" name="idNivelUsuario" value="0">
	      </div>
	      <div class="modal-footer d-flex justify-content-center">
	        <button class="btn btn-deep-orange" type="submit">Cadastrar</button>
	      </div>
	    </div>
	  </div>
	</div>
</form>