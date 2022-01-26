package helperland.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import helperland.models.loginModel;
import helperland.models.userRegister;

@Controller
public class MainController {
	
	@RequestMapping({"/home" , "/"})
	public String home() {
		System.out.println("a inside");
		return "home";
	}
	@RequestMapping("/contact")
	public String contact() {
		System.out.println("b inside");
		return "contact";
	}
	@RequestMapping( value = "/about")
	public String about() {
		System.out.println("b inside");
		return "about";
	}
	@RequestMapping( value = "/login")
	public String login(@ModelAttribute("login") loginModel loginmodel , Model model) {
		System.out.println("b inside");
		
		model.addAttribute("email" , loginmodel.email);
		
		return "login";
	}
	@RequestMapping("/faqs")
	public String faqs() {
		System.out.println("s inside");
		return "faqs";
	}
	@RequestMapping("/prices")
	public String prices() {
		System.out.println("d inside");
		return "prices";
	}
	
	@RequestMapping("/become-a-pro")
	public String becomeAPro() {
		System.out.println("g inside");
		return "becomeAPro";
	}
	
	@RequestMapping("/service-booking")
	public String serviceBooking() {
		System.out.println("h inside");
		return "serviceBooking";
	}
	@RequestMapping("/user-register")
	public String userRegister() {
		System.out.println("h inside");
		return "userRegistration";
	}
	
	@RequestMapping(value = "/reguser" , method = RequestMethod.POST)
	public String regUser(@ModelAttribute ("userreg") userRegister user , Model model) {
		
		model.addAttribute("type" , user.getUserType());
		model.addAttribute("firstname" , user.getFirstname());
		model.addAttribute("user",user);
		return "register";
	}
	
}


