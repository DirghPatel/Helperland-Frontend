<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="user_type_id" value="${user.user_type_id }" />

<link href='<c:url value="/resources/css/navbar-2.css" />' rel="stylesheet" />

<link href='<c:url value="/resources/css/serviceBooking.css" />' rel="stylesheet" />
<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

</head>
<body>
	
	
	<c:if test="${user_type_id  == 1}">	
	
		<nav class="navbar navbar-expand-lg w-100 sticky-top" id="navbar">
            <div class="container-fluid navbar_main">
                <a class="navbar-brand py-0" href="/helperland/home">
                    <img src="<c:url value = "/resources/assets/nav-footer-assets/logo.png" />" alt="" height="54px" width="73px">
                </a>
                <div class="d-flex navbar_wrapper">
                    <div class="offcanvas offcanvas-end navbar_offcanvas sidebarMain" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                        <div class="offcanvas-body justify-content-end sidebarInner">
                            <div class="navcol_first navcol m-0 p-0">
                                <p class="nav-link">Welcome,<br>${user.first_name } ${user.last_name }</p>
                            </div>
                            <div class="navcol_second navcol">
                                <div class="nav-item nav_select1"  id="dashBoard1">
                                    <a class="nav-link" href="/helperland/customer/dash">Dashboard</a>
                                </div>
                                <div class="nav-item nav_select1" id="serviceHistory1">
                                    <a class="nav-link" id="serviceHistory1" href="/helperland/customer/service-history">Service History</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="serviceSchedule1" href="/helperland/customer/service-schedule">Service Schedule</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="favouritePros1" href="/helperland/customer/fav-pros">Favourite Pros</a>
                                </div>
                                <div class="nav-item nav_select1" id="notification1">
                                    <a class="nav-link" href="/helperland/customer/notification">Notification</a>
                                </div>
                                <div class="nav-item nav_select1" id="mySettings">
                                    <a class="nav-link" href="/helperland/customer/mysettings">My Settings</a>
                                </div>
                                <div class="nav-item nav_select1" id="logOut">
                                    <a class="nav-link" href="/helperland/logout">Logout</a>
                                </div>
                            </div>
                            <div class="navcol_third navcol position-relative">
                               <div class="nav-item rounded-pill nav_select1">
                                    <a class="nav-link" href="/helperland/prices" id="pricesServices">Prices & services</a>
                                </div>
                                <div class="nav-item rounded-pill nav_select2">
                                    <a class="nav-link" href="" id="warranty">Warranty</a>
                                </div>
                                <div class="nav-item rounded-pill nav_select3">
                                    <a class="nav-link" href="" id="blog">Blog</a>
                                </div>
                                <div class="nav-item rounded-pill nav_select4">
                                    <a class="nav-link" href="/helperland/contact" id="contact">Contact</a>
                                </div>
                            </div>
                            <div class="navcol_fourth align-items-center justify-content-center p-2">
                                <a href="https://www.facebook.com/TatvaSoft/" target="_blank">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="9" height="18" class="me-3">
                                        <path fill-rule="evenodd" fill="#000" d="M1.947 3.48v2.481H0v3.033h1.947V18.1h4.001V8.995h2.685S8.885 7.541 9.7 5.95H5.963V3.876c0-.31.437-.728.868-.728H9.11V.9H6.46C1.848.9 1.947 3.27 1.947 3.48z"/>
                                    </svg>
                                </a>
                                <a href="https://www.instagram.com/" target="_blank">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" class="ms-3">
                                        <path fill-rule="evenodd" fill="#000" d="M14.48 20H5.519A5.524 5.524 0 0 1 0 14.482V5.52C0 2.477 2.475.2 5.519.2h8.961c3.043 0 5.519 2.277 5.519 5.32v8.962A5.525 5.525 0 0 1 14.48 20zm3.744-5.518V5.52a3.748 3.748 0 0 0-3.744-3.744H5.519A3.749 3.749 0 0 0 1.774 5.52v8.962a3.749 3.749 0 0 0 3.745 3.744h8.961a3.748 3.748 0 0 0 3.744-3.744zm-2.855-8.536c-.099 0-.678-.14-.92-.381-.242-.243.221-.578.221-.921 0-.342-.463-.678-.221-.92.242-.242.821-.381.92-.381.343 0 1.111.139.92.381.242.242.381.578.381.92 0 .342-.139.678-.381.921.171.241-.577.381-.92.381zm-5.37 9.208c-2.841 0-5.153-2.312-5.153-5.054 0-2.941 2.312-5.252 5.153-5.252 2.842 0 5.153 2.311 5.153 5.252 0 2.742-2.311 5.054-5.153 5.054zm0-8.532c-1.863 0-3.379 1.516-3.379 3.478 0 1.764 1.516 3.28 3.379 3.28s3.379-1.516 3.379-3.28c0-1.962-1.516-3.478-3.379-3.478z"/>
                                    </svg> 
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex align-items-center justify-content-center nav_right_icon position-relative">
                        <a class="navbar-brand py-0 nav_icons1 ms-3" href="">
                            <img src="<c:url value = "/resources/assets/nav-footer-assets/bell.png" />" alt="" height="32px" width="29px">
                        </a>
                        <a class="navbar-brand py-0 nav_icons2 me-0 dropDownBtn" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36">
                                <path fill-rule="evenodd" fill="#FFF" d="M35.999 17.999C35.999 8.75 27.924 0 17.999 0 8.75 0 0 8.75 0 17.999c0 5.243 2.254 9.968 5.842 13.26l-.017.015.584.492c.038.032.079.059.117.09.31.257.631.501.959.738.106.076.212.153.32.228.349.798.708.469 1.075.685.08.048.52.094.24.139.402.229.811 1.254 1.231.642l.093.042a17.834 17.834 0 0 0 4.474 1.399c.474.082.953.147 1.438.191l.177.014c.627.04.972.065 1.466.065.491 0 .974-.025 1.455-.064l.182-.013c.481-.044.957-.108 1.984-.188-.517-.008-.476-.015-.436-.023a17.8 17.8 0 0 0 4.292-1.345c.05-.023.1-.044.15-.068.674-.19.799-.394 1.186-.612.096-.055.488-.11 1.178-.166-.539-.208-.193.44.144-.655.121-.082.239-.169.359-.256.287-.206 1.137-.42.844-.643.061-.049.126-.092.186-.142l.599-.5-.018-.015c3.62-3.159 5.895-8.041 5.895-13.31zm-34.691 0c0-9.203 7.488-16.691 16.691-16.691 9.204 0 16.691 7.488 16.691 16.691 0 4.96-2.176 9.419-5.01 12.478-.804-.133-.998-.252-1.196-.351l-5.542-2.771c-.498-.249-.806-.749-.806-.855v-2.385c.128-.159.263-.338.403-.535a13.327 13.327 0 0 0 1.713-3.353c1.558-.394 1.364-.527 1.364-1.487v-2.986c0-.568-.208-1.118-.256-1.551v-3.055c.34-.339-.17-2.257-1.557-3.838-1.206-1.377-3.159-2.074-5.804-2.074-2.645 0-4.597.697-5.803 2.073-1.387 1.582-1.267 3.499-1.233 3.839v3.054a2.385 2.385 0 0 0-.581 1.551v2.977c0 .064.324.736.878 1.19.53 2.077 1.621 3.649 2.024 4.182v1.894c0 .534-.291 1.214-.761 1.282l-5.175 2.823c-.165.089-.158.194-.492.311-3.403-3.058-5.548-7.489-5.548-12.413zm26.483 13.505c-.229.166-.462.327.129.481-.936.575-1.044.141-1.155.21a16.35 16.35 0 0 1-.944.543c-.07.038-.142.073-.213.11-.737.377-1.5.702-2.283.966l-.083.028c-.411.136-.826 1.148-1.247.361l-.004.001c-.424.105-.853.192-1.285.263l-.035.007c-.407.066-.817.114-1.228.15l-.218.016c-.407.031-.815.05-1.226.05-.415 0-.828-.02-1.24-.051l-.213-.016a16.98 16.98 0 0 1-1.292-.163 16.582 16.582 0 0 1-2.547-.635l-.077-.026c-.412-.14-.819-.295-1.219-.467l-.008-.004c-.153-.163-.75-.343-1.116-.534-.048-.025-.096-.048-.143-.074a17.284 17.284 0 0 1-.985-.573c.481.713-.19.113-.285-.183a16.32 16.32 0 0 1-.875-.611c-.03-.022-.058-.045-.087-.068l.062-.035 5.176-2.823c1.25-.486 1.443-1.327 1.443-2.431v-2.358l-.151-.182c-.014-.016-1.322-1.737-1.964-4.068l-.06-.26-.223-.144c-.315-.204-.503-.544-.503-.254v-2.978c0-.304.129-.587.868-.8l-.288-.195v-3.646l-.006.139c-.002.65.444-1.815.914-3.079.946-.241 2.568-1.626 4.819-1.626 2.243 0 3.86 1.335 4.809 1.614 1.107 1.251.926 2.971.925 3.101l-.006 3.498.216.195c.235.212.364.496.364.801v2.986c0-.199-.317.224-.773.365l-.325.1-.105.324a12.1 12.1 0 0 1-1.634 3.294c-.171.827-.338.457-.481.621l-.163.185V26.5c0 .605.587 2.04 1.531 2.026l5.542 2.77c.035.018.07.036.501.055-.467.053-.539.102-.609.153z"/>
                            </svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="11" height="6">
                                <path fill-rule="evenodd" fill="#FFF" d="M.113.674C.37.597 0 .5 0 .394 0 .287.37.191.113.113c.152.297.399.297.55 0L5.499 5.43 10.336.113c.151.297.398.297.55 0 .484.155.484.406 0 .561l-5.112 5.21c-.151.506-.398.506-.55 0L.113.674z"/>
                            </svg>                                        
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-1 px-3">
                            <li class="border-bottom" style="font-size: 14px;">
                                <p class="mb-0">Welcome,</p>
                                <p class="mb-1 fw-bold">${user.first_name }</p>
                            </li>
                            <li><a class="dropdown-item px-0" type="button" href="/helperland/customer/dash">My Dashboard</a></li>
                            <li><a class="dropdown-item px-0" type="button" href="/helperland/customer/mysettings" >My Settings</a></li>
                            <li><a class="dropdown-item px-0" type="button" href="/helperland/logout">Logout</a></li>
                        </ul>
                    </div>
                    <div>
                        <button class="navbar-toggler text-white" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" aria-expanded="false" aria-label="Toggle navigation">
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
                    </div>   
                </div>
            </div>
        </nav>
		
	</c:if>
	<c:if test="${user_type_id == 2}" >
	
		<nav class="navbar navbar-expand-lg w-100 sticky-top" id="navbar">
            <div class="container-fluid navbar_main">
                <a class="navbar-brand py-0" href="/helperland/home">
                    <img src="<c:url value = "/resources/assets/nav-footer-assets/logo.png" />" alt="" height="54px" width="73px">
                </a>
                <div class="d-flex navbar_wrapper">
                    <div class="offcanvas offcanvas-end navbar_offcanvas sidebarMain" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                        <div class="offcanvas-body justify-content-end sidebarInner">
                            <div class="navcol_first navcol m-0 p-0">
                                <p class="nav-link">Welcome,<br>${user.first_name } ${user.last_name }</p>
                            </div>
                            <div class="navcol_second navcol">
                                <!-- <div class="nav-item nav_select1"  id="dashBoard1">
                                    <a class="nav-link" href="#dashBoardTable">Dashboard</a>
                                </div> -->
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="newServiceRequest1" href="/helperland/service-provider/dash">New Service Request</a>
                                </div>
            
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="upcomingServices1" href="/helperland/service-provider/upcoming-services">Upcoming Services</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="serviceSchedule1" href="/helperland/service-provider/service-schedule">Service Schedule</a>
                                </div>
                                <div class="nav-item nav_select1" id="serviceHistory1">
                                    <a class="nav-link" id="serviceHistory1" href="/helperland/service-provider/service-history">Service History</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="myRating1" href="/helperland/service-provider/my-ratings">My Rating</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="blockCustomer1" href="/helperland/service-provider/block-customer">Block Customer</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="notification1" href="/helperland//service-provider/notification">Notification</a>
                                </div>
                                <!-- <div class="nav-item nav_select1">
                                    <a class="nav-link">Invoice</a>
                                </div> -->
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" href="/helperland/service-provider/mysettings">My Settings</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" href="/helperland/logout">Logout</a>
                                </div>
                            </div>
                            <div class="navcol_third navcol position-relative">
                            	<div class="nav-item rounded-pill nav_select5">
                                    <a class="nav-link" href="/helperland/service-booking" id="pricesServices">Book Now</a>
                                </div>
                                <div class="nav-item rounded-pill nav_select1">
                                    <a class="nav-link" href="/helperland/prices" id="pricesServices">Prices & services</a>
                                </div>
                                <div class="nav-item rounded-pill nav_select2">
                                    <a class="nav-link" href="" id="warranty">Warranty</a>
                                </div>
                                <div class="nav-item rounded-pill nav_select3">
                                    <a class="nav-link" href="" id="blog">Blog</a>
                                </div>
                                <div class="nav-item rounded-pill nav_select4">
                                    <a class="nav-link" href="/helperland/contact" id="contact">Contact</a>
                                </div>
                            </div>
                            <div class="navcol_fourth align-items-center justify-content-center p-2">
                                <a href="https://www.facebook.com/TatvaSoft/" target="_blank">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="9" height="18" class="me-3">
                                        <path fill-rule="evenodd" fill="#000" d="M1.947 3.48v2.481H0v3.033h1.947V18.1h4.001V8.995h2.685S8.885 7.541 9.7 5.95H5.963V3.876c0-.31.437-.728.868-.728H9.11V.9H6.46C1.848.9 1.947 3.27 1.947 3.48z"/>
                                    </svg>
                                </a>
                                <a href="https://www.instagram.com/" target="_blank">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" class="ms-3">
                                        <path fill-rule="evenodd" fill="#000" d="M14.48 20H5.519A5.524 5.524 0 0 1 0 14.482V5.52C0 2.477 2.475.2 5.519.2h8.961c3.043 0 5.519 2.277 5.519 5.32v8.962A5.525 5.525 0 0 1 14.48 20zm3.744-5.518V5.52a3.748 3.748 0 0 0-3.744-3.744H5.519A3.749 3.749 0 0 0 1.774 5.52v8.962a3.749 3.749 0 0 0 3.745 3.744h8.961a3.748 3.748 0 0 0 3.744-3.744zm-2.855-8.536c-.099 0-.678-.14-.92-.381-.242-.243.221-.578.221-.921 0-.342-.463-.678-.221-.92.242-.242.821-.381.92-.381.343 0 1.111.139.92.381.242.242.381.578.381.92 0 .342-.139.678-.381.921.171.241-.577.381-.92.381zm-5.37 9.208c-2.841 0-5.153-2.312-5.153-5.054 0-2.941 2.312-5.252 5.153-5.252 2.842 0 5.153 2.311 5.153 5.252 0 2.742-2.311 5.054-5.153 5.054zm0-8.532c-1.863 0-3.379 1.516-3.379 3.478 0 1.764 1.516 3.28 3.379 3.28s3.379-1.516 3.379-3.28c0-1.962-1.516-3.478-3.379-3.478z"/>
                                    </svg> 
                                </a> 
                            </div>
                        </div>
                    </div>
                    <div class="d-flex align-items-center justify-content-center nav_right_icon position-relative">
                        <a class="navbar-brand py-0 nav_icons1 ms-3" href="">
                            <img src="<c:url value = "/resources/assets/nav-footer-assets/bell.png" />" alt="" height="32px" width="29px">
                        </a>
                        <a class="navbar-brand py-0 nav_icons2 me-0 dropDownBtn" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36">
                                <path fill-rule="evenodd" fill="#FFF" d="M35.999 17.999C35.999 8.75 27.924 0 17.999 0 8.75 0 0 8.75 0 17.999c0 5.243 2.254 9.968 5.842 13.26l-.017.015.584.492c.038.032.079.059.117.09.31.257.631.501.959.738.106.076.212.153.32.228.349.798.708.469 1.075.685.08.048.52.094.24.139.402.229.811 1.254 1.231.642l.093.042a17.834 17.834 0 0 0 4.474 1.399c.474.082.953.147 1.438.191l.177.014c.627.04.972.065 1.466.065.491 0 .974-.025 1.455-.064l.182-.013c.481-.044.957-.108 1.984-.188-.517-.008-.476-.015-.436-.023a17.8 17.8 0 0 0 4.292-1.345c.05-.023.1-.044.15-.068.674-.19.799-.394 1.186-.612.096-.055.488-.11 1.178-.166-.539-.208-.193.44.144-.655.121-.082.239-.169.359-.256.287-.206 1.137-.42.844-.643.061-.049.126-.092.186-.142l.599-.5-.018-.015c3.62-3.159 5.895-8.041 5.895-13.31zm-34.691 0c0-9.203 7.488-16.691 16.691-16.691 9.204 0 16.691 7.488 16.691 16.691 0 4.96-2.176 9.419-5.01 12.478-.804-.133-.998-.252-1.196-.351l-5.542-2.771c-.498-.249-.806-.749-.806-.855v-2.385c.128-.159.263-.338.403-.535a13.327 13.327 0 0 0 1.713-3.353c1.558-.394 1.364-.527 1.364-1.487v-2.986c0-.568-.208-1.118-.256-1.551v-3.055c.34-.339-.17-2.257-1.557-3.838-1.206-1.377-3.159-2.074-5.804-2.074-2.645 0-4.597.697-5.803 2.073-1.387 1.582-1.267 3.499-1.233 3.839v3.054a2.385 2.385 0 0 0-.581 1.551v2.977c0 .064.324.736.878 1.19.53 2.077 1.621 3.649 2.024 4.182v1.894c0 .534-.291 1.214-.761 1.282l-5.175 2.823c-.165.089-.158.194-.492.311-3.403-3.058-5.548-7.489-5.548-12.413zm26.483 13.505c-.229.166-.462.327.129.481-.936.575-1.044.141-1.155.21a16.35 16.35 0 0 1-.944.543c-.07.038-.142.073-.213.11-.737.377-1.5.702-2.283.966l-.083.028c-.411.136-.826 1.148-1.247.361l-.004.001c-.424.105-.853.192-1.285.263l-.035.007c-.407.066-.817.114-1.228.15l-.218.016c-.407.031-.815.05-1.226.05-.415 0-.828-.02-1.24-.051l-.213-.016a16.98 16.98 0 0 1-1.292-.163 16.582 16.582 0 0 1-2.547-.635l-.077-.026c-.412-.14-.819-.295-1.219-.467l-.008-.004c-.153-.163-.75-.343-1.116-.534-.048-.025-.096-.048-.143-.074a17.284 17.284 0 0 1-.985-.573c.481.713-.19.113-.285-.183a16.32 16.32 0 0 1-.875-.611c-.03-.022-.058-.045-.087-.068l.062-.035 5.176-2.823c1.25-.486 1.443-1.327 1.443-2.431v-2.358l-.151-.182c-.014-.016-1.322-1.737-1.964-4.068l-.06-.26-.223-.144c-.315-.204-.503-.544-.503-.254v-2.978c0-.304.129-.587.868-.8l-.288-.195v-3.646l-.006.139c-.002.65.444-1.815.914-3.079.946-.241 2.568-1.626 4.819-1.626 2.243 0 3.86 1.335 4.809 1.614 1.107 1.251.926 2.971.925 3.101l-.006 3.498.216.195c.235.212.364.496.364.801v2.986c0-.199-.317.224-.773.365l-.325.1-.105.324a12.1 12.1 0 0 1-1.634 3.294c-.171.827-.338.457-.481.621l-.163.185V26.5c0 .605.587 2.04 1.531 2.026l5.542 2.77c.035.018.07.036.501.055-.467.053-.539.102-.609.153z"/>
                            </svg>
                            <svg xmlns="http://www.w3.org/2000/svg" width="11" height="6">
                                <path fill-rule="evenodd" fill="#FFF" d="M.113.674C.37.597 0 .5 0 .394 0 .287.37.191.113.113c.152.297.399.297.55 0L5.499 5.43 10.336.113c.151.297.398.297.55 0 .484.155.484.406 0 .561l-5.112 5.21c-.151.506-.398.506-.55 0L.113.674z"/>
                            </svg>                                        
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-1 px-3">
                            <li class="border-bottom" style="font-size: 14px;">
                                <p class="mb-0">Welcome,</p>
                                <p class="mb-1 fw-bold">${user.first_name }</p>
                            </li>
                            <li><a class="dropdown-item px-1" type="button" href="/helperland/service-provider/dash">My Dashboard</a></li>
                            <li><a class="dropdown-item px-1" type="button" href="/helperland/service-provider/mysettings" >My Settings</a></li>
                            <li><a class="dropdown-item px-1" type="button" href="/helperland/logout">Logout</a></li>
                        </ul>
                    </div>
                    <div>
                        <button class="navbar-toggler text-white" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" aria-expanded="false" aria-label="Toggle navigation">
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
                    </div>   
                </div>
            </div>
        </nav>
	
	</c:if>


	<div style="min-height: 100vh; padding-bottom: 150px;">
		<div class="bookService_heading position-relative">
			<h1 class="text-center">Set up your cleaning service</h1>
			<div class="bookService_box">
				<div class="left_line"></div>
				<img
					src="<c:url value = "/resources/assets/serviceBooking/separator.png" />"
					alt="" />
				<div class="right_line"></div>
			</div>
		</div>


		<section>
			<div class="bookService_container row">
				<div class="bookService_Left col-sm-7">
					<div class="dash_contents w-100">
						<ul
							class="nav nav-fill nav-tabs nav-pills justify-content-center mb-3"
							id="myTab" role="tablist">
							<li class="nav-item" role="presentation">
							<a
								class="nav-link active activeBg" id="setupServiceTabController"
								data-bs-toggle="tab" data-bs-target="#setupServiceTab"
								type="button" aria-controls="setupService" aria-selected="true">
									<!-- <img src="./assets/setup-service.png" alt="" class="nav_image"> -->
									<span class="title_wrapper"> <span
										class="setupServiceTabControllerBG bg_wrapper"></span> <span
										class="ms-2 nav_title">Setup Service</span>
								</span>
							</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								disabled id="schedulePlanTabController" data-bs-toggle="tab"
								data-bs-target="#schedulePlanTab" type="button"
								aria-controls="schedulePlan" aria-selected="false"> <!-- data-bs-target="#schedulePlanTab" -->
									<!-- <img src="./assets/edit-icon.png" alt=""> --> <span
									class="title_wrapper"> <span
										class="schedulePlanTabControllerBG bg_wrapper"></span> <span
										class="ms-2 nav_title">Schedule & Plan</span>
								</span>
							</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								disabled id="yourDetailsTabController" data-bs-toggle="tab"
								data-bs-target="#yourDetailsTab" type="button"
								aria-controls="yourDetails" aria-selected="false"> <!-- <img src="./assets/edit-icon.png" alt=""> -->
									<span class="title_wrapper"> <span
										class="yourDetailsTabControllerBG bg_wrapper"></span> <span
										class="ms-2 nav_title">Your Details</span>
								</span>
							</a></li>
							<li class="nav-item" role="presentation"><a class="nav-link"
								disabled id="makePaymentTabController" data-bs-toggle="tab"
								data-bs-target="#makePaymentTab" type="button"
								aria-controls="makePayment" aria-selected="false"> <!-- <img src="./assets/edit-icon.png" alt=""> -->
									<span class="title_wrapper"> <span
										class="makePaymentTabControllerBG bg_wrapper"></span> <span
										class="ms-2 nav_title">Make Payment</span>
								</span>
							</a></li>
						</ul>

						<div class="tab-content mt-4" id="myTabContent">

							<form id="mainServiceForm" name="mainServiceForm" method="post"
								action="service-request"></form>
							<!-- ------- setup services ---------  -->
							<div class="tab-pane fade show mt-3 color646464 active"
								id="setupServiceTab" role="tabpanel"
								aria-labelledby="setupService">
								<form class="row" id="postalCodeForm" method="post"
									action="check-availability">

									<p class="fw-bold mb-1">Enter Your Postal Code</p>
									<div class="d-flex height46 serviceTab_wrapper">
										<input type="text" id="postal_code" form="mainServiceForm"
											class="form-control me-2" required placeholder="Postal code"
											name="postal_code">
										<button
											class="nav-link btn text-light greenButton rounded-pill form-control"
											type="submit" disabled id="checkAvailability">Check Availability</button>
									</div>
									<small id="errPostalCode" class="text-danger"></small>
								</form>

							</div>


							<!-- ------------- Schedule and plan ----------- -->
							<div class="tab-pane fade" role="tabpanel" id="schedulePlanTab"
								aria-labelledby="schedulePlan">
								<form action="schedule-plan" id="schedulePlanForm" method="post">
									<div class="row borderbottom pb-3 color646464">
										<div class="col-md-6">
											<p class="fw-bold mb-1">When do you need the cleaner?</p>
											<div>
												<input type="date" name="servicedate" required
													class="height46 paddinginner borderlight color646464 mb-1"
													id="servicedate"> 
												<select name="servicetime"
													id="servicetime"
													class="height46 paddinginner borderlight mb-1 color646464">
													<option value="08:00:00">8:00</option>
													<option value="08:30:00">8:30</option>
													<option value="09:00:00">9:00</option>
													<option value="09:30:00">9:30</option>
													<option value="10:00:00">10:00</option>
													<option value="10:30:00">10:30</option>

												</select> 
												<input type="hidden" form="mainServiceForm"
													id="service_start_date" name="service_start_date">
											</div>
										</div>
										<div class="col-md-6">
											<p class="fw-bold mb-1">How long do you need your cleaner
												to stay?</p>
											<select name="service_hours" form="mainServiceForm"
												class="height46 paddinginner borderlight mb-1 color646464"
												id="servicehrs">
												<option value=3 selected>3 Hrs</option>
												<option value=3.5>3.5 Hrs</option>
												<option value=4>4 Hrs</option>
												<option value=4.5>4.5 Hrs</option>
												<option value=5>5 Hrs</option>
												<option value=5.5>5.5 Hrs</option>
											</select>
										</div>
									</div>
									<div class="pt-4 pb-5 color646464 borderbottom">
										<label class="mb-3 fw-bold">Extra Services</label>
										<div class="btn-group avatarGroup" role="group"
											aria-label="Basic checkbox toggle button group">

											<div
												class="d-flex flex-column align-items-center label_wrapper">
												<label class="btn btn-outline-primary itemAvatar"
													for="cabinet"> <input type="checkbox" form="mainServiceForm"
													name="cabinet" id="cabinet" value="0">
													<div class="img_outer rounded-circle">
														<div class="img_wrapper">
															<img
																src="<c:url value = "/resources/assets/serviceBooking/cabinet.png" /> "
																alt="">
														</div>
													</div>
												</label> <span class="text-center">Clean cabinet interiors</span>
											</div>

											<div
												class="d-flex flex-column align-items-center label_wrapper">
												<label class="btn btn-outline-primary itemAvatar"
													for="refrigerator"> <input type="checkbox" form="mainServiceForm"
													name="refrigerator" id="refrigerator" value="0">
													<div class="img_outer rounded-circle">
														<div class="img_wrapper">
															<img
																src="<c:url value = "/resources/assets/serviceBooking/refrigerator.png" />"
																alt="">
														</div>
													</div>
												</label> <span class="text-center">Cleaning the refrigerator</span>
											</div>

											<div
												class="d-flex flex-column align-items-center label_wrapper">
												<label class="btn btn-outline-primary itemAvatar" for="oven">
													<input type="checkbox" form="mainServiceForm" name="oven" id="oven" value="0">
													<div class="img_outer rounded-circle">
														<div class="img_wrapper">
															<img
																src="<c:url value = "/resources/assets/serviceBooking/oven.png" />"
																alt="">
														</div>
													</div>
												</label> <span class="text-center">Cleaning the oven</span>
											</div>

											<div
												class="d-flex flex-column align-items-center label_wrapper">
												<label class="btn btn-outline-primary itemAvatar"
													for="laundry"> <input type="checkbox" form="mainServiceForm"
													name="laundry" id="laundry" value="0">
													<div class="img_outer rounded-circle">
														<div class="img_wrapper">
															<img
																src="<c:url value = "/resources/assets/serviceBooking/laundry.png" />"
																alt="">
														</div>
													</div>
												</label> <span class="text-center">Wash and dry laundry</span>
											</div>

											<div
												class="d-flex flex-column align-items-center label_wrapper">
												<label class="btn btn-outline-primary itemAvatar"
													for="windows"> 
													<input type="checkbox" form="mainServiceForm"
														name="windows" id="windows" value="0">
													<div class="img_outer rounded-circle">
														<div class="img_wrapper">
															<img
																src="<c:url value = "/resources/assets/serviceBooking/windows.png" />"
																alt="">
														</div>
													</div>
												</label> 
												<span class="text-center">Clean windows</span>
											</div>
										</div>
									</div>
									<input type="hidden" id="extra_hours" form="mainServiceForm"
										name="extra_hours"> 
									<input type="hidden"
										id="total_cost" form="mainServiceForm" name="total_cost">
									<input type="hidden" id="sub_total" form="mainServiceForm"
										name="sub_total"> 
									<input type="hidden"
										name="created_date" form="mainServiceForm" id="created_date">
									<input type="hidden" name="modified_date"
										form="mainServiceForm" id="modified_date"> 
									<div class="d-flex flex-column py-4">
										<label for="comments" class="color646464 fw-bold mb-3">Comments</label>
										<textarea name="comments" form="mainServiceForm" id="comments"
											maxlength="500" placeholder="Comments" rows="3"
											class="paddinginner"></textarea>
									</div>
									<div class="d-flex align-items-center borderbottom pb-4">
										<input type="checkbox" name="has_pets" form="mainServiceForm"
											id="pets" value="0"> 
										<label for="pets" class="ms-2">I
											have pets at home.</label>
									</div>
									<div class="d-flex justify-content-end">
										<button type="submit"
											class="btn greenButton my-2 text-light rounded-pill">
											Continue</button>
									</div>
								</form>
							</div>

							<!-- ----------- your details ----------- -->
							<div class="tab-pane fade" role="tabpanel" id="yourDetailsTab"
								aria-labelledby="yourDetails">
								<form action="service-address" name="yourDetailsForm" id="yourDetailsForm" method="post">
									<p class="fw-bold">Enter your contact details, so we can
										serve you in better way!</p>
									<ul class="address_list p-0" id="address_list">
										<c:forEach var="address" items="${addresses }">
	
											<li class="address_listItem px-3 py-2 my-2">
												<label
													class="d-flex align-items-center"> 
													<input
														type="radio" id="${address.address_id }" form="mainServiceForm"
														name="address_id" class="address_id" required value="${address.address_id }">
													<div class="ms-4">
														<p class="mb-1">
															<b>Address:</b> ${address.address_line1 }
															${address.address_line2 } , ${address.city },
															${address.state } , ${address.postal_code }
														</p>
														<p class="mb-1">
															<b>Phone number:</b> ${address.mobile }
														</p>
													</div>
												</label>
											</li>
	
										</c:forEach>
	
									</ul>
									
									<a
										class="btn addNewAddressBtn px-4 mt-3 rounded-pill fw-bolder"
										value="+ Add New Address" data-bs-toggle="collapse"
										href="#newAddressCollapse" role="button" aria-expanded="false"
										aria-controls="newAddressCollapse">+ Add New Address</a>
	
									<p><small class="text-danger mb-0 fs-small" id="selectAddressError"></small></p>
									<hr class="mt-5 mb-3">
									<!-- <div class="d-flex justify-content-end">
	                                        <button type="submit" class="btn greenButton my-2 text-light rounded-pill" >
	                                            Continue
	                                        </button>
	                                    </div> -->
								</form> 
								
								<div class="my-3 collapse multi-collapse newAddress_collapse"
									id="newAddressCollapse">
									<form action="add-address" id="addNewAddressForm" method="post">
										<div class="row newAddress_form">
											<div class="col-sm-6 mb-4">
												<div class="form-group d-flex flex-column">
													<label for="streetname">Street Name</label> 
													<input
														type="text" required placeholder="Street Name"
														name="address_line2"
														class="borderlight height46 paddinginner w-100 needed_in_address1">
												</div>
											</div>
											<div class="col-sm-6 mb-4">
												<div class="form-group d-flex flex-column">
													<label for="housenumber">House number</label> <input
														type="text"  placeholder="House Number"
														name="address_line1"
														class="borderlight height46 paddinginner w-100 needed_in_address2">
												</div>
											</div>
											<div class="col-sm-6 mb-4">
												<div class="form-group d-flex flex-column">
													<label for="postalcode">Postal Code</label> <input
														type="text" required id="address_pincode" readonly
														placeholder="Postal Code" name="postal_code"
														class="borderlight height46 paddinginner w-100 ">
												</div>
											</div>
											<div class="col-sm-6">
												<div class="form-group d-flex flex-column">
													<label for="city">City</label>
													<div class="d-inline-block">
														<!-- <select name="city" id="" class="height46 borderlight paddinginner w-100" >
                                                            <option value="troisdorf" >Troisdorf</option>
                                                        </select> -->
														<input required type="text" name="city"
															class="height46 borderlight paddinginner w-100 needed_in_address3"
															placeholder="City">
													</div>
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-group d-flex flex-column">
													<label for="phonenumber"> Phone Number</label>
													<div class="d-flex">
														<input type="text" name="phonecode"
															class="borderlight height46 paddinginner" value="+91"
															disabled style="max-width: 55px;"> 
														<input
															type="text" required placeholder="Phone Number"
															name="mobile" id="addNewAddressMobile"
															class="borderlight minheight46 paddinginner"
															>
													</div>
												</div>
											</div>
											<small id="addAddressError" class="text-danger mb-2"></small>
										</div>
										<input type="hidden" value="${user.user_id }" name="user_id">
										<input type="hidden" name="is_default" value="0"> <input
											type="hidden" name="is_deleted" value="0"> <input
											type="hidden" name="email" value="${user.email }">
										
										<button type="submit" id="addressSubmitBtn"
											class="greenButton disabledBtn rounded-pill borderlight text-light px-3 paddinginner">
											Save</button>
										<a role="button"
											class="btn border height46 paddinginner rounded-pill"
											data-bs-toggle="collapse" href="#newAddressCollapse"
											aria-expanded="false" aria-controls="newAddressCollapse">
											Cancel </a>
									</form>
								</div>

								<div id="favouriteTable my-3">
									<h4 class="border-bottom pb-2">Your favourite service
										providers.</h4>
									<p>you can choose your favourite service provider from
										below list.</p>
									<div class="favouriteList">
										<c:forEach var="u" items="${favUsers }">
											<div class="favouriteListItem col-sm-4 w-100 d-flex align-items-center justify-content-center flex-column">
												<div
													class="spProfile mb-3 rounded-circle d-flex align-items-center justify-content-center">
													<img
														src="<c:url value = "/resources/assets/serviceBooking/${u.user_profile_picture }.png" />">
												</div>
												<p class="mb-3">${u.first_name } ${u.last_name }</p>
												<div>
													<input type="radio" id="spid${u.user_id }" name="fav-sp-id" class="btn-check" value="${u.user_id }" form="mainServiceForm">
													<label for="spid${u.user_id }" class="btn btn-outline-primary  select_button rounded-pill">Select</label>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>


								<div class="d-flex justify-content-end">
									<button type="submit"
										class="btn greenButton my-2 text-light rounded-pill"
										onclick="$('#yourDetailsForm').submit();">Continue</button>
								</div>


							</div>

							<!-- --------------- payment --------------  -->
							<div class="tab-pane fade" role="tabpanel" id="makePaymentTab"
								aria-labelledby="makePayment">
								<!-- <form action="" id="bookForm" name="bookForm"> -->
								<div class="d-flex align-items-center pb-2">
									<input type="checkbox" name="acceptterms" id="acceptterms"
										required> <label for="acceptterms" class="ms-4">
										I accepted terms and conditions, the cancellation policy and
										the privacy policy. I confirm that Helperland starts to
										execute the contract before the expiry of the withdrawal
										period and I lose my right of withdrawal as a consumer with
										full performance of the contract. </label>
								</div>
								<small id="serviceRequestError" class="text-danger"></small>
								<hr class="mt-5 mb-3">
								<div class="d-flex justify-content-end">
									<button type="submit"
										class="btn greenButton my-2 text-light rounded-pill fw-bolder"
										id="mainServiceFormSubmit">Complete Booking</button>
								</div>
								<!-- </form> -->
							</div>
						</div>
					</div>
				</div>

				<div class="bookService_Right col-sm-5" id="bookService_Right">
					<div class="inner-wrapper">
						<div class="paymentSummary">
							<h3 class="paymentSummary_heading">Payment Summery</h3>
							<div class="padding20 borderbottom">
								<div>
									<p class="mb-0 fw-bold">Duration</p>
									<div class="d-flex justify-content-between">
										<p class="mb-0">Basic</p>
										<p class="mb-0" id="basicTime"></p>
									</div>
									<hr>
									<table class="w-100" id="extraTable">
										<thead>
											<td class="fw-bold">Extras</td>
											<td width="60px"></td>
										</thead>
										<tbody>

										</tbody>
									</table>
									<hr>
								</div>
								<div class="d-flex justify-content-between">
									<p class="mb-0 fw-bold">Total Service Time</p>
									<p class="mb-0 fw-bold" id="total_service_time"></p>
								</div>
							</div>
							<div
								class="borderbottom d-flex justify-content-between padding20">
								<p class="mb-0">Per cleaning</p>
								<p class="mb-0 fw-bold">18,00 $</p>
							</div>
							<div class="padding20">
								<div class="d-flex align-items-end justify-content-between">
									<p class="totalPayment mb-0">Total Payment</p>
									<p class="paymentBig mb-0" id="total_payment"></p>
								</div>
								<p class="mb-0 smallFont pt-1">According to § 19 UStG no
									sales tax is calculated.</p>
								<div class="d-flex justify-content-between mt-2 mb-2">
									<p class="mb-0">Effective Price</p>
									<p class="mb-0 fw-bold" id="effective_price"></p>
								</div>
								<p class="mb-0 smallFont">
									<span>*</span>You will save 20% according to §35a EStG.
								</p>
							</div>
							<div class="padding20 paymentSummary_Bottom">
								<a href="" class="text-decoration-none">See what is always
									included</a>
							</div>
						</div>
					</div>
					<div class="faqs color646464 mt-4">
						<h4 class="text-center">Questions?</h4>
						<div class="accordion position-relative w-100"
							id="accordionCustomer">
							<div class="accordion-item border-0 border-bottom">
								<div class="accordion-header d-flex align-items-center"
									id="headingOne">
									<button class="accordion-button btn collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseOne"
										aria-expanded="false" aria-controls="collapseOne"></button>
									<p class="mb-0 ms-3">What's included in a cleaning?</p>
								</div>
								<div id="collapseOne" class="accordion-collapse collapse"
									aria-labelledby="headingOne"
									data-bs-parent="#accordionCustomer">
									<div class="accordion-body fw-bold">Bedroom, Living Room
										& Common Areas,Bathrooms,Kitchen,Extras</div>
								</div>
							</div>


							<div class="accordion-item border-0 border-bottom">
								<div class="accordion-header d-flex align-items-center"
									id="headingTwo">
									<button class="accordion-button btn collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseTwo"
										aria-expanded="false" aria-controls="collapseOne"></button>
									<p class="mb-0 ms-3">Which Helperland professional will
										come to my place?</p>
								</div>
								<div id="collapseTwo" class="accordion-collapse collapse"
									aria-labelledby="headingTwo"
									data-bs-parent="#accordionCustomer">
									<div class="accordion-body fw-bold">Helperland has a vast
										network of experienced, top-rated cleaners. Based on the time
										and date of your request, we work to assign the best
										professional available.Like working with a specific pro? Add
										them to your Pro Team from the mobile app and they'll be
										requested first for all future bookings.You will receive an
										email with details about your professional prior to your
										appointment.</div>
								</div>
							</div>


							<div class="accordion-item border-0 border-bottom">
								<div class="accordion-header d-flex align-items-center"
									id="headingThree">
									<button class="accordion-button btn collapsed" type="button"
										data-bs-toggle="collapse" data-bs-target="#collapseThree"
										aria-expanded="false" aria-controls="collapseThree">

									</button>
									<p class="mb-0 ms-3">Can I skip or reschedule bookings?</p>
								</div>
								<div id="collapseThree" class="accordion-collapse collapse"
									aria-labelledby="headingThree"
									data-bs-parent="#accordionCustomer">
									<div class="accordion-body fw-bold">You can reschedule
										any booking for free at least 24 hours in advance of the
										scheduled start time. If you need to skip a booking within the
										minimum commitment, we’ll credit the value of the booking to
										your account. You can use this credit on future cleanings and
										other Helperland services.</div>
								</div>
							</div>
						</div>
						<a href="faqs"
							class="fw-bold faqsPage_Redirect text-decoration-none"> For
							more help</a>
					</div>
				</div>

			</div>
		</section>

		<div class="modal fade" id="successModal" aria-hidden="true"
			aria-labelledby="successModalLabel2" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered modal-md">
				<div class="modal-content">
					
					<div class="modal-body">
						<div class="successBG rounded-circle mb-3">
							<img
								src="<c:url value = "/resources/assets/serviceBooking/ic-check.png" />"
								alt="">
						</div>
						<div class="text-center">
							<h4 class="mb-2">Booking has been submitted successfully</h4>
							<p id="service_id_p"></p>
						</div>
						<div class="text-center">
							<button type="button"
								class="btn greenButton text-white rounded-pill"
								data-bs-dismiss="modal" aria-label="Close"
								style="min-width: 60px;" id="successModelOk">ok</button>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="footer_section w-100" style="margin-top: -150px;">
		<div
			class="footer_main d-flex justify-content-center align-items-center position-relative">
			<div
				class="d-flex justify-content-between h-100 align-items-center footer_inner position-relative">
				<div class="footer_left">
					<a href="home"> <img
						src="<c:url value = "/resources/assets/nav-footer-assets/logo.png" />"
						alt="" height="78" width="106">
					</a>
				</div>
				<div class="footer_mid">
					<ul class="d-flex p-0 text-center m-0">
						<li><a href="home" class="text-decoration-none">HOME</a></li>
						<li><a href="about" class="text-decoration-none">ABOUT</a></li>
						<li><a href="#" class="text-decoration-none">TESTIMONIAL</a>
						</li>
						<li><a href="faqs" class="text-decoration-none">FAQS</a></li>
						<li><a href="" class="text-decoration-none">INSURANCE
								POLICY</a></li>
						<li><a href="" class="text-decoration-none">IMPRESSUM</a></li>
					</ul>
				</div>
				<div
					class="footer_right d-flex align-items-center justify-content-evenly">
					<a href="https://www.facebook.com/TatvaSoft/" target="_blank">
						<svg xmlns="http://www.w3.org/2000/svg" width="9" height="18">
                            <path fill-rule="evenodd" fill="#CCC"
								d="M1.947 3.48v2.481H0v3.033h1.947V18.1h4.001V8.995h2.685S8.885 7.541 9.7 5.95H5.963V3.876c0-.31.437-.728.868-.728H9.11V.9H6.46C1.848.9 1.947 3.27 1.947 3.48z" />
                        </svg>
					</a> <a href="https://www.instagram.com/" target="_blank"> <svg
							xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                            <path fill-rule="evenodd" fill="#CCC"
								d="M14.48 20H5.519A5.524 5.524 0 0 1 0 14.482V5.52C0 2.477 2.475.2 5.519.2h8.961c3.043 0 5.519 2.277 5.519 5.32v8.962A5.525 5.525 0 0 1 14.48 20zm3.744-5.518V5.52a3.748 3.748 0 0 0-3.744-3.744H5.519A3.749 3.749 0 0 0 1.774 5.52v8.962a3.749 3.749 0 0 0 3.745 3.744h8.961a3.748 3.748 0 0 0 3.744-3.744zm-2.855-8.536c-.099 0-.678-.14-.92-.381-.242-.243.221-.578.221-.921 0-.342-.463-.678-.221-.92.242-.242.821-.381.92-.381.343 0 1.111.139.92.381.242.242.381.578.381.92 0 .342-.139.678-.381.921.171.241-.577.381-.92.381zm-5.37 9.208c-2.841 0-5.153-2.312-5.153-5.054 0-2.941 2.312-5.252 5.153-5.252 2.842 0 5.153 2.311 5.153 5.252 0 2.742-2.311 5.054-5.153 5.054zm0-8.532c-1.863 0-3.379 1.516-3.379 3.478 0 1.764 1.516 3.28 3.379 3.28s3.379-1.516 3.379-3.28c0-1.962-1.516-3.478-3.379-3.478z" />
                        </svg>
					</a>
				</div>
			</div>
		</div>
		<div
			class="footer_end d-flex align-items-center justify-content-center position-relative">
			<p class="m-0 text-center">
				©2018 Helperland. All rights reserved. &nbsp;&nbsp;<span><a
					href="" class="text-decoration-none">Terms and Conditions</a></span> | <span><a
					href="" class="text-decoration-none">Privacy Policy</a></span>
			</p>
		</div>
	</div>

	
    <script>
	    $(document).ready(function(){
	        var dtToday = new Date();
	        
	        var month = dtToday.getMonth() + 1;
	        var day = dtToday.getDate() + 1;
	        var year = dtToday.getFullYear();
	        if(month < 10)
	            month = '0' + month.toString();
	        if(day < 10)
	            day = '0' + day.toString();
	        
	        var maxDate = year + '-' + month + '-' + day;
	        $('#servicedate').attr('min', maxDate);
	        
	        $('#successModal').modal({backdrop: 'static', keyboard: false})
	    });
    </script>

	<script>
		
		$(".needed_in_address1 , .needed_in_address2 , .needed_in_address3").on("keyup" , function(){
			if($(".needed_in_address1").val().length > 0 && $(".needed_in_address2").val().length > 0 && $(".needed_in_address3").val().length > 0){
				$("#addressSubmitBtn").removeAttr('disabled');
				$("#addressSubmitBtn").removeClass('disabledBtn');
			}
			else{
				$("#addressSubmitBtn").addClass('disabledBtn');
				$("#addressSubmitBtn").attr('disabled' , true);	
			}
			
			if($(".needed_in_address1").val().length == 0 || $(".needed_in_address2").val().length == 0 || $(".needed_in_address3").val().length == 0){
				$("#addressSubmitBtn").attr('disabled' , true);
				$("#addressSubmitBtn").addClass('disabledBtn');
			}
			
		}); 
		
		$("#postal_code").on("keyup" , function(){
			if($("#postal_code").val().length > 4){
				$("#checkAvailability").removeAttr('disabled');
			}
			else{
				$("#checkAvailability").attr('disabled' , true);	
			}
		})
	
		$("#successModelOk").on("click",function(){
			location.reload(true);
		})
		
	
	</script>
	<script>
		$("#servicedate , #servicetime").on(
				"change",
				function() {

					var serviceDate = $("#servicedate").val();
					var serviceTime = $("#servicetime").val();
					var date = moment(serviceDate + ' ' + serviceTime).format(
							"YYYY-MM-DD HH:mm:ss.SSS");

					var sdate = new Date(date);
					console.log(date);
					$("#service_start_date").val(sdate);

				});

		var t = moment(new Date()).format("YYYY-MM-DD HH:mm:ss.SSS");
		var k = new Date(t);
		$('#created_date').val(k);
		$('#modified_date').val(k);
	</script>
	
	<script>
		
		$("#setupServiceTabController").on("click" , function(){
	        if($("#setupServiceTabController").hasClass("active")){
	            $("#setupServiceTabController").addClass("activeBg");
	            
	            $("#makePaymentTabController").removeClass("activeBg")
	            $("#schedulePlanTabController").removeClass("activeBg");
	            $("#yourDetailsTabController").removeClass("activeBg");
	
	            $("#schedulePlanTabController").prop('disabled' , true);
	            $("#yourDetailsTabController").prop('disabled' , true);
	            $("#makePaymentTabController").prop('disabled' , true);
	        }
	    })
	
	    $("#schedulePlanTabController").on("click" , function(){
	        if($("#schedulePlanTabController").hasClass("active")){
	            $("#schedulePlanTabController").addClass("activeBg");
	            $("#setupServiceTabController").addClass("activeBg");
	
	            $("#yourDetailsTabController").removeClass("activeBg");
	            $("#makePaymentTabController").removeClass("activeBg")
	
	            $("#yourDetailsTabController").prop('disabled' , true);
	            $("#makePaymentTabController").prop('disabled' , true);
	        }
	    })
	
	    $("#yourDetailsTabController").on("click" , function(){
	        if($("#yourDetailsTabController").hasClass("active")){
	            $("#yourDetailsTabController").addClass("activeBg")
	            $("#setupServiceTabController").addClass("activeBg");
	            $("#schedulePlanTabController").addClass("activeBg");
	
	            $("#makePaymentTabController").removeClass("activeBg")
	
	            $("#makePaymentTabController").prop('disabled' , true);
	        }
	    })
	
	    $("#makePaymentTabController").on("click" , function(){
	        if($("#makePaymentTabController").hasClass("active")){
	
	            $("#makePaymentTabController").addClass("activeBg")
	            $("#setupServiceTabController").addClass("activeBg");
	            $("#schedulePlanTabController").addClass("activeBg");
	            $("#yourDetailsTabController").addClass("activeBg");
	
	        }
	    })
	
	</script>

	<script>
		
		
		$("#mainServiceFormSubmit").on("click" , function(){
			$("#mainServiceForm").submit();	
		});
		
		$("#mainServiceForm").on("submit", function(e) {

			console.log($("#mainServiceForm").serialize());
			
			$(document).find('input[type=checkbox]:checked').val(1);
			$(document).find('input[type=checkbox]:not(:checked)').val(0);

			e.preventDefault();
			$.ajax({
				url : $("#mainServiceForm").attr('action'),
				type : $("#mainServiceForm").attr('method'),
				data : $("#mainServiceForm").serialize(),
				success : function(data) {
					
					$("#successModal").modal("show");
					console.log("success");
					console.log(data);
					$("#service_id_p").html("Service Id:" + data);

				},
				error : function(xhr, textStatus, xml) {
					console.log("error");
					console.log(xhr.status);
					console.log(xhr);
					console.log(xml);
					console.log(textStatus);
					$("#serviceRequestError").html("Some error occured. Please try again from first step and enter all the fields required.");
					

				}
			})
		})
	</script>
	
	<script>
		$("#yourDetailsForm").submit(
				function addressReq(e) {

					e.preventDefault();
					

					$.ajax({
						type : "POST",
						contentType : "application/json",
						url : $("#yourDetailsForm").attr("action"),
						data : $(".address_id:checked").val(),
						crossDomain : true,
						success : function(xml, textStatus, xhr) {
							if (xhr.status === 200) {
								console.log("good");
								$("#makePaymentTabController").prop("disabled" , false);
			                    document.getElementById("makePaymentTabController").click();
							} else {
								console.log(xhr.status);
								console.log("bad");
							}
						},
						error : function(xml, textStatus, xhr) {
							console.log(xhr.status);
							$("#selectAddressError").html("Please select service address or add new address.")
						}
					});
				});
		
	</script>

	<script>
		$("#addNewAddressForm").submit(function addnewAddressFun(e) {

			$(this).find('input[type=checkbox]:checked').val(1);
			

			console.log($(this).serialize());
			e.preventDefault();
			$.ajax({
				url : $(this).attr('action'),
				type : $(this).attr('method'),
				data : $(this).serialize(),
				success : function(data) {
					/* $("#address_list").load(document.URL + " #refresh_div"); */
					console.log("success");
					$("#address_list").load(document.URL + " #address_list");
					$(".needed_in_address1").val(null);
					$(".needed_in_address2").val(null);				
					$(".needed_in_address3").val(null);
					$("#addNewAddressMobile").val(null);
				},
					
				error : function(xhr, textStatus, xml) {
					console.log("error");
					$("#addAddressError").html("Please enter all fields to add."); 
				}
			})
		})
	</script>

	<script>
		$("#postalCodeForm").submit(function checkPostalCode(e) {
			e.preventDefault();
			$("#address_pincode").val($("#postal_code").val());

			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : $("#postalCodeForm").attr(
						"action"),

				data : $("#postal_code").val(),
				crossDomain : true,
				success : function(xml, textStatus, xhr) {
					if (xhr.status === 200) {
						$("#schedulePlanTabController").prop("disabled", false);
						document.getElementById("schedulePlanTabController").click();
					} else {
						$("#errPostalCode").html("sorry no service provider available in your area.");
					}
				},
				error : function(xml, textStatus, xhr) {
					console.log(xhr.status);
					$("#errPostalCode").html("sorry no service provider available in your area.");
				}
			});
		});
	</script>

	<script>
		$("#schedulePlanForm").submit(function dummyForm(e) {
			e.preventDefault();
			$("#yourDetailsTabController").prop("disabled", false);
			document.getElementById("yourDetailsTabController").click();
			return false;
		})
	</script>

	<script>
		$(document)
				.ready(
						function() {
							
							$("#pets").val(0);

							var newBasicTime = $("#servicehrs").val();

							var totalServiceTime = newBasicTime;

							var afterChange = $("#servicehrs").val();

							var totalCharge = $("#total_payment");
							var effectivePrice = $("#effective_price");
							var checkedBox = 0;

							$("#extra_hours").val(checkedBox);
							$("#sub_total").val(totalServiceTime * 18);
							$("#total_cost").val(
									(totalServiceTime * 18)
											- ((totalServiceTime * 18) * 0.2));
							totalCharge.html(totalServiceTime * 18 + ",00 $");
							effectivePrice.html((totalServiceTime * 18)
									- ((totalServiceTime * 18) * 0.2));

							$("#basicTime").html(totalServiceTime + " Hrs");
							$("#total_service_time").html(
									totalServiceTime + " Hrs");

							$("#servicehrs")
									.on(
											'change',
											function() {

												newBasicTime = parseFloat($("#servicehrs").val());
												console.log(newBasicTime);
												console.log(totalServiceTime+ " before select");
												console.log(afterChange+ " afterchange value");
												totalServiceTime = totalServiceTime- afterChange;

												console.log(totalServiceTime+ " after minus");
												totalServiceTime = totalServiceTime+ newBasicTime;

												$("#basicTime").html(newBasicTime + " Hrs");
												$("#total_service_time").html(totalServiceTime+ " Hrs");
												afterChange = $("#servicehrs").val();

												console.log(afterChange+ "   after select change");
												console.log(totalServiceTime+ "  inside select");

												totalCharge.html(totalServiceTime* 18 + ",00 $");
												effectivePrice.html((totalServiceTime * 18)- ((totalServiceTime * 18) * 0.2)+ " $");
												$("#sub_total").val(totalServiceTime * 18);
												$("#total_cost").val((totalServiceTime * 18)- ((totalServiceTime * 18) * 0.2));
											})

							$('#cabinet')
									.change(
											function() {
												if (this.checked) {
													extraTableBody = $("#extraTable tbody");
													extraTableBody
															.append("<tr id='cabinetRow'><td>Clean cabinet interiors</td><td>30 mins</td></tr>");
													console
															.log(totalServiceTime
																	+ "before 1 change");
													totalServiceTime = ((totalServiceTime * 60) + 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													console
															.log(totalServiceTime
																	+ "after 1 change");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox + 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												} else if (!this.checked) {
													$("#cabinetRow").remove();
													totalServiceTime = ((totalServiceTime * 60) - 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox - 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												}

											});

							$('#refrigerator')
									.change(
											function() {
												if (this.checked) {
													extraTableBody = $("#extraTable tbody");
													extraTableBody
															.append("<tr id='refrigeratorRow'><td>Cleaning the refrigerator</td><td>30 mins</td></tr>");
													totalServiceTime = ((totalServiceTime * 60) + 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox + 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												} else if (!this.checked) {
													$("#refrigeratorRow")
															.remove();
													totalServiceTime = ((totalServiceTime * 60) - 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox - 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												}

											});

							$('#oven')
									.change(
											function() {
												if (this.checked) {
													extraTableBody = $("#extraTable tbody");
													extraTableBody
															.append("<tr id='ovenRow'><td>Cleaning the oven</td><td>30 mins</td></tr>");
													totalServiceTime = ((totalServiceTime * 60) + 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox + 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												} else if (!this.checked) {
													$("#ovenRow").remove();
													totalServiceTime = ((totalServiceTime * 60) - 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox - 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												}

											});

							$('#laundry')
									.change(
											function() {
												if (this.checked) {
													extraTableBody = $("#extraTable tbody");
													extraTableBody
															.append("<tr id='laundryRow'><td>Wash and dry laundry</td><td>30 mins</td></tr>");
													totalServiceTime = ((totalServiceTime * 60) + 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox + 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												}

												else if (!this.checked) {
													$("#laundryRow").remove();
													totalServiceTime = ((totalServiceTime * 60) - 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox - 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												}
											});

							$('#windows')
									.change(
											function() {
												if (this.checked) {
													extraTableBody = $("#extraTable tbody");
													extraTableBody
															.append("<tr id='windowsRow'><td>Clean windows</td><td>30 mins</td></tr>");
													totalServiceTime = ((totalServiceTime * 60) + 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox + 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												} else if (!this.checked) {
													$("#windowsRow").remove();
													totalServiceTime = ((totalServiceTime * 60) - 30) / 60;
													$("#total_service_time")
															.html(
																	totalServiceTime
																			+ " Hrs");
													totalCharge
															.html(totalServiceTime
																	* 18
																	+ ",00 $");
													effectivePrice
															.html((totalServiceTime * 18)
																	- ((totalServiceTime * 18) * 0.2)
																	+ " $");
													checkedBox = checkedBox - 0.5;
													$("#extra_hours").val(
															checkedBox);
													$("#sub_total")
															.val(
																	totalServiceTime * 18);
													$("#total_cost")
															.val(
																	(totalServiceTime * 18)
																			- ((totalServiceTime * 18) * 0.2));
												}
											});
						});

		$(document).ready(function() {
			$(document).click(function(event) {
				var clickover = $(event.target);
				var _opened = $(".navbar-collapse").hasClass("show");
				if (_opened === true && !clickover.hasClass("navbar-toggler")) {
					$(".navbar-toggler").click();
				}
			});
		});
	</script>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
</body>
</html>