<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
	
		$("#descricao").keyup(function() {
			
			var texto = $('#descricao').val();
			var idCategoria = $('#categoriaProduto').val();
			
			$.post("pesquisarProduto", {'descricao' : texto, 'idCategoria' : idCategoria}, function(dados) {
	           $('#tabelaListaProduto').html(dados);
	        });
		});
	
		
		$("#categoriaProduto").change(function() {
			
			var texto = $('#descricao').val();
			var idCategoria = $('#categoriaProduto').val();
			
			$.post("pesquisarProduto", {'descricao' : texto, 'idCategoria' : idCategoria}, function(dados) {
	           $('#tabelaListaProduto').html(dados);
	        });
		});
	});

</script>

</head>
<body>

	<c:import url="/view/comum/menu.jsp" />
	
	<hr> <h3>Pesquisar Produto</h3>
	<div>
	    <p>
	      Descrição: <br />
	      <input type="text" id="descricao" name="descricao" value="${produto.descricao}">
	    </p>
	    <p>
		  Categoria: <br />
		  <select id="categoriaProduto" name="categoriaProduto" >
		    <option value=""> Selecione </option>
			  <c:forEach items="${listaCategoriaProduto}" var="obj">
			    <option value="${obj.id}"> ${obj.descricao} </option>
			  </c:forEach> 
		  </select>
	    </p>
	</div>

	<hr><h3>Listar Produto</h3><hr>
	
	<div style="text-align: center; color: red;"> ${mensagem} </div>

	<table border='1' style='width: 100%;' id="tabelaListaProduto">
		<tr style='background-color: #E6E6E6; font-weight: bold;'>
			<td> CATEGORIA </td>
			<td> CÓDIGO </td>
			<td> DESCRIÇÃO </td>
			<td> PREÇO DE CUSTO </td>
			<td> PREÇO DE VENDA </td>
			<td> GARANTIA </td>
			<td> QUANTIDADE </td>
			<td> IMAGEM </td>
			<td> # </td>
		</tr>
	
		<c:forEach var="produto" items="${listaProduto}">
			<tr>
				<td> ${produto.categoriaProduto.descricao} </td>
				<td> ${produto.codigo} </td>
				<td> ${produto.descricao} </td>
				<td> ${produto.precoCusto} </td>
				<td> ${produto.precoVenda} </td>
				<td> <fmt:formatDate value="${produto.garantia}" pattern="dd/MM/yyyy" /> </td>
				<td> ${produto.quantidade} </td>
				<td> <img alt="" src="view/img/${produto.imagem}" style="width: 30%;"> </td>
				<td>
					<a href="exibirAlterarProduto?id=${produto.id}">Alterar</a>
					<a href="removerProduto?id=${produto.id}">Remover</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>

</body>
</html>