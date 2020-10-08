 <jsp:include page="include_painel/header.jsp"/>

  <div id="wrapper">
  
    <jsp:include page="include_painel/sidebar.jsp"/>

    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">

      	<jsp:include page="include_painel/navbar.jsp"/>

        <div class="container-fluid">
        	<div class="container">
			
			<jsp:include page="include_painel/inserir_usuario_form.jsp"/>
			
			<br>
			</div>
        </div>
      </div>
      
	  <a class="scroll-to-top rounded" href="#page-top">
	    <i class="fas fa-angle-up"></i>
	  </a>
	
	  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	      <div class="modal-content">
	        <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	          <a class="btn btn-primary" href="login.html">Logout</a>
	        </div>
	      </div>
	    </div>
	  </div>

      <jsp:include page="include_painel/footer.jsp"/>

    </div>

  </div>

  

  