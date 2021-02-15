<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:import url="/view/comum/menu.jsp" />

	<hr><h3>Alterar Produto</h3><hr>
	
	<div style="text-align: center; color: red;"> ${msg} </div>
	
	<form action="alterarProduto" method="post" enctype="multipart/form-data">

		<input type="hidden" name="id" value="${produto.id}" />
	
		<p>
			Código: <br />
			<input type="text" name="codigo" value="${produto.codigo}" />
		</p>
		
		<p>
			Categoria: <br />
			<select name="categoriaProduto" >
				<option value=""> Selecione </option>
				<c:forEach items="${listaCategoriaProduto}" var="obj">
					<option value="${obj.id}" <c:if test="${obj.id eq produto.categoriaProduto.id}">selected="selected"</c:if>> 
						${obj.descricao} 
					</option>
				</c:forEach> 
			</select>
		</p>
		
		<p>
			Descrição: <br />
			<input type="text" name="descricao" value="${produto.descricao}" />
		</p>
		
		<p>
			Preço de Custo: <br />
			<input type="text" name="precoCusto" value="${produto.precoCusto}" />
		</p>
		
		<p>
			Preço de Venda: <br />
			<input type="text" name="precoVenda" value="${produto.precoVenda}" />
		</p>
		
		<p>
			Data de Garantia: <br />
			<input type="text" name="garantia" value="<fmt:formatDate value='${produto.garantia}' pattern='dd/MM/yyyy' />" />
		</p>
		
		<p>
			Quantidade: <br />
			<input type="text" name="quantidade" value="${produto.quantidade}" />
		</p>
		
		<p>
			Foto: <br />
			<input type="hidden" name="imagem" value="${produto.imagem}" />
			<img alt="" src="view/img/${produto.imagem}" style="width: 30%;">
		</p>
		
		<p>
			Selecione uma nova foto para este produto: <br />
			<input type="file" name="file">
		</p>
		
		<p> <input type="submit" value="Alterar"> </p>
	</form>

</body>
</html>