package helperland.models;

public class loginModel {

	public String email;
	public String password;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	@Override
	public String toString() {
		return "loginModel [email=" + email + ", password=" + password + "]";
	}
	public loginModel() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
