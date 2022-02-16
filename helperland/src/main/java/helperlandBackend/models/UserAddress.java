package helperlandBackend.models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity(name = "user_address")
@Table(name="user_address")
public class UserAddress {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO )
	private int address_id;
	
//	@NotBlank
	private int user_id;
	
//	@NotBlank
	private String address_line1;
	
	private String address_line2;
	
//	@NotBlank
	private String city;
	
	private String state;
	
//	@NotBlank
	private String postal_code;
	
//	@NotBlank
	private int is_default;
	
//	@NotBlank
	private int is_deleted;
	
	private String mobile;
	private String email;


	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getAddress_line1() {
		return address_line1;
	}
	public void setAddress_line1(String address_line1) {
		this.address_line1 = address_line1;
	}
	public String getAddress_line2() {
		return address_line2;
	}
	public void setAddress_line2(String address_line2) {
		this.address_line2 = address_line2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	public int getIs_default() {
		return is_default;
	}
	public void setIs_default(int is_default) {
		this.is_default = is_default;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public UserAddress() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserAddress(int address_id, int user_id, String address_line1, String address_line2, String city,
			String state, String postal_code, int is_default, int is_deleted, String mobile, String email, int type) {
		super();
		this.address_id = address_id;
		this.user_id = user_id;
		this.address_line1 = address_line1;
		this.address_line2 = address_line2;
		this.city = city;
		this.state = state;
		this.postal_code = postal_code;
		this.is_default = is_default;
		this.is_deleted = is_deleted;
		this.mobile = mobile;
		this.email = email;
	}
	@Override
	public String toString() {
		return "UserAddress [address_id=" + address_id + ", user_id=" + user_id + ", address_line1=" + address_line1
				+ ", address_line2=" + address_line2 + ", city=" + city + ", state=" + state + ", postal_code="
				+ postal_code + ", is_default=" + is_default + ", is_deleted=" + is_deleted + ", mobile=" + mobile
				+ ", email=" + email + ", type=" + "]";
	}
	
	

}
