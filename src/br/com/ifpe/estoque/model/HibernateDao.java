package br.com.ifpe.estoque.model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public abstract class HibernateDao {

	protected static final String PERSISTENCE_UNIT = "estoque";

	public void salvar(Object obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.persist(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	public void alterar(Object obj) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();

		manager.getTransaction().begin();
		manager.merge(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	public void remover(int id) {

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Object obj = manager.find(getClassEntidade(), id);

		manager.getTransaction().begin();
		manager.remove(obj);
		manager.getTransaction().commit();

		manager.close();
		factory.close();
	}

	public Object buscarPorId(int id) {

		Object obj = null;

		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(getClassEntidade(), id);
		manager.close();
		factory.close();

		return obj;
	}

    public abstract Class getClassEntidade();
    
}
