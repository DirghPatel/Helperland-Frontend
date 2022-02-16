package helperlandBackend.service;

import java.util.List;

import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;

public interface ServiceBookingService {


	public List<Object []> getUserByPostalCode(String postalcode);
	
	public int saveServiceRequest(ServiceRequest serviceRequest);
	
	public int saveServiceRequestAddress(ServiceRequestAddress serviceRequestAddress);
	
	public int saveServiceRequestExtra(ServiceRequestExtra serviceRequestExtra);
	
}
