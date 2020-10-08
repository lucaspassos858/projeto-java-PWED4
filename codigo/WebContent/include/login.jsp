
<form action="" method="post">
	<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	  aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header text-center">
	        <h4 class="modal-title w-100 font-weight-bold">Login</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <i class="fas fa-envelope prefix grey-text"></i>
	          <input type="email" id="defaultForm-email" class="form-control validate" name="email" required>
	          <label data-error="wrong" data-success="right" for="defaultForm-email">Email</label>
	        </div>
	
	        <div class="md-form mb-4">
	          <i class="fas fa-lock prefix grey-text"></i>
	          <input type="password" id="defaultForm-pass" class="form-control validate" name="senha" required>
	          <label data-error="wrong" data-success="right" for="defaultForm-pass">Senha</label>
	        </div>
			
			<input type="hidden" name="tokenLogin" value="1"/>
	
	      </div>
	      <div class="modal-footer d-flex justify-content-center">
	        <button class="btn btn-default" type="submit">Login</button>
	      </div>
	      <div class="text-center">
			<a href="" class="btn btn-sm btn-warning btn-rounded mb-4" style="font-weight:100; opacity:100%;" data-dismiss="modal" aria-label="Close" data-toggle="modal" data-target="#modalEsqueceuSenha">
				Esqueceu sua senha?
			</a>
		  </div>
	    </div>
	  </div>
	</div>
</form>


<jsp:include page="recuperarSenha.jsp"/>

