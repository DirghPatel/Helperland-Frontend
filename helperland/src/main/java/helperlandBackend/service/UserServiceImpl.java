package helperlandBackend.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperlandBackend.dao.UserDao;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;

@Service
public class UserServiceImpl implements UserService  {

	@Autowired
	private UserDao userDao;
	
	public int createUser(UserModel user) {
		
		UserModel alreadyUser = userDao.getUserByEmail(user.getEmail());
		System.out.println("------"+alreadyUser);
		
		if(alreadyUser == null) {
			System.out.println("ssssssssssssssssssssss");
			return this.userDao.saveUser(user);
		}
		else{
			System.out.println("fffffffffffffffffffffff");
			return 0;
		}
	}

	public UserModel getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}
	
	public List<UserModel> getAllUser() {
		return this.userDao.getAllUser();
	}

	public void updateUser(UserModel user) {
			this.userDao.updateUser(user);
		}
		
	public Optional<UserModel> findUserByResetToken(String resetToken) {
		return userDao.findByResetToken(resetToken);
	}

	public int saveUserAddress(UserAddress userAddress) {
		
		return this.userDao.addUserAddress(userAddress);
	}

	public List<UserAddress> getAllAddress(int id) {
		return this.userDao.getAllAddress(id);
	}
	
	public UserAddress getAllAddressByAddressId(int id) {
		return this.userDao.getAllAddressByAddressId(id);
	}

	
}
