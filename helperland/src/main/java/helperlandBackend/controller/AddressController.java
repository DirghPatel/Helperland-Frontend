package helperlandBackend.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;
import helperlandBackend.service.UserServiceImpl;

@Controller
public class AddressController {

	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping(value = "/add-address" , method = RequestMethod.POST)
	public ResponseEntity<HttpStatus> addAddress(@Valid @ModelAttribute UserAddress userAddress , BindingResult br) {
		
		
		
		User loggedInUserDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		userAddress.setUser_id(currentUser.getUser_id());
		
		System.out.println(userAddress);
		
		this.userService.saveUserAddress(userAddress);
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
}
