package helperlandBackend.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
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

import helperlandBackend.models.FavouriteBlockedModel;
import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;
import helperlandBackend.service.ServiceBookingServiceImpl;
import helperlandBackend.service.UserService;

@Controller
public class ServiceBookingController {
	
	@Autowired
	private ServiceBookingServiceImpl serviceBookingService;
	
	@Autowired
	private MainController mainController;

	@RequestMapping(value = "/check-availability" , method =RequestMethod.POST)
	public ResponseEntity<HttpStatus> checkAvailability(@RequestBody String postal_code ) {

		List<Object []> users = this.serviceBookingService.getUserByPostalCode(postal_code);
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
		if(users.isEmpty() ) {
			return new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
		}
		else {
			return new ResponseEntity<HttpStatus>(HttpStatus.OK);
		}
	}
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/service-address" , method =RequestMethod.POST)
	public ResponseEntity<HttpStatus> serviceAddress(@RequestBody int address_id ) {

		UserAddress userAddresses = this.userService.getAllAddressByAddressId(address_id);
		if(userAddresses == null) {
			return new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
		}
		else {
			HttpHeaders headers = new HttpHeaders();
	        headers.add("Content-Type", "application/json");
			return new ResponseEntity<HttpStatus>(HttpStatus.OK);
		}
	}
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/service-request" , method = RequestMethod.POST)
	public ResponseEntity addNewService(@ModelAttribute ServiceRequest serviceRequest , @RequestParam(value = "fav-sp-id" , defaultValue = "0000") int fav_sp_id , Model model){
	
		User loggedInUserDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());

		serviceRequest.setUser_id(currentUser.getUser_id());
		serviceRequest.setDiscount(20);
		serviceRequest.setDistance(0);
		serviceRequest.setPayment_due(0);
		serviceRequest.setService_provider_id(currentUser.getUser_id());
		serviceRequest.setModified_by(currentUser.getUser_id());
		serviceRequest.setStatus(1);
		if(fav_sp_id != 0) {
			serviceRequest.setStatus(2);
			serviceRequest.setService_provider_id(fav_sp_id);
		}
		
		UserAddress userAddress = this.userService.getAllAddressByAddressId(serviceRequest.getAddress_id());
		int k = this.serviceBookingService.saveServiceRequest(serviceRequest);
		
		ServiceRequestAddress serviceReqAddress = new ServiceRequestAddress();
		serviceReqAddress.setAddress_line1(userAddress.getAddress_line1());
		serviceReqAddress.setAddress_line2(userAddress.getAddress_line2());
		serviceReqAddress.setCity(userAddress.getCity());
		serviceReqAddress.setEmail(userAddress.getEmail());
		serviceReqAddress.setMobile(userAddress.getMobile());
		serviceReqAddress.setPostal_code(userAddress.getPostal_code());
		serviceReqAddress.setState(userAddress.getState());
		serviceReqAddress.setService_req_id(k);
		int l = this.serviceBookingService.saveServiceRequestAddress(serviceReqAddress);
		
		ServiceRequestExtra serviceRequestExtra = new ServiceRequestExtra();
		serviceRequestExtra.setService_req_id(k);
		serviceRequestExtra.setCabinet(serviceRequest.getCabinet());
		serviceRequestExtra.setLaundry(serviceRequest.getLaundry());
		serviceRequestExtra.setOven(serviceRequest.getOven());
		serviceRequestExtra.setRefrigerator(serviceRequest.getRefrigerator());
		serviceRequestExtra.setWindows(serviceRequest.getWindows());
		int m = this.serviceBookingService.saveServiceRequestExtra(serviceRequestExtra);
				
		if(k != (int)k || l != (int)l || m != (int)m){
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("String or obj");
		}
		else {
			List<UserModel> userSp = this.userService.getAllUser();
			List<UserModel> userEmails = new ArrayList<UserModel>();
			for(UserModel i: userSp) {
				if(i.getPostal_code() != null) {
					if(i.getPostal_code().equals(serviceRequest.getPostal_code())&& i.getUser_type_id() == 2){
						FavouriteBlockedModel fb = this.userService.getFavBlockByUserIdAndTargetUserId(serviceRequest.getUser_id(), i.getUser_id());
						FavouriteBlockedModel fb1 = this.userService.getFavBlockByUserIdAndTargetUserId(i.getUser_id() ,serviceRequest.getUser_id());
						if(fb == null && fb1 == null) {
							userEmails.add(i);
						}
						else {
							if(fb != null && fb1 != null) {
								if(fb.getIs_blocked() == 0 && fb1.getIs_blocked() == 0) {
									userEmails.add(i);
								}
							}
							else if( fb != null) {
								if(fb.getIs_blocked() == 0) {
									userEmails.add(i);
								}
							}
							else if( fb1 != null) {
								if(fb1.getIs_blocked() == 0) {
									userEmails.add(i);
								}
							}
						}
					}	
				}
			}
			for(UserModel i : userEmails) {
//				this.mainController.sendMail(i.getEmail() , "A new Service Request #" + serviceRequest.getService_req_id() + " is available in your postal code " + i.getPostal_code() + " area.");
//				System.out.println(i.getEmail());
//				this.mainController.sendMail("dirghpatel8801@gmail.com" , "A new Service Request #" + serviceRequest.getService_req_id() + " is available in your postal code " + i.getPostal_code() + " area.");
			}
			if(serviceRequest.getService_provider_id() != serviceRequest.getUser_id()) {
				UserModel userSpDirect = this.userService.getUserByUserId(serviceRequest.getService_provider_id());
//				this.mainController.sendMail(userSpDirect.getEmail() , "A new Service Request #" + serviceRequest.getService_req_id() + " is directly assigned to you.");
//				System.out.println(userSpDirect.getEmail() );
//				this.mainController.sendMail("dirghpatel8801@gmail.com" , "A new Service Request #" + serviceRequest.getService_req_id() + " is directly assigned to you.");
			}
			return ResponseEntity.status(HttpStatus.OK).body(serviceRequest.getService_req_id());
		}
	}
}
