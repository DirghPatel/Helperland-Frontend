package helperlandBackend.models;

import java.util.Date;

public class RescheduleRequestModel {

	private int service_req_id;
	private Date service_start_date;
	public int getService_req_id() {
		return service_req_id;
	}
	public void setService_req_id(int service_req_id) {
		this.service_req_id = service_req_id;
	}
	public Date getService_start_date() {
		return service_start_date;
	}
	public void setService_start_date(Date service_start_date) {
		this.service_start_date = service_start_date;
	}
	@Override
	public String toString() {
		return "RescheduleRequestModel [service_req_id=" + service_req_id + ", service_start_date=" + service_start_date
				+ "]";
	}
	public RescheduleRequestModel(int service_req_id, Date service_start_date) {
		super();
		this.service_req_id = service_req_id;
		this.service_start_date = service_start_date;
	}
	public RescheduleRequestModel() {
		super();
	}
	
	
	
}
