package helperlandBackend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperlandBackend.dao.ServiceRatingDao;
import helperlandBackend.models.RatingModel;

@Service
public class ServiceRatingServiceImpl implements ServiceRatingService{

	@Autowired
	private ServiceRatingDao serviceRatingDao;
	
	public int addServiceRating(RatingModel ratingModel) {
		return this.serviceRatingDao.addServiceRating(ratingModel);
	}

	public List<RatingModel> getRatingsByRatingTo(int service_provider_id) {
		return this.serviceRatingDao.getRatingsByRatingTo(service_provider_id);
	}
	
	public List<RatingModel> getRatingsByServiceId(int service_id) {
		return this.serviceRatingDao.getRatingsByServiceId(service_id);
	}

}
