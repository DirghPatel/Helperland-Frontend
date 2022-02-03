package helperlandBackend.service;

import helperlandBackend.models.UserModel;

//@Service
//public class UserService  {
//
//	@Autowired
//	private UserDao userDao;
//	
//	public int createUser(UserModel user) {
//		
//		UserModel alreadyUser = userDao.loginUser(user.getEmail());
//		
//		if(alreadyUser == null) {
//			return this.userDao.saveUser(user);
//		}
//		else{
//			return 0;
//		}
//	}
//
//	public UserModel loginUser(String email) {
//		return userDao.loginUser(email);
//	}
//
//}


public interface UserService{
	
	public int createUser(UserModel user);
	
	public UserModel loginUser(String email);
	
}