package helperlandBackend.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import helperlandBackend.models.CancelRequestModel;
import helperlandBackend.models.FavouriteBlockedModel;
import helperlandBackend.models.RatingModel;
import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;
import helperlandBackend.service.ServiceRatingServiceImpl;
import helperlandBackend.service.ServiceRequestsServiceImpl;
import helperlandBackend.service.UserServiceImpl;

@Controller
@RequestMapping("/service-provider")
public class ServiceProviderController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private ServiceRequestsServiceImpl serviceRequests;
	
	@Autowired
	private ServiceRatingServiceImpl serviceRating;
	
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
	
	@SuppressWarnings({ "rawtypes", "deprecation" })
	@RequestMapping(value = "/service-accept" , method=RequestMethod.POST)
	public ResponseEntity serviceAccept(@RequestBody int serviceReqId) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		System.out.println("-----------------------------------------------------------------");
		
		List<ServiceRequest> allRequestsOfSp = this.serviceRequests.getServiceRequestBySPIdAndStatus(currentUser.getUser_id() , 2);
		for(ServiceRequest i: allRequestsOfSp) {
	
//			if(i.getStatus() == 2) {
				
				Date todayDate = new Date();
				
				long a = i.getService_start_date().getTime();

				Date startDate = new Date(a);
				Date endDate = new Date(a);
				
				float totalTime = i.getService_hours() + i.getExtra_hours();
				
				if(totalTime == (int)totalTime) {
					
					endDate.setHours(endDate.getHours() + (int)totalTime + 2);
					startDate.setHours(startDate.getHours() - 2);
				}
				else {
					
					endDate.setHours(endDate.getHours() + (int)totalTime + 2);
					endDate.setMinutes(endDate.getMinutes() + 30);
					startDate.setHours(startDate.getHours() - 2);
				}	
				
				ServiceRequest sr = this.serviceRequests.getServiceRequestById(serviceReqId);
				if(sr.getService_start_date().after(startDate) && sr.getService_start_date().before(endDate)) {
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("conflict" + i.getService_req_id());
				}
				if(sr.getService_start_date().before(todayDate)) {
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("expired");
				}
//			}	
		}
		
		ServiceRequest currentSR = this.serviceRequests.getServiceRequestById(serviceReqId);
		
		if(currentSR.getStatus() == 2) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("already accepted");
		}
		else {
			Date dateToday = new Date();
			
			ServiceRequest sr = this.serviceRequests.getServiceRequestById(serviceReqId);
			sr.setService_provider_id(currentUser.getUser_id());
			sr.setSp_accepted_date(dateToday);
			sr.setModified_by(currentUser.getUser_id());
			sr.setModified_date(dateToday);
			sr.setStatus(2);
			
			this.serviceRequests.updateServiceRequestStatus(sr);
			return ResponseEntity.status(HttpStatus.OK).body("updated");
		}
	}
	
	@RequestMapping("/dash")
	public String spDash(Model model) {
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		List<ServiceRequest> sr = this.serviceRequests.getServiceRequestByPostalCode(currentUser.getPostal_code());
//		List<FavouriteBlockedModel> fb = this.userService.getFavBlockByUserId(currentUser.getUser_id());
		List<ServiceRequest> ls = new ArrayList<ServiceRequest>();
		for(ServiceRequest s: sr) {
			FavouriteBlockedModel fb = this.userService.getFavBlockByUserIdAndTargetUserId(currentUser.getUser_id() , s.getUser_id());
			if(fb==null) {
				continue;
			}
			else {	
				if(fb.getIs_blocked() == 1) {
					ls.add(s);
				}
			}
			FavouriteBlockedModel fb1 = this.userService.getFavBlockByUserIdAndTargetUserId(s.getUser_id(),currentUser.getUser_id());
			if(fb1==null) {
				continue;
			}
			else {	
				if(fb1.getIs_blocked() == 1) {
					ls.add(s);
				}
			}
			
		}
		
		for(ServiceRequest i:ls) {
			sr.remove(i);
		}
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequestAddress> srAddress = new ArrayList<ServiceRequestAddress>();
		
		users.add(currentUser);
		
		for(ServiceRequest i : sr) {
			ServiceRequestAddress a = this.serviceRequests.getServiceRequestAddressById(i.getService_req_id());
			srAddress.add(a);
			
			UserModel userCust = this.userService.getUserByUserId(i.getUser_id());
			users.add(userCust);
		}
		
		model.addAttribute("service_requests" , sr);
		model.addAttribute("users" , users);
		model.addAttribute("srAddress" , srAddress);
		return "serviceProvider/spDash";
	}
	
	@RequestMapping("/upcoming-services")
	public String spUpcomingServices(Model model) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		List<ServiceRequest> sr = this.serviceRequests.getServiceRequestBySPIdAndStatus(currentUser.getUser_id() , 2);
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequestAddress> srAddress = new ArrayList<ServiceRequestAddress>();
		
		users.add(currentUser);
		
		for(ServiceRequest i : sr) {
			ServiceRequestAddress a = this.serviceRequests.getServiceRequestAddressById(i.getService_req_id());
			srAddress.add(a);
			UserModel userCust = this.userService.getUserByUserId(i.getUser_id());
			users.add(userCust);
		}
		
		
		model.addAttribute("service_requests" , sr);
		model.addAttribute("users" , users);
		model.addAttribute("srAddress" , srAddress);
		
		return "serviceProvider/spUpcomingServices";
	}
	
	@RequestMapping("/service-history")
	public String spServiceHistory(Model model) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = this.userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		List<ServiceRequest> sr = this.serviceRequests.getServiceRequestBySPIdAndStatus(currentUser.getUser_id(), 3);
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequestAddress> srAddress = new ArrayList<ServiceRequestAddress>();
		
		users.add(currentUser);
		
		for(ServiceRequest i: sr) {
			ServiceRequestAddress a = this.serviceRequests.getServiceRequestAddressById(i.getService_req_id());
			srAddress.add(a);
			
			UserModel userCust = this.userService.getUserByUserId(i.getUser_id());
			users.add(userCust);
		}
		
		model.addAttribute("service_requests" , sr);
		model.addAttribute("users" , users);
		model.addAttribute("srAddress" , srAddress);
		
		return "serviceProvider/spServiceHistory";
	}
	
	@RequestMapping("/my-ratings")
	public String spMyRating(Model model) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = this.userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		List<RatingModel> ratings = this.serviceRating.getRatingsByRatingTo(currentUser.getUser_id());
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequest> sr = new ArrayList<ServiceRequest>();
		
		users.add(currentUser);
		
		for(RatingModel r : ratings) {
			UserModel userFrom = this.userService.getUserByUserId(r.getRating_from());
			users.add(userFrom);
			
			ServiceRequest s = this.serviceRequests.getServiceRequestById(r.getservice_request_id());
			sr.add(s);
		}
		
		model.addAttribute("ratings",ratings);
		model.addAttribute("service_requests" , sr);
		model.addAttribute("users" , users);
				
		
		return "serviceProvider/spMyRating";
	}
	
	@RequestMapping("/block-customer")
	public String spBlockCustomer(Model model) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = this.userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		List<ServiceRequest> sr = this.serviceRequests.getServiceRequestBySPId(currentUser.getUser_id());
		Set<UserModel> users = new HashSet<UserModel>();
		List<FavouriteBlockedModel> favBlocked = this.userService.getFavBlockByUserId(currentUser.getUser_id()); 
		List<Integer> blockedId = new ArrayList<Integer>();
		Set<Integer> usersId = new HashSet<Integer>();
		for(ServiceRequest i: sr) {
			UserModel u = this.userService.getUserByUserId(i.getUser_id());
			users.add(u);
		}
		for(FavouriteBlockedModel i: favBlocked) {
			blockedId.add(i.getTarget_user_id());
			
		}
		for(UserModel i: users) {
			usersId.add(i.getUser_id());
		}
		
		System.out.println(blockedId);
		System.out.println(usersId);
		
		model.addAttribute("users",users);
		model.addAttribute("blocked",favBlocked);
		model.addAttribute("usersId",usersId);
		model.addAttribute("blockedId",blockedId);
		
		return "serviceProvider/spBlockCustomer";
	}
	
	@RequestMapping("/notification")
	public String spNotification(Model model) {
		
		return "serviceProvider/spNotification";
	}
	
	@RequestMapping("/service-schedule")
	public String spServiceSchedule(Model model) {
		
		return "serviceProvider/spServiceSchedule";
	}
	
	@RequestMapping("/mysettings")
	public String mySettingsSP(Model model) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		List<UserAddress> addresses = this.userService.getAllAddress(currentUser.getUser_id());
		UserAddress address = new UserAddress();
		
		for(UserAddress i: addresses) {
			address = i;
		}
		
		model.addAttribute("user" , currentUser);
		model.addAttribute("address" , address);
		
		
		return "serviceProvider/mySettingsSP";
	}
	
	
	@RequestMapping(value = "/service-cancel" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> serviceCancel(@ModelAttribute CancelRequestModel cancelReq) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		System.out.println("---"+cancelReq);
		
		Date dt = new Date();
		
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(cancelReq.getService_req_id());
		sr.setCancel_comment(cancelReq.getCancel_comment());
		sr.setModified_date(dt);
		sr.setModified_by(currentUser.getUser_id());
		sr.setStatus(0);
		
		this.serviceRequests.updateServiceRequestStatus(sr);
		
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/favblock-unblock" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> FavBlockUnblock(@RequestBody int id) {
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = this.userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		FavouriteBlockedModel favBlock = this.userService.getFavBlockByUserIdAndTargetUserId(currentUser.getUser_id(), id);
		System.out.println("---------"+favBlock);
		favBlock.setIs_blocked(0);
		
		this.userService.updateFavBlock(favBlock);
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/favblock-block" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> FavBlockBlock(@RequestBody int id) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = this.userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		
		FavouriteBlockedModel alreadyAdded = this.userService.getFavBlockByUserIdAndTargetUserId(currentUser.getUser_id(), id);
		System.out.println(alreadyAdded);
		System.out.println("------------");
		
		if(alreadyAdded == null) {
			System.out.println("======");
			FavouriteBlockedModel newFavBlock = new FavouriteBlockedModel();
			newFavBlock.setIs_blocked(1);
			newFavBlock.setTarget_user_id(id);
			newFavBlock.setUser_id(currentUser.getUser_id());
			newFavBlock.setIs_favourite(0);
			this.userService.addFavBlock(newFavBlock);
		}
		else {
			System.out.println("---3333");
			FavouriteBlockedModel favBlock = this.userService.getFavBlockById(alreadyAdded.getId());
			System.out.println(favBlock);
			favBlock.setIs_blocked(1);
			
			this.userService.updateFavBlock(favBlock);
		}
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/update-mydetails" , method=RequestMethod.POST)
	public String updateMyDetails(@ModelAttribute UserModel changeUser , @RequestParam("address_line1") String address_line1 , @RequestParam("address_line2") String address_line2 , @RequestParam("postal_code") String postal_code , @RequestParam("city") String city) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		Date dtToday = new Date();
		Date dob = changeUser.getDate_of_birth();
		dob.setHours(0);
		dob.setMinutes(0);
		dob.setSeconds(0);
		
		currentUser.setFirst_name(changeUser.getFirst_name());
		currentUser.setLast_name(changeUser.getLast_name());
		currentUser.setMobile(changeUser.getMobile());
		currentUser.setDate_of_birth(dob);
		currentUser.setModified_date(dtToday);
		currentUser.setModified_by(currentUser.getUser_id());
		currentUser.setGender(changeUser.getGender());
		currentUser.setUser_profile_picture(changeUser.getUser_profile_picture());
		
		
		this.userService.updateUser(currentUser);
		
		List<UserAddress> addresses = this.userService.getAllAddress(currentUser.getUser_id());
//		UserAddress address = new UserAddress();
		
		if(addresses.isEmpty()) {
			UserAddress address = new UserAddress();
			address.setAddress_line1(address_line1);
			address.setAddress_line2(address_line2);
			address.setPostal_code(postal_code);
			address.setCity(city);
			address.setUser_id(currentUser.getUser_id());
			address.setEmail(currentUser.getEmail());
			address.setMobile(currentUser.getMobile());
			address.setIs_default(1);
			address.setIs_deleted(0);
			
			if(currentUser.getPostal_code() == null || currentUser.getPostal_code().length() <= 4 ) {
				currentUser.setPostal_code(postal_code);
				this.userService.updateUser(currentUser);
			}
			
			this.userService.saveUserAddress(address);
		}
		else {
			for(UserAddress i: addresses) {
				i.setAddress_line1(address_line1);
				i.setAddress_line2(address_line2);
				i.setPostal_code(postal_code);
				i.setCity(city);
				
				this.userService.updateUserAddress(i);
			}
		}
		
		return "redirect:mysettings";
		
	}
	
}

