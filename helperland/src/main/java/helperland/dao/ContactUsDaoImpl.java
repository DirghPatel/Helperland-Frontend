package helperland.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import helperland.models.ContactUs;
import helperland.models.User;

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
		// TODO Auto-generated method stub
		Session session = factory.getCurrentSession();
		try {
			  Query<User> query = session.createQuery("from user where email =:userEmail",User.class);
			  query.setParameter("userEmail", contactUsUser.getEmail());
			  
			  User user = new User();
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
