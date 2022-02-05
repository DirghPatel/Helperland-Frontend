<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

<%@ page isELIgnored = "false" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<c:url value="/resources/css/resetPassword.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script> 
</head>


<body>	

	<div class="container-fluid d-flex flex-column align-items-center justify-content-center">
		
		<div class="alert alert-danger alert-dismissible fade show d-none mt-3" ${ showEnterSamePassword } role="alert">
		  ${enterSamePassword } 
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		
		<div class="alert alert-danger alert-dismissible fade show d-none mt-3" ${ showPasswordValidation } role="alert">
		  ${passwordValidation } 
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		
		<div class="main-div">
			<h3 class="text-center reset_heading my-4">
				Reset Your Password!
			</h3>
			
			
			
			<div class="form_wrapper w-100">
		
				<form action="reset" method="post">
			        <div class="d-flex mb-3">
			            <input type="password"  placeholder="Password" name="password" id="password" class="modalInputEmail inputHeightBorder" title="Password must include uppercase letter , lowercase letter , number , special character and length should be between 6 to 14" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{6,14}$" >
			        </div>
			        <div class="d-flex mb-3">
			            <input type="password" placeholder="Confirm Password" name="confirmpassword" id="confirmpassword" class="modalInputEmail inputHeightBorder">
			        </div>
			        <small id="confirmPasswordMessage"></small>
			        <input type="hidden" name="token" value = "${resetToken }" />
			        <input type="hidden" name="modified_date" id="modified_date" value="">
			        <button type="submit" id="registerButton" disabled class="my-3 btn submitButton text-light w-100 rounded-pill" >
			            Submit
			        </button>
			    </form>
			    
			</div>
		</div>
		
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>


    <script>

	    $('#password, #confirmpassword').on('keyup', function () {
	        if ($('#password').val() == $('#confirmpassword').val()) {
	            $('#confirmPasswordMessage').html('Looks Good!').css('color', 'green');
	            $('#registerButton').removeAttr('disabled');
	        } 
	        else {
	            $('#confirmPasswordMessage').html('Enter same password again').css('color', 'red');
	        }
	        if ($('#password').val() != $('#confirmpassword').val()) {
	            $('#registerButton').attr('disabled' , true);
	        }
	        if($('#password').val().length == 0){
	        	$('#registerButton').attr('disabled' , true);	
	        }
	    });
        
        
        
        var dt = new Date();
		
        var t = moment(new Date()).format("YYYY/MM/DD HH:mm:ss");
		$('#modified_date').val(t);
    </script>
    
</body>
</html>