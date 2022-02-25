package helperlandBackend.dao;

import java.util.List;

import helperlandBackend.models.RatingModel;

public interface ServiceRatingDao {

	public int addServiceRating(RatingModel ratings);
	
	public List<RatingModel> getRatingsByRatingTo(int service_id);
	
	public List<RatingModel> getRatingsByServiceId(int service_id);
	
	
}
