package helperlandBackend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Service;

import helperlandBackend.dao.UserDao;
import helperlandBackend.models.UserModel;

@Service
public class LoginUserService implements UserDetailsService{

	@Autowired
	private UserDao userDao;
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserModel user = userDao.getUserByEmail(username);

		System.out.println(user.getEmail());
		System.out.println(user.getPassword());
		
		UserBuilder builder = null;
		if (user != null) {
			
//			builder = org.springframework.security.core.userdetails.User.withUsername(username);
			builder = User.withUsername(username);
//			builder.password("{noop}".concat(user.getPassword()));
			builder.password(user.getPassword());
			
			if (user.getUser_type_id() == 1) {
				builder.roles("CUSTOMER");
			} else if (user.getUser_type_id() == 2) {
				builder.roles("SP");
			} else {
				builder.roles("ADMIN");
			}
		} 
		
		System.out.println(builder.toString());
		
		return builder.build();
	}
	
}
