package helperlandBackend.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import helperlandBackend.validator.ValidPassword;


@Entity(name="user")
@Table(name="user")
public class UserModel{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int user_id;
	
	
	private int user_type_id;

	@NotBlank
	private String first_name;

	@NotBlank
	private String last_name;	
	
	@Email
	@NotBlank
	private String email;
	
	@NotBlank
	private String mobile;
	
	@ValidPassword
	@Size(min = 6 , max=14)
	private String password;
	
	private int is_registered_user;
	private int works_with_pet;
	private int modified_by;
	private int is_approved;
	private int is_active;
	private int is_deleted;
	private int is_online;
	private Date created_date;
	private Date modified_date;
	private String reset_token;
	private String postal_code;
	
	public Date getModified_date() {
		return modified_date;
	}

	public void setModified_date(Date modified_date) {
		this.modified_date = modified_date;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

	public UserModel() {
		super();
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getUser_type_id() {
		return user_type_id;
	}
	public void setUser_type_id(int user_type_id) {
		this.user_type_id = user_type_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getIs_registered_user() {
		return is_registered_user;
	}
	public void setIs_registered_user(int is_registered_user) {
		this.is_registered_user = is_registered_user;
	}
	public int getWorks_with_pet() {
		return works_with_pet;
	}
	public void setWorks_with_pet(int works_with_pet) {
		this.works_with_pet = works_with_pet;
	}
	public int getModified_by() {
		return modified_by;
	}
	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}
	public int getIs_approved() {
		return is_approved;
	}
	public void setIs_approved(int is_approved) {
		this.is_approved = is_approved;
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	public int getIs_online() {
		return is_online;
	}
	public void setIs_online(int is_online) {
		this.is_online = is_online;
	}

	public String getReset_token() {
		return reset_token;
	}

	public void setReset_token(String reset_token) {
		this.reset_token = reset_token;
	}

	public String getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	
	
	@Override
	public String toString() {
		return "user [user_id=" + user_id + ", user_type_id=" + user_type_id + ", first_name=" + first_name
				+ ", last_name=" + last_name + ", email=" + email + ", mobile=" + mobile + ", password=" + password
				+ ", is_registered_user=" + is_registered_user + ", works_with_pet=" + works_with_pet + ", modified_by="
				+ modified_by + ", is_approved=" + is_approved + ", is_active=" + is_active + ", is_deleted="
				+ is_deleted + ", is_online=" + is_online + "]";
	}

	
}
