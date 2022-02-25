package helperlandBackend.models;

public class CancelRequestModel {

	private int service_req_id;
	private String cancel_comment;
	public int getService_req_id() {
		return service_req_id;
	}
	public void setService_req_id(int service_req_id) {
		this.service_req_id = service_req_id;
	}
	public String getCancel_comment() {
		return cancel_comment;
	}
	public void setCancel_comment(String cancel_comment) {
		this.cancel_comment = cancel_comment;
	}
	@Override
	public String toString() {
		return "CancelRequestModel [service_req_id=" + service_req_id + ", cancel_comment=" + cancel_comment + "]";
	}
	public CancelRequestModel(int service_req_id, String cancel_comment) {
		super();
		this.service_req_id = service_req_id;
		this.cancel_comment = cancel_comment;
	}
	public CancelRequestModel() {
		super();
	}
	
	
}
