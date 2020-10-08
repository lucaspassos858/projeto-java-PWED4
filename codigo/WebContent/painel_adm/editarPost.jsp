<%@page import="models.Post"%>
<%@page import="models.Categoria"%>

<%
	Categoria categoriaRead = new Categoria();
	String listarCategorias = categoriaRead.listarCategorias();

	int idPost		= Integer.parseInt( request.getParameter("idPost"));
	String titulo 	= request.getParameter("titulo");
	String img 		= request.getParameter("img");	
	String descricao	= request.getParameter("descricao");
	String dataPublicacao	= request.getParameter("dataPublicacao");
	String autor	= request.getParameter("autor");
	int idCategoria	= Integer.parseInt(request.getParameter("idCategoria"));

	if (request.getParameter("atualizar") != null){
		String tituloNovo 		= request.getParameter("tituloNovo");	
		String imgNovo			= request.getParameter("imgNovo");
		String descricaoNovo 		= request.getParameter("descricaoNovo");	
		int idCategoriaNovo 	= Integer.parseInt( request.getParameter("idCategoriaNovo"));
		
		Post newPost = new Post(idPost, tituloNovo, imgNovo, descricaoNovo, dataPublicacao, autor, idCategoriaNovo);
		newPost.save();
		response.sendRedirect("postagens.jsp");
	    
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
			<p class="h4 mb-4">Atualizar Postagem</p>
			
			<input type="text"  class="form-control mb-4" placeholder="Título" name="tituloNovo" value="<%= titulo %>" required>
			
			<input type="text" class="form-control mb-4" placeholder="Imagem" name="imgNovo" value="<%= img %>" required>
			
			<input type="text" class="form-control mb-4" placeholder="Descrição" name="descricaoNovo" value="<%= descricao %>" required>
		   
			<select class="browser-default custom-select" name="idCategoriaNovo"  required>
			  <option value="<%= idCategoria %>" selected hidden>
				  <% String categoria = idCategoria == 1 ? "Filme" : "Série"; %>
				  <%= categoria %>
			  </option>
			  
			  <%= listarCategorias %>
			</select>
			<input type="hidden" name="idPost" value="0"/>
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

  

  