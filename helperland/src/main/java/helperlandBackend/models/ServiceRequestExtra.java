package helperlandBackend.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity(name="service_request_extra")
@Table(name="service_request_extra")
public class ServiceRequestExtra {

	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int service_req_extra_id;
	
	private int service_req_id;
	
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int service_extra_id;
	
	private int refrigerator;
	private int oven;
	private int laundry;
	private int cabinet;
	private int windows;
	public int getService_req_extra_id() {
		return service_req_extra_id;
	}
	public void setService_req_extra_id(int service_req_extra_id) {
		this.service_req_extra_id = service_req_extra_id;
	}
	public int getService_req_id() {
		return service_req_id;
	}
	public void setService_req_id(int service_req_id) {
		this.service_req_id = service_req_id;
	}
	public int getService_extra_id() {
		return service_extra_id;
	}
	public void setService_extra_id(int service_extra_id) {
		this.service_extra_id = service_extra_id;
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
	public ServiceRequestExtra(int service_req_extra_id, int service_req_id, int service_extra_id, int refrigerator,
			int oven, int laundry, int cabinet, int windows) {
		super();
		this.service_req_extra_id = service_req_extra_id;
		this.service_req_id = service_req_id;
		this.service_extra_id = service_extra_id;
		this.refrigerator = refrigerator;
		this.oven = oven;
		this.laundry = laundry;
		this.cabinet = cabinet;
		this.windows = windows;
	}
	public ServiceRequestExtra() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ServiceRequestExtra [service_req_extra_id=" + service_req_extra_id + ", service_req_id="
				+ service_req_id + ", service_extra_id=" + service_extra_id + ", refrigerator=" + refrigerator
				+ ", oven=" + oven + ", laundry=" + laundry + ", cabinet=" + cabinet + ", windows=" + windows + "]";
	}
	
	
}
