package helperlandBackend.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Optional;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import helperlandBackend.models.UserModel;
import helperlandBackend.service.UserServiceImpl;

@Controller
public class ResetPasswordController {

	@Autowired
	UserServiceImpl userService;
	
	@Autowired
	JavaMailSender emailService;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
	

	@RequestMapping(value = "/forgot" , method=RequestMethod.POST)
	public String processForgotPasswordForm(Model model, @RequestParam("email") String userEmail, HttpServletRequest request , RedirectAttributes redirectAttributes) {

		UserModel user = userService.getUserByEmail(userEmail);
		if (user != null) {
			
			user.setReset_token(UUID.randomUUID().toString());
			userService.updateUser(user );
			String appUrl = request.getScheme() + "://" + request.getServerName();
			
			SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
			passwordResetEmail.setFrom("coding.tricks.8801@gmail.com");
			passwordResetEmail.setTo(user.getEmail());
			passwordResetEmail.setSubject("Password Reset Request");
			passwordResetEmail.setText("To reset your password, click the link below:\n" + appUrl + ":8080/helperland/reset?token=" + user.getReset_token());
			
			emailService.send(passwordResetEmail);
			redirectAttributes.addFlashAttribute("successMessage", "A password reset link has been sent to " + userEmail);
			redirectAttributes.addFlashAttribute("displaySuccessMessage" , "style='display: block !important'");
		} else {
			redirectAttributes.addFlashAttribute("errorMessage", "We didn't find an account for that e-mail address.");
			redirectAttributes.addFlashAttribute("displayErrorMessage" , "style='display: block !important'");
		}
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	public String displayResetPasswordPage(Model model, @RequestParam("token") String token , RedirectAttributes redirectAttributes) throws IOException {
		
		Optional<UserModel> user = userService.findUserByResetToken(token);
		
		if(user == null) {
			redirectAttributes.addFlashAttribute("userNotFound", "Sorry , some problem with link. Please try again later");
			redirectAttributes.addFlashAttribute("displayUserNotFound" , "style='display: block !important'");
			return "redirect:/home";
		}
		else if(user.isPresent()) {
			model.addAttribute("resetToken", token);
			return "resetPassword";
		}
		else {
			return "redirects:/contact";
		}
	}

	@RequestMapping(value = "/reset", method = RequestMethod.POST)
	public String setNewPassword(@RequestParam("token") String token ,@RequestParam ("password") String password , @RequestParam ("confirmpassword") String cpassword,@RequestParam("modified_date") Date modified_date , RedirectAttributes redirectAttributes , Model model) {
		
		Pattern p = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{6,14}$");
		Matcher matcher = p.matcher(password);
		if(!matcher.matches()) {
			redirectAttributes.addAttribute("token", token);
			redirectAttributes.addFlashAttribute("passwordValidation" , "Password must include uppercase letter , lowercase letter , number , special character and length should be between 6 to 14");
			redirectAttributes.addFlashAttribute("showPasswordValidation" , "style='display: block !important'");
			return "redirect:/reset";
		}
		else {
			if(password.equals(cpassword)) {
				Optional<UserModel> user = userService.findUserByResetToken(token);
				if (user.isPresent()) {
					UserModel resetUser = user.get(); 
//		            resetUser.setPassword(password);
					resetUser.setPassword(passwordEncoder.encode(cpassword));
					resetUser.setReset_token(null);
					resetUser.setModified_date(modified_date);
					userService.updateUser(resetUser);	
					redirectAttributes.addFlashAttribute("successPasswordChange" , "Password changed successfully. Please try logging in again.");
					redirectAttributes.addFlashAttribute("displaySuccessPasswordChange" , "style='display: block !important'");
					return "redirect:/home";
				} else {
					redirectAttributes.addFlashAttribute("errorMessage", "We didn't find an account for that e-mail address.");
					redirectAttributes.addFlashAttribute("displayErrorMessage" , "style='display: block !important'");
					return "redirect:/home";
				}
			}
			else {
				redirectAttributes.addAttribute("token", token);
				redirectAttributes.addFlashAttribute("enterSamePassword" , "Please enter same password in both field.");
				redirectAttributes.addFlashAttribute("showEnterSamePassword" , "style='display: block !important'");
				return "redirect:/reset";
			}
		}
   }	
}
