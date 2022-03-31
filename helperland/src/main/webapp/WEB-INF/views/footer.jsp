<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>

	<div class="footer_section w-100">
	    <div class="footer_main d-flex justify-content-center align-items-center position-relative">
	        <div class="d-flex justify-content-between h-100 align-items-center footer_inner position-relative">
	            <div class="footer_left">
	                <a href="/helperland/home">
	                    <img src="<c:url value = "/resources/assets/nav-footer-assets/logo.png" />" alt="" height="78" width="106">
	                </a>
	            </div>
	            <div class="footer_mid">
	                <ul class="d-flex p-0 text-center m-0">
	                    <li>
	                        <a href="/helperland/home" class="text-decoration-none">HOME</a>
	                    </li>
	                    <li>
	                        <a href="/helperland/about" class="text-decoration-none">ABOUT</a>
	                    </li>
	                    <li>
	                        <a href="#" class="text-decoration-none">TESTIMONIAL</a>
	                    </li>
	                    <li>
	                        <a href="/helperland/faqs" class="text-decoration-none">FAQS</a>
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
	
	<a class="position-fixed back_to_top" >
		<img src=" <c:url value = "/resources/assets/homepage/ic-bktop.svg" />" alt="">
	</a>
</body>
</html>