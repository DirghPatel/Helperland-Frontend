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

import helperlandBackend.models.FavouriteBlockedModel;
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
	
	@Transactional
	public UserModel getUserByUserId(int user_id) {
		Session session = factory.getCurrentSession();
		try {
		  Query<UserModel> query = session.createQuery("from user where user_id =:id",UserModel.class);
		  query.setParameter("id", user_id);
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
	public List<UserAddress> getAllUserAddress() {

		return factory.getCurrentSession().createQuery("from user_address ")
                .list();
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<UserAddress> getAllAddressByUserId(int id) {
		
		return factory.getCurrentSession().createQuery("from user_address E where E.user_id = :id and E.is_deleted = 0")
                .setParameter("id", id)
                .list();
	
	}
	
	@Transactional
	public UserAddress getAllAddressByAddressId(int id) {
		Session session = factory.getCurrentSession();
		try {
		  Query<UserAddress> query = session.createQuery("from user_address E where E.address_id = :id and E.is_deleted = 0",UserAddress.class);
		  query.setParameter("id", id);
		  UserAddress userAddress = query.getSingleResult();
		 
		  return userAddress;
		}
		catch (NoResultException e) {
			return null;
		}
	}
	
	@Transactional
	public int addFavBlock(FavouriteBlockedModel favBlockModel) {
		int id = (Integer) this.hibernateTemplate.save(favBlockModel);
		return id;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<FavouriteBlockedModel> getFavBlockByUserId(int user_id) {
		return factory.getCurrentSession().createQuery("from favourite_blocked where user_id = :id")
				.setParameter("id",user_id )
				.list();
	}

	@Transactional
	public FavouriteBlockedModel getFavBlockByUserIdAndTargetUserId(int user_id , int target_user_id) {
		Session session = factory.getCurrentSession();
		try {
		  Query<FavouriteBlockedModel> query = session.createQuery("from favourite_blocked where user_id = :id and target_user_id = :targetId",FavouriteBlockedModel.class);
		  query.setParameter("id", user_id);
		  query.setParameter("targetId", target_user_id);
		  FavouriteBlockedModel favBlock = query.getSingleResult();
		
		  return favBlock;
		}
		catch (NoResultException e) {
			return null;
		}
	}

	
	@Transactional
	public FavouriteBlockedModel getFavBlockById(int id) {
		Session session = factory.getCurrentSession();
		
		try {
			Query<FavouriteBlockedModel> query = session.createQuery("from favourite_blocked where id=:id" , FavouriteBlockedModel.class);
			query.setParameter("id", id);
			FavouriteBlockedModel favBlockModel = query.getSingleResult();
			return favBlockModel;
		}
		catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	public void updateFavBlock(FavouriteBlockedModel favBlock) {		
		this.hibernateTemplate.update(favBlock);
	}

	@Transactional
	public void updateUserAddress(UserAddress userAddress) {
		this.hibernateTemplate.update(userAddress);
	}
	
}