package helperlandBackend.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import helperlandBackend.models.ContactUs;
import helperlandBackend.models.UserModel;

@Repository
public class ContactUsDaoImpl implements ContactUsDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public int saveContactUs(ContactUs contactUsModel) {
		int id = (Integer) this.hibernateTemplate.save(contactUsModel);
		return id;
	}

	@Transactional
	public int getContactUsUser(ContactUs contactUsUser) {
		Session session = factory.getCurrentSession();
		try {
			  Query<UserModel> query = session.createQuery("from user where email =:userEmail",UserModel.class);
			  query.setParameter("userEmail", contactUsUser.getEmail());
			  
			  UserModel user = new UserModel();
			  user = query.getSingleResult();
			  int userId = user.getUser_id();
			  
			  System.out.println(user.getUser_id());
			  
			  return userId;
			}
		catch(Exception e) {
			return 0;
		}
	}
	
}
