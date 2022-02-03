package helperlandBackend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperlandBackend.dao.ContactUsDao;
import helperlandBackend.models.ContactUs;

@Service
public class ContactUsServiceImpl implements ContactUsService {
	
	@Autowired
	private ContactUsDao contactUsDao;
	
	public int createContactUs(ContactUs contactUsModel) {
		return this.contactUsDao.saveContactUs(contactUsModel);
	}

	public int getContactUsUser(ContactUs contactUsUser) {
		return this.contactUsDao.getContactUsUser(contactUsUser);
	}

}
