package helperlandBackend.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import helperlandBackend.models.UserModel;
import helperlandBackend.service.UserService;

public class SuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	UserService userService;
	
	

	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		User loggedInUserDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		UserModel loggedInUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		session.setAttribute("user", loggedInUser);
		
		System.out.println("----------"+loggedInUser);
		
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
        if (roles.contains("ROLE_CUSTOMER")) {
            response.sendRedirect("customer/dash");
        }
        else if (roles.contains("ROLE_SP")) {
            response.sendRedirect("service-provider/dash");
        }
        else if (roles.contains("ROLE_ADMIN")) {
            response.sendRedirect("admin/user-management");
        }
	}
}