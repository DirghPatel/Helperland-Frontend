package helperlandBackend.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private ServiceRequestsServiceImpl serviceRequests;
	
	@Autowired
	private ServiceRatingServiceImpl serviceRating;

//	SERVICE STATUS CANCELLED 0
//	SERVICE STATUS NEW 1
//	SERVICE STATUS PENDING 2
//	SERVICE STATUS COMPLETED 3

	
	public int avgRatingCount(int service_provider_id) {
		
			List<RatingModel> ratings = this.serviceRating.getRatingsByRatingTo(service_provider_id);
			
			
			int avgRating = 0; 
			
			for(RatingModel i : ratings) {
				   avgRating = avgRating + i.getRatings();
			}
			
			if(ratings.size() == 0) {
				avgRating = avgRating / 1;
			}
			else {
				avgRating = avgRating / ratings.size();
			}			
			
			return avgRating;
	}

	@RequestMapping(value = "/dash")
	public String customerDash(@RequestParam(required=false, name="page") String page, @RequestParam(required=false, name="count") String count , Model model ) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		List<ServiceRequest> sr = this.serviceRequests.getNewPendingServiceRequestByUserId(currentUser.getUser_id());
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequestAddress> srAddress = new ArrayList<ServiceRequestAddress>();
		Map<Integer, Integer> spRating = new HashMap<Integer, Integer>();
		users.add(currentUser);
		for(ServiceRequest i : sr) {
			ServiceRequestAddress a = this.serviceRequests.getServiceRequestAddressById(i.getService_req_id());
			srAddress.add(a);
			if(i.getUser_id() != i.getService_provider_id()) {
				UserModel userSP = this.userService.getUserByUserId(i.getService_provider_id());
				users.add(userSP);
				int avgRating = avgRatingCount(i.getService_provider_id());
				spRating.put(i.getService_provider_id(), avgRating);
			}
		}
		
		PagedListHolder<ServiceRequest> srPaged = new PagedListHolder<ServiceRequest>();
		srPaged.setSource(sr);
		if(count == null) {
			srPaged.setPageSize(10);
		}
		else {
			srPaged.setPageSize(Integer.parseInt(count));
		}
		if(page == null) {
			model.addAttribute("service_requests" , srPaged);
		}
		else {
	    	int pageNum = Integer.parseInt(page);
	    	srPaged.setPage(pageNum - 1);
	      	model.addAttribute("service_requests" , srPaged);
	    }
		model.addAttribute("users" , users);
		model.addAttribute("srAddress" , srAddress);
		model.addAttribute("spRating" , spRating);
	
		return "customer/custDash";
	}
	
	@RequestMapping("/service-history")
	public String custServiceHistory(@RequestParam(required=false, name="page") String page, @RequestParam(required=false, name="count") String count , Model model) {	
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		
		List<ServiceRequest> sr = this.serviceRequests.getAllServiceRequestsHistoryByUserId(currentUser.getUser_id());
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequestAddress> srAddress = this.serviceRequests.getAllServiceRequestAddress();
		Map<Integer, Integer> spRating = new HashMap<Integer, Integer>();
		
		users.add(currentUser);
		
		for(ServiceRequest i : sr) {
			ServiceRequestAddress a = this.serviceRequests.getServiceRequestAddressById(i.getService_req_id());
			srAddress.add(a);
			
			if(i.getUser_id() != i.getService_provider_id()) {
				UserModel userSP = this.userService.getUserByUserId(i.getService_provider_id());
				users.add(userSP);
					
				int avgRating = avgRatingCount(i.getService_provider_id());
				spRating.put(i.getService_provider_id(), avgRating);
			}
		}
		
		PagedListHolder<ServiceRequest> srPaged = new PagedListHolder<ServiceRequest>();
		srPaged.setSource(sr);
		
		if(count == null) {
			srPaged.setPageSize(10);
		}
		else {
			srPaged.setPageSize(Integer.parseInt(count));
		}
		
		if(page == null) {
			model.addAttribute("service_requests" , srPaged);
		}
		else {
	    	int pageNum = Integer.parseInt(page);
	    	srPaged.setPage(pageNum - 1);
	      	model.addAttribute("service_requests" , srPaged);
	    }
		
		model.addAttribute("users" , users);
		model.addAttribute("srAddress" , srAddress);
		model.addAttribute("spRating" , spRating);
		
		return "customer/custServiceHistory";
	}
	
	@RequestMapping("/fav-pros")
	public String custFavouritePros(@RequestParam(required=false, name="page") String page, @RequestParam(required=false, name="count") String count ,Model model) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		List<FavouriteBlockedModel> favBlocked = this.userService.getFavBlockByUserId(currentUser.getUser_id());
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequest> sr = this.serviceRequests.getAllServiceRequestByUserId(currentUser.getUser_id());
		Map<Integer, Integer> spRating = new HashMap<Integer, Integer>();
		Map<Integer, Integer> spTotalCleaning = new HashMap<Integer, Integer>();
		List<Integer> blockedId = new ArrayList<Integer>();
		
		for(ServiceRequest i: sr) {
			if(i.getUser_id() != i.getService_provider_id()) {
				UserModel user = this.userService.getUserByUserId(i.getService_provider_id());
				users.add(user);
				
				int avgRating = avgRatingCount(i.getService_provider_id());
				spRating.put(i.getService_provider_id(), avgRating);
				
				List<ServiceRequest> totalCleanings = this.serviceRequests.getServiceRequestBySPId(i.getService_provider_id());
				spTotalCleaning.put(i.getService_provider_id(), totalCleanings.size());
			}
		}
		
		for(FavouriteBlockedModel i: favBlocked) {
			blockedId.add(i.getTarget_user_id());
		}
		
		List<UserModel> usersList = new ArrayList<UserModel>();
		PagedListHolder<UserModel> userPaged = new PagedListHolder<UserModel>();
		
		for(UserModel i: users) {
			usersList.add(i);
		}
		userPaged.setSource(usersList);
		
		if(count == null) {
			userPaged.setPageSize(10);
		}
		else {
			userPaged.setPageSize(Integer.parseInt(count));
		}
		
		if(page == null) {
			model.addAttribute("users" , userPaged);
		}
		else {
	    	int pageNum = Integer.parseInt(page);
	    	userPaged.setPage(pageNum - 1);
	      	model.addAttribute("users" , userPaged);
	    }
		
		model.addAttribute("fav" , favBlocked);
		model.addAttribute("avgSpRating" , spRating);
		model.addAttribute("spTotalCleaning" , spTotalCleaning);
		model.addAttribute("blockedId" , blockedId);
		return "customer/custFavouritePros";
	}
	
	@RequestMapping("/notification")
	public String custNotification(Model model) {
		return "customer/custNotification";
	}
	
	@RequestMapping("/service-schedule")
	public String custSeviceSchedule(Model model) {
		return "customer/custSeviceSchedule";
	}
	@RequestMapping("/mysettings")
	public String mySettingsCust(Model model) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		List<UserAddress> addresses = this.userService.getAllAddressByUserId(currentUser.getUser_id());
		
		model.addAttribute("user" , currentUser);
		model.addAttribute("addresses",addresses);
		
		return "customer/mySettingsCust";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/service-details-data" , method = RequestMethod.POST)
	public ResponseEntity serviceDetailsData(@RequestBody int serviceReqId) {
		
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(serviceReqId);
		ServiceRequestAddress srAddress = this.serviceRequests.getServiceRequestAddressById(serviceReqId);
		ServiceRequestExtra srExtra = this.serviceRequests.getServiceRequestExtra(serviceReqId);
		UserModel sp = this.userService.getUserByUserId(sr.getService_provider_id());
				
		List<RatingModel> ratings = this.serviceRating.getRatingsByRatingTo(sr.getService_provider_id());
		
		int avgRating = 0; 
		
		for(RatingModel i : ratings) {
			   avgRating = avgRating + i.getRatings();
		}
		
		if(ratings.size() == 0) {
			avgRating = avgRating / 1;
		}
		else {
			avgRating = avgRating / ratings.size();
		}		
		
		List<ServiceRequest> totalCleanings = this.serviceRequests.getServiceRequestBySPId(sr.getService_provider_id());
		
		List<Object> srList = new ArrayList<Object>();
		srList.add(sr);
		srList.add(srAddress);
		srList.add(srExtra);
		srList.add(sp);
		srList.add(avgRating);
		srList.add(totalCleanings.size());
		return ResponseEntity.status(HttpStatus.OK).body(srList);
	}

	@RequestMapping(value = "/service-cancel" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> serviceCancel(@RequestParam("service_req_id") int service_req_id , @RequestParam("cancel_comment") String cancel_comment) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		Date dt = new Date();
		
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(service_req_id);
		sr.setCancel_comment(cancel_comment);
		sr.setModified_date(dt);
		sr.setModified_by(currentUser.getUser_id());
		sr.setStatus(0);
		
		this.serviceRequests.updateServiceRequestStatus(sr);
		
		UserModel userSp = this.userService.getUserByUserId(sr.getService_provider_id());
//		sendMail(userSp.getEmail() , "Your Service Request #"+sr.getService_req_id()+" is cancelled by " + currentUser.getFirst_name() + " " + currentUser.getLast_name() + " because of "+ cancel_comment +" ." );
	
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	@RequestMapping(value = "/service-reschedule" , method=RequestMethod.POST)
	public ResponseEntity serviceReschedule(@RequestParam("service_start_date") Date service_start_date , @RequestParam("service_req_id") int service_req_id) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
	    Date dateToday = new Date();  
	    
	    ServiceRequest sr = this.serviceRequests.getServiceRequestById(service_req_id);
		
		if(sr.getService_provider_id() == sr.getUser_id()) {
			sr.setService_start_date(service_start_date);
			sr.setModified_date(dateToday);
			sr.setModified_by(currentUser.getUser_id());
			sr.setStatus(4);
			
			this.serviceRequests.updateServiceRequestStatus(sr);
			return ResponseEntity.status(HttpStatus.OK).body("ok");
		}
		else {
			List<ServiceRequest> allRequestsOfSp = this.serviceRequests.getServiceRequestBySPIdAndStatus(sr.getService_provider_id() , 2);
			List<ServiceRequest> srRescheduled = this.serviceRequests.getServiceRequestBySPIdAndStatus(sr.getService_provider_id() , 4);
			
			for(ServiceRequest i: srRescheduled) {
				allRequestsOfSp.add(i);
			}
			for(ServiceRequest i: allRequestsOfSp) {
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
				
				if(service_start_date.after(startDate) && service_start_date.before(endDate)) {
					if(i.getService_req_id() != service_req_id){
						List<Object> rList = new ArrayList<Object>();
						rList.add("conflict");
						rList.add(startDate);
						rList.add(endDate);
						
						return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(rList);
					}
				}
			}
			
			UserModel userSp = this.userService.getUserByUserId(sr.getService_provider_id());
			
			sr.setService_start_date(service_start_date);
			sr.setModified_date(dateToday);
			sr.setModified_by(currentUser.getUser_id());
			sr.setStatus(4);
			
//			sendMail(userSp.getEmail() , "Your Service Request #"+sr.getService_req_id()+" is rescheduled on " + service_start_date  + " by " + currentUser.getFirst_name() + " " + currentUser.getLast_name() + " ." );
			this.serviceRequests.updateServiceRequestStatus(sr);
			return ResponseEntity.status(HttpStatus.OK).body("ok");
		}
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/service-rating-data" , method=RequestMethod.POST)
	public ResponseEntity serviceRatingData(@RequestBody int service_id) {
	
		List<RatingModel> existingRatings = this.serviceRating.getRatingsByServiceId(service_id);
		
		if(existingRatings.size() == 0) {
			ServiceRequest sr = this.serviceRequests.getServiceRequestById(service_id);
			List<RatingModel> ratings = this.serviceRating.getRatingsByRatingTo(sr.getService_provider_id());
			
			int avgRating = 0; 
			for(RatingModel i : ratings) {
				   avgRating = avgRating + i.getRatings();
			}
			
			if(ratings.size() == 0) {
				avgRating = avgRating / 1;
			}
			else {
				avgRating = avgRating / ratings.size();
			}
			List<Object> srList = new ArrayList<Object>();
			
			UserModel sp = this.userService.getUserByUserId(sr.getService_provider_id());
			Object avg = avgRating;
			
			srList.add(sp);
			srList.add(avg);
			
			return ResponseEntity.status(HttpStatus.OK).body(srList);
		}
		else {
			String error = "You already Rated ServiceProvider For This Service.";
			return ResponseEntity.status(HttpStatus.OK).body(error);
		}
	}
	
	@RequestMapping(value = "/rate-sp" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> rateSP(@ModelAttribute RatingModel ratings , BindingResult br) {
		
		if(br.hasErrors()) {
			return new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
		}
		else {
			User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
			
			int averageRating = (int) Math.ceil((ratings.getFriendly() + ratings.getOn_time_arrival() + ratings.getQuality_of_service()) / 3);  
		    Date dateToday = new Date();  
		    
		    ratings.setIs_approved(1);
		    ratings.setRating_date(dateToday);
		    ratings.setRating_from(currentUser.getUser_id());
		    ratings.setRatings(averageRating);
		    ratings.setVisible_on_homescreen(1);
		    
		    this.serviceRating.addServiceRating(ratings);
		    return new ResponseEntity<HttpStatus>(HttpStatus.OK);
		}
	}
	
	
	@RequestMapping(value = "/favblock-remove" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> FavBlockRemove(@RequestBody int id) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		FavouriteBlockedModel favBlock = this.userService.getFavBlockByUserIdAndTargetUserId(currentUser.getUser_id(), id);
		
		if(favBlock != null) {
			favBlock.setIs_favourite(0);
			this.userService.updateFavBlock(favBlock);
		}
		else {
			FavouriteBlockedModel fb = new FavouriteBlockedModel();
			fb.setIs_blocked(0);
			fb.setIs_favourite(0);
			fb.setTarget_user_id(id);
			fb.setUser_id(currentUser.getUser_id());
			
			this.userService.addFavBlock(fb);
		}
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/favblock-favourite" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> FavBlockFavourite(@RequestBody int id) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		FavouriteBlockedModel favBlock = this.userService.getFavBlockByUserIdAndTargetUserId(currentUser.getUser_id(), id);
		
		if(favBlock != null) {
			favBlock.setIs_favourite(1);
			this.userService.updateFavBlock(favBlock);
		}
		else {
			FavouriteBlockedModel fb = new FavouriteBlockedModel();
			fb.setIs_blocked(0);
			fb.setIs_favourite(1);
			fb.setTarget_user_id(id);
			fb.setUser_id(currentUser.getUser_id());
			
			this.userService.addFavBlock(fb);
		}
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/favblock-block" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> FavBlockBlock(@RequestBody int id) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		FavouriteBlockedModel favBlock = this.userService.getFavBlockByUserIdAndTargetUserId(currentUser.getUser_id(), id);
		
		if(favBlock != null) {
			favBlock.setIs_blocked(1);
			this.userService.updateFavBlock(favBlock);
		}
		else {
			FavouriteBlockedModel fb = new FavouriteBlockedModel();
			fb.setIs_blocked(1);
			fb.setIs_favourite(0);
			fb.setTarget_user_id(id);
			fb.setUser_id(currentUser.getUser_id());
			
			this.userService.addFavBlock(fb);
		}
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/favblock-unblock" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> FavBlockUnblock(@RequestBody int id) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		FavouriteBlockedModel favBlock = this.userService.getFavBlockByUserIdAndTargetUserId(currentUser.getUser_id(), id);
		
		if(favBlock != null) {
			favBlock.setIs_blocked(0);
			this.userService.updateFavBlock(favBlock);
		}
		else {
			FavouriteBlockedModel fb = new FavouriteBlockedModel();
			fb.setIs_blocked(0);
			fb.setIs_favourite(0);
			fb.setTarget_user_id(id);
			fb.setUser_id(currentUser.getUser_id());
			
			this.userService.addFavBlock(fb);
		}
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/update-mydetails" , method=RequestMethod.POST)
	public String updateMyDetails(@ModelAttribute UserModel changeUser , RedirectAttributes redirectAttributes) {
		if(changeUser.getFirst_name().length() < 1 ) {
			redirectAttributes.addFlashAttribute("errorInFirstName" , "Firstname can't be empty.");
			return "redirect:mysettings";
		}
		else if(changeUser.getLast_name().length() < 1 ) {
			redirectAttributes.addFlashAttribute("errorInLastName" , "Lastname can't be empty.");
			return "redirect:mysettings";
		}
		else if(changeUser.getMobile().length() < 10 || changeUser.getMobile().length() > 12 ) {
			redirectAttributes.addFlashAttribute("errorInMobile" , "Mobile number must be 10 to 12 digits long.");
			return "redirect:mysettings";
		}
		else {
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
			
			this.userService.updateUser(currentUser);
			return "redirect:mysettings";
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


