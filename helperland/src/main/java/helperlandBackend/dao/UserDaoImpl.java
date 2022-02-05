package helperlandBackend.dao;

import java.util.Optional;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import helperlandBackend.models.UserModel;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int saveUser(UserModel user) {
		int id = (Integer) this.hibernateTemplate.save(user);
		return id;
	}
	
	@Autowired
	private SessionFactory factory;

	@Transactional
	public UserModel loginUser(String email) {
		Session session = factory.getCurrentSession();
		try {
		  Query<UserModel> query = session.createQuery("from user where email =:userName",UserModel.class);
		  query.setParameter("userName", email);
		  UserModel user = query.getSingleResult();
		  System.out.println(user);
		  return user;
		}
		catch (NoResultException e) {
			return null;
		}
	}
	
	@Transactional
	public void updateUser(UserModel user) {
		this.hibernateTemplate.update(user);
	}
	
	@Transactional
	public Optional<UserModel> findByResetToken(String resetToken) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		try {
		  Query<UserModel> query = session.createQuery("from user where reset_token =:token",UserModel.class);
		  query.setParameter("token", resetToken);
		  Optional<UserModel> user = Optional.of(query.getSingleResult());
		  System.out.println(user);
		  return user;
		}
		catch (NoResultException e) {
			return null;
		}
	}
	


}