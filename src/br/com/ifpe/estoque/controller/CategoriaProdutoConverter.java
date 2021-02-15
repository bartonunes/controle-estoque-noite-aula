package br.com.ifpe.estoque.controller;

import org.springframework.core.convert.converter.Converter;

import br.com.ifpe.estoque.model.CategoriaProduto;
import br.com.ifpe.estoque.model.CategoriaProdutoDao;

public class CategoriaProdutoConverter implements Converter<String, CategoriaProduto> {

	public CategoriaProduto convert(String id) {

		if (id != null && !id.equals("")) {
			CategoriaProdutoDao dao = new CategoriaProdutoDao();
			return dao.buscarPorId(Integer.valueOf(id));
		} else {
			return null;
		}
	}
}