<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>Listagem de álbuns</h2>
<br />
<table class="table">
	<thead>
		<th>ID</th>
		<th>Nome do álbum</th>
		<th>Ano do lançamento</th>
		<th>Ações</th>
	</thead>
	<tbody>
		<c:if test="${!empty albuns}">
			<c:forEach items="${albuns}" var="album">
				<tr>
					<td>${album.id}</td>
					<td>${album.nome}</td>
					<td>${album.anoDeLancamento}</td>
					<td><a href="/TreinaWebSpringMVC/albuns/alterar/${album.id}">Alterar</a>
						| <a href="/TreinaWebSpringMVC/albuns/excluir/${album.id}">Excluir</a>
						|</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br />
<a href="/TreinaWebSpringMVC/albuns/adicionar" class="btn btn-default">Adicionar
	novo álbum</a>