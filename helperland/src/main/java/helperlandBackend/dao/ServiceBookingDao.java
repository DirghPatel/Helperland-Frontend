package helperlandBackend.dao;

import java.util.List;

import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;


public interface ServiceBookingDao {

	public List<Object []> getUserWithPostalCode(String postalcode);
	
	public int addServiceRequest(ServiceRequest serviceRequest);
	
	public int saveServiceRequestAddress(ServiceRequestAddress serviceReqAddress);
	
	public int addServiceRequestExtra(ServiceRequestExtra serviceRequestExtra);
}
