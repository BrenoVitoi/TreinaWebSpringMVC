<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h2>Listagem de Músicas</h2>
<br>
<div class="row">
	<div class="col-md-10">
		<div class="form-group">
			<label>Músicas a ser pesquisada:</label>
			<input type="text" id="txt-pesquisa" class="form-control">
		</div>
		<button class="btn btn-default" id="btn-pesquisar">Pesquisar</button>
	</div>
</div>
<table class="table" id="tbl-musicas">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome da Música</th>
			<th>Data de Criação</th>
			<th>Nome do Álbum</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty musicas}">
			<c:forEach items="${musicas}" var="musica">
				<tr>
					<td>${musica.id}</td>
					<td>${musica.nome}</td>
					<td><fmt:formatDate value="${musica.dataCriacao}"
							pattern="dd/MM/yyyy" timeZone="UTC" /></td>
					<td>${musica.album.nome}</td>
					<td><a href="/TreinaWebSpringMVC/musicas/alterar/${musica.id}">Alterar</a>
						<a href="/TreinaWebSpringMVC/musicas/excluir/${musica.id}">Excluir</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br>
<a href="/TreinaWebSpringMVC/musicas/adicionar" class="btn btn-default">Adicionar
	Nova Música</a>

<script type="text/javascript">
	$(document).ready(function() {
		$('#btn-pesquisar').click(function() {
			var nomeMusica = $('#txt-pesquisa').val();
			$.ajax( {
				method: 'GET',
				url: '/TreinaWebSpringMVC/musicas/porNome?nome=' + nomeMusica,
				success: function(data) {
					$('#tbl-musicas tbody > tr').remove();
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
					});
				},
				error: function() {
					alert("Houve um erro na requisição.");
				}
			});
		});
	});
</script>
