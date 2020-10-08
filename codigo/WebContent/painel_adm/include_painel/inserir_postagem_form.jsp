<%@page import="models.Categoria"%>
<%@page import="models.Post"%>
<%@ page import="java.util.*" %>

<% 
    Categoria categoriaRead = new Categoria();
    String listarCategorias = categoriaRead.listarCategorias();
    
    if ( request.getParameter("idPost") != null ){
    	int idPost		= Integer.parseInt( request.getParameter("idPost"));
		String titulo 	= request.getParameter("titulo");
		String img 		= request.getParameter("img");	
		String descricao	= request.getParameter("descricao");
		String dataPublicacao	= (new java.util.Date()).toLocaleString();

		int idCategoria 	= Integer.parseInt(request.getParameter("idCategoria"));
		String autor 		= (String) session.getAttribute("nome");
   		
		Post newPost = new Post(idPost, titulo, img, descricao, dataPublicacao, autor, idCategoria);
		
		if(newPost.save()){
			response.getWriter().write("<div class='alert alert-success alert-dismissible fade show' role='alert' style='margin:10px'>" +
					 " <strong>Postagem criada com sucesso!</strong>" +
					 " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
					  "  <span aria-hidden='true'>&times;</span>" +
					 " </button> " +
					"</div>");
		}
	}	
 %> 

<form class="text-center border border-light p-5" action="" style="background:white; border:1px solid gray;" method="post">
	<p class="h4 mb-4">Cadastrar Nova Postagem</p>
	
	<input type="text"  class="form-control mb-4" placeholder="Título" name="titulo" required>
	
	<input type="text" class="form-control mb-4" placeholder="Imagem" name="img" required>
	
	<input type="text" class="form-control mb-4" placeholder="Descrição" name="descricao" required>
   
	<select class="browser-default custom-select" name="idCategoria" required>
	  <option selected hidden>Categoria</option>
	  
	  <%= listarCategorias %>
	</select>
	<input type="hidden" name="idPost" value="0"/>
    <button class="btn btn-info my-4 btn-block" type="submit">Cadastrar</button>

   <hr>
</form>
