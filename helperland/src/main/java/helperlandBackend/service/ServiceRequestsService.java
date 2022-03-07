package helperlandBackend.service;

import java.util.List;

import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;

public interface ServiceRequestsService {

	public List<ServiceRequest> getAllServiceRequests();
	
	public List<ServiceRequest>getAllServiceRequestByUserId(int user_id);
	
	public List<ServiceRequest> getNewPendingServiceRequestByUserId(int user_id);
	
	public List<ServiceRequest>getServiceRequestBySPId(int service_provider_id);
	
	public List<ServiceRequest>getServiceRequestBySPIdAndStatus(int service_provider_id , int status);
	
//	public List<ServiceRequest> getAllServiceRequestsByUserIdAndStatus(int user_id , int status);
	
	public List<ServiceRequest> getServiceRequestByPostalCode(String postal_code);
	
	public List<ServiceRequestAddress> getAllServiceRequestAddress();
	
	public ServiceRequest getServiceRequestById(int id);
	
	public ServiceRequestAddress getServiceRequestAddressById(int service_req_id);
	
	public ServiceRequestExtra getServiceRequestExtra(int service_req_id);
	
	public void updateServiceRequestStatus(ServiceRequest service_req_id);
	
	public void updateServiceRequestAddress(ServiceRequestAddress service_req_address);
	
	public List<ServiceRequest> getAllServiceRequestsHistoryByUserId(int user_id);
	
}
