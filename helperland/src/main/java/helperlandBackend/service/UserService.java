package helperlandBackend.service;

import java.util.List;
import java.util.Optional;

import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;

public interface UserService{
	
	public int createUser(UserModel user);
	
	public UserModel getUserByEmail(String email);
	
	public List<UserModel> getAllUser();
	
	public void updateUser(UserModel user);
	
	public Optional<UserModel> findUserByResetToken(String resetToken);
	
	public int saveUserAddress(UserAddress userAddress);
	
	public List<UserAddress> getAllAddress(int id);
	
	public UserAddress getAllAddressByAddressId(int id);
}