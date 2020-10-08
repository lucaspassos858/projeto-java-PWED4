<%@page import="models.Usuario"%>

<%
	int idUsuario 		= Integer.parseInt( request.getParameter("idUsuario"));
	int idNivelUsuario 	= Integer.parseInt( request.getParameter("idNivelUsuario"));
	String nome 		= request.getParameter("nome");	
	String email 		= request.getParameter("email");
	String senha 		= request.getParameter("senha");

	if (request.getParameter("atualizar") != null){
		String nomeNovo 		= request.getParameter("nomeNovo");	
		String emailNovo	= request.getParameter("emailNovo");
		int idNivelUsuarioNovo 	= Integer.parseInt( request.getParameter("idNivelUsuarioNovo"));
		
		Usuario usuario = new Usuario(idUsuario, idNivelUsuarioNovo, nomeNovo, emailNovo, senha, "");
		
		usuario.save();
		
		response.sendRedirect("index.jsp");
	    
	} 
	
	
%>


 <jsp:include page="include_painel/header.jsp"/>

  <!-- Page Wrapper -->
  <div id="wrapper">

    <jsp:include page="include_painel/sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

      	<jsp:include page="include_painel/navbar.jsp"/>

        <form class="text-center border border-light p-5" action="" style="background:white; border:1px solid gray;" method="post">
		   <p class="h4 mb-4">Atualizar Usuário</p>
		   <span style="float:left;">Nome </span>
		   <input type="text" id="defaultRegisterFormFirstName" class="form-control mb-4" placeholder="Nome" name="nomeNovo" value="<%= nome %>">
		   <span style="float:left;">Email </span>
		   <input type="email" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="E-mail" name="emailNovo" value="<%= email %>">
		   <span style="float:left;">Nível do Usuário </span>
		   <input type="number" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="Nível do Usuario" name="idNivelUsuarioNovo" max="1" min="0" value="<%= idNivelUsuario %>">
		   <input type="hidden" name="atualizar">
		
		   <button class="btn btn-info my-4 btn-block" type="submit">Atualizar</button>
		
		   <hr>
		</form>
			
      	<jsp:include page="include_painel/footer.jsp"/>
      
       </div>
    	<!-- End of Content Wrapper -->
    	
      </div>
  </div>
  <!-- End of Page Wrapper -->

  

  