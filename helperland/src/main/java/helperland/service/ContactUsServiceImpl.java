package helperland.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helperland.dao.ContactUsDao;
import helperland.models.ContactUs;

@Service
public class ContactUsServiceImpl implements ContactUsService {
	
	@Autowired
	private ContactUsDao contactUsDao;
	
	public int createContactUs(ContactUs contactUsModel) {
		return this.contactUsDao.saveContactUs(contactUsModel);
	}

	public int getContactUsUser(ContactUs contactUsUser) {
		// TODO Auto-generated method stub
		return this.contactUsDao.getContactUsUser(contactUsUser);
	}
	
}
