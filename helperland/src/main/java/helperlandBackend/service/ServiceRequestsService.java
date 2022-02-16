package helperlandBackend.service;

import java.util.List;

import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;

public interface ServiceRequestsService {

	public List<ServiceRequest> getServiceRequestByUserId(int user_id);
	
	public List<ServiceRequest> getServiceRequestByPostalCode(String postal_code);
	
	public List<ServiceRequestAddress> getAllServiceRequestAddress();
	
	public ServiceRequest getServiceRequestById(int id);
	
	public ServiceRequestAddress getServiceRequestAddressById(int service_req_id);
	
	public ServiceRequestExtra getServiceRequestExtra(int service_req_id);
	
	public void updateServiceRequestStatus(ServiceRequest service_req_id);
	
}
