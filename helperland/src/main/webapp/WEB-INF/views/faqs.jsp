<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link href='<c:url value="/resources/css/navbar.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/faqs.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
	
</head>

<body>

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
                        <a href="become-a-helper" class="text-decoration-none text-light nav-link">Become a Helper</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div style="min-height: 100vh; padding-bottom: 150px;">
        <div class="container-fluid main position-relative p-0">
            
            <div class="main_image">
                <img src="<c:url value = "/resources/assets/faqs/first/faq-top.jpg" />" alt="" height="370px" width="auto">
            </div>
        </div>
        <div class="container-fluid faqs">
            <div class="faqs_heading position-relative">
                <h1>FAQs</h1>
                <div class="faq_box">
                    <div class="left_line"></div>
                    <img src="<c:url value = "/resources/assets/faqs/first/separator.png" />" alt="">
                    <div class="right_line"></div>
                </div>
            </div>
            <div class="faqs_content d-flex flex-column align-items-center justify-content-center position-relative">
                <p class="content_head">Whether you are Customer or Service provider,<br> We have tried our best to solve all your queries and questions.</p>
                <div class="faqs_accordion">
                    <div class="accordion_head d-flex align-items-center justify-content-between">
                        <div class="btn-1 d-flex align-items-center justify-content-center" id="forCustomer">FOR CUSTOMERS</div>
                        <div class="btn-2 d-flex align-items-center justify-content-center" id="forServiceProvider">FOR SERVICE PROVIDER</div>
                    </div>
                </div>
            </div>
            <div class="accordion position-relative w-100" id="accordionCustomer">
                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingOne">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">    
                            <img src="<c:url value = "/resources/assets/faqs/accordion/arr.png" /> " alt="" height="22" width="22">
                        </button>
                        <p>What's included in a cleaning? </p>
                    </div>
                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionCustomer">
                        <div class="accordion-body">
                            Bedroom, Living Room & Common Areas, Bathrooms, Kitchen, Extras 
                        </div>
                    </div>
                </div>
                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingTwo">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseOne">    
                            <img src="<c:url value = "/resources/assets/faqs/accordion/arr.png" />" alt="" height="22" width="22">
                        </button>
                        <p>Which Helperland professional will come to my place? </p>
                    </div>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionCustomer">
                        <div class="accordion-body">
                            Helperland has a vast network of experienced, top-rated cleaners. Based on the time and date of your request, we work to assign the best professional available. Like working with a specific pro? Add them to your Pro Team from the mobile app and they'll be requested first for all future bookings. You will receive an email with details about your professional prior to your appointment. 
                        </div>
                    </div>
                </div>
                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingThree">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">    
                            <img src="<c:url value = "/resources/assets/faqs/accordion/arr.png" />" alt="" height="22" width="22">
                        </button>
                        <p>Can I skip or reschedule bookings? </p>
                    </div>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionCustomer">
                        <div class="accordion-body">
                            You can reschedule any booking for free at least 24 hours in advance of the scheduled start time. If you need to skip a booking within the minimum commitment, we’ll credit the value of the booking to your account. You can use this credit on future cleanings and other Helperland services. 
                        </div>
                    </div>
                </div>
                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingFour">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseThree">    
                            <img src="<c:url value = "/resources/assets/faqs/accordion/arr.png" />" alt="" height="22" width="22">
                        </button>
                        <p>Do I need to be home for the booking? </p>
                    </div>
                    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionCustomer">
                        <div class="accordion-body">
                            We strongly recommend that you are home for the first clean of your booking to show your cleaner around. Some customers choose to give a spare key to their cleaner, but this decision is based on individual preferences. 
                        </div>
                    </div>
                </div>
                <!-- <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingFive">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseThree">    
                            <img src="./assets/accordion/arr.png" alt="" height="22" width="22">
                        </button>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</p>
                    </div>
                    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionCustomer">
                        <div class="accordion-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum. 
                        </div>
                    </div>
                </div>
                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingSix">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseThree">    
                            <img src="./assets/accordion/arr.png" alt="" height="22" width="22">
                        </button>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</p>
                    </div>
                    <div id="collapseSix" class="accordion-collapse collapse" aria-labelledby="headingSix" data-bs-parent="#accordionCustomer">
                        <div class="accordion-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum. 
                        </div>
                    </div>
                </div>

                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingSeven">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseThree">    
                            <img src="./assets/accordion/arr.png" alt="" height="22" width="22">
                        </button>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</p>
                    </div>
                    <div id="collapseSeven" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-bs-parent="#accordionCustomer">
                        <div class="accordion-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum. 
                        </div>
                    </div>
                </div>

                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingEight">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseThree">    
                            <img src="./assets/accordion/arr.png" alt="" height="22" width="22">
                        </button>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</p>
                    </div>
                    <div id="collapseEight" class="accordion-collapse collapse" aria-labelledby="headingEight" data-bs-parent="#accordionCustomer">
                        <div class="accordion-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum. 
                        </div>
                    </div>
                </div>

                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingNine">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseThree">    
                            <img src="./assets/accordion/arr.png" alt="" height="22" width="22">
                        </button>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</p>
                    </div>
                    <div id="collapseNine" class="accordion-collapse collapse" aria-labelledby="headingNine" data-bs-parent="#accordionCustomer">
                        <div class="accordion-body">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum. 
                        </div>
                    </div>
                </div> -->
            </div>
            <div class="accordion position-relative w-100" id="accordionServiceProvider">
                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingOne">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">    
                            <img src="<c:url value = "/resources/assets/faqs/accordion/arr.png" />" alt="" height="22" width="22">
                        </button>
                        <p>How much do service providers earn? </p>
                    </div>
                    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionServiceProvider">
                        <div class="accordion-body">
                            The self-employed service providers working with Helperland set their own payouts, this means that they decide how much they earn per hour. 
                        </div>
                    </div>
                </div>
                <div class="accordion-item border-0">
                    <div class="accordion-header d-flex align-items-center" id="headingTwo">
                        <button class=" btn collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseOne">    
                            <img src="<c:url value = "/resources/assets/faqs/accordion/arr.png" />" alt="" height="22" width="22">
                        </button>
                        <p>What support do you provide to the service providers? </p>
                    </div>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionServiceProvider">
                        <div class="accordion-body">
                            Our call-centre is available to assist the service providers with all queries or issues in regards to their bookings during office hours. Before a service provider starts receiving jobs, every individual partner receives an orientation session to familiarise with the online platform and their profile. 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="footer_section w-100" style="margin-top: -150px;">
        <div class="footer_main d-flex justify-content-center align-items-center position-relative">
            <div class="d-flex justify-content-between h-100 align-items-center footer_inner position-relative">
                <div class="footer_left">
                    <a href="home">
                        <img src="<c:url value = "/resources/assets/nav-footer-assets/logo.png" />" alt="" height="78" width="106">
                    </a>
                </div>
                <div class="footer_mid">
                    <ul class="d-flex p-0 text-center m-0">
                        <li>
                            <a href="home" class="text-decoration-none">HOME</a>
                        </li>
                        <li>
                            <a href="about" class="text-decoration-none">ABOUT</a>
                        </li>
                        <li>
                            <a href="#" class="text-decoration-none">TESTIMONIAL</a>
                        </li>
                        <li>
                            <a href="faqs" class="text-decoration-none">FAQS</a>
                        </li>
                        <li>
                            <a href="" class="text-decoration-none">INSURANCE POLICY</a>
                        </li>
                        <li>
                            <a href="" class="text-decoration-none">IMPRESSUM</a>
                        </li>
                    </ul>
                </div>
                <div class="footer_right d-flex align-items-center justify-content-evenly">
                    <a href="https://www.facebook.com/TatvaSoft/" target="_blank">
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="18">
                            <path fill-rule="evenodd" fill="#CCC" d="M1.947 3.48v2.481H0v3.033h1.947V18.1h4.001V8.995h2.685S8.885 7.541 9.7 5.95H5.963V3.876c0-.31.437-.728.868-.728H9.11V.9H6.46C1.848.9 1.947 3.27 1.947 3.48z"/>
                        </svg>
                    </a>
                    <a href="https://www.instagram.com/" target="_blank">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                            <path fill-rule="evenodd" fill="#CCC" d="M14.48 20H5.519A5.524 5.524 0 0 1 0 14.482V5.52C0 2.477 2.475.2 5.519.2h8.961c3.043 0 5.519 2.277 5.519 5.32v8.962A5.525 5.525 0 0 1 14.48 20zm3.744-5.518V5.52a3.748 3.748 0 0 0-3.744-3.744H5.519A3.749 3.749 0 0 0 1.774 5.52v8.962a3.749 3.749 0 0 0 3.745 3.744h8.961a3.748 3.748 0 0 0 3.744-3.744zm-2.855-8.536c-.099 0-.678-.14-.92-.381-.242-.243.221-.578.221-.921 0-.342-.463-.678-.221-.92.242-.242.821-.381.92-.381.343 0 1.111.139.92.381.242.242.381.578.381.92 0 .342-.139.678-.381.921.171.241-.577.381-.92.381zm-5.37 9.208c-2.841 0-5.153-2.312-5.153-5.054 0-2.941 2.312-5.252 5.153-5.252 2.842 0 5.153 2.311 5.153 5.252 0 2.742-2.311 5.054-5.153 5.054zm0-8.532c-1.863 0-3.379 1.516-3.379 3.478 0 1.764 1.516 3.28 3.379 3.28s3.379-1.516 3.379-3.28c0-1.962-1.516-3.478-3.379-3.478z"/>
                        </svg>   
                    </a>                                     
                </div>
            </div>
        </div>
        <div class="footer_end d-flex align-items-center justify-content-center position-relative">
            <p class="m-0 text-center">©2018 Helperland. All rights reserved. &nbsp;&nbsp;<span><a href="" class="text-decoration-none">Terms and Conditions</a></span> | <span><a href="" class="text-decoration-none">Privacy Policy</a></span></p>
        </div>
    </div>
    
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
                        <form action="loggedin" method="post">
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
                        <form action="">
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src = "<c:url value="/resources/js/faqs.js" />" ></script>
    
   
    <!-- <script>
        $("#navbar").load("../navbar.html");
        $("#footer").load("../footer.html");
    </script> -->
</body>

</html>