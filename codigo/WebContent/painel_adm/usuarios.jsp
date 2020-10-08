<%@page import="models.Usuario"%>
<% 
    Usuario usuarioRead = new Usuario();
    String listarUsuarios = usuarioRead.listarUsuarios();
 %> 
<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h6 class="m-0 font-weight-bold text-primary">Usu�rios</h6>
  </div>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Email</th>
            <th>ID - N�vel de Usu�rio</th>
            <th>A��es</th>
          </tr>
        </thead>
        <tbody>
		 <%=listarUsuarios%>
        </tbody>
      </table>
    </div>
  </div>
</div>