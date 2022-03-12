package helperlandBackend.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
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
@RequestMapping("/service-provider")
public class ServiceProviderController {
	
	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private ServiceRequestsServiceImpl serviceRequests;
	
	@Autowired
	private ServiceRatingServiceImpl serviceRating;
	
	@Autowired
	private MainController mainController;

	@RequestMapping(value = "/dash" , method = RequestMethod.GET)
	public String spDash(Model model , @RequestParam(value="pets" , defaultValue = "1") int pet , @RequestParam(required=false, name="page") String page, @RequestParam(required=false, name="count") String count ) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	

		List<ServiceRequest> sr = this.serviceRequests.getServiceRequestByPostalCode(currentUser.getPostal_code());
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
		model.addAttribute("users" , users);
		model.addAttribute("srAddress" , srAddress);
		
		PagedListHolder<ServiceRequest> srPaged = new PagedListHolder<ServiceRequest>();
		PagedListHolder<ServiceRequest> srFilterPaged = new PagedListHolder<ServiceRequest>();
		srPaged.setSource(sr);
		
		List<ServiceRequest> srFilter = new ArrayList<ServiceRequest>();
		srFilterPaged.setSource(srFilter);
		
		for(ServiceRequest i : srPaged.getPageList()) {
			if(i.getHas_pets() == 0) {
				srFilter.add(i);
			}
		}
		if(count == null) {
			srPaged.setPageSize(10);
			srFilterPaged.setPageSize(10);
		}
		else {
			srPaged.setPageSize(Integer.parseInt(count));
			srFilterPaged.setPageSize(Integer.parseInt(count));
		}
		
