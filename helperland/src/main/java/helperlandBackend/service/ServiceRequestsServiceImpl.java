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
	
	
	public List<ServiceRequest> getServiceRequestByUserId(int user_id) {
		return this.serviceRequestsDao.getServiceRequestByUserId(user_id);
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
	
	
	
}
