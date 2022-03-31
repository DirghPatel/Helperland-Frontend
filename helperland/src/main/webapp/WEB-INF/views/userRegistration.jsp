<%@page import="org.springframework.security.web.header.Header"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

<%@ page isELIgnored = "false" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<c:url value="/resources/css/navbar.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/userRegistration.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script> 
</head>


<body>
    <div style="min-height: 100vh; padding-bottom: 150px;">
        <nav class="navbar navbar-expand-xl sticky-top" id="navbar">
            <div class="container-fluid navbar_main">
                <a class="navbar-brand py-0" href="home">
                    <img src= ' <c:url value = "/resources/assets/nav-footer-assets/logo.png" />' alt="" height="54px" width="73px">
                </a>
                <button class="navbar-toggler text-white" type="button" data-bs-toggle="offcanvas" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="40"
                        height="40"
                        fill="#fff"
                        class="bi bi-list"
                        viewBox="0 0 16 16"
                        >
                        <path
                            fill-rule="evenodd"
                            d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"
                        />
                    </svg>
                </button>
                <div class="offcanvas offcanvas-end" id="navbarText" aria-labelledby="offcanvasExampleLabel" tabindex="-1">
                    <div class="offcanvas-body navbar_list">
                        <div class="nav-item navbar_book rounded-pill" >
                            <a class="nav-link text-light" href="service-booking" id="bookNow">Book now</a>
                        </div>
                        <div class="nav-item rounded-pill nav_select1">
                            <a class="nav-link text-light" href="prices" id="pricesServices">Prices & services</a>
                        </div>
                        <div class="nav-item rounded-pill nav_select2">
                            <a class="nav-link text-light" href="" id="warranty">Warranty</a>
                        </div>
                        <div class="nav-item rounded-pill nav_select3">
                            <a class="nav-link text-light" href="" id="blog">Blog</a>
                        </div>
                        <div class="nav-item rounded-pill nav_select4">
                            <a class="nav-link text-light" href="contact" id="contact">Contact</a>
                        </div>
                        <div class="nav-item navbar_login rounded-pill">
                            <a href="#logInModal" class="text-decoration-none text-light nav-link" data-bs-target="#logInModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="logInButton">Login</a>
                        </div>
                        <div class="nav-item navbar_helper rounded-pill">
                            <a href="become-a-pro" class="text-decoration-none text-light nav-link">Become a Helper</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

		<div class="alert alert-danger alert-dismissible fade show d-none mx-4 mt-3"${displayLoginError} role="alert">
		  ${loginErrorMessage }
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		
		<div class="alert alert-danger alert-dismissible fade show d-none mx-4 mt-3" ${displayNotUser } role="alert">
		  ${notUser }
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		
        <div class="userReg_heading position-relative mt-5">
            <h1>Create An Account</h1>
            <div class="userReg_box">
                <div class="left_line"></div>
                <img src="<c:url value = "/resources/assets/userRegistration/separator.png" />" alt="" />
                <div class="right_line"></div>
            </div>
        </div>


        <div class="userRegForm_wrapper my-5">
            <form action="user-register" class="userRegForm" method="post">
                <div class="alert alert-danger alert-dismissible fade show d-none " ${displayError } role="alert">
				  ${error }
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				<div class="alert alert-success alert-dismissible fade show d-none " ${displaySuccess } role="alert">
				  ${success } 
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				<div class="alert alert-warning alert-dismissible fade show d-none " ${displayAlreadyUser } role="alert">
				  ${alreadyUser } 
				  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				
                <input type="hidden" id="userType" name="user_type_id" value="1">
                <div class="row">
                    <div class="col-sm-6 mb-4">
                        <div class="form-group d-flex flex-column">
                            <input type="text" autofocus name="first_name" placeholder="First name" class="inputHeightBorderPadding form-control">
                        </div>
                    </div>
                    <div class="col-sm-6 mb-4">
                        <div class="form-group d-flex flex-column">
                            <input type="text" required name="last_name" id="lastname" placeholder="Last name" class="inputHeightBorderPadding form-control">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 mb-4">
                        <div class="form-group d-flex flex-column">
                            <input type="text" required name="email" id="emailaddress" placeholder="Email Address" class="inputHeightBorderPadding form-control">
                        </div>
                        <small class="text-danger">${emailError }</small>
                    </div>
                    <div class="col-sm-6 mb-4">
                        <div class="form-group d-flex flex-column">
                            <div class="d-flex">
                                <input type="text" name="mobilecode" value="+49" readonly="readonly" disabled style="max-width: 55px;" class="inputHeightBorderPadding form-control">
                                <input type="text" name="mobile" required id="mobile" placeholder="Mobile number" class="inputHeightBorderPadding form-control">
                            </div>
                            <small id="mobileNumberMessage"></small>
                            <small class="text-danger">${mobileError }</small>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 mb-4">
                        <div class="form-group d-flex flex-column">
                            <input type="password" required name="password" id="password" placeholder="Password" class="inputHeightBorderPadding form-control" title="Password must include uppercase letter , lowercase letter , number , special character and length should be between 6 to 14" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{6,14}$" >
                        </div>
                    </div>
                    <div class="col-sm-6 mb-4">
                        <div class="form-group d-flex flex-column">
                            <input type="password" required name="confirmpassword"  id="confirmpassword" placeholder="Confirm password" class="inputHeightBorderPadding form-control">
                            <small id="confirmPasswordMessage"></small>
                        </div>
                    </div>
                </div>

                <div class="d-flex align-items-center my-2">
                    <input type="checkbox" name="termsandconditions" required>
                    <label for="termsandconditions" class="fs14 ms-3">I agree with the <span><a href="#" class="text-decoration-none colorGreen">terms and conditions</a></span> of Helperland.</label>
                </div>
                <div class="d-flex align-items-center my-2">
                    <input type="checkbox" name="privacypolicy" required>
                    <label for="privacypolicy" class="fs14 ms-3">I have read the <span><a href="#" class="text-decoration-none colorGreen">privacy policy.</a></span> </label>
                </div>
                <div class="text-center mt-4"> 
                    <button class="btn submitButton text-light rounded-pill"  disabled id="registerButton">Register</button>
                </div>
                
                <!-- <input type="hidden" name="is_registered_user" value="1">
                <input type="hidden" name="works_with_pet" value="1">
                <input type="hidden" name="modified_by" value="1">
                <input type="hidden" name="is_approved" value="1">
                <input type="hidden" name="is_active" value="0">
                <input type="hidden" name="is_deleted" value="0">
                <input type="hidden" name="is_online" value="1">
                <input type="hidden" name="created_date" id="created_date" value="">
                <input type="hidden" name="modified_date" id="modified_date" value=""> -->
                
            </form>
            <div class="text-center mt-3 color646464">
                Already registered? 
                <span><a class="colorGreen text-decoration-none" href="#logInModal" data-bs-target="#logInModal" data-bs-toggle="modal" data-bs-dismiss="modal" id="logInButton">Login now</a></span>
            </div>
        </div>
  
    </div>
    
    <jsp:include page="footer.jsp" />
    <jsp:include page="/WEB-INF/views/loader.jsp" />
    <!-- ------------- login modals --------------  -->
    <div class="logInPopUp">

        <div class="modal fade" id="logInModal" aria-hidden="true" aria-labelledby="logInModalLabel" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered vertical-align-center modal-md">
                <div class="modal-content">
                    <!-- <div class="modal-body"> -->
                    <div class="modal-header">
                        <h3 class="modal-title" id="logInModalLabel">Login to your account</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body logInModal p-2">
                        <form action="login" method="post">
                            <div class="form-group position-relative my-3">
                                <input type="email" placeholder="Email Address" name="email" class="modalInputEmail inputHeightBorder">
                                <img
									src=" <c:url value = "/resources/assets/homepage/first/user.png" />" alt="" height="21"
									width="20">
                            </div>
                            
                            <div class="form-group position-relative my-3">
                                <input type="password" placeholder="Password" name="password" class="modalInputEmail inputHeightBorder">
                                <img
									src="<c:url value = "/resources/assets/homepage/first/lock.png" />" alt="" height="21"
									width="20">
                            </div>

                            <div class="form-group">
                                <input type="checkbox" value="rememberme" id="rememberme">
                                <label for="rememberme" class="control-label">Remember me</label>
                            </div>
                            
                            <button type="submit" class="my-3 btn submitButton text-light w-100 rounded-pill" >
                                Login
                            </button>
                        </form>
                        <div class="text-center mt-2">
                            <a href="forgotPasswordModal" class="forgotPasswordRedirect" data-bs-target="#forgotPasswordModal" data-bs-toggle="modal" data-bs-dismiss="modal">Forgot Password?</a>
                        </div>
                        <div class="text-center">
                            Don't have account? <span> <a class="forgotPasswordRedirect" href="user-register">Create an account? </a></span>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="forgotPasswordModal" aria-hidden="true" aria-labelledby="forgotPasswordModalLabel2" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title me-3" id="forgotPasswordModalLabel2">Forgot Password</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body ">
                        <form action="forgot" method="post">
                            <div class="d-flex mb-3">
                                <input type="email" placeholder="Email Address" name="email" class="modalInputEmail inputHeightBorder">
                            </div>
                            <button type="submit" class="my-3 btn submitButton text-light w-100 rounded-pill" >
                                Send
                            </button>
                        </form>
                        <div class="text-center mt-2">
                            <a href="logInModal" class="forgotPasswordRedirect" data-bs-target="#logInModal" data-bs-toggle="modal" data-bs-dismiss="modal">Login now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>


    <script>

	    $('#password, #confirmpassword').on('keyup', function () {
	        if ($('#password').val() == $('#confirmpassword').val() && $('#password').val().length >= 8) {
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
		$('#created_date').val(t);
		$('#modified_date').val(t);
        
        $(function () {
            $("#mobile").keypress(function (e) {
                var keyCode = e.keyCode || e.which;
                $("#mobileNumberMessage").html("");
                var regex = /^[0-9]+$/;
                var isValid = regex.test(String.fromCharCode(keyCode));
                if (!isValid) {
                    $("#mobileNumberMessage").html("Only numbers allowed.").css('color' , 'red');
                }
                return isValid;
            });
        });
    </script>
    <script>
    
	    $(document).ajaxSend(function(){
	        $(loadingSpinner).fadeIn(250);
	        $('html').css("overflow" , "hidden");
	    });
	    $(document).ajaxComplete(function(){
	        $(loadingSpinner).fadeOut(250);
	        $('html').css("overflow" , "initial");
	    });
	    document.onreadystatechange = function() {
	        if (document.readyState !== "complete") {
	        	$(loadingSpinner).fadeIn(250);
	        	$('html').css("overflow" , "hidden");
	        } else {
	        	$(loadingSpinner).fadeOut(250);
	        	$('html').css("overflow" , "initial");
	        }
	    };
    
    </script>
</body>
</html>