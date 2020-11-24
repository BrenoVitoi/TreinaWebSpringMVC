<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>Listagem de músicas</h2>
<br />
<table class="table">
	<thead>
		<th>ID</th>
		<th>Nome da música</th>
		<th>Data de criação</th>
		<th>Nome do Álbum</th>
		<th>Ações</th>
	</thead>
	<tbody>
		<c:if test="${!empty musicas}">
			<c:forEach items="${musicas}" var="musicas">
				<tr>
					<td>${musica.id}</td>
					<td>${musica.nome}</td>
					<td>${musica.dataCriacao}</td>
					<td>${musica.album.nome}</td>
					<td><a href="/TreinaWebSpringMVC/musicas/alterar/${musica.id}">Alterar</a>
						| <a href="/TreinaWebSpringMVC/musicas/excluir/${musica.id}">Excluir</a>
						|</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br />
<a href="/TreinaWebSpringMVC/musicas/adicionar" class="btn btn-default">Adicionar
	nova música</a>