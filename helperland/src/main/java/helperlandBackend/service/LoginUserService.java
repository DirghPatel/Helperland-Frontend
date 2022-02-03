package helperlandBackend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Service;

import helperlandBackend.dao.UserDao;
import helperlandBackend.models.UserModel;

@Service
public class LoginUserService implements UserDetailsService{

	@Autowired
	private UserDao userDao;
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserModel user = userDao.loginUser(username);

		UserBuilder builder = null;
		if (user != null) {
			
			builder = org.springframework.security.core.userdetails.User.withUsername(username);
			builder.password("{noop}".concat(user.getPassword()));
			if (user.getUser_type_id() == 1) {
				builder.roles("CUSTOMER");
			} else if (user.getUser_type_id() == 2) {
				builder.roles("SP");
			} else {
				builder.roles("ADMIN");
			}
		} else {
			throw new UsernameNotFoundException("User not found.");
		}

		return builder.build();
	}
	
}
