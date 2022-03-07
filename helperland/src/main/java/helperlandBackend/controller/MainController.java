package helperlandBackend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import helperlandBackend.models.ContactUs;
import helperlandBackend.models.FavouriteBlockedModel;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;
import helperlandBackend.service.ContactUsServiceImpl;
import helperlandBackend.service.UserServiceImpl;



@Controller
@ComponentScan(basePackages={"helperlandBackend.dao,helperlandBackend.models,helperlandBackend.service,helperlandBackend.interceptors"})
public class MainController {
	
	@Autowired
	private UserServiceImpl userService;

	
	@Autowired
	private ContactUsServiceImpl contactUsService;

	
	
	@RequestMapping({"/home" , "/"})
	public String home(Model model) {
		Object loggedInUserDetailsObject = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loggedInUserDetailsObject instanceof UserDetails) {
			System.out.println(loggedInUserDetailsObject);
			
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
			System.out.println("errors");
			model.addAttribute("error" , "please enter all fields to submit form");
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
			System.out.println(loggedInUserDetailsObject);
			
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
			System.out.println(loggedInUserDetailsObject);
			
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
			System.out.println(loggedInUserDetailsObject);
			
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
//		List<UserModel> favUsers = this.userService.getAllUser();
		
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

	@RequestMapping(value = "/user-register" , method = RequestMethod.POST)
	public String regUser(@Valid @ModelAttribute ("userreg") UserModel user , BindingResult br, Model model , HttpSession session , HttpServletRequest request) throws IOException {
		
		user.setUser_profile_picture("avatar-hat");
		
        System.out.println(user.getFirst_name() + user.getPassword());
		if(br.hasErrors()) {
			
			if(user.getUser_type_id() == 1) {
				model.addAttribute("error" , "please enter all fields to submit form");
				model.addAttribute("displayError" , "style='display: block !important;'");
				System.out.println("errror");
				return "userRegistration";
			}
			else if(user.getUser_type_id() == 2) {
				model.addAttribute("error" , "please enter all fields perfectly to submit form");
				model.addAttribute("displayError" , "style='display: block !important;'");
				System.out.println("errror");
				return "becomeAPro";
			}
		return "userRegistration";
		}
		else {
			int k = this.userService.createUser(user);
			if(k == 0) {
				System.out.println("aaaaaaaaaaaaaaaaaaaa");
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
				try {
					request.login(user.getEmail(), user.getPassword());
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
				} catch (ServletException e) {
					e.printStackTrace();
					return "home";
				}
			}
		}
        
	}

	@RequestMapping(value = "/login")
	public String login(Model model) {
		System.out.println("inside login");
		model.addAttribute("loginErrorMessage" , "invalid username or password");
		model.addAttribute("displayLoginError" , "style='display: block !important;'");
		return "userRegistration";
	}
	
	@RequestMapping(value = "/accessDenied")
	public String accessDenied(Model model) {
		return "403accessDenied";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/change-password" , method=RequestMethod.POST)
	public ResponseEntity changePassword(@RequestParam("oldPassword") String oldPassword , @RequestParam("newPassword") String newPassword , @RequestParam("confirmPassword") String confirmPassword ){
		
		User loggedInUserDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		System.out.println(currentUser.getPassword());
		System.out.println(oldPassword);
		
		if(oldPassword.equals(currentUser.getPassword())) {
			
			System.out.println(newPassword + "-------" + confirmPassword);
			
			if(newPassword.equals(confirmPassword)) {
				Date dateToday = new Date();
				currentUser.setPassword(newPassword);
				currentUser.setModified_date(dateToday);
				currentUser.setModified_by(currentUser.getUser_id());
				this.userService.updateUser(currentUser);
				return ResponseEntity.status(HttpStatus.OK).body("changed");
			}
			else {
				System.out.println("no same password");
				return ResponseEntity.status(HttpStatus.OK).body("different");
			}
			
			
		}
		else {
			System.out.println("error");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("error");
		}
		
		
	}
	
	@Autowired
	JavaMailSender emailService;
	
	public void sendMail(String email , String message) {
		SimpleMailMessage emailToSend = new SimpleMailMessage();
		emailToSend.setFrom("coding.tricks.8801@gmail.com");
		emailToSend.setTo(email);
		emailToSend.setSubject("Password Reset Request");
		emailToSend.setText(message);
		
		emailService.send(emailToSend);
	}
}

