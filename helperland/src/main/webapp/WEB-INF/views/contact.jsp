<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored = "false" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:set var="user_type_id" value="${user.user_type_id }" />
	<c:if test="${user_type_id == 1 }">
		<link href="<c:url value="/resources/css/navbar-2.css" />" rel="stylesheet" />
	</c:if>
	<c:if test="${user_type_id == 2 }">
		<link href="<c:url value="/resources/css/navbar-2.css" />" rel="stylesheet" />
	</c:if>
	<c:if test="${user_type_id == null }">
		<link href="<c:url value="/resources/css/navbar.css" />" rel="stylesheet" />
	</c:if>
	<link href='<c:url value="/resources/css/contact.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
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
                                    <a class="nav-link" id="/helperland/serviceHistory1" href="customer/service-history">Service History</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="/helperland/serviceSchedule1" href="customer/service-schedule">Service Schedule</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="/helperland/favouritePros1" href="customer/fav-pros">Favourite Pros</a>
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
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#fff" class="bi bi-list" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
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
                                    <a class="nav-link" id="notification1" href="/helperland/service-provider/notification">Notification</a>
                                </div>
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
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#fff" class="bi bi-list" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                            </svg>
                        </button>
                    </div>   
                </div>
            </div>
        </nav>
	
	</c:if>
	
	<c:if test="${user_type_id == null}">
	    <nav class="navbar navbar-expand-xl sticky-top" id="navbar">
	        <div class="container-fluid navbar_main">
	            <a class="navbar-brand py-0" href="home">
	                <img src= ' <c:url value = "/resources/assets/nav-footer-assets/logo.png" />' alt="" height="54px" width="73px">
	            </a>
	            <button class="navbar-toggler text-white" type="button" data-bs-toggle="offcanvas" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	                <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#fff" class="bi bi-list" viewBox="0 0 16 16">
	                    <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
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
	</c:if>
    <div class="container-fluid p-0">
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
                <form method="post" action="contact" class="d-flex flex-column">
                    <div class="alert alert-danger alert-dismissible fade show d-none " ${displayError } role="alert">
					  ${error }
					  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
					<div class="alert alert-success alert-dismissible fade show d-none " ${displaySuccess } role="alert">
					  ${success }
					  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
					</div>
                    <div class="row justify-content-center">
                        <div class="col">
                            <input type="text" required name="firstname" path="firstname" placeholder="First name" class="form_in w-100 h-100">
                        </div>
                        <div class="col">
                            <input type="text" name="lastname" placeholder="Last name" class="form_in w-100 h-100">
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col d-flex">
                            <input type="text" name="areacode" value="+49" class="form_areacode form_in" disabled>
                            <input type="text" required name="phone_number" placeholder="Mobile number" class=" form_in w-100 h-100">
                        </div>
                        <div class="col">
                            <input type="email" required name="email" placeholder="Email address" class="form_in w-100 h-100">
                        </div>
                    </div>
                    <div class="form_select">
                        <select class="w-100 p-0 form_in" required aria-label="Default select" name="subject_type">
                            <option value="general" class="w-100">General</option>
                            <option value="inquiry" class="w-100">Inquiry</option>
                            <option value="renewal" class="w-100">renewal</option>
                            <option value="revocation" class="w-100">revocation</option>
                        </select>
                    </div>
                    <div class="textarea">
                        <textarea name="message"  class="w-100 h-100 p-0 form_in" placeholder="Message" ></textarea>
                    </div>
                    
                    <div class="form_btn w-100 mt-3 d-flex align-items-center justify-content-center">
                        <button type="submit" class="btn submit_btn rounded-pill text-white">
                            Submit
                        </button>
                    </div>
                    <input type="hidden" name="created_on" id="created_on">
                    <input type="hidden" name="is_deleted" value="0">
                </form>
            </div>
        </div>
    </div>
    <div class="container_map">
        <iframe width="100%" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3671.6979157244114!2d72.49824711445191!3d23.034861321650208!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e8352e403437b%3A0xdc9d4dae36889fb9!2sTatvaSoft!5e0!3m2!1sen!2sin!4v1640187081460!5m2!1sen!2sin">
        </iframe>
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
                                <input type="email" required placeholder="Email Address" name="email" class="modalInputEmail inputHeightBorder">
                                <img
									src=" <c:url value = "/resources/assets/homepage/first/user.png" />" alt="" height="21"
									width="20">
                            </div>
                            
                            <div class="form-group position-relative my-3">
                                <input type="password" required placeholder="Password" name="password" class="modalInputEmail inputHeightBorder">
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
                                <input type="email" required placeholder="Email Address" name="email" class="modalInputEmail inputHeightBorder">
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

	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"> </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
	<script>
	
		$(".back_to_top").on("click" , function(){
			$(window).scrollTop(0);	
		})
		
		$(window).on("scroll" , function(){
			if($(window).scrollTop() > 60){
				$(".back_to_top").show();
			}
			else{
				$(".back_to_top").hide();	
			}
		})
	
	</script>
    
    <script>
        
        $('select').change(function() {
            console.log("hello");
            if ($(this).children('option:first-child').is(':selected')) {
                $("select").css("color" , "#a0a0a0");
            } else {
                $("select").css("color" , "black");
            }
        });
        
        var dt = new Date();
        var t = moment(new Date()).format("YYYY/MM/DD HH:mm:ss");
		$('#created_on').val(t);
		
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