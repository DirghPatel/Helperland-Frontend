package helperlandBackend.dao;

import java.util.List;

import javax.persistence.NoResultException;

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
public class ServiceRequestsDaoImpl implements ServiceRequestsDao{

	@Autowired
	private SessionFactory factory;
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<ServiceRequest> getServiceRequestByUserId(int user_id) {
		return factory.getCurrentSession().createQuery("from service_request where user_id = :id")
                .setParameter("id", user_id)
                .list();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<ServiceRequest> getServiceRequestByPostalCode(String postal_code) {
		return factory.getCurrentSession().createQuery("from service_request where postal_code = :pc and user_id = service_provider_id")
                .setParameter("pc", postal_code)
                .list();
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<ServiceRequestAddress> getAllServiceRequestAddress() {
		return factory.getCurrentSession().createQuery("from service_request_address ")
                .list();
	}

	@Transactional
	public ServiceRequest getServiceRequestById(int id) {
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		try {
		  Query<ServiceRequest> query = session.createQuery("from service_request where service_req_id =:id",ServiceRequest.class);
		  query.setParameter("id", id);
		  ServiceRequest sr = query.getSingleResult();
		  System.out.println(sr);
		  return sr;
		}
		catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	public ServiceRequestAddress getServiceRequestAddressById(int service_req_id) {
		Session session = factory.getCurrentSession();
		try {
		  Query<ServiceRequestAddress> query = session.createQuery("from service_request_address where service_req_id =:id",ServiceRequestAddress.class);
		  query.setParameter("id", service_req_id);
		  ServiceRequestAddress sr = query.getSingleResult();
		  System.out.println(sr);
		  return sr;
		}
		catch (NoResultException e) {
			return null;
		}
	}

	@Transactional
	public ServiceRequestExtra getServiceRequestExtra(int service_req_id) {
		Session session = factory.getCurrentSession();
		try {
		  Query<ServiceRequestExtra> query = session.createQuery("from service_request_extra where service_req_id =:id",ServiceRequestExtra.class);
		  query.setParameter("id", service_req_id);
		  ServiceRequestExtra sr = query.getSingleResult();
		  System.out.println(sr);
		  return sr;
		}
		catch (NoResultException e) {
			return null;
		}
	}
	
	@Transactional
	public void updateServiceRequestStatus(ServiceRequest service_req_id) {
		this.hibernateTemplate.update(service_req_id);
	}
	
}
