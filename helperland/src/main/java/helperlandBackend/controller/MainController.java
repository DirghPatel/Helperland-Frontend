package helperlandBackend.controller;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import helperlandBackend.models.ContactUs;
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
	public String home() {
		System.out.println("a inside");
		return "home";
	}
	
	
	@RequestMapping(value = "/contact" , method = RequestMethod.GET)
	public String contact() {
		System.out.println("b inside");
		return "contact";
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
	public String about() {
		return "about";
	}
	@RequestMapping("/faqs")
	public String faqs() {
		return "faqs";
	}
	@RequestMapping("/prices")
	public String prices() {
		return "prices";
	}
	
	@RequestMapping("/become-a-pro")
	public String becomeAPro() {
		return "becomeAPro";
	}
	
	@RequestMapping("/service-booking")
	public String serviceBooking() {
		return "serviceBooking";
	}
	@RequestMapping(value = "/user-register" , method = RequestMethod.GET)
	public String userRegister() {
		return "userRegistration";
	}

	@RequestMapping(value = "/user-register" , method = RequestMethod.POST)
	public String regUser(@Valid @ModelAttribute ("userreg") UserModel user , BindingResult br, Model model , HttpSession session) throws IOException {
		
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
			
			if(this.userService.createUser(user) == 0) {
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
				
				this.userService.createUser(user);
				
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
	
//	@RequestMapping(value = "/login" , method = RequestMethod.POST)
//	public String loginUser(@ModelAttribute ("login") userRegister login,@RequestParam("password") String password ,Model model , HttpSession session) {
//		
////		  UserDetails userLogin = userService.loadUserByUsername(login.getEmail());
//		  userRegister userLogin = userService.loginUser(login.getEmail());
//		  
//		  System.out.println(userLogin);
//		  if(userLogin != null) {
//
//			   if(userLogin.getPassword().equals(login.getPassword())) {
//				   session.setAttribute("username", userLogin);
//				   if(userLogin.getUser_type_id() == 1) {
//					   return "redirect:/customer/dash";
//				   }
//				   else if(userLogin.getUser_type_id() == 2) {
//					   return "redirect:/service-provider/dash";
//				   }
//				   else if(userLogin.getUser_type_id() == 3){
//					   return "redirect:/admin/service-requests";
//				   }
//				   else {
//					   System.out.println("main else");
//					   return "redirect:/user-register";
//				   }
//			   }
//			   else {
//				   model.addAttribute("errorMessage" , "invalid username or password");
//				   model.addAttribute("displayLoginError" , "style='display: block !important;'");
//				   return "userRegistration";
//			   }
//		  }
//		  else {
//			  model.addAttribute("notUser" , "Can't find account with this email. Please Create Your Account.");
//			  model.addAttribute("displayNotUser" , "style='display: block !important;'");
//			  return "userRegistration";
//		  }
//	}
	
	@RequestMapping(value = "/login")
	public String login(Model model) {
		System.out.println("inside login");
		model.addAttribute("loginErrorMessage" , "invalid username or password");
		model.addAttribute("displayLoginError" , "style='display: block !important;'");
		return "userRegistration";
	}
	
	
	
	
	
	

	
	
}

