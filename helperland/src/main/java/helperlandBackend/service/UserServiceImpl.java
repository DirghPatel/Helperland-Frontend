package helperlandBackend.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperlandBackend.dao.UserDao;
import helperlandBackend.models.UserModel;

@Service
public class UserServiceImpl implements UserService  {

	@Autowired
	private UserDao userDao;
	
	public int createUser(UserModel user) {
		
		UserModel alreadyUser = userDao.loginUser(user.getEmail());
		
		if(alreadyUser == null) {
			return this.userDao.saveUser(user);
		}
		else{
			return 0;
		}
	}

	public UserModel loginUser(String email) {
		return userDao.loginUser(email);
	}

	public void updateUser(UserModel user) {
			this.userDao.updateUser(user);
		}
		
	public Optional<UserModel> findUserByResetToken(String resetToken) {
		return userDao.findByResetToken(resetToken);
	}
}
