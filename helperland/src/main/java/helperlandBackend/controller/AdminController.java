package helperlandBackend.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestParam;

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
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private UserServiceImpl userService;
	
	@Autowired
	private ServiceRequestsServiceImpl serviceRequests;
	
	@Autowired
	private ServiceRatingServiceImpl serviceRating;
	
	@RequestMapping("/service-requests")
	public String serviceRequests(Model model) {
		
		List<UserModel> allUsers = this.userService.getAllUser();
		Set<UserModel> usersCust = new HashSet<UserModel>();
		Set<UserModel> usersSP = new HashSet<UserModel>();
		List<ServiceRequest> sr = this.serviceRequests.getAllServiceRequests();
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequestAddress> srAddress = new ArrayList<ServiceRequestAddress>();
		Map<Integer, Integer> spRating = new HashMap<Integer, Integer>();
		
		for(ServiceRequest i: sr) {
			UserModel uCust = this.userService.getUserByUserId(i.getUser_id());
			users.add(uCust);
			UserModel uSP = this.userService.getUserByUserId(i.getService_provider_id());
			users.add(uSP);
			
			ServiceRequestAddress address = this.serviceRequests.getServiceRequestAddressById(i.getService_req_id());
			srAddress.add(address);
			
			List<RatingModel> ratings = this.serviceRating.getRatingsByRatingTo(i.getService_provider_id());
			int avgRating = 0; 
			
			for(RatingModel j : ratings) {
				   avgRating = avgRating + j.getRatings();
			}
			
			if(ratings.size() == 0) {
				avgRating = avgRating / 1;
			}
			else {
				avgRating = avgRating / ratings.size();
			}
			spRating.put(i.getService_provider_id(), avgRating);
		}
		for(UserModel u:allUsers) {
			if(u.getUser_type_id() == 1) {
				usersCust.add(u);
			}
			else if(u.getUser_type_id() == 2) {
				usersSP.add(u);
			}
		}
		
		model.addAttribute("service_requests" , sr);
		model.addAttribute("users" , users);
		model.addAttribute("srAddress" , srAddress);
		model.addAttribute("spRating" , spRating);
		model.addAttribute("usersCust" , usersCust);
		model.addAttribute("usersSP" , usersSP);
		return "admin/serviceRequests";
	}
	
	public boolean checkDate(Date from , Date to , Date check) {
		if(check.after(from) && check.before(to)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@RequestMapping(value = "/service-requests" , method=RequestMethod.POST)
	public String serviceRequestsSearch(Model model , @RequestParam(value = "service_req_id" , defaultValue = "null") String sr_id , @RequestParam(value = "customer" , defaultValue = "null") String custId , @RequestParam(value = "serviceprovider" , defaultValue = "null") String spId , @RequestParam(value= "status" , defaultValue = "null") String status , @RequestParam(value = "fromdate" , defaultValue = "null") String fromDate , @RequestParam(value = "todate" , defaultValue = "null") String toDate) throws ParseException {
		
		List<UserModel> allUsers = this.userService.getAllUser();
		Set<UserModel> usersCust = new HashSet<UserModel>();
		Set<UserModel> usersSP = new HashSet<UserModel>();
		List<ServiceRequest> sr1 = this.serviceRequests.getAllServiceRequests();
		Set<UserModel> users = new HashSet<UserModel>();
		List<ServiceRequestAddress> srAddress = new ArrayList<ServiceRequestAddress>();
		Map<Integer, Integer> spRating = new HashMap<Integer, Integer>();
		List<ServiceRequest> sr = new ArrayList<ServiceRequest>();
		
		for(ServiceRequest i: sr1) {
			String id = String.valueOf(i.getService_req_id());
			String cid = String.valueOf(i.getUser_id());
			String sid = String.valueOf(i.getService_provider_id());
			String sts = String.valueOf(i.getStatus());
			
			if(id.equals(sr_id) || cid.equals(custId)  || sid.equals(spId) || sts.equals(status)) {
				if(id.equals(sr_id) && cid.equals("null") && sid.equals("null") && sts.equals("null")) {
					sr.add(i);
				}
				else if(id.equals("null") && cid.equals(custId) && sid.equals("null") && sts.equals("null")) {
					sr.add(i);
				}
				else if(id.equals("null") && cid.equals("null") && sid.equals(spId) && sts.equals("null")) {
					sr.add(i);
				}
				else if(id.equals("null") && cid.equals("null") && sid.equals("null") && sts.equals(status)) {
					sr.add(i);
				}
				else if(id.equals(sr_id) && cid.equals(custId) && sid.equals("null") && sts.equals("null")) {
					sr.add(i);
				}
				else if(id.equals(sr_id) && cid.equals("null") && sid.equals(spId) && sts.equals("null")) {
					sr.add(i);
				}
				else if(id.equals(sr_id) && cid.equals("null") && sid.equals("null") && sts.equals(status)) {
					sr.add(i);
				}
				else if(id.equals("null") && cid.equals(custId) && sid.equals(spId) && sts.equals("null")) {
					sr.add(i);
				}
				else if(id.equals("null") && cid.equals(custId) && sid.equals("null") && sts.equals(status)) {
					sr.add(i);
				}
				else if(id.equals("null") && cid.equals("null") && sid.equals(spId) && sts.equals(status)) {
					sr.add(i);
				}
				else if(id.equals(sr_id) && cid.equals(custId) && sid.equals(spId) && sts.equals("null")) {
					sr.add(i);
				}
				else if(id.equals(sr_id) && cid.equals(custId) && sid.equals("null") && sts.equals(status)) {
					sr.add(i);
				}
				else if(id.equals(sr_id) && cid.equals("null") && sid.equals(spId) && sts.equals(status)) {
					sr.add(i);
				}
				else if(id.equals("null") && cid.equals(custId) && sid.equals(spId) && sts.equals(status)) {
					sr.add(i);
				}
				else if(id.equals(sr_id) && cid.equals(custId) && sid.equals(spId) && sts.equals(status)) {
					sr.add(i);
				}
				else {
					sr.add(i);
				}
			}
			else if(sr_id.equals("null") && custId.equals("null") && spId.equals("null") && status.equals("null")) {
				sr.add(i);
			}
		}

		List<ServiceRequest> srIds = new ArrayList<ServiceRequest>();
		for(ServiceRequest i: sr) {
			if(!fromDate.equals("null") && !fromDate.equals("null")) {
				Date fromdt = new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
				Date todt = new SimpleDateFormat("yyyy-MM-dd").parse(toDate);
				if(!checkDate(fromdt , todt , i.getService_start_date())) {
					srIds.add(i);
				}
			}
		}
		for(ServiceRequest i: srIds) {
			sr.remove(i);
		}
		
		for(ServiceRequest i: sr) {
			UserModel uCust = this.userService.getUserByUserId(i.getUser_id());
			users.add(uCust);
			
			UserModel uSP = this.userService.getUserByUserId(i.getService_provider_id());
			users.add(uSP);
			
			ServiceRequestAddress address = this.serviceRequests.getServiceRequestAddressById(i.getService_req_id());
			srAddress.add(address);
			
			List<RatingModel> ratings = this.serviceRating.getRatingsByRatingTo(i.getService_provider_id());
			int avgRating = 0; 
			
			for(RatingModel j : ratings) {
				   avgRating = avgRating + j.getRatings();
			}
			
			if(ratings.size() == 0) {
				avgRating = avgRating / 1;
			}
			else {
				avgRating = avgRating / ratings.size();
			}
			spRating.put(i.getService_provider_id(), avgRating);
		}
		
		for(UserModel u:allUsers) {
			if(u.getUser_type_id() == 1) {
				usersCust.add(u);
			}
			else if(u.getUser_type_id() == 2) {
				usersSP.add(u);
			}				
		}
		
		model.addAttribute("service_requests" , sr);
		model.addAttribute("users" , users);
		model.addAttribute("srAddress" , srAddress);
		model.addAttribute("spRating" , spRating);
		model.addAttribute("usersCust" , usersCust);
		model.addAttribute("usersSP" , usersSP);
		return "admin/serviceRequests";
	}
	
	@RequestMapping("/user-management")
	public String userManagement(Model model) {
		List<UserModel> users = this.userService.getAllUser();
		List<UserAddress> addresses = this.userService.getAllUserAddress();
		
		model.addAttribute("users" , users);
		model.addAttribute("addresses" , addresses);
		return "admin/userManagement";
	}
	
	@RequestMapping(value = "/user-management" , method =RequestMethod.POST)
	public String userManagementSerach(Model model ,@RequestParam(value = "username" , defaultValue = "null") String username , @RequestParam(value = "userrole" , defaultValue = "null") String userrole ,@RequestParam(value = "mobile" , defaultValue = "null") String mobile ,@RequestParam(value = "postalcode",  defaultValue = "null" ) String postalcode) {
		List<UserModel> users = this.userService.getAllUser();
		List<UserAddress> addresses = this.userService.getAllUserAddress();
		List<UserModel> userAdd = new ArrayList<UserModel>();
		
		for(UserModel u: users) {
			String type_id = String.valueOf(u.getUser_type_id());
			if(u.getEmail() == null) {
				u.setEmail("");
			}
			if(u.getPostal_code() == null) {
				u.setPostal_code("");
			}
			if(u.getEmail().equals(username) || u.getMobile().equals(mobile) || u.getPostal_code().equals(postalcode) || type_id.equals(userrole)) {
				if(username.equals(u.getEmail()) && mobile.equals("null") && userrole.equals("null") && postalcode.equals("null")) {
					userAdd.add(u);
				}
				else if(username.equals("null") && mobile.equals(u.getMobile()) && userrole.equals("null") && postalcode.equals("null")) {
					userAdd.add(u);
				}
				else if(username.equals("null") && mobile.equals("null") && userrole.equals(type_id) && postalcode.equals("null")) {
					userAdd.add(u);
				}
				else if(username.equals("null") && mobile.equals("null") && userrole.equals("null") && postalcode.equals(u.getPostal_code())) {
					userAdd.add(u);
				}
				else if(username.equals(u.getEmail()) && mobile.equals(u.getMobile()) && userrole.equals("null") && postalcode.equals("null")) {
					userAdd.add(u);
				}
				else if(username.equals(u.getEmail()) && mobile.equals("null") && userrole.equals(type_id) && postalcode.equals("null")) {
					userAdd.add(u);
				}
				else if(username.equals(u.getEmail()) && mobile.equals("null") && userrole.equals("null") && postalcode.equals(u.getPostal_code())) {
					userAdd.add(u);
				}
				else if(username.equals("null") && mobile.equals(u.getMobile()) && userrole.equals(type_id) && postalcode.equals("null")) {
					userAdd.add(u);
				}
				else if(username.equals("null") && mobile.equals(u.getMobile()) && userrole.equals("null") && postalcode.equals(u.getPostal_code())) {
					userAdd.add(u);
				}
				else if(username.equals("null") && mobile.equals("null") && userrole.equals(type_id) && postalcode.equals(u.getPostal_code())) {
					userAdd.add(u);
				}
				else if(username.equals(u.getEmail()) && mobile.equals(u.getMobile()) && userrole.equals(type_id) && postalcode.equals("null")) {
					userAdd.add(u);
				}
				else if(username.equals(u.getEmail()) && mobile.equals("null") && userrole.equals(type_id) && postalcode.equals(u.getPostal_code())) {
					userAdd.add(u);
				}
				else if(username.equals(u.getEmail()) && mobile.equals(u.getMobile()) && userrole.equals("null") && postalcode.equals(u.getPostal_code())) {
					userAdd.add(u);
				}
				else if(username.equals("null") && mobile.equals(u.getMobile()) && userrole.equals(type_id) && postalcode.equals(u.getPostal_code())) {
					userAdd.add(u);
				}
				else if(username.equals(u.getEmail()) && mobile.equals(u.getMobile()) && userrole.equals(type_id) && postalcode.equals(u.getPostal_code())) {
					userAdd.add(u);
				}
				else {
					userAdd.add(u);
				}
			}
			else if(username.equals("null") && mobile.equals("null") && userrole.equals("null") && postalcode.equals("null")){
				userAdd.add(u);
			}
		}
		model.addAttribute("users" , userAdd);
		model.addAttribute("addresses" , addresses);
		
		return "admin/userManagement";
	}
	
	@RequestMapping(value = "/update-user" , method=RequestMethod.POST)
	public String updateUser(@RequestBody int user_id) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
		Date dtToday = new Date();
		UserModel userToModify = this.userService.getUserByUserId(user_id);
		int status = userToModify.getStatus();
		
		if(status == 0) {
			userToModify.setStatus(1);
		}
		if(status == 1) {
			userToModify.setStatus(0);
		}
		
		userToModify.setModified_by(currentUser.getUser_id());
		userToModify.setModified_date(dtToday);
		this.userService.updateUser(userToModify);
		
		return "redirect:user-management";
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
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/edit-details-data" , method = RequestMethod.POST)
	public ResponseEntity editDetailsData(@RequestBody int serviceReqId) {
		
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(serviceReqId);
		ServiceRequestAddress srAddress = this.serviceRequests.getServiceRequestAddressById(serviceReqId);
		List<Object> srList = new ArrayList<Object>();
		
		srList.add(sr);
		srList.add(srAddress);
		return ResponseEntity.status(HttpStatus.OK).body(srList);	
	}

	@SuppressWarnings({ "rawtypes", "deprecation" })
	@RequestMapping(value = "/edit-service" , method=RequestMethod.POST)
	public ResponseEntity editService(@RequestParam("service_req_id") int service_req_id,@RequestParam("service_start_date") Date service_start_date , @RequestParam("address_line1") String address_line1 , @RequestParam("address_line2") String address_line2 , @RequestParam("postal_code") String postal_code , @RequestParam("city") String city) {
		
		User loggedInUserDetails = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());	
		ServiceRequest sr = this.serviceRequests.getServiceRequestById(service_req_id);
		List<ServiceRequest> allRequestsOfSp = this.serviceRequests.getServiceRequestBySPIdAndStatus(sr.getService_provider_id() , 2);
		List<ServiceRequest> srRescheduled = this.serviceRequests.getServiceRequestBySPIdAndStatus(sr.getService_provider_id() , 4);
		Date dateToday = new Date();  		
		
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
				if(i.getService_req_id() != sr.getService_req_id()){
					return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("conflict");
				}
			}
		}
		sr.setService_start_date(service_start_date);
		sr.setModified_date(dateToday);
		sr.setModified_by(currentUser.getUser_id());
		
		ServiceRequestAddress srAddress = this.serviceRequests.getServiceRequestAddressById(service_req_id);
		srAddress.setAddress_line1(address_line1);
		srAddress.setAddress_line2(address_line2);
		srAddress.setCity(city);
		srAddress.setPostal_code(postal_code);
		
		this.serviceRequests.updateServiceRequestStatus(sr);
		this.serviceRequests.updateServiceRequestAddress(srAddress);
		return ResponseEntity.status(HttpStatus.OK).body("updated");
	}
}

