<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<c:url value="/resources/css/navbar.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/contact.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet" />
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
                        <a class="nav-link text-light" href="#" id="warranty">Warranty</a>
                    </div>
                    <div class="nav-item rounded-pill nav_select3">
                        <a class="nav-link text-light" href="#" id="blog">Blog</a>
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
    <div class="container-fluid p-0">
        
        <!-- <div id="navbar_load"></div> -->
        <div class="main_image">
            <img src='<c:url value = "/resources/assets/contact/first/contact-top.jpg" />' alt="" height="370"/>
        </div>
    </div>
    <div class="container-fluid">
        <div class="contact_heading position-relative">
            <h1>Contact us</h1>
            <div class="contact_box">
                <div class="left_line"></div>
                    <img src="<c:url value = "/resources/assets/contact/first/separator.png" />" alt="" />
                <div class="right_line"></div>
            </div>
        </div>
        <div class="contact_logos d-flex align-items-center justify-content-center">
            <div class="logos_inner d-flex flex-column align-items-center justify-content-start">
                <div class="logos_logo">
                    <svg xmlns="http://www.w3.org/2000/svg" width="34" height="54">
                        <path fill-rule="evenodd" fill="#1D7A8C" d="M17.1.2c4.584 0 8.85 1.713 12.7 4.9 3.06 3.8 4.194 7.252 4.194 12.53 0 4.203-3.059 9.95-5.726 14.975-.819 1.525-1.598 2.991-1.788 4.3L18.237 53.23c-.331.685-.357.978-1.831.645a1.378 1.378 0 0 1-.643-.645L7.952 36.905c-.623-1.309-1.403-2.775-2.202-4.3C3.63 27.581.5 21.833.5 17.63c0-5.278 1.413-8.74 4.491-12.53C8.7 1.913 12.316.2 17.1.2zm0 8.496c2.208 0 4.292.939 5.791 2.444 1.5 1.505 2.435 3.598 2.435 6.49 0 1.74-.935 3.831-2.435 5.337-1.499 1.505-3.583 2.444-5.791 2.444-2.389 0-4.473-.939-5.992-2.444-1.499-1.505-2.435-3.597-2.435-5.337 0-2.894.936-4.985 2.435-6.49 1.519-1.505 3.603-2.444 5.992-2.444zm3.844 5.264c-1.013-1.16-2.395-2.506-3.844-2.506-1.649 0-2.42 1.346-3.54 2.506-1.13.152-2.14 1.54-2.14 3.68 0 .968 1.01 2.357 2.14 3.48 1.12 1.17 1.891 1.534 3.54 1.534 1.449 0 2.831-.364 3.844-1.534 1.012-1.123 1.636-2.512 1.636-3.48.001-2.14-.622-3.528-1.636-3.68zM27.8 6.957c-3.311-2.6-6.856-4.203-10.7-4.203-3.35 0-7.59 1.603-10.161 4.203-2.59 2.58-4.188 6.159-4.188 10.683 0 3.529 2.883 8.925 5.414 13.675.819 1.545 1.598 3.03 2.26 4.398L17.8 49.456l5.772-13.743c.663-1.368 1.568-2.853 2.26-4.398 2.531-4.75 5.414-10.146 5.414-13.675.002-4.524-1.595-8.103-3.446-10.683z"/>
                    </svg>
                </div>
                <div class="logos_content">
                    <p class="mb-0 text-center">Königswinterer Str. 116<br>53227 Bonn</p>
                </div>            
            </div>
            <div class="logos_inner d-flex flex-column align-items-center justify-content-start">
                <div class="logos_logo">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="46" height="52">
                        <image width="46" height="52" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAA0CAMAAADCKvr4AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAACWFBMVEUdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeowdeoz///+TM67+AAAAxnRSTlMAAgYImPdcH8uuYcJZNOX0mQTXDGTaIKIDR078zyEl+o/cG7XsD3JB+BUsB7P5pvYBgRprXwtN8Mqw8iNTMCIqdRKvu/EOEPWfkP08Y7ge0hRdUU/+aR2cxwV/0N6tSDPjhOfilifmKKRAHBmpqyaSUBPv1ttbZSnOFo77t1UK8+oN7dmDnXhLQmZ8glK+0zasVGLJbVeJzemHL8SnCUPdfj6jMoy0F2juWIo5pTpMVnrfRugtky6huuEYXtV9cOCGsqiIbjtmgvnvAAAAAWJLR0THjQVKWwAAAAd0SU1FB+ULEgsMOxZ2x10AAALXSURBVEjHlZVnVxNREIYnhtCCFBWIhmIQkGJwQSIlQECDFFFAgwULoAKCqBAQpAnYsYANURDFgijYsff6/i43myyScza763yZJ5Mnc+7cvblLZA/FPPqPULqpAHe5tocnvLzV8JFnz/f1gz8FLPBdKMdehMCgYJWGFmOJDNtbGxJKYeFLiXQ6aTsCy2w74xkZRdFYLqkHx8TaUhw7aLxqhaSuT+BSQMhKhhKRJKVjlT0ns4OG+iVI2AasdlBKKlFaukR7IzIcFI1MykKiuG4Kz3ZQDtYoNGvNuaL6urx8HgsKlbQeReLtzRsCHLRRxf6y2Fdcd1PxxKhTSqgUm0T1zeyEfHtLGSlRIKpvyds6236bfns8ysVXs2OnkscMJO8KjxPXd6NilitRWKUR13P2pPLosZc/EiKxT1Vth1zU1EraNE+73w6lqJO2SeEPIwfeqJeh0wE0cDlJf5CR41cVHuLyYTTK0ZuszfZbrEUVIMc/glYut+GonNtPoda3c+CODjntazu77FPmo1uOn+1YzrHiTpOc5YT0ZHFQn94b8a/q0u87XmP/0qQ9wcsnT532cOWfgRcPzQZbPotCIL3flX8O57nMXMBFAymKegYGKUeHLqUL/xIu2+EKrl5zgzlmiOXrenOmsG4Y5v8prTcsuDkyiltjRLfvYFz42bWnWB0HvmmQXf7YOCrvsptwD6Ntgn6TNS927uf7ndoH7H4NwVom6Gf2+BmdChMIKSF6OIwJQb86ptd5sslHeEykmYJWcOIwi3XauaDGkyZintbgmZBfH4jnTgXmBV6+Yk9Ty0yOkJ80ivJ4p8pra+cb2/X4VnD9ynd4H+RU0TTgQ1Q3Pgo/L5q0zHxyrvjMwDrAuNBp5DPUfU4D9FsiK8hlGL7EIHFOt6/4ZiSRYIwJwHfHizDqB372kUQEpQHFU43TjR06/JKSuR35XQw2VLo6Ro7OTWH6U83zXyXRw9syqx3QAAAAAElFTkSuQmCC"/>
                    </svg>            
                </div>
                <div class="logos_content text-center">
                    <a class="mb-0 text-center text-decoration-none" href="tel:(40) 123 56 7890" style="color: #646464;">+49 (40) 123 56 7890</a>
                    <a class="mb-0 text-center text-decoration-none" href="tel:(40) 987 56 0000" style="color: #646464;">+49 (40) 987 56 0000</a>
                </div>            
            </div>
            <div class="logos_inner d-flex flex-column align-items-center justify-content-start mb-0">
                <div class="logos_logo">
                    <img src="<c:url value = "/resources/assets/contact/contact/message.png" />" alt="" height="37" width="61px">
                </div>
                <div class="logos_content">
                    <a href="mailto:info@helperland.com" class="text-decoration-none mb-0 text-center" style="color: #646464;">info@helperland.com <br> &nbsp</a>
                </div>            
            </div>
        </div>
        <hr />
        <div class="container-fluid form_cover">
            <h4 class="text-center form_heading">Get in touch with us</h4>
            <div class="touch_form d-flex align-items-center justify-content-center">
                <form method="" action="" class="d-flex flex-column">
                    <div class="row justify-content-center">
                        <div class="col">
                            <input type="text" name="firstname" placeholder="First name" class="form_in w-100 h-100">
                        </div>
                        <div class="col">
                            <input type="text" name="lastname" placeholder="Last name" class="form_in w-100 h-100">
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col d-flex">
                            <input type="text" name="areacode" value="+49" class="form_areacode form_in" disabled >
                            <input type="text" name="number" placeholder="Mobile number" class=" form_in w-100 h-100">
                        </div>
                        <div class="col">
                            <input type="email" name="email" placeholder="Email address" class="form_in w-100 h-100">
                        </div>
                    </div>
                    <div class="form_select">
                        <select class="w-100 p-0 form_in" aria-label="Default select">
                            <option value="general" class="w-100">General</option>
                            <option value="inquiry" class="w-100">Inquiry</option>
                            <option value="renewal" class="w-100">renewal</option>
                            <option value="revocation" class="w-100">revocation</option>
                        </select>
                    </div>
                    <div class="textarea">
                        <textarea name="" id="" class="w-100 h-100 p-0 form_in" placeholder="Message" ></textarea>
                    </div>
                    <div class="form_btn w-100 mt-3 d-flex align-items-center justify-content-center">
                        <button type="submit" class="btn submit_btn rounded-pill text-white">
                            Submit
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- <div class="container_map position-relative">
        <img src="./assets/contact/map.jpg" alt="" class="map_image">
        <div class="map_marker position-absolute">
            <svg xmlns="http://www.w3.org/2000/svg" width="48" height="67">
                <path fill-rule="evenodd" fill="#FF6060" d="M45.959 16.672c-.238-.894-.722-1.846-1.08-2.68C40.598 3.688 31.242.5 23.688.5 13.575.5 2.437 6.785.95 20.782v2.859c0 .119.041 1.191.54 1.728.393 7.021 5.649 13.759 10.16 20.429 3.638 7.147 8.02 14.177 12.48 21.502 2.559-4.883 5.227-9.529 7.843-13.996.713-1.311 1.541-2.621 2.255-3.873.475-.833 1.384-1.666 2.052-2.441 3.971-7.743 11.2-15.546 11.2-23.23v-3.156c0-.834-1.3-3.752-1.521-3.932zM23.873 31.27c-2.973 0-6.226-1.731-7.473-5.842-.599-.654-.58-1.966-.58-2.086v-1.846c0-5.24 4.444-7.623 8.309-7.623 4.759 0 8.439 3.812 8.439 8.578 0 4.765-3.937 8.819-8.695 8.819z"/>
            </svg>        
        </div>
    </div> -->
    <div class="container_map">
        <iframe width="100%" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3671.6979157244114!2d72.49824711445191!3d23.034861321650208!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e8352e403437b%3A0xdc9d4dae36889fb9!2sTatvaSoft!5e0!3m2!1sen!2sin!4v1640187081460!5m2!1sen!2sin">
        </iframe>
    </div>

    <!-- <div id="footer"></div> -->

    <div class="footer_section w-100">
        <div class="footer_main d-flex justify-content-center align-items-center position-relative">
            <div class="d-flex justify-content-between h-100 align-items-center footer_inner position-relative">
                <div class="footer_left">
                    <a href="home">
                        <img src="<c:url value = "/resources/assets/nav-footer-assets/logo.png" />" alt="helperland" height="78" width="106">
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

    <script>
        
        // $(function () {
        //     $("#navbar_load").load("../navbar.html");
        //     $("#footer").load("../footer.html");
        // });
    
        $('select').change(function() {
            console.log("hello");
            if ($(this).children('option:first-child').is(':selected')) {
                $("select").css("color" , "#a0a0a0");
            } else {
                $("select").css("color" , "black");
            }
        });

    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
</body>

</html>