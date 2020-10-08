 <jsp:include page="include_painel/header.jsp"/>

  <!-- Page Wrapper -->
  <div id="wrapper">

    <jsp:include page="include_painel/sidebar.jsp"/>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

      	<jsp:include page="include_painel/navbar.jsp"/>

        <!-- Begin Page Content -->
        <div class="container-fluid">
		
		<jsp:include page="usuarios.jsp"/>
		
        </div>

      </div>
      <!-- End of Main Content -->
      
      <!-- Scroll to Top Button-->
	  <a class="scroll-to-top rounded" href="#page-top">
	    <i class="fas fa-angle-up"></i>
	  </a>
	
	  <!-- Logout Modal-->
	  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	      <div class="modal-content">
	        <div class="modal-footer">
	          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
	          <a class="btn btn-primary" href="login.html">Logout</a>
	        </div>
	      </div>
	    </div>
	  </div>

      <jsp:include page="include_painel/footer.jsp"/>
      

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  

  