package helperlandBackend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/service-provider")
public class ServiceProviderController {

	@RequestMapping("/dash")
	public String spDash() {
		System.out.println("k inside");
		return "serviceProvider/spDash";
	}
	@RequestMapping("/block-customer")
	public String spBlockCustomer() {
		System.out.println("k inside");
		return "serviceProvider/spBlockCustomer";
	}
	@RequestMapping("/my-ratings")
	public String spMyRating() {
		System.out.println("l inside");
		return "serviceProvider/spMyRating";
	}
	@RequestMapping("/notification")
	public String spNotification() {
		System.out.println("k inside");
		return "serviceProvider/spNotification";
	}
	@RequestMapping("/service-history")
	public String spServiceHistory() {
		System.out.println("k inside");
		return "serviceProvider/spServiceHistory";
	}
	@RequestMapping("/service-schedule")
	public String spServiceSchedule() {
		System.out.println("k inside");
		return "serviceProvider/spServiceSchedule";
	}
	@RequestMapping("/upcoming-services")
	public String spUpcomingServices() {
		System.out.println("k inside");
		return "serviceProvider/spUpcomingServices";
	}
	@RequestMapping("/mysettings")
	public String mySettingsSP() {
		System.out.println("j inside");
		return "serviceProvider/mySettingsSP";
	}
	
	
}

