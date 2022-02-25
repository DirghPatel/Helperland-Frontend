package helperlandBackend.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity(name="favourite_blocked")
@Table(name="favourite_blocked")
public class FavouriteBlockedModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@NotNull
	private int user_id;
	@NotNull
	private int target_user_id;
	@NotNull
	private int is_favourite;
	@NotNull
	private int is_blocked;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getTarget_user_id() {
		return target_user_id;
	}
	public void setTarget_user_id(int target_user_id) {
		this.target_user_id = target_user_id;
	}
	public int getIs_favourite() {
		return is_favourite;
	}
	public void setIs_favourite(int is_favourite) {
		this.is_favourite = is_favourite;
	}
	public int getIs_blocked() {
		return is_blocked;
	}
	public void setIs_blocked(int is_blocked) {
		this.is_blocked = is_blocked;
	}
	@Override
	public String toString() {
		return "FavouriteBlockedModel [id=" + id + ", user_id=" + user_id + ", target_user_id=" + target_user_id
				+ ", is_favourite=" + is_favourite + ", is_blocked=" + is_blocked + "]";
	}
	public FavouriteBlockedModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FavouriteBlockedModel(int id, int user_id, int target_user_id, int is_favourite, int is_blocked) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.target_user_id = target_user_id;
		this.is_favourite = is_favourite;
		this.is_blocked = is_blocked;
	}
	
	
	
}
