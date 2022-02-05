package helperlandBackend.dao;

import java.util.Optional;

import helperlandBackend.models.UserModel;



public interface UserDao{
	
	public int saveUser(UserModel user);
	
	public UserModel loginUser(String email);
	
	Optional<UserModel> findByResetToken(String resetToken);

	public void updateUser(UserModel user);
}

//@Repository
//public class UserDao {
//	
//	@Autowired
//	private HibernateTemplate hibernateTemplate;
//	
//	@Transactional
//	public int saveUser(UserModel user) {
//		int id = (Integer) this.hibernateTemplate.save(user);
//		return id;
//	}
//	
//	@Autowired
//	private SessionFactory factory;
//
//	@Transactional
//	public UserModel loginUser(String email) {
//		Session session = factory.getCurrentSession();
//		try {
//		  Query<UserModel> query = session.createQuery("from user where email =:userName",UserModel.class);
//		  query.setParameter("userName", email);
//		  UserModel user = query.getSingleResult();
//		  System.out.println(user);
//		  return user;
//		}
//		catch (NoResultException e) {
//			return null;
//		}
//	}
//	
//
//
//}



