<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pesquisar Categoria de Produto</title>
</head>
<body>

	<c:import url="/view/comum/menu.jsp" />

	<div style="color: red;" align="center"> <h3> ${msg} </h3> </div>

	<hr>
	<h3>Pesquisar Categoria de Produto</h3>
	<hr>
	
	<table border='1' style='width: 100%;'>
		<tr style='background-color: #E6E6E6; font-weight: bold;'>
			<td> ID </td>
			<td> CÓDIGO </td>
			<td> DESCRIÇÃO </td>
			<td> AÇÕES </td>
		</tr>
	
	<c:forEach var="c" items="${listaCategoriaProduto}">
		<tr>
	    	<td> ${c.id} </td>
	    	<td> ${c.codigo} </td>
	    	<td> ${c.descricao} </td>
	    	<td>
	    		<a href='exibirAlterarCategoriaProduto?id=${c.id}'>Editar</a> &nbsp;
	    		<a href='removerCategoriaProduto?id=${c.id}'>Remover</a>
	    	</td>
	    </tr>
	</c:forEach>
	</table>

</body>
</html>