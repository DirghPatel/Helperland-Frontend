package helperlandBackend.controller;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import javax.validation.executable.ExecutableValidator;
import javax.validation.metadata.BeanDescriptor;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import helperlandBackend.models.UserModel;

@Component
public class UserValidator implements Validator {
 

    public boolean supports(Class<?> clazz) {
         return UserModel.class.isAssignableFrom(clazz);
    }
 
    public void validate(Object target, Errors errors) {
                 
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "first_name", "error.username", "UserName cannot be empty");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.password", "Password cannot be empty");
         
    }

	public <T> Set<ConstraintViolation<T>> validate(T object, Class<?>... groups) {
		// TODO Auto-generated method stub
		return null;
	}

	public <T> Set<ConstraintViolation<T>> validateProperty(T object, String propertyName, Class<?>... groups) {
		// TODO Auto-generated method stub
		return null;
	}

	public <T> Set<ConstraintViolation<T>> validateValue(Class<T> beanType, String propertyName, Object value,
			Class<?>... groups) {
		// TODO Auto-generated method stub
		return null;
	}

	public BeanDescriptor getConstraintsForClass(Class<?> clazz) {
		// TODO Auto-generated method stub
		return null;
	}

	public <T> T unwrap(Class<T> type) {
		// TODO Auto-generated method stub
		return null;
	}

	public ExecutableValidator forExecutables() {
		// TODO Auto-generated method stub
		return null;
	}
 
}
