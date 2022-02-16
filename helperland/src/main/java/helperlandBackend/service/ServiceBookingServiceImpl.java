package helperlandBackend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperlandBackend.dao.ServiceBookingDao;
import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;
import helperlandBackend.models.UserAddress;
import helperlandBackend.models.UserModel;

@Service
public class ServiceBookingServiceImpl implements ServiceBookingService {

	@Autowired
	private ServiceBookingDao serviceBookingDao;
	
	public List<Object []> getUserByPostalCode(String postalcode) {
		return serviceBookingDao.getUserWithPostalCode(postalcode);
	}

	public int saveServiceRequest(ServiceRequest serviceRequest) {
		return this.serviceBookingDao.addServiceRequest(serviceRequest);
	}

	public int saveServiceRequestAddress(ServiceRequestAddress serviceRequestAddress) {
		return this.serviceBookingDao.saveServiceRequestAddress(serviceRequestAddress);
	}

	public int saveServiceRequestExtra(ServiceRequestExtra serviceRequestExtra) {
		return this.serviceBookingDao.addServiceRequestExtra(serviceRequestExtra);
	}
	
}
