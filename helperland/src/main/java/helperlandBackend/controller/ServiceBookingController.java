package helperlandBackend.controller;

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
	

	@RequestMapping(value = "/check-availability" , method =RequestMethod.POST)
	public ResponseEntity<HttpStatus> checkAvailability(@RequestBody String postal_code ) {

		System.out.println(postal_code);
		List<Object []> users = this.serviceBookingService.getUserByPostalCode(postal_code);
		HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
		if(users.isEmpty() ) {
			System.out.println("empty called");
			return new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
		}
		else {
			System.out.println("ok called");
			return new ResponseEntity<HttpStatus>(HttpStatus.OK);
		}
	}
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/service-address" , method =RequestMethod.POST)
	public ResponseEntity<HttpStatus> serviceAddress(@RequestBody int address_id ) {

		System.out.println(address_id);
		UserAddress userAddresses = this.userService.getAllAddressByAddressId(address_id);
		System.out.println(userAddresses);
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
	public ResponseEntity addNewService(@ModelAttribute ServiceRequest serviceRequest , Model model){
	
		System.out.println(serviceRequest);
		
		User loggedInUserDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());

		serviceRequest.setUser_id(currentUser.getUser_id());
		serviceRequest.setDiscount(20);
		serviceRequest.setDistance(0);
		serviceRequest.setPayment_due(0);
		serviceRequest.setService_provider_id(currentUser.getUser_id());
		serviceRequest.setModified_by(currentUser.getUser_id());
		
		System.out.println(serviceRequest);
		
		UserAddress userAddress = this.userService.getAllAddressByAddressId(serviceRequest.getAddress_id());
		System.out.println(userAddress);
		
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
		System.out.println(serviceReqAddress);
		
		ServiceRequestExtra serviceRequestExtra = new ServiceRequestExtra();
		serviceRequestExtra.setService_req_id(k);
		serviceRequestExtra.setCabinet(serviceRequest.getCabinet());
		serviceRequestExtra.setLaundry(serviceRequest.getLaundry());
		serviceRequestExtra.setOven(serviceRequest.getOven());
		serviceRequestExtra.setRefrigerator(serviceRequest.getRefrigerator());
		serviceRequestExtra.setWindows(serviceRequest.getWindows());
		
		int m = this.serviceBookingService.saveServiceRequestExtra(serviceRequestExtra);
				
		if(k != (int)k || l != (int)l || m != (int)m){
			System.out.println("first error");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("String or obj");
		}
		else {
			return ResponseEntity.status(HttpStatus.OK).body(serviceRequest.getService_req_id());
		}
	}
	
	
}
