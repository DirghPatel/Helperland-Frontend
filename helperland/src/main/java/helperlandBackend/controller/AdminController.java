package helperlandBackend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/service-requests")
	public String serviceRequests() {
		System.out.println("j inside");
		return "admin/serviceRequests";
	}
	@RequestMapping("/user-management")
	public String userManagement() {
		System.out.println("u inside");
		return "admin/userManagement";
	}
	
}

