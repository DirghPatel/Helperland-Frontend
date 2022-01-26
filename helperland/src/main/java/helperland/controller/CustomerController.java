package helperland.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	// customer dash 
		@RequestMapping("/dash")
		public String customerDash() {
			System.out.println("j inside");
			return "customer/custDash";
		}
		@RequestMapping("/fav-pros")
		public String custFavouritePros() {
			System.out.println("j inside");
			return "customer/custFavouritePros";
		}
		
		@RequestMapping("/notification")
		public String custNotification() {
			System.out.println("j inside");
			return "customer/custNotification";
		}
		@RequestMapping("/service-history")
		public String custServiceHistory() {
			System.out.println("j inside");
			return "customer/custServiceHistory";
		}
		@RequestMapping("/service-schedule")
		public String custSeviceSchedule() {
			System.out.println("j inside");
			return "customer/custSeviceSchedule";
		}
		@RequestMapping("/mysettings")
		public String mySettingsCust() {
			System.out.println("j inside");
			return "customer/mySettingsCust";
		}
}
