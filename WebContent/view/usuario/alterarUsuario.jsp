
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Usuário</title>
</head>
<body>

	<c:import url="/view/comum/menu.jsp" />

	<hr>
	<h3>Alterar Usuário</h3>
	<hr>
	
	<form action="alterarUsuario" method="post">
	
		<input type="hidden" name="id" value="${usuario.id}">
		
		<p>
			Nome: <br />
			<input type="text" name="nome" style="width: 80px;" value="${usuario.nome}" />
		</p>
		
		<p>
			E-mail: <br />
			<input type="text" name="email" style="width: 400px;" value="${usuario.email}" />
		</p>
		
		<p>
			Login: <br />
			<input type="text" name="login" value="${usuario.login}" />
		</p>
		
		<p>
			Senha: <br />
			<input type="password" name="senha" value="${usuario.senha}" />
		</p>
		
		<br />
		
		<p>
			<input type="reset" value="Limpar"> &nbsp; &nbsp;
			<input type="submit" value="Inserir">
		</p>
		
	</form>

</body>
</html>