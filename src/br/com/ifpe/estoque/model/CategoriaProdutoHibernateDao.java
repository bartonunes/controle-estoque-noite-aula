package br.com.ifpe.estoque.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CategoriaProdutoHibernateDao extends HibernateDao {

	public Class getClassEntidade() {
		return CategoriaProduto.class;
	}
	
	public List<CategoriaProduto> listar() {

		List<CategoriaProduto> lista = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		lista = manager.createQuery("SELECT p FROM CategoriaProduto p ORDER BY p.descricao").getResultList();
		manager.close();
		factory.close();

		return lista;
	}
}
