package helperlandBackend.service;

import java.util.List;
import java.util.Optional;

import helperlandBackend.models.FavouriteBlockedModel;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;

public interface UserService{
	
	public int createUser(UserModel user);
	
	public UserModel getUserByEmail(String email);
	
	public UserModel getUserByUserId(int user_id);
	
	public List<UserModel> getAllUser();
	
	public void updateUser(UserModel user);
	
	public Optional<UserModel> findUserByResetToken(String resetToken);
	
	public int saveUserAddress(UserAddress userAddress);
	
	public List<UserAddress> getAllUserAddress();
	
	public List<UserAddress> getAllAddressByUserId(int id);
	
	public UserAddress getAllAddressByAddressId(int id);
	
	public int addFavBlock(FavouriteBlockedModel favBlockModel);
	
	public List<FavouriteBlockedModel> getFavBlockByUserId(int user_id); 
	
	public FavouriteBlockedModel getFavBlockByUserIdAndTargetUserId(int user_id , int target_user_id); 
	
	public FavouriteBlockedModel getFavBlockById(int id); 

	
	public void updateFavBlock(FavouriteBlockedModel favBlock);
	
	public void updateUserAddress(UserAddress userAddress);
}