package helperlandBackend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import helperlandBackend.models.ContactUs;
import helperlandBackend.models.FavouriteBlockedModel;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;
import helperlandBackend.service.ContactUsServiceImpl;
import helperlandBackend.service.LoginUserService;
import helperlandBackend.service.UserServiceImpl;

@Controller
@ComponentScan(basePackages={"helperlandBackend.dao,helperlandBackend.models,helperlandBackend.service"})
public class MainController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private ContactUsServiceImpl contactUsService;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	
	@RequestMapping({"/home" , "/"})
	public String home(Model model) {
		Object loggedInUserDetailsObject = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loggedInUserDetailsObject instanceof UserDetails) {
			User loggedInUserDetails = (User)loggedInUserDetailsObject;
			UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
			model.addAttribute("user" , currentUser);
			return "home";
		}
		else {
			return "home";
		}
	}
	
	
	@RequestMapping(value = "/contact" , method = RequestMethod.GET)
	public String contact(Model model) {
		Object loggedInUserDetailsObject = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loggedInUserDetailsObject instanceof UserDetails) {
			System.out.println(loggedInUserDetailsObject);
			
			User loggedInUserDetails = (User)loggedInUserDetailsObject;
			UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
			model.addAttribute("user" , currentUser);
			return "contact";
		}
		else {
			return "contact";
		}
	}
	
	@RequestMapping(value  = "/contact" , method=RequestMethod.POST)
	public String handleContactUs(@Valid @ModelAttribute ContactUs contactUs , BindingResult br , Model model) {
		
		if(br.hasErrors()) {
			model.addAttribute("error" , "please enter all fields with valid details to submit form");
			model.addAttribute("displayError" , "style='display: block !important;'");
			return "contact";
		}
		else {
			model.addAttribute("success" , "Your response submitted. Thank you!");
			model.addAttribute("displaySuccess" , "style='display: block !important;'");
			contactUs.setName(contactUs.getFirstname() , contactUs.getLastname());
			contactUs.setCreated_by(this.contactUsService.getContactUsUser(contactUs));
			this.contactUsService.createContactUs(contactUs);
			return "contact";
		}
	}
	@RequestMapping( value = "/about")
	public String about(Model model) {
		Object loggedInUserDetailsObject = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loggedInUserDetailsObject instanceof UserDetails) {
			User loggedInUserDetails = (User)loggedInUserDetailsObject;
			UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
			model.addAttribute("user" , currentUser);
			return "about";
		}
		else {
			return "about";
		}		
	}
	@RequestMapping("/faqs")
	public String faqs(Model model) {
		Object loggedInUserDetailsObject = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loggedInUserDetailsObject instanceof UserDetails) {
			User loggedInUserDetails = (User)loggedInUserDetailsObject;
			UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
			model.addAttribute("user" , currentUser);
			return "faqs";
		}
		else {
			return "faqs";
		}
	}
	@RequestMapping("/prices")
	public String prices(Model model) {
		Object loggedInUserDetailsObject = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loggedInUserDetailsObject instanceof UserDetails) {
			User loggedInUserDetails = (User)loggedInUserDetailsObject;
			UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
			model.addAttribute("user" , currentUser);
			return "prices";
		}
		else {
			return "prices";
		}
	}
	
	@RequestMapping("/become-a-pro")
	public String becomeAPro(Model model) {
		return "becomeAPro";
	}
	
	@RequestMapping("/service-booking")
	public String serviceBooking(Model model) {
		
		User loggedInUserDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		List<UserAddress> allAddresses = this.userService.getAllAddressByUserId(currentUser.getUser_id());
		List<FavouriteBlockedModel> favBlockList = this.userService.getFavBlockByUserId(currentUser.getUser_id());
		List<FavouriteBlockedModel> favSp = new ArrayList<FavouriteBlockedModel>();
		Set<UserModel> favUsers = new HashSet<UserModel>();
		
		for(FavouriteBlockedModel i: favBlockList) {
			if(i.getIs_favourite() == 1) {
				favSp.add(i);
			}
		}
		for(FavouriteBlockedModel i : favSp) {
			UserModel u = this.userService.getUserByUserId(i.getTarget_user_id());
			favUsers.add(u);
		}
		model.addAttribute("addresses",allAddresses);
		model.addAttribute("user" , currentUser);
		model.addAttribute("favSp" , favSp);
		model.addAttribute("favUsers" , favUsers);
		return "serviceBooking";
	}
	@RequestMapping(value = "/user-register" , method = RequestMethod.GET)
	public String userRegister() {
		return "userRegistration";
	}
	
	public static boolean patternMatches(String emailAddress, String regexPattern) {
	    return Pattern.compile(regexPattern)
	      .matcher(emailAddress)
	      .matches();
	}
	
	@Autowired
	private LoginUserService loginUserService;
	
	@Autowired
	private AuthenticationManager authenticationManager;

	@RequestMapping(value = "/user-register" , method = RequestMethod.POST)
	public String regUser(@Valid @ModelAttribute ("userreg") UserModel user , BindingResult br, Model model , HttpSession session , HttpServletRequest request) throws IOException {
		Date dateToday = new Date();
		
		String unEncodedPass = user.getPassword();
		
		user.setUser_profile_picture("avatar-hat");		
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		user.setIs_registered_user(1);
		user.setWorks_with_pet(1);
		user.setModified_by(1);
		user.setIs_approved(1);
		user.setIs_active(0);
		user.setIs_deleted(0);
		user.setIs_online(1);
		user.setCreated_date(dateToday);
		user.setModified_date(dateToday);
		user.setStatus(1);
		
		if(br.hasErrors()) {
			String regexPattern = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
			if(!patternMatches(user.getEmail() , regexPattern)) {
				model.addAttribute("emailError" , "Not matching email format.");
			}
			if(user.getMobile().length() > 12 || user.getMobile().length() < 10) {
				model.addAttribute("mobileError" , "Mobile number must be 10 to 12 digits.");
			}
			if(user.getUser_type_id() == 1) {
				model.addAttribute("error" , "please enter all fields with valid details to submit form.");
				model.addAttribute("displayError" , "style='display: block !important;'");
				return "userRegistration";
			}
			else if(user.getUser_type_id() == 2) {
				model.addAttribute("error" , "please enter all fields perfectly to submit form.");
				model.addAttribute("displayError" , "style='display: block !important;'");
				return "becomeAPro";
			}
		return "userRegistration";
		}
		else {
			int k = this.userService.createUser(user);
			if(k == 0) {
				if(user.getUser_type_id() == 2) {
					model.addAttribute("alreadyUser" , "You already have an account, Please Login!!");
					model.addAttribute("displayAlreadyUser" , "style='display: block !important;'");
					return "becomeAPro";
				}
				else if(user.getUser_type_id() == 1) {
					model.addAttribute("alreadyUser" , "You already have an account, Please Login!!");
					model.addAttribute("displayAlreadyUser" , "style='display: block !important;'");
					return "userRegistration";
				}
				else {
					return "home";
				}
			}
			else {
				UsernamePasswordAuthenticationToken authToken = new UsernamePasswordAuthenticationToken(user.getEmail(), unEncodedPass);
		        authToken.setDetails(new WebAuthenticationDetails(request));
		        Authentication authentication = authenticationManager.authenticate(authToken);
		        SecurityContextHolder.getContext().setAuthentication(authentication);

				if(user.getUser_type_id() == 1) {
					session.setAttribute("user" , user);
					return "redirect:/customer/dash";
				}
				else if(user.getUser_type_id() == 2) {
					session.setAttribute("user" , user);
					return "redirect:/service-provider/dash";
				}
				else {
					return "home";
				}
			}
		}        
	}

	@RequestMapping(value = "/login")
	public String login(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("loginErrorMessage" , "invalid username or password");
		redirectAttributes.addFlashAttribute("displayLoginError" , "style='display: block !important;'");
		return "redirect:user-register";
	}
	
	@RequestMapping(value = "/accessDenied")
	public String accessDenied(Model model) {
		return "403accessDenied";
	}
	
	@Autowired
	private PasswordEncoder passEncoder;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/change-password" , method=RequestMethod.POST)
	public ResponseEntity changePassword(@RequestParam("oldPassword") String oldPasswordRaw , @RequestParam("newPassword") String newPasswordRaw , @RequestParam("confirmPassword") String confirmPasswordRaw ){
		
		User loggedInUserDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		String newPassword = passEncoder.encode(newPasswordRaw);	
		if(passEncoder.matches(oldPasswordRaw, currentUser.getPassword())) {
			if(passEncoder.matches(confirmPasswordRaw, newPassword)) {
				Date dateToday = new Date();
				currentUser.setPassword(newPassword);
				currentUser.setModified_date(dateToday);
				currentUser.setModified_by(currentUser.getUser_id());
				this.userService.updateUser(currentUser);
				return ResponseEntity.status(HttpStatus.OK).body("changed");
			}
			else {
				return ResponseEntity.status(HttpStatus.OK).body("different");
			}	
		}
		else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("error");
		}
	}
	
}

