package helperlandBackend.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import helperlandBackend.models.RatingModel;

@Repository
public class ServiceRatingDaoImpl implements ServiceRatingDao{

	@Autowired
	private SessionFactory factory;
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int addServiceRating(RatingModel ratings) {
		
		int id = (Integer) this.hibernateTemplate.save(ratings);
		return id;
		
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<RatingModel> getRatingsByRatingTo(int service_provider_id) {
		return factory.getCurrentSession().createQuery("from rating where rating_to = :sp_id and is_approved = 1")
                .setParameter("sp_id", service_provider_id)
                .list();
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<RatingModel> getRatingsByServiceId(int service_id) {
		return factory.getCurrentSession().createQuery("from rating where service_request_id = :service_id and is_approved = 1")
                .setParameter("service_id", service_id)
                .list();
	}
}