		if(page == null) {
			if(pet == 1) {
				model.addAttribute("service_requests" , srPaged);
				model.addAttribute("sr_type" , 1);
			}
			else {
				model.addAttribute("service_requests",srFilterPaged);
				model.addAttribute("sr_type" , 0);
			}
		}
		else {
			int pageNum = Integer.parseInt(page);
	    	srPaged.setPage(pageNum - 1);
			if(pet == 1) {
				model.addAttribute("service_requests" , srPaged);
				model.addAttribute("sr_type" , 1);
			}
			else {
				model.addAttribute("service_requests",srFilterPaged);
				model.addAttribute("sr_type" , 0);
			}
	    }		
		return "serviceProvider/spDash";
	}
	
	@RequestMapping("/upcoming-services")
	public String spUpcomingServices(@RequestParam(required=false, name="page") String page, @RequestParam(required=false, name="count") String count ,Model model) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());

		List<ServiceRequest> sr = this.serviceRequests.getServiceRequestBySPIdAndStatus(currentUser.getUser_id() , 2);
		List<ServiceRequest> sr1 = this.serviceRequests.getServiceRequestBySPIdAndStatus(currentUser.getUser_id() , 4);
		
		for(ServiceRequest i: sr1) {
			sr.add(i);
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
		
		List<Integer> completeId = new ArrayList<Integer>();
		
		Date dtToday = new Date();
		
		for(ServiceRequest i : sr) {
			Date sdate = i.getService_start_date();
			float totalTime = i.getService_hours() + i.getExtra_hours();
			long k = (long) (sdate.getTime() + (totalTime*3600*1000));
			
			Date dcomplete = new Date(k);
			if(dcomplete.before(dtToday)) {
				completeId.add(i.getService_req_id());
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
		model.addAttribute("completeId" , completeId);
		return "serviceProvider/spUpcomingServices";
	}
	
	@RequestMapping("/service-history")
	public String spServiceHistory(@RequestParam(required=false, name="page") String page, @RequestParam(required=false, name="count") String count  , Model model) {
		
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
		return "serviceProvider/spServiceHistory";
	}
	
	@RequestMapping("/my-ratings")
	public String spMyRating(Model model , @RequestParam(required=false, name="page") String page, @RequestParam(required=false, name="count") String count  , @RequestParam(value="ratingType" , defaultValue = "all") String ratingType) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = this.userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		List<RatingModel> ratings = this.serviceRating.getRatingsByRatingTo(currentUser.getUser_id());
		PagedListHolder<RatingModel> ratingsPaged = new PagedListHolder<RatingModel>();
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequest> sr = new ArrayList<ServiceRequest>();
		
		users.add(currentUser);
		
		for(RatingModel r : ratings) {
			UserModel userFrom = this.userService.getUserByUserId(r.getRating_from());
			users.add(userFrom);
			
			ServiceRequest s = this.serviceRequests.getServiceRequestById(r.getservice_request_id());
			sr.add(s);
		}
		
		model.addAttribute("service_requests" , sr);
		model.addAttribute("users" , users);
		
		List<RatingModel> ratingsFilteredVeryGood = new ArrayList<RatingModel>();
		PagedListHolder<RatingModel> ratingsFilteredVeryGoodPaged = new PagedListHolder<RatingModel>();
		
		List<RatingModel> ratingsFilteredGood = new ArrayList<RatingModel>();
		PagedListHolder<RatingModel> ratingsFilteredGoodPaged = new PagedListHolder<RatingModel>();
		
		List<RatingModel> ratingsFilteredAverage = new ArrayList<RatingModel>();
		PagedListHolder<RatingModel> ratingsFilteredAveragePaged = new PagedListHolder<RatingModel>();
		
		List<RatingModel> ratingsFilteredPoor = new ArrayList<RatingModel>();
		PagedListHolder<RatingModel> ratingsFilteredPoorPaged = new PagedListHolder<RatingModel>();
		
		for(RatingModel r : ratings) {
			if(r.getRatings() == 5) {
				ratingsFilteredVeryGood.add(r);
			}
			if(r.getRatings() == 4) {
				ratingsFilteredGood.add(r);
			}
			if(r.getRatings() == 3) {
				ratingsFilteredAverage.add(r);
			}
			if(r.getRatings() == 2) {
				ratingsFilteredPoor.add(r);
			}
		}
		
		ratingsPaged.setSource(ratings);
		ratingsFilteredVeryGoodPaged.setSource(ratingsFilteredVeryGood);
		ratingsFilteredGoodPaged.setSource(ratingsFilteredGood);
		ratingsFilteredAveragePaged.setSource(ratingsFilteredAverage);
		ratingsFilteredPoorPaged.setSource(ratingsFilteredPoor);
		
		if(count == null) {
			ratingsPaged.setPageSize(10);
			ratingsFilteredVeryGoodPaged.setPageSize(10);
			ratingsFilteredGoodPaged.setPageSize(10);
			ratingsFilteredAveragePaged.setPageSize(10);
			ratingsFilteredPoorPaged.setPageSize(10);
		}
		else {
			ratingsPaged.setPageSize(Integer.parseInt(count));
			ratingsFilteredVeryGoodPaged.setPageSize(Integer.parseInt(count));
			ratingsFilteredGoodPaged.setPageSize(Integer.parseInt(count));
			ratingsFilteredAveragePaged.setPageSize(Integer.parseInt(count));
			ratingsFilteredPoorPaged.setPageSize(Integer.parseInt(count));
		}
		
		if(ratingType.equals("all")) {
			if(page == null) {
				model.addAttribute("ratings",ratingsPaged);
			}
			else {
		    	int pageNum = Integer.parseInt(page);
		    	ratingsPaged.setPage(pageNum - 1);
		      	model.addAttribute("ratings",ratingsPaged);
		    }
			model.addAttribute("typeSelect" , "all");
		}
		if(ratingType.equals("verygood")) {
			if(page == null) {
				model.addAttribute("ratings",ratingsFilteredVeryGoodPaged);
			}
			else {
		    	int pageNum = Integer.parseInt(page);
		    	ratingsFilteredVeryGoodPaged.setPage(pageNum - 1);
		      	model.addAttribute("ratings",ratingsFilteredVeryGoodPaged);
		    }
			model.addAttribute("typeSelect" , "verygood");
		}
		if(ratingType.equals("good")) {
			if(page == null) {
				model.addAttribute("ratings",ratingsFilteredGoodPaged);
			}
			else {
		    	int pageNum = Integer.parseInt(page);
		    	ratingsFilteredGoodPaged.setPage(pageNum - 1);
		      	model.addAttribute("ratings",ratingsFilteredGoodPaged);
		    }
			model.addAttribute("typeSelect" , "good");
		}
		if(ratingType.equals("average")) {
			if(page == null) {
				model.addAttribute("ratings",ratingsFilteredAveragePaged);
			}
			else {
		    	int pageNum = Integer.parseInt(page);
		    	ratingsFilteredAveragePaged.setPage(pageNum - 1);
		      	model.addAttribute("ratings",ratingsFilteredAveragePaged);
		    }
			model.addAttribute("typeSelect" , "average");
		}
		if(ratingType.equals("poor")) {
			if(page == null) {
				model.addAttribute("ratings",ratingsFilteredPoorPaged);
			}
			else {
		    	int pageNum = Integer.parseInt(page);
		    	ratingsFilteredPoorPaged.setPage(pageNum - 1);
		      	model.addAttribute("ratings",ratingsFilteredPoorPaged);
		    }
			model.addAttribute("typeSelect" , "poor");
		}
		return "serviceProvider/spMyRating";
	}
	
	@RequestMapping("/block-customer")
	public String spBlockCustomer(@RequestParam(required=false, name="page") String page, @RequestParam(required=false, name="count") String count ,Model model) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = this.userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		List<ServiceRequest> sr = this.serviceRequests.getServiceRequestBySPId(currentUser.getUser_id());
		Set<UserModel> users = new HashSet<UserModel>();
		List<FavouriteBlockedModel> favBlocked = this.userService.getFavBlockByUserId(currentUser.getUser_id()); 
		List<Integer> blockedId = new ArrayList<Integer>();
		Set<Integer> usersId = new HashSet<Integer>();
		List<UserModel> usersList = new ArrayList<UserModel>();
		
		for(ServiceRequest i: sr) {
			UserModel u = this.userService.getUserByUserId(i.getUser_id());
			users.add(u);
		}
		for(FavouriteBlockedModel i: favBlocked) {
			blockedId.add(i.getTarget_user_id());
		}
		for(UserModel i: users) {
			usersId.add(i.getUser_id());
			usersList.add(i);
		}
		
		
		PagedListHolder<UserModel> userPaged = new PagedListHolder<UserModel>();
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
		
		List<UserAddress> addresses = this.userService.getAllAddressByUserId(currentUser.getUser_id());
		UserAddress address = new UserAddress();
		
		for(UserAddress i: addresses) {
			address = i;
		}

		model.addAttribute("user" , currentUser);
		model.addAttribute("address" , address);
		return "serviceProvider/mySettingsSP";
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/service-details-data" , method = RequestMethod.POST)
	public ResponseEntity serviceDetailsData(@RequestBody int serviceReqId) {
		
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(serviceReqId);
		ServiceRequestAddress srAddress = this.serviceRequests.getServiceRequestAddressById(serviceReqId);
		ServiceRequestExtra srExtra = this.serviceRequests.getServiceRequestExtra(serviceReqId);
		
		List<Object> srList = new ArrayList<Object>();
		srList.add(sr);
		srList.add(srAddress);
		srList.add(srExtra);
		return ResponseEntity.status(HttpStatus.OK).body(srList);		
	}
	
	@SuppressWarnings({ "rawtypes", "deprecation" })
	@RequestMapping(value = "/service-accept" , method=RequestMethod.POST)
	public ResponseEntity serviceAccept(@RequestBody int serviceReqId) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(serviceReqId);
		
		List<ServiceRequest> allRequestsOfSp = this.serviceRequests.getServiceRequestBySPIdAndStatus(currentUser.getUser_id() , 2);
		Date todayDate = new Date();
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
				
				if(sr.getService_start_date().after(startDate) && sr.getService_start_date().before(endDate)) {
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("conflict" + i.getService_req_id());
				}
		}
		if(sr.getService_start_date().before(todayDate)) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("expired");
		}
		
		if(sr.getStatus() == 2) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("already accepted");
		}
		else {
			Date dateToday = new Date();
			
			sr.setService_provider_id(currentUser.getUser_id());
			sr.setSp_accepted_date(dateToday);
			sr.setModified_by(currentUser.getUser_id());
			sr.setModified_date(dateToday);
			sr.setStatus(2);
			this.serviceRequests.updateServiceRequestStatus(sr);
			
			UserModel user = this.userService.getUserByUserId(sr.getUser_id());
//			this.mainController.sendMail(user.getEmail() , "Your Service Request #"+sr.getService_req_id()+" is accepted by " + currentUser.getFirst_name() + " " + currentUser.getLast_name() + " ." );
			
			return ResponseEntity.status(HttpStatus.OK).body("updated");
		}
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
		
		UserModel customer = this.userService.getUserByUserId(sr.getUser_id());
