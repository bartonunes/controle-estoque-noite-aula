<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Incluir Produto</title>
</head>
<body>

	<c:import url="/view/comum/menu.jsp" />

	<hr><h3>Incluir Produto</h3><hr>
	
	<div style="text-align: center; color: red;"> ${msg} </div>
	
	<form action="incluirProduto" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="acao" value="incluir">
	
		<p>
			Código: <br />
			<input type="text" name="codigo" />
		</p>
		
		<p>
			Categoria: <br />
			<select name="categoriaProduto" >
				<option value=""> Selecione </option>
				<c:forEach items="${listaCategoriaProduto}" var="obj">
					<option value="${obj.id}"> ${obj.descricao} </option>
				</c:forEach> 
			</select>
		</p>
		
		<p>
			Descrição: <br />
			<input type="text" name="descricao" />
		</p>
		
		<p>
			Preço de Custo: <br />
			<input type="text" name="precoCusto" />
		</p>
		
		<p>
			Preço de Venda: <br />
			<input type="text" name="precoVenda" />
		</p>
		
		<p>
			Data de Garantia: <br />
			<input type="text" name="garantia" />
		</p>
		
		<p>
			Quantidade: <br />
			<input type="text" name="quantidade" />
		</p>
		
		<p>
			Foto do Produto: <br />
			<input type="file" name="file">
		</p>
		
		<p> <input type="submit" value="Inserir"> </p>
	</form>

</body>
</html>