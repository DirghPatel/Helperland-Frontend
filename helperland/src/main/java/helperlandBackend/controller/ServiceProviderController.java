package helperlandBackend.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;
import helperlandBackend.models.UserModel;
import helperlandBackend.service.ServiceRequestsServiceImpl;
import helperlandBackend.service.UserServiceImpl;

@Controller
@RequestMapping("/service-provider")
public class ServiceProviderController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private ServiceRequestsServiceImpl serviceRequests;
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/service-details-data" , method = RequestMethod.POST)
	public ResponseEntity serviceDetailsData(@RequestBody int serviceReqId) {
		
		System.out.println(serviceReqId);
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(serviceReqId);
		ServiceRequestAddress srAddress = this.serviceRequests.getServiceRequestAddressById(serviceReqId);
		ServiceRequestExtra srExtra = this.serviceRequests.getServiceRequestExtra(serviceReqId);
		
		List<Object> srList = new ArrayList<Object>();
		srList.add(sr);
		srList.add(srAddress);
		srList.add(srExtra);
		System.out.println(srList);
		
		
		
		return ResponseEntity.status(HttpStatus.OK).body(srList);

		
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/service-accept" , method=RequestMethod.POST)
	public ResponseEntity serviceAccept(@RequestBody int serviceReqId) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		System.out.println("-----------------------------------------------------------------");
		
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(serviceReqId);
		sr.setService_provider_id(currentUser.getUser_id());
		
		this.serviceRequests.updateServiceRequestStatus(sr);
		return ResponseEntity.status(HttpStatus.OK).body("updated");
	}
	
	@RequestMapping("/dash")
	public String spDash(Model model) {
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		List<ServiceRequest> sr = this.serviceRequests.getServiceRequestByPostalCode(currentUser.getPostal_code());
		List<UserModel> users = this.userService.getAllUser();
		List<ServiceRequestAddress> srAddress = this.serviceRequests.getAllServiceRequestAddress();
		
		model.addAttribute("service_requests" , sr);
		model.addAttribute("users" , users);
		model.addAttribute("srAddress" , srAddress);
		return "serviceProvider/spDash";
	}
	@RequestMapping("/block-customer")
	public String spBlockCustomer(Model model) {
		
		return "serviceProvider/spBlockCustomer";
	}
	@RequestMapping("/my-ratings")
	public String spMyRating(Model model) {
		
		return "serviceProvider/spMyRating";
	}
	@RequestMapping("/notification")
	public String spNotification(Model model) {
		
		return "serviceProvider/spNotification";
	}
	@RequestMapping("/service-history")
	public String spServiceHistory(Model model) {
		
		return "serviceProvider/spServiceHistory";
	}
	@RequestMapping("/service-schedule")
	public String spServiceSchedule(Model model) {
		
		return "serviceProvider/spServiceSchedule";
	}
	@RequestMapping("/upcoming-services")
	public String spUpcomingServices(Model model) {
		
		return "serviceProvider/spUpcomingServices";
	}
	@RequestMapping("/mysettings")
	public String mySettingsSP(Model model) {
		
		return "serviceProvider/mySettingsSP";
	}
	
	
}