//		this.mainController.sendMail(customer.getEmail() , "Your Service Request #"+sr.getService_req_id()+" is cancelled by " + currentUser.getFirst_name() + " " + currentUser.getLast_name() + " because of " + cancelReq.getCancel_comment()+ " ." );
		
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/service-complete" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> serviceComplete(@RequestBody int sr_id) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		
		Date dt = new Date();
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(sr_id);
		sr.setModified_date(dt);
		sr.setModified_by(currentUser.getUser_id());
		sr.setStatus(3);
		this.serviceRequests.updateServiceRequestStatus(sr);
		
		UserModel customer = this.userService.getUserByUserId(sr.getUser_id());
//		this.mainController.sendMail(customer.getEmail() , "Your Service Request #"+sr.getService_req_id()+" has been completed by " + currentUser.getFirst_name() + " " + currentUser.getLast_name() + " ." );

		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/favblock-unblock" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> FavBlockUnblock(@RequestBody int id) {
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = this.userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		FavouriteBlockedModel favBlock = this.userService.getFavBlockByUserIdAndTargetUserId(currentUser.getUser_id(), id);
		favBlock.setIs_blocked(0);
		
		this.userService.updateFavBlock(favBlock);
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@RequestMapping(value = "/favblock-block" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> FavBlockBlock(@RequestBody int id) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = this.userService.getUserByEmail(loggedInUserDetails.getUsername());
		
		FavouriteBlockedModel alreadyAdded = this.userService.getFavBlockByUserIdAndTargetUserId(currentUser.getUser_id(), id);
		
		if(alreadyAdded == null) {
			FavouriteBlockedModel newFavBlock = new FavouriteBlockedModel();
			newFavBlock.setIs_blocked(1);
			newFavBlock.setTarget_user_id(id);
			newFavBlock.setUser_id(currentUser.getUser_id());
			newFavBlock.setIs_favourite(0);
			this.userService.addFavBlock(newFavBlock);
		}
		else {
			FavouriteBlockedModel favBlock = this.userService.getFavBlockById(alreadyAdded.getId());
			favBlock.setIs_blocked(1);
			this.userService.updateFavBlock(favBlock);
		}
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/update-mydetails" , method=RequestMethod.POST)
	public String updateMyDetails(@ModelAttribute UserModel changeUser , @RequestParam("address_line1") String address_line1 , @RequestParam("address_line2") String address_line2 , @RequestParam("postal_code") String postal_code , @RequestParam("city") String city , RedirectAttributes redirectAttributes ) {
		
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
		else if(address_line1.length() < 1) {
			redirectAttributes.addFlashAttribute("errorInAddressLine1" , "AddressLine 1 can't be empty.");
			return "redirect:mysettings";
		}
		else if(postal_code.length() < 1) {
			redirectAttributes.addFlashAttribute("errorInPostalCode" , "PostalCode can't be empty.");
			return "redirect:mysettings";
		}
		else if(city.length() < 1) {
			redirectAttributes.addFlashAttribute("errorInCity" , "City can't be empty.");
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
			currentUser.setGender(changeUser.getGender());
			currentUser.setUser_profile_picture(changeUser.getUser_profile_picture());
			this.userService.updateUser(currentUser);
			
			List<UserAddress> addresses = this.userService.getAllAddressByUserId(currentUser.getUser_id());	
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
	
}

