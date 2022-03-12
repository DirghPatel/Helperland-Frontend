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
import org.springframework.lang.Nullable;

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
	@Size(min = 10 , max=12 , message = "Mobile number must be in between 10 to 12 digits")
	private String mobile;
	
	@ValidPassword
	private String password;
	
	private int is_registered_user;
	private int works_with_pet;
	private int modified_by;
	private int is_approved;
	private int is_active;
	private int is_deleted;
	private int is_online;
	private int status;
	private Date created_date;
	private Date modified_date;
	private String reset_token;
	private String postal_code;
	private String user_profile_picture;
	private Date date_of_birth;
	private int gender;
	
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
	
	
	public String getUser_profile_picture() {
		return user_profile_picture;
	}

	public void setUser_profile_picture(String user_profile_picture) {
		this.user_profile_picture = user_profile_picture;
	}

	public Date getDate_of_birth() {
		return date_of_birth;
	}

	public void setDate_of_birth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	

	@Override
	public String toString() {
		return "UserModel [user_id=" + user_id + "]";
	}

	public UserModel(int user_id, int user_type_id, String first_name, String last_name, String email, String mobile,
			String password, int is_registered_user, int works_with_pet, int modified_by, int is_approved,
			int is_active, int is_deleted, int is_online, int status, Date created_date, Date modified_date,
			String reset_token, String postal_code, String user_profile_picture, Date date_of_birth, int gender) {
		super();
		this.user_id = user_id;
		this.user_type_id = user_type_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.email = email;
		this.mobile = mobile;
		this.password = password;
		this.is_registered_user = is_registered_user;
		this.works_with_pet = works_with_pet;
		this.modified_by = modified_by;
		this.is_approved = is_approved;
		this.is_active = is_active;
		this.is_deleted = is_deleted;
		this.is_online = is_online;
		this.status = status;
		this.created_date = created_date;
		this.modified_date = modified_date;
		this.reset_token = reset_token;
		this.postal_code = postal_code;
		this.user_profile_picture = user_profile_picture;
		this.date_of_birth = date_of_birth;
		this.gender = gender;
	}

	public UserModel() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((created_date == null) ? 0 : created_date.hashCode());
		result = prime * result + ((date_of_birth == null) ? 0 : date_of_birth.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((first_name == null) ? 0 : first_name.hashCode());
		result = prime * result + gender;
		result = prime * result + is_active;
		result = prime * result + is_approved;
		result = prime * result + is_deleted;
		result = prime * result + is_online;
		result = prime * result + is_registered_user;
		result = prime * result + ((last_name == null) ? 0 : last_name.hashCode());
		result = prime * result + ((mobile == null) ? 0 : mobile.hashCode());
		result = prime * result + modified_by;
		result = prime * result + ((modified_date == null) ? 0 : modified_date.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((postal_code == null) ? 0 : postal_code.hashCode());
		result = prime * result + ((reset_token == null) ? 0 : reset_token.hashCode());
		result = prime * result + status;
		result = prime * result + user_id;
		result = prime * result + ((user_profile_picture == null) ? 0 : user_profile_picture.hashCode());
		result = prime * result + user_type_id;
		result = prime * result + works_with_pet;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserModel other = (UserModel) obj;
		if (created_date == null) {
			if (other.created_date != null)
				return false;
		} else if (!created_date.equals(other.created_date))
			return false;
		if (date_of_birth == null) {
			if (other.date_of_birth != null)
				return false;
		} else if (!date_of_birth.equals(other.date_of_birth))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (first_name == null) {
			if (other.first_name != null)
				return false;
		} else if (!first_name.equals(other.first_name))
			return false;
		if (gender != other.gender)
			return false;
		if (is_active != other.is_active)
			return false;
		if (is_approved != other.is_approved)
			return false;
		if (is_deleted != other.is_deleted)
			return false;
		if (is_online != other.is_online)
			return false;
		if (is_registered_user != other.is_registered_user)
			return false;
		if (last_name == null) {
			if (other.last_name != null)
				return false;
		} else if (!last_name.equals(other.last_name))
			return false;
		if (mobile == null) {
			if (other.mobile != null)
				return false;
		} else if (!mobile.equals(other.mobile))
			return false;
		if (modified_by != other.modified_by)
			return false;
		if (modified_date == null) {
			if (other.modified_date != null)
				return false;
		} else if (!modified_date.equals(other.modified_date))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (postal_code == null) {
			if (other.postal_code != null)
				return false;
		} else if (!postal_code.equals(other.postal_code))
			return false;
		if (reset_token == null) {
			if (other.reset_token != null)
				return false;
		} else if (!reset_token.equals(other.reset_token))
			return false;
		if (status != other.status)
			return false;
		if (user_id != other.user_id)
			return false;
		if (user_profile_picture == null) {
			if (other.user_profile_picture != null)
				return false;
		} else if (!user_profile_picture.equals(other.user_profile_picture))
			return false;
		if (user_type_id != other.user_type_id)
			return false;
		if (works_with_pet != other.works_with_pet)
			return false;
		return true;
	}

	
	

	
}
