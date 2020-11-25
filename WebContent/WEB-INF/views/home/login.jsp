<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h2>Login no Sistema</h2>
<br>
<%
if(request.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION") != null
    &&
    ((Exception) request.getSession().getAttribute("SPRING_SECURITY_LAST_EXCEPTION"))
    .getMessage().equalsIgnoreCase("Bad credentials"))
{
    out.print("Usuário ou senha inválidos");
}
%>
<form action="/TreinaWebSpringMVC/login" method="post">

	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Usuário:</label>
				<input type="text" name="username" class="form-control" />
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Senha:</label>
				<input type="password" name="password" class="form-control" />
			</div>
		</div>
	</div>

	<input type="submit" value="Login" class="btn btn-default" />
</form>
