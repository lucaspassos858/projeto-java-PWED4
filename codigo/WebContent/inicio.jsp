<%@page import="models.Post"%>
<%
	Post novoPost = new Post();
	String listarCards = novoPost.listarCards();
	String listarFilmes = novoPost.listarFilmes();
	String listarSeries = novoPost.listarSeries();
%>

<jsp:include page="include/tratarLogin.jsp"/>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/navbar.jsp"/>

<div class="container">
  	<div class="row">
	    <%= listarCards %>
  	</div>
  	<hr>
  	
 	<div id="filmes"></div>
  	<center><h1>Filmes</h1></center>
  	<br>
  	<div class="row">
	    <%= listarFilmes %>
  	</div>
  	
  	<hr>
  	
  	<div id="series"></div>
  	<center><h1>Séries</h1></center>
  	<br>
  	<div class="row">
	    <%= listarSeries %>	    
  	</div>
</div>	    
	
<jsp:include page="include/footer.jsp"/>
	    
	