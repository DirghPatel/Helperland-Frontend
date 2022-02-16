package helperlandBackend.dao;

import java.util.List;
import java.util.Optional;

import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;



public interface UserDao{
	
	public int saveUser(UserModel user);
	
	public UserModel getUserByEmail(String email);
	
	public List<UserModel> getAllUser();
	
	Optional<UserModel> findByResetToken(String resetToken);

	public void updateUser(UserModel user);
	
	public int addUserAddress(UserAddress userAddress);
	
	public List<UserAddress> getAllAddress(int id);
	
	public UserAddress getAllAddressByAddressId(int id);

}

