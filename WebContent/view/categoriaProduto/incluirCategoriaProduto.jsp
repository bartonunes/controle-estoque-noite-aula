
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Incluir Categoria de Produto</title>
</head>
<body>

	<c:import url="/view/comum/menu.jsp" />

	<hr>
	<h3>Incluir Categoria de Produto</h3>
	<hr>
	
	<form action="incluirCategoriaProduto" method="post">
		
		<form:errors path="categoriaProduto.codigo" cssStyle="color:red" /> <br/>
		<form:errors path="categoriaProduto.descricao" cssStyle="color:red" />
		
		<p>
			Código: <br />
			<input type="text" name="codigo" style="width: 80px;" maxlength="5" />
		</p>
		
		<p>
			Descrição: <br />
			<input type="text" name="descricao" style="width: 400px;" />
		</p>
		
		<br />
		
		<p>
			<input type="reset" value="Limpar"> &nbsp; &nbsp;
			<input type="submit" value="Inserir">
		</p>
		
	</form>

</body>
</html>