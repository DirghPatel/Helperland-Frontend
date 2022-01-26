package helperland.models;

public class userRegister {

	private String userType;
	private String firstname;
	private String lastname;	
	private String emailaddress;
	private String mobilecode;
	private String mobilenumber;
	private String password;
	private String confirmpassword;
	
	public userRegister() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "userRegister [userType=" + userType + ", firstname=" + firstname + ", lastname=" + lastname
				+ ", emailaddress=" + emailaddress + ", mobilecode=" + mobilecode + ", mobilenumber=" + mobilenumber
				+ ", password=" + password + ", confirmpassword=" + confirmpassword + "]";
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
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
	public String getEmailaddress() {
		return emailaddress;
	}
	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}
	public String getMobilecode() {
		return mobilecode;
	}
	public void setMobilecode(String mobilecode) {
		this.mobilecode = mobilecode;
	}
	public String getMobilenumber() {
		return mobilenumber;
	}
	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}
	
	
}
