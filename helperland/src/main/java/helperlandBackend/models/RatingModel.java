package helperlandBackend.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity(name="rating")
@Table(name="rating")
public class RatingModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int rating_id;
	
	@NotNull
	private int service_request_id;
	
	@NotNull
	private int rating_from;
	
	@NotNull
	private int rating_to;
	
	@NotNull
	private int ratings;
	
	private String comments;
	
	@NotNull
	private Date rating_date;
	
	private int is_approved;
	
	@NotNull
	private int visible_on_homescreen;
	
	@NotNull
	private int on_time_arrival;
	
	@NotNull
	private int friendly;
	
	@NotNull
	private int quality_of_service;
	
	
	public int getRating_id() {
		return rating_id;
	}
	public void setRating_id(int rating_id) {
		this.rating_id = rating_id;
	}
	public int getservice_request_id() {
		return service_request_id;
	}
	public void setservice_request_id(int service_request_id) {
		this.service_request_id = service_request_id;
	}
	public int getRating_from() {
		return rating_from;
	}
	public void setRating_from(int rating_from) {
		this.rating_from = rating_from;
	}
	public int getRating_to() {
		return rating_to;
	}
	public void setRating_to(int rating_to) {
		this.rating_to = rating_to;
	}
	public int getRatings() {
		return ratings;
	}
	public void setRatings(int ratings) {
		this.ratings = ratings;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getRating_date() {
		return rating_date;
	}
	public void setRating_date(Date rating_date) {
		this.rating_date = rating_date;
	}
	public int getIs_approved() {
		return is_approved;
	}
	public void setIs_approved(int is_approved) {
		this.is_approved = is_approved;
	}
	public int getVisible_on_homescreen() {
		return visible_on_homescreen;
	}
	public void setVisible_on_homescreen(int visible_on_homescreen) {
		this.visible_on_homescreen = visible_on_homescreen;
	}
	public int getOn_time_arrival() {
		return on_time_arrival;
	}
	public void setOn_time_arrival(int on_time_arrival) {
		this.on_time_arrival = on_time_arrival;
	}
	public int getFriendly() {
		return friendly;
	}
	public void setFriendly(int friendly) {
		this.friendly = friendly;
	}
	public int getQuality_of_service() {
		return quality_of_service;
	}
	public void setQuality_of_service(int quality_of_service) {
		this.quality_of_service = quality_of_service;
	}
	@Override
	public String toString() {
		return "RatingModel [rating_id=" + rating_id + ", service_request_id=" + service_request_id + ", rating_from="
				+ rating_from + ", rating_to=" + rating_to + ", ratings=" + ratings + ", comments=" + comments
				+ ", rating_date=" + rating_date + ", is_approved=" + is_approved + ", visible_on_homescreen="
				+ visible_on_homescreen + ", on_time_arrival=" + on_time_arrival + ", friendly=" + friendly
				+ ", quality_of_service=" + quality_of_service + "]";
	}
	public RatingModel(int rating_id, int service_request_id, int rating_from, int rating_to, int ratings, String comments,
			Date rating_date, int is_approved, int visible_on_homescreen, int on_time_arrival, int friendly,
			int quality_of_service) {
		super();
		this.rating_id = rating_id;
		this.service_request_id = service_request_id;
		this.rating_from = rating_from;
		this.rating_to = rating_to;
		this.ratings = ratings;
		this.comments = comments;
		this.rating_date = rating_date;
		this.is_approved = is_approved;
		this.visible_on_homescreen = visible_on_homescreen;
		this.on_time_arrival = on_time_arrival;
		this.friendly = friendly;
		this.quality_of_service = quality_of_service;
	}
	public RatingModel() {
		super();
	}
	
}
