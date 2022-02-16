package helperlandBackend.dao;

import java.util.Arrays;
import java.util.List;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import helperlandBackend.models.ServiceRequest;
import helperlandBackend.models.ServiceRequestAddress;
import helperlandBackend.models.ServiceRequestExtra;

@Repository
public class ServiceBookingDaoImpl implements ServiceBookingDao {

	@Autowired
	private SessionFactory factory;
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public List<Object []> getUserWithPostalCode(String postalcode) {
		
		Session session = factory.getCurrentSession();
		
		try {
			  Query<Object []> query = session.createQuery("from user as a INNER JOIN user_address as b ON a.user_id = b.user_id where b.postal_code = :postal_code and a.user_type_id = 2"  , Object [].class);
			  query.setParameter("postal_code", postalcode);
			  List<Object []> usersWithPostalCode= query.getResultList();
			  System.out.println("--------"+usersWithPostalCode);
			  return usersWithPostalCode;
			}
			catch (NoResultException e) {
				return null;
			}
	}

	@Transactional
	public int addServiceRequest(ServiceRequest serviceRequest) {
		
		int id = (Integer) this.hibernateTemplate.save(serviceRequest);
		
		return id;
	}
	
	@Transactional
	public int saveServiceRequestAddress(ServiceRequestAddress serviceReqAddress) {
		int id = (Integer) this.hibernateTemplate.save(serviceReqAddress);
		return id;
	}
	
	@Transactional
	public int addServiceRequestExtra(ServiceRequestExtra serviceRequestExtra) {
		int id = (Integer) this.hibernateTemplate.save(serviceRequestExtra);
		return id;
	}
	
}
