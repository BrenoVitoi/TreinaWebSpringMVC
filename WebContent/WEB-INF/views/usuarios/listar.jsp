<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<h2>Listagem de Usuários</h2>
<br>
<div class="row">
	<div class="col-md-10">
		<div class="form-group">
			<label>Usuário a ser pesquisado:</label>
			<input type="text" id="txt-pesquisa" class="form-control">
		</div>
		<button class="btn btn-default" id="btn-pesquisar">Pesquisar</button>
	</div>
</div>
<table class="table" id="tbl-usuarios">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome de Usuário</th>
			<th>Role</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty usuarios}">
			<c:forEach items="${usuarios}" var="usuario">
				<tr>
					<td>${usuario.id}</td>
					<td>${usuario.username}</td>
					<td>${usuario.role}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br>
<a href="/TreinaWebSpringMVC/usuarios/adicionar" class="btn btn-default">Adicionar
	Novo Usuário</a>

<script type="text/javascript">
	$(document).ready(function() {
		$('#btn-pesquisar').click(function() {
			var nomeUsuário = $('#txt-pesquisa').val();
			$.ajax( {
				method: 'GET',
				url: '/TreinaWebSpringMVC/usuarios/porNome?nome=' + nomeUsuario,
				success: function(data) {
					/*$('#tbl-musicas tbody > tr').remove();
					$.each(data, function(index, musica) {
						$('#tbl-musicas tbody').append(
							'<tr>' +
							'	<td>' + musica.id + '</td>' +
							'	<td>' + musica.nome + '</td>' +
							'	<td> ' + $.format.date(musica.dataCriacao, "dd/MM/yyyy")) + '</td>' +
							'	<td>' + musica.album.nome + '</td>' +
							'	<td>' +
							'		<a href="/TreinaWebSpringMVC/musicas/alterar/' + musica.id + '">Alterar</a> |' +
							'		<a href="/TreinaWebSpringMVC/musicas/excluir/' + musica.id + '">Excluir</a>' +
							'	</td>' +
							'</tr>'
						);
					});*/
				},
				error: function() {
					alert("Houve um erro na requisição.");
				}
			});
		});
	});
</script>
