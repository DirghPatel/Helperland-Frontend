package helperlandBackend.dao;

import helperlandBackend.models.UserModel;



public interface UserDao{
	
	public int saveUser(UserModel user);
	
	public UserModel loginUser(String email);
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



