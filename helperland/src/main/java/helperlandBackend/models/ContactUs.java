package helperlandBackend.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name="contact_us")
public class ContactUs {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int contact_us_id;
	
	@NotBlank(message="please enter this field")
	private String firstname;
	private String lastname;
	
	@NotBlank(message="please enter this field")
	private String email;
	@NotBlank(message="please enter this field")
	private String subject_type;
	@NotBlank(message="please enter this field")
	private String phone_number;
	@NotBlank(message="please enter this field")
	private String message;
	private Date created_on;
	private int is_deleted;
	private String name;
	private int created_by;
	
	public String getName() {
		return name;
	}
	public void setName(String fname , String lname) {
		this.name = fname +" "+ lname;
	}

	@Override
	public String toString() {
		return "ContactUs [contact_us_id=" + contact_us_id + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", email=" + email + ", subject_type=" + subject_type + ", phone_number=" + phone_number
				+ ", message=" + message + ", created_on=" + created_on + ", is_deleted=" + is_deleted + ", name="
			 + "]";
	}
	public ContactUs() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getContact_us_id() {
		return contact_us_id;
	}
	public void setContact_us_id(int contact_us_id) {
		this.contact_us_id = contact_us_id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject_type() {
		return subject_type;
	}
	public void setSubject_type(String subject_type) {
		this.subject_type = subject_type;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getCreated_on() {
		return created_on;
	}
	public void setCreated_on(Date created_on) {
		this.created_on = created_on;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	public int getCreated_by() {
		return created_by;
	}
	public void setCreated_by(int created_by) {
		this.created_by = created_by;
	}
	
	
	
}
