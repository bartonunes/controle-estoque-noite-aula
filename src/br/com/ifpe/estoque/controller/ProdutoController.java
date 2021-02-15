package br.com.ifpe.estoque.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import br.com.ifpe.estoque.model.CategoriaProduto;
import br.com.ifpe.estoque.model.CategoriaProdutoDao;
import br.com.ifpe.estoque.model.Produto;
import br.com.ifpe.estoque.model.ProdutoDao;
import br.com.ifpe.estoque.model.ProdutoHibernateDao;
import br.com.ifpe.estoque.util.Util;

@Controller
public class ProdutoController {

	@RequestMapping("/exibirIncluirProduto")
	public String exibirIncluirProduto(Model model) {

		// Código para popular o combo de categoria de produto
		CategoriaProdutoDao dao = new CategoriaProdutoDao();
		List<CategoriaProduto> listaCategoriaProduto = dao.listar();
		model.addAttribute("listaCategoriaProduto", listaCategoriaProduto);

		return "produto/incluirProduto";
	}

	@RequestMapping("/incluirProduto")
	public String incluirProduto(Produto produto, @RequestParam("file") MultipartFile imagem, Model model) {

		if (Util.fazerUploadImagem(imagem)) {
			produto.setImagem(Calendar.getInstance().getTime() + " - " + imagem.getOriginalFilename());
		}

		ProdutoHibernateDao dao = new ProdutoHibernateDao();
		dao.salvar(produto);
		model.addAttribute("msg", "O produto " + produto.getDescricao() + " foi incluído com sucesso !");

		return "produto/incluirProduto";
	}

	@RequestMapping("/listarProduto")
	public String listarProduto(Model model) {

		ProdutoHibernateDao dao = new ProdutoHibernateDao();
		List<Produto> listaProduto = dao.listar();
		model.addAttribute("listaProduto", listaProduto);

		// Código para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listaCategoriaProduto = dao2.listar();
		model.addAttribute("listaCategoriaProduto", listaCategoriaProduto);

		return "produto/pesquisarProduto";
	}

	@RequestMapping("/pesquisarProduto")
	public @ResponseBody String pesquisarProduto(@RequestParam String descricao, @RequestParam Integer idCategoria,
			HttpServletResponse response) {

		ProdutoHibernateDao dao = new ProdutoHibernateDao();
		List<Produto> listaProduto = dao.pesquisar(descricao, idCategoria);

		StringBuilder st = new StringBuilder();

		st.append("<tr style='background-color: #E6E6E6; font-weight: bold;'>");
		st.append("<td> CATEGORIA </td>");
		st.append("<td> CÓDIGO </td>");
		st.append("<td> DESCRIÇÃO </td>");
		st.append("<td> PREÇO DE CUSTO </td>");
		st.append("<td> PREÇO DE VENDA </td>");
		st.append("<td> GARANTIA </td>");
		st.append("<td> QUANTIDADE </td>");
		st.append("<td> IMAGEM </td>");
		st.append("<td> # </td>");
		st.append("</tr>");

		for (Produto produto : listaProduto) {
			st.append("<tr>");
			st.append("<td> " + produto.getCategoriaProduto().getDescricao() + " </td>");
			st.append("<td> " + produto.getCodigo() + " </td>");
			st.append("<td> " + produto.getDescricao() + " </td>");
			st.append("<td> " + produto.getPrecoCusto() + " </td>");
			st.append("<td> " + produto.getPrecoVenda() + " </td>");
			st.append("<td> " + produto.getGarantia() + " </td>");
			st.append("<td> " + produto.getQuantidade() + " </td>");
			st.append("<td> <img alt='' src='view/img/" + produto.getImagem() + "' style='width: 30%;'> </td>");
			st.append("<td>");
			st.append("<a href='exibirAlterarProduto?id=" + produto.getId() + "'>Editar</a> &nbsp;");
			st.append("<a href='removerProduto?id=" + produto.getId() + "'>Remover</a>");
			st.append("</td>");
			st.append("</tr>");
		}

		response.setStatus(200);
		return st.toString();
	}

	@RequestMapping("exibirAlterarProduto")
	public String exibirAlterarProduto(Produto produto, Model model) {

		ProdutoHibernateDao dao = new ProdutoHibernateDao();
		Produto produtoCompleto = (Produto) dao.buscarPorId(produto.getId());
		model.addAttribute("produto", produtoCompleto);

		// Código para popular o combo de categoria de produto
		CategoriaProdutoDao dao2 = new CategoriaProdutoDao();
		List<CategoriaProduto> listaCategoriaProduto = dao2.listar();
		model.addAttribute("listaCategoriaProduto", listaCategoriaProduto);

		return "produto/alterarProduto";
	}

	@RequestMapping("/alterarProduto")
	public String alterarProduto(Produto produto, @RequestParam("file") MultipartFile imagem, Model model) {

		if (Util.fazerUploadImagem(imagem)) {
			produto.setImagem(Calendar.getInstance().getTime() + " - " + imagem.getOriginalFilename());
		}

		ProdutoHibernateDao dao = new ProdutoHibernateDao();
		dao.alterar(produto);
		model.addAttribute("mensagem", "O produto " + produto.getDescricao() + " foi alterado com sucesso !");

		return "forward:listarProduto";
	}

	@RequestMapping("removerProduto")
	public String removerProduto(Produto produto, Model model) {

		ProdutoHibernateDao dao = new ProdutoHibernateDao();
		dao.remover(produto.getId());
		model.addAttribute("mensagem", "Produto Removido com Sucesso");

		return "forward:listarProduto";
	}
}
