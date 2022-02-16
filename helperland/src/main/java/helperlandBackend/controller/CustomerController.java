package helperlandBackend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.UserModel;
import helperlandBackend.service.ServiceRequestsServiceImpl;
import helperlandBackend.service.UserServiceImpl;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private ServiceRequestsServiceImpl serviceRequests;
	
	
	@RequestMapping("/dash")
	public String customerDash(Model model) {
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		List<ServiceRequest> sr = this.serviceRequests.getServiceRequestByUserId(currentUser.getUser_id());
		
		
		model.addAttribute("service_requests" , sr);
		return "customer/custDash";
	}
	@RequestMapping("/fav-pros")
	public String custFavouritePros(Model model) {
		
		return "customer/custFavouritePros";
	}
	
	@RequestMapping("/notification")
	public String custNotification(Model model) {
		
		return "customer/custNotification";
	}
	@RequestMapping("/service-history")
	public String custServiceHistory(Model model) {
		
		return "customer/custServiceHistory";
	}
	@RequestMapping("/service-schedule")
	public String custSeviceSchedule(Model model) {
		
		return "customer/custSeviceSchedule";
	}
	@RequestMapping("/mysettings")
	public String mySettingsCust(Model model) {
		
		return "customer/mySettingsCust";
	}
}

