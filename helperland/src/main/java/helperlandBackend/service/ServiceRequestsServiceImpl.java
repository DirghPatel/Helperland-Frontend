package helperlandBackend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperlandBackend.dao.ServiceRequestsDao;
import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;

@Service
public class ServiceRequestsServiceImpl implements ServiceRequestsService{

	@Autowired
	private ServiceRequestsDao serviceRequestsDao;
	
	public List<ServiceRequest> getAllServiceRequests() {
		return this.serviceRequestsDao.getAllServiceRequests();
	}
	
	public List<ServiceRequest> getNewPendingServiceRequestByUserId(int user_id) {
		return this.serviceRequestsDao.getNewPendingServiceRequestByUserId(user_id);
	}

	public List<ServiceRequest> getServiceRequestBySPId(int service_provider_id) {
		return this.serviceRequestsDao.getServiceRequestBySPId(service_provider_id);
	}
	
	public List<ServiceRequest> getServiceRequestBySPIdAndStatus(int service_provider_id, int status) {
		return this.serviceRequestsDao.getServiceRequestBySPIdAndStatus(service_provider_id , status);
	}
	
	public List<ServiceRequest> getAllServiceRequestsByUserIdAndStatus(int user_id, int status) {
		return this.serviceRequestsDao.getAllServiceRequestsByUserIdAndStatus(user_id , status);
	}
	
	public List<ServiceRequest> getServiceRequestByPostalCode(String postal_code) {
		return this.serviceRequestsDao.getServiceRequestByPostalCode(postal_code);
	}
	
	public List<ServiceRequestAddress> getAllServiceRequestAddress() {
		return this.serviceRequestsDao.getAllServiceRequestAddress();
	}

	public ServiceRequest getServiceRequestById(int id) {
		return this.serviceRequestsDao.getServiceRequestById(id);
	}

	public ServiceRequestAddress getServiceRequestAddressById(int service_req_id) {
		return this.serviceRequestsDao.getServiceRequestAddressById(service_req_id);
	}

	public ServiceRequestExtra getServiceRequestExtra(int service_req_id) {
		return this.serviceRequestsDao.getServiceRequestExtra(service_req_id);
	}

	public void updateServiceRequestStatus(ServiceRequest service_req_id) {
		this.serviceRequestsDao.updateServiceRequestStatus(service_req_id);
	}
	
	public List<ServiceRequest> getAllServiceRequestsHistoryByUserId(int user_id) {
		return this.serviceRequestsDao.getAllServiceRequestsHistoryByUserId(user_id);
	}

	


	
	
}
