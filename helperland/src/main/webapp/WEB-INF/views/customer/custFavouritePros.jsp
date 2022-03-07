<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:set var="fav" value="${fav }" />
	<c:set var="users" value="${users }" />
	<c:set var="avgSpRating" value="${avgSpRating }" />
	<c:set var="spTotalCleaning" value="${spTotalCleaning }" />
	<link href='<c:url value="/resources/css/navbar-2.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/custDash.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/pagination.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
</head>
<body>
    <div style="min-height: 100vh; padding-bottom: 170px;">
        
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
                                    <a class="nav-link" href="dash">Dashboard</a>
                                </div>
                                <div class="nav-item nav_select1" id="serviceHistory1">
                                    <a class="nav-link" id="serviceHistory1" href="service-history">Service History</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="serviceSchedule1" href="service-schedule">Service Schedule</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="favouritePros1" href="fav-pros">Favourite Pros</a>
                                </div>
                                <div class="nav-item nav_select1" id="notification1">
                                    <a class="nav-link" href="notification">Notification</a>
                                </div>
                                <div class="nav-item nav_select1" id="mySettings">
                                    <a class="nav-link" href="mysettings">My Settings</a>
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
                            <li><a class="dropdown-item px-0" type="button" href="dash">My Dashboard</a></li>
                            <li><a class="dropdown-item px-0" type="button" href="mysettings" >My Settings</a></li>
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



        <div class="position-relative custDash_header d-flex align-items-center justify-content-center">
            <p class="m-0">Welcome, <span class="text-bold">${user.first_name }!</span></p>
        </div>


        <div class="custDash_main d-flex justify-content-between h-100 m-3">

            <!-- --------------- Sidebar -------------- -->
            <div class="dash_sidebar position-relative d-none d-lg-block d-xl-block">
                <ul class="sidebar_inner mb-0">
                    <li>
                        <a class="text-light" id="dashBoard" href="dash">Dashboard</a>
                    </li>
                    <li>
                        <a id="serviceHistory" class="text-light" href="service-history">Service History</a>
                    </li>
                    <li>
                        <a id="serviceSchedule" class="text-light" href="service-schedule">Service Schedule</a>
                    </li>
                    <li style="background-color: #146371;">
                        <a id="favouritePros" class="text-light" href="fav-pros" >Favourite Pros</a>
                    </li>
                    <li>
                        <a id="notification" class="text-light" href="notification">Notification</a>
                    </li>
                </ul>
            </div>

            <!-- ------------------- Tables ------------------- -->
            <div class="dash_content">
                <!-- --------- Favourite Pros ----------  -->
                <div id="favouriteProsTable">
                    <div class="favouriteProsList">
                        
                        
                        <%-- <c:forEach var="fav" items="${fav }">
                        	
                        	<div class="favouriteProsListItem col-sm-4 w-100 d-flex align-items-center justify-content-center flex-column">
	                        	<c:forEach var="u" items="${users }">  
	                        		<c:if test="${u.user_id == fav.target_user_id }">  
			                            <div class="custProfile mb-3 rounded-circle d-flex align-items-center justify-content-center">
			                                <img src="<c:url value = "/resources/assets/custDash/${u.user_profile_picture }.png" />" >
			                            </div>
		                            
	                            		<p class="mb-3"> ${u.first_name } ${u.last_name }</p>
	                            	</c:if>
								</c:forEach>
	                            <div class="d-flex align-items-center">
	                                <c:forEach items="${avgSpRating}" var="spRating">		        
								        <c:if test="${spRating.key == fav.target_user_id }">
								        	<c:if test="${spRating.value == 0}">
								        		<span class="icon" id="icon1" style="color: #e1e1e1">★</span>
								        		<span class="icon" id="icon2" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon3" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon4" style="color: #e1e1e1">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 1}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon3" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon4" style="color: #e1e1e1">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 2}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon3" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon4" style="color: #e1e1e1">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 3}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon3" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon4" style="color: #e1e1e1">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 4}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon3" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon4" style="color: #ECB91C">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 5}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon3" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon4" style="color: #ECB91C">★</span>
                                   				<span class="icon" id="icon5" style="color: #ECB91C">★</span>	
								        	</c:if>	
                                              	<p class="mb-0">${spRating.value }</p>
								        </c:if>
								    </c:forEach>  
	                            </div>
	                            <c:forEach var="total" items="${spTotalCleaning }">
	                            	<c:if test="${total.key == fav.target_user_id}">
	                            		<p>${total.value } Cleanings</p>	
	                            	</c:if>
	                            </c:forEach>
	                            <div>
		                            <c:forEach var="u" items="${users }">  
		                            	<c:if test="${u.user_id == fav.target_user_id and fav.is_favourite == 1}">
		                            		<div class="btn remove_button text-white rounded-pill" data-favId="${fav.id }" onclick="removeFunction($(this).attr('data-favId'))">Remove</div>
		                            	</c:if>
		                            	<c:if test="${u.user_id == fav.target_user_id and fav.is_favourite == 0}">
		                            		<div class="btn remove_button text-white rounded-pill" data-favId="${fav.id }" onclick="favouriteFunction($(this).attr('data-favId'))">Favourite</div>
		                            	</c:if>
			                            <c:if test="${u.user_id == fav.target_user_id and fav.is_blocked == 0}">
			                                <div class="btn block_button text-white rounded-pill" data-favId="${fav.id }" onclick="blockFunction($(this).attr('data-favId'))">Block</div>
										</c:if>
										<c:if test="${u.user_id == fav.target_user_id and fav.is_blocked == 1}">
			                                <div class="btn block_button text-white rounded-pill" data-favId="${fav.id }" onclick="unblockFunction($(this).attr('data-favId'))">Unblock</div>
										</c:if>
										
		                            </c:forEach>
		                        </div>
	                        </div>
                        	
                        </c:forEach> --%>
                        
                        <c:forEach var="u" items="${users.pageList }">
                        
                        	
                        	
                        	<div class="favouriteProsListItem col-sm-4 w-100 d-flex align-items-center justify-content-center flex-column">
	                        	<%-- <c:forEach var="fav" items="${fav }">  
	                        		<c:if test="${u.user_id == fav.target_user_id }">   --%>
			                            <div class="custProfile mb-3 rounded-circle d-flex align-items-center justify-content-center">
			                                <img src="<c:url value = "/resources/assets/custDash/${u.user_profile_picture }.png" />" >
			                            </div>
		                            
	                            		<p class="mb-3"> ${u.first_name } ${u.last_name }</p>
	                            	<%-- </c:if>
								</c:forEach> --%>
	                            <div class="d-flex align-items-center">
	                                <c:forEach items="${avgSpRating}" var="spRating">		        
								        <c:if test="${spRating.key == u.user_id }"> 
								        	<c:if test="${spRating.value == 0}">
								        		<span class="icon" id="icon1" style="color: #e1e1e1">★</span>
								        		<span class="icon" id="icon2" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon3" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon4" style="color: #e1e1e1">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 1}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon3" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon4" style="color: #e1e1e1">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 2}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon3" style="color: #e1e1e1">★</span>
		                                    	<span class="icon" id="icon4" style="color: #e1e1e1">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 3}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon3" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon4" style="color: #e1e1e1">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 4}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon3" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon4" style="color: #ECB91C">★</span>
                                   				<span class="icon" id="icon5" style="color: #e1e1e1">★</span>	
								        	</c:if>	
								        	<c:if test="${spRating.value == 5}">
								        		<span class="icon" id="icon1" style="color: #ECB91C">★</span>
								        		<span class="icon" id="icon2" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon3" style="color: #ECB91C">★</span>
		                                    	<span class="icon" id="icon4" style="color: #ECB91C">★</span>
                                   				<span class="icon" id="icon5" style="color: #ECB91C">★</span>	
								        	</c:if>	
                                            <p class="mb-0">${spRating.value }</p>
								        </c:if> 
								    </c:forEach>  
	                            </div>
	                            <c:forEach var="total" items="${spTotalCleaning }">
	                            	<c:if test="${total.key == u.user_id}"> 
	                            		<p>${total.value } Cleanings</p>	
	                            	</c:if>
	                            </c:forEach>
	                            <div>
		                           	<%-- <c:forEach var="fav" items="${fav }">  
		                            	<c:if test="${u.user_id == fav.target_user_id and fav.is_favourite == 1}">
		                            		<div class="btn remove_button text-white rounded-pill" data-favId="${fav.id }" onclick="removeFunction($(this).attr('data-favId'))">Remove</div>
		                            	</c:if>
		                            	<c:if test="${u.user_id == fav.target_user_id and fav.is_favourite == 0}">
		                            		 <div class="btn remove_button text-white rounded-pill" data-favId="${fav.id }" onclick="favouriteFunction($(this).attr('data-favId'))">Favourite</div>
		                            	</c:if>
			                            <c:if test="${u.user_id == fav.target_user_id and fav.is_blocked == 0}">
			                                <div class="btn block_button text-white rounded-pill" data-favId="${fav.id }" onclick="blockFunction($(this).attr('data-favId'))">Block</div>
										</c:if>
										<c:if test="${u.user_id == fav.target_user_id and fav.is_blocked == 1}">
			                                <div class="btn block_button text-white rounded-pill" data-favId="${fav.id }" onclick="unblockFunction($(this).attr('data-favId'))">Unblock</div>
										</c:if> --%>
										
										<c:if test = "${fn:contains(blockedId , u.user_id)}">
											<c:forEach var="fav" items="${fav }"> 
												<c:if test="${u.user_id == fav.target_user_id }"> 
											
													<c:if test="${fav.is_favourite == 1 }">
														<div class="btn remove_button text-white rounded-pill" data-uId = "${u.user_id }" onclick="removeFunction($(this).attr('data-uId'))">Remove</div>
													</c:if>
													<c:if test="${fav.is_favourite == 0 }">
														<div class="btn remove_button text-white rounded-pill" data-uId = "${u.user_id }" onclick="favouriteFunction($(this).attr('data-uId'))">Favourite</div>
													</c:if>
													<c:if test="${fav.is_blocked == 0 }">
														<div class="btn block_button text-white rounded-pill" data-uId = "${u.user_id }" onclick="blockFunction($(this).attr('data-uId'))">Block</div>
													</c:if>
													<c:if test="${fav.is_blocked == 1 }">
														<div class="btn block_button text-white rounded-pill" data-uId = "${u.user_id }" onclick="unblockFunction($(this).attr('data-uId'))">Unblock</div>
													</c:if>
												</c:if>
											</c:forEach>
										</c:if>
										<%-- <c:if test="${u.user_id != fav.target_user_id }"> --%>
										
										<c:if test = "${!fn:contains(blockedId, u.user_id)}">
											<div class="btn remove_button text-white rounded-pill" data-uId = "${u.user_id }" onclick="favouriteFunction($(this).attr('data-uId'))">Favourite</div>
											<div class="btn block_button text-white rounded-pill" data-uId = "${u.user_id }" onclick="blockFunction($(this).attr('data-uId'))">Block</div>
										</c:if>
		                            <%-- </c:forEach> --%> 
		                        </div>
	                        </div>            	
                        </c:forEach>      
                    </div>
                    <div class="pagination p12 d-flex align-items-center justify-content-between">
                    	
                    	<div class="d-flex pg-768">
                    		<div class="d-flex">
	                    		<p class="mb-0">Show &nbsp</p>
		                    	<select id="count_select" name="count">
		                    		<option value="10" selected>10</option>
		                    		<option value="50">50</option>
		                    		<option value="100">100</option>
		                    	</select>
	                    	</div>
	                    	<p class="mb-0"> &nbsp Entries total record: ${users.nrOfElements }</p>
                    	</div>		
                    
                    	 <% 
				        	String c = request.getParameter("count");
                    	 	if(c == null){
                    	 		c = "10";
                    	 	}
							pageContext.setAttribute("c", c);					        
					     %>
                    	
				        <ul>
					        <li class="rounded-circle"><a id="firstPrev" href="/helperland/customer/fav-pros?page=1&count=${c}" class="rounded-circle"> « </a></li>
					        
					        <li class="rounded-circle">
					        	<a id="prevIcon" href="/helperland/customer/fav-pros?page=<c:if test="${users.page == 1 or users.page == 0 }">1</c:if><c:if test="${users.page > 1 }">${users.page }</c:if>&count=${c}" class="rounded-circle" <c:if test = "${users.page ==  0}">style = "pointer-events: none"</c:if>>  ‹ </a>
					        </li>
					        
					       
					        
					        <li class="rounded-circle">
						        <c:forEach begin="1" end="${users.pageCount}" step="1"  varStatus="tagStatus">
									  <c:choose>
										    <c:when test="${(users.page + 1) == tagStatus.index}">
										      	<span class="is-active rounded-circle">${tagStatus.index}</span>
										    </c:when>
										    <c:otherwise>                
										     	<a class="pageNoTag rounded-circle" href="/helperland/customer/fav-pros?page=${tagStatus.index}&count=${c}" id="${tagStatus.index }">${tagStatus.index}</a>
										    </c:otherwise>
									  </c:choose>
								</c:forEach>
							</li>
					        <li class="rounded-circle"><a id="nextIcon" href="/helperland/customer/fav-pros?page=${users.page + 2 }&count=${c}" class="rounded-circle" <c:if test = "${users.page + 1 ==  users.pageCount}">style = "pointer-events: none"</c:if>> › </a></li>
					        <li class="rounded-circle"><a id="lastNext" href="/helperland/customer/fav-pros?page=${users.pageCount }&count=${c}" class="rounded-circle"> » </a></li>
				        	
				        </ul>
				    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div id="footer" class="position-relative w-100 bottom-0">
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
    </div>

    <!-- <script src="./custDash.js"></script> -->
    <!-- <script>
        $(function () {
            $("#footer").load("../footer.html");
        });
    </script> -->
    
    <script>
    
		$(document).ready(function() {
			
			let searchParams = new URLSearchParams(window.location.search);
			let param = searchParams.get('count');
			$("#count_select option[value = '" + param + "']").attr("selected" , true);
			
			console.log($("#count_select").val());
			console.log($(".pageNoTag").attr("id"));
			$("#prevIcon").attr("href" , '/helperland/customer/fav-pros?page='+<c:if test="${users.page ==0 }">1</c:if><c:if test="${users.page >1 }">${users.page }</c:if>+'&count='+$("#count_select").val()); 
			$("#nextIcon").attr("href" , '/helperland/customer/fav-pros?page=${users.page + 2 }&count=' + $("#count_select").val());
			$("#lastNext").attr("href" , '/helperland/customer/fav-pros?page=${users.pageCount}&count=' + $("#count_select").val());
			$("#firstPrev").attr("href" , '/helperland/customer/fav-pros?page=1&count=' + $("#count_select").val());    		
			
		})
		
		$("#count_select").on("change" , function(){
       		$("#firstPrev").attr("href" , '/helperland/customer/fav-pros?page=1&count=' + $("#count_select").val());
       	
    		document.getElementById("firstPrev").click();
    	})
    
    </script>
    
    <script>
    
    	function removeFunction(uid){
    		
    		$.ajax({
				url : 'favblock-remove',
				type : 'POST',
				data : uid,
				contentType : "application/json",
				success : function(data) {
					location.reload();
				},
				error : function(xhr, textStatus, xml) {
					console.log("error");
					console.log(xhr);
					console.log(textStatus);
					console.log(xml);
				}
			})
    		
    	}
    	
		function favouriteFunction(uid){
			
    		$.ajax({
				url : 'favblock-favourite',
				type : 'POST',
				data : uid,
				contentType : "application/json",
				success : function(data) {
					location.reload();
				},
				error : function(xhr, textStatus, xml) {
					console.log("error");
					console.log(xhr);
					console.log(textStatus);
					console.log(xml);
				}
			})
    		
    	}
    	
		function blockFunction(uid){
			
			$.ajax({
				url : 'favblock-block',
				type : 'POST',
				data : uid,
				contentType : "application/json",
				success : function(data) {
					location.reload();
				},
				error : function(xhr, textStatus, xml) {
					console.log("error");
					console.log(xhr);
					console.log(textStatus);
					console.log(xml);
				}
			})
			
		}
		
		function unblockFunction(uid){
			
			$.ajax({
				url : 'favblock-unblock',
				type : 'POST',
				data : uid,
				contentType : "application/json",
				success : function(data) {
					location.reload();
				},
				error : function(xhr, textStatus, xml) {
					console.log("error");
					console.log(xhr);
					console.log(textStatus);
					console.log(xml);
				}
			})
			
		}
    
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


</body>
</html>