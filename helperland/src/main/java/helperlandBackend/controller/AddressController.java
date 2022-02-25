package helperlandBackend.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import helperlandBackend.models.RatingModel;
import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;
import helperlandBackend.service.UserServiceImpl;

@Controller
public class AddressController {

	@Autowired
	private UserServiceImpl userService;
	
	@RequestMapping(value = "/add-address" , method = RequestMethod.POST)
	public ResponseEntity<HttpStatus> addAddress(@Valid @ModelAttribute UserAddress userAddress , BindingResult br) {
		
		
		if(br.hasErrors()) {
			return new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
		}
		else {
			User loggedInUserDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			UserModel currentUser = userService.getUserByEmail(loggedInUserDetails.getUsername());
			
			List<UserAddress> checkAddress = this.userService.getAllAddress(currentUser.getUser_id());
			
			if(checkAddress.isEmpty()) {
				Date dt = new Date();
				currentUser.setPostal_code(userAddress.getPostal_code());
				currentUser.setModified_by(currentUser.getUser_id());
				currentUser.setModified_date(dt);
				userAddress.setUser_id(currentUser.getUser_id());
				userAddress.setEmail(currentUser.getEmail());
				userAddress.setIs_default(1);
				this.userService.saveUserAddress(userAddress);
				this.userService.updateUser(currentUser);
			}
			else {
				userAddress.setUser_id(currentUser.getUser_id());
				userAddress.setEmail(currentUser.getEmail());
				this.userService.saveUserAddress(userAddress);
			}
			
			return new ResponseEntity<HttpStatus>(HttpStatus.OK);
		}
	}
	
	@RequestMapping(value = "/edit-address" , method = RequestMethod.POST)
	public ResponseEntity<HttpStatus> editAddress(@Valid @ModelAttribute UserAddress editAddress , BindingResult br) {
		if(br.hasErrors()) {
			return new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
		}
		else {
			
			UserAddress userAddress = this.userService.getAllAddressByAddressId(editAddress.getAddress_id());
			
			userAddress.setAddress_line1(editAddress.getAddress_line1());
			userAddress.setAddress_line2(editAddress.getAddress_line2());
			userAddress.setCity(editAddress.getCity());
			userAddress.setMobile(editAddress.getMobile());
			userAddress.setPostal_code(editAddress.getPostal_code());
						
			this.userService.updateUserAddress(userAddress);
			return new ResponseEntity<HttpStatus>(HttpStatus.OK);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/address-details" , method = RequestMethod.POST)
	public ResponseEntity serviceDetailsData(@RequestBody int addressId) {
		
		UserAddress addressDetails = this.userService.getAllAddressByAddressId(addressId); 
		return ResponseEntity.status(HttpStatus.OK).body(addressDetails);
		
	}
	
	@RequestMapping(value="address-delete" , method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> deleteAddress(@RequestBody int addressId){
		
		UserAddress address = this.userService.getAllAddressByAddressId(addressId);
		
		address.setIs_deleted(1);
		
		this.userService.updateUserAddress(address);
		
		return new ResponseEntity<HttpStatus>(HttpStatus.OK);
		
	}
}
