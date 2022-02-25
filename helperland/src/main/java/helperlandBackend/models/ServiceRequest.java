package helperlandBackend.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity(name="service_request")
@Table(name="service_request")
public class ServiceRequest {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int service_req_id;
	
	private int user_id;
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int service_id;
	
	private Date service_start_date;
	

	private String postal_code;
	
	private int service_frequency;
	
	private float service_hourly_rate;
	
	private float service_hours;
	private float extra_hours;
	
	private float sub_total;
	private float discount;
	
	private float total_cost;
	private String comments;
	private String payment_transaction_ref_no;
	
	private float payment_due;
	private int job_status;
	
	private int service_provider_id;
	private Date sp_accepted_date;
	
	private int has_pets;
	private int status;
	

	private Date created_date;
	
	private  Date modified_date;
	private int modified_by;
	private float refunded_amount;

	
	private float distance;
	private int has_issue;
	private int payment_done;
	private String record_version;
	private String cancel_comment;
	
	@Transient
	private int refrigerator;
	@Transient
	private int oven;
	@Transient
	private int laundry;
	@Transient
	private int cabinet;
	@Transient
	private int windows;
	
	@Transient
	private int address_id;
	
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public int getService_req_id() {
		return service_req_id;
	}
	public void setService_req_id(int service_req_id) {
		this.service_req_id = service_req_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int service_id) {
		this.service_id = service_id;
	}
	public Date getService_start_date() {
		return service_start_date;
	}
	public void setService_start_date(Date service_start_date) {
		this.service_start_date = service_start_date;
	}
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	public int getService_frequency() {
		return service_frequency;
	}
	public void setService_frequency(int service_frequency) {
		this.service_frequency = service_frequency;
	}
	public float getService_hourly_rate() {
		return service_hourly_rate;
	}
	public void setService_hourly_rate(float service_hourly_rate) {
		this.service_hourly_rate = service_hourly_rate;
	}
	public float getService_hours() {
		return service_hours;
	}
	public void setService_hours(float service_hours) {
		this.service_hours = service_hours;
	}
	public float getExtra_hours() {
		return extra_hours;
	}
	public void setExtra_hours(float extra_hours) {
		this.extra_hours = extra_hours;
	}
	public float getSub_total() {
		return sub_total;
	}
	public void setSub_total(float sub_total) {
		this.sub_total = sub_total;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public float getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(float total_cost) {
		this.total_cost = total_cost;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getPayment_transaction_ref_no() {
		return payment_transaction_ref_no;
	}
	public void setPayment_transaction_ref_no(String payment_transaction_ref_no) {
		this.payment_transaction_ref_no = payment_transaction_ref_no;
	}
	public float getPayment_due() {
		return payment_due;
	}
	public void setPayment_due(float payment_due) {
		this.payment_due = payment_due;
	}
	public int getJob_status() {
		return job_status;
	}
	public void setJob_status(int job_status) {
		this.job_status = job_status;
	}
	public int getService_provider_id() {
		return service_provider_id;
	}
	public void setService_provider_id(int service_provider_id) {
		this.service_provider_id = service_provider_id;
	}
	public Date getSp_accepted_date() {
		return sp_accepted_date;
	}
	public void setSp_accepted_date(Date sp_accepted_date) {
		this.sp_accepted_date = sp_accepted_date;
	}
	public int getHas_pets() {
		return has_pets;
	}
	public void setHas_pets(int has_pets) {
		this.has_pets = has_pets;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}
	public Date getModified_date() {
		return modified_date;
	}
	public void setModified_date(Date modified_date) {
		this.modified_date = modified_date;
	}
	public int getModified_by() {
		return modified_by;
	}
	public void setModified_by(int modified_by) {
		this.modified_by = modified_by;
	}
	public float getRefunded_amount() {
		return refunded_amount;
	}
	public void setRefunded_amount(float refunded_amount) {
		this.refunded_amount = refunded_amount;
	}
	public float getDistance() {
		return distance;
	}
	public void setDistance(float distance) {
		this.distance = distance;
	}
	public int getHas_issue() {
		return has_issue;
	}
	public void setHas_issue(int has_issue) {
		this.has_issue = has_issue;
	}
	public int getPayment_done() {
		return payment_done;
	}
	public void setPayment_done(int payment_done) {
		this.payment_done = payment_done;
	}
	public String getRecord_version() {
		return record_version;
	}
	public void setRecord_version(String record_version) {
		this.record_version = record_version;
	}
	public int getRefrigerator() {
		return refrigerator;
	}
	public void setRefrigerator(int refrigerator) {
		this.refrigerator = refrigerator;
	}
	public int getOven() {
		return oven;
	}
	public void setOven(int oven) {
		this.oven = oven;
	}
	public int getLaundry() {
		return laundry;
	}
	public void setLaundry(int laundry) {
		this.laundry = laundry;
	}
	public int getCabinet() {
		return cabinet;
	}
	public void setCabinet(int cabinet) {
		this.cabinet = cabinet;
	}
	public int getWindows() {
		return windows;
	}
	public void setWindows(int windows) {
		this.windows = windows;
	}
	
	
	public String getCancel_comment() {
		return cancel_comment;
	}
	public void setCancel_comment(String cancel_comment) {
		this.cancel_comment = cancel_comment;
	}
	@Override
	public String toString() {
		return "ServiceRequest [service_req_id=" + service_req_id + ", user_id=" + user_id + ", service_id="
				+ service_id + ", service_start_date=" + service_start_date + ", postal_code=" + postal_code
				+ ", service_frequency=" + service_frequency + ", service_hourly_rate=" + service_hourly_rate
				+ ", service_hours=" + service_hours + ", extra_hours=" + extra_hours + ", sub_total=" + sub_total
				+ ", discount=" + discount + ", total_cost=" + total_cost + ", comments=" + comments
				+ ", payment_transaction_ref_no=" + payment_transaction_ref_no + ", payment_due=" + payment_due
				+ ", job_status=" + job_status + ", service_provider_id=" + service_provider_id + ", sp_accepted_date="
				+ sp_accepted_date + ", has_pets=" + has_pets + ", status=" + status + ", created_date=" + created_date
				+ ", modified_date=" + modified_date + ", modified_by=" + modified_by + ", refunded_amount="
				+ refunded_amount + ", distance=" + distance + ", has_issue=" + has_issue + ", payment_done="
				+ payment_done + ", record_version=" + record_version + ", refrigerator=" + refrigerator + ", oven="
				+ oven + ", laundry=" + laundry + ", cabinet=" + cabinet + ", windows=" + windows + ", address_id="
				+ address_id + "]";
	}
	public ServiceRequest(int service_req_id, int user_id, int service_id, Date service_start_date, String postal_code,
			int service_frequency, float service_hourly_rate, float service_hours, float extra_hours, float sub_total,
			float discount, float total_cost, String comments, String payment_transaction_ref_no, float payment_due,
			int job_status, int service_provider_id, Date sp_accepted_date, int has_pets, int status, Date created_date,
			Date modified_date, int modified_by, float refunded_amount, float distance, int has_issue, int payment_done,
			String record_version, int refrigerator, int oven, int laundry, int cabinet, int windows, int address_id, String cancel_comment) {
		super();
		this.service_req_id = service_req_id;
		this.user_id = user_id;
		this.service_id = service_id;
		this.service_start_date = service_start_date;
		this.postal_code = postal_code;
		this.service_frequency = service_frequency;
		this.service_hourly_rate = service_hourly_rate;
		this.service_hours = service_hours;
		this.extra_hours = extra_hours;
		this.sub_total = sub_total;
		this.discount = discount;
		this.total_cost = total_cost;
		this.comments = comments;
		this.payment_transaction_ref_no = payment_transaction_ref_no;
		this.payment_due = payment_due;
		this.job_status = job_status;
		this.service_provider_id = service_provider_id;
		this.sp_accepted_date = sp_accepted_date;
		this.has_pets = has_pets;
		this.status = status;
		this.created_date = created_date;
		this.modified_date = modified_date;
		this.modified_by = modified_by;
		this.refunded_amount = refunded_amount;
		this.distance = distance;
		this.has_issue = has_issue;
		this.payment_done = payment_done;
		this.record_version = record_version;
		this.refrigerator = refrigerator;
		this.oven = oven;
		this.laundry = laundry;
		this.cabinet = cabinet;
		this.windows = windows;
		this.address_id = address_id;
		this.cancel_comment = cancel_comment;
	}
	public ServiceRequest() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
