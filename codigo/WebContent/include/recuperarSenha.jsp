<div class="modal fade" id="modalEsqueceuSenha" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Recuperação de Senha</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <form method="post" action="">
	      <div class="modal-body mx-3">
	        <div class="md-form mb-5">
	          <i class="fas fa-envelope prefix grey-text"></i>
	          <input type="email" id="defaultForm-email2" class="form-control validate" name="email" required>
	          <label data-error="wrong" data-success="right" for="defaultForm-email2">Email para recuperação de senha</label>
	        </div>
	      </div>
	      <input type="hidden" name="tokenSenha" value="1"/>
	      <div class="modal-footer d-flex justify-content-center">
	        <button class="btn btn-default" type="submit">Enviar</button>
	      </div>
      </form>
    </div>
  </div>
</div>