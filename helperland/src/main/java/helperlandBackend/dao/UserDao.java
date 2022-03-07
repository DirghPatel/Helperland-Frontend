package helperlandBackend.dao;

import java.util.List;
import java.util.Optional;

import helperlandBackend.models.FavouriteBlockedModel;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;



public interface UserDao{
	
	public int saveUser(UserModel user);
	
	public UserModel getUserByEmail(String email);
	
	public UserModel getUserByUserId(int user_id);
	
	public List<UserModel> getAllUser();
	
	Optional<UserModel> findByResetToken(String resetToken);

	public void updateUser(UserModel user);
	
	public int addUserAddress(UserAddress userAddress);
	
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

