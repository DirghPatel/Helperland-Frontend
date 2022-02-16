package helperlandBackend.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import helperlandBackend.models.ContactUs;
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
		
		
		List<UserAddress> allAddresses = this.userService.getAllAddress(currentUser.getUser_id());
		model.addAttribute("addresses",allAddresses);
		model.addAttribute("user" , currentUser);
		
		return "serviceBooking";
	}
	@RequestMapping(value = "/user-register" , method = RequestMethod.GET)
	public String userRegister() {
		return "userRegistration";
	}

	@RequestMapping(value = "/user-register" , method = RequestMethod.POST)
	public String regUser(@Valid @ModelAttribute ("userreg") UserModel user , BindingResult br, Model model , HttpSession session , HttpServletRequest request) throws IOException {
		
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
				
//				this.userService.createUser(user);
//				System.out.println("-------------------------");
//				if(user.getUser_type_id() == 1) {
//					session.setAttribute("user" , user);
//					return "redirect:/customer/dash";
//				}
//				else if(user.getUser_type_id() == 2) {
//					session.setAttribute("user" , user);
//					return "redirect:/service-provider/dash";
//				}
//				else {
//					return "home";
//				}
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
	
	
	
	

	
	
}

