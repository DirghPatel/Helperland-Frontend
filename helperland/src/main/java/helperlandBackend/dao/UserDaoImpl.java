package helperlandBackend.dao;

import java.util.List;
import java.util.Optional;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import helperlandBackend.models.UserAddress;
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
	public UserModel getUserByEmail(String email) {
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
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<UserModel> getAllUser() {

		return factory.getCurrentSession().createQuery("from user ")
                .list();
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
	
	
	@Transactional
	public int addUserAddress(UserAddress userAddress) {
		int id = (Integer) this.hibernateTemplate.save(userAddress);
		return id;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<UserAddress> getAllAddress(int id) {
		
		return factory.getCurrentSession().createQuery("from user_address E where E.user_id = :id ")
                .setParameter("id", id)
                .list();
	
	}
	
	@Transactional
	public UserAddress getAllAddressByAddressId(int id) {
//		return (UserAddress) factory.getCurrentSession().createQuery("from user_address E where E.address_id = :id ")
//                .setParameter("id", id);
		Session session = factory.getCurrentSession();
		try {
		  Query<UserAddress> query = session.createQuery("from user_address E where E.address_id = :id",UserAddress.class);
		  query.setParameter("id", id);
		  UserAddress userAddress = query.getSingleResult();
		 
		  return userAddress;
		}
		catch (NoResultException e) {
			return null;
		}
	}
	
}