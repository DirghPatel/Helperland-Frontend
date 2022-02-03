package helperlandBackend.service;

import helperlandBackend.models.ContactUs;

public interface ContactUsService {
	public int createContactUs(ContactUs contactUsModel);
	public int getContactUsUser(ContactUs contactUsUser);
}
