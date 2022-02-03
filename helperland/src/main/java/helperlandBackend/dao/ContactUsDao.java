package helperlandBackend.dao;


import helperlandBackend.models.ContactUs;

public interface ContactUsDao {

	public int saveContactUs(ContactUs contactUsModel);
	
	public int getContactUsUser(ContactUs contactUsUser);
	
}
