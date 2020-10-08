<nav class="mb-1 navbar navbar-expand-lg navbar-dark primary-color-dark sticky-top">
   <a class="navbar-brand" href="#">
    <img src="https://mdbootstrap.com/img/logo/mdb-transparent.png" height="30" alt="mdb logo">
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-3" aria-controls="navbarSupportedContent-3" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent-3">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link waves-effect waves-light" href="inicio.jsp">Início
          <span class="sr-only">(current)</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link waves-effect waves-light" href="#filmes">Filmes</a>
      </li>
      <li class="nav-item">
        <a class="nav-link waves-effect waves-light" href="#series">Séries</a>
      </li>
      <!--  <li class="nav-item">
        <a class="nav-link waves-effect waves-light" href="#">Avaliações</a>
      </li> -->
      <% 
	      
	      if(session.getAttribute("email") != null){ 
	    	  int idNivelUsuario = Integer.parseInt(session.getAttribute("idNivelUsuario").toString());
	    	  if(idNivelUsuario==1){
	      
	      %>
	      
	      <li class="nav-item">
	        <a class="nav-link waves-effect waves-light btn btn-sm btn-success" href="painel_adm/index.jsp" target="_blank">Painel Administrativo</a>
	      </li>
      <% }}%>
    </ul>
    <ul class="navbar-nav ml-auto nav-flex-icons">
      <span> 
      <%
      	String nome = (String) session.getAttribute("nome");
        if(nome == null){
        	response.sendRedirect("inicio.jsp");
        } else {
        	out.print("<span style='text-align:center; vertical-align:-webkit-baseline-middle; font-size:large; color: lightgray;'><strong>Bem vindo,</strong> " + nome + "</span>");
        }
      %>
      </span>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle waves-effect waves-light" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-default" aria-labelledby="navbarDropdownMenuLink">
        
          <% if(session.getAttribute("email") == null){ %>
	          	<a class="dropdown-item waves-effect waves-light" data-toggle="modal" data-target="#modalLoginForm" href="">Login</a>
				<a class="dropdown-item waves-effect waves-light" data-toggle="modal" data-target="#modalRegisterForm" href="">Cadastro</a>
          <% } else { %>
         		<a class="dropdown-item waves-effect waves-light" href="include/logout.jsp">Logout</a>
          <% } %>
           
        </div>
      </li>
    </ul>
  </div>
</nav>
<hr>

<jsp:include page="login.jsp"/>
<jsp:include page="cadastro.jsp"/>