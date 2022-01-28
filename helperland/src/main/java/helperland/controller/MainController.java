package helperland.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import helperland.service.ContactUsServiceImpl;



@Controller
@ComponentScan(basePackages={"helperland.dao,helperland.models,helperland.service,helperland.interceptors"})
public class MainController {
	
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
	public String handleContactUs(@Valid @ModelAttribute helperland.models.ContactUs contactUs , BindingResult br , Model model) {
		
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
		System.out.println("b inside");
		return "about";
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
	

	
}


