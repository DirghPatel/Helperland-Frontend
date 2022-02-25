package helperlandBackend.service;

import java.util.List;

import helperlandBackend.models.RatingModel;

public interface ServiceRatingService {
	
	public int addServiceRating(RatingModel ratingModel );
	
	public List<RatingModel> getRatingsByRatingTo(int service_provider_id);
	
	public List<RatingModel> getRatingsByServiceId(int service_id);

}
