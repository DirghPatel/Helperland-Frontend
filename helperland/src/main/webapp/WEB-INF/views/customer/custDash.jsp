<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:set var="sr" value="${service_requests }" />
	<c:set var="u" value="${users }" />
	<c:set var="spRating" value="${spRating }" />
	<link href='<c:url value="/resources/css/navbar-2.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/custDash.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/pagination.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

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
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#fff" class="bi bi-list" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
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
                    <li style="background-color: #146371;">
                        <a class="text-light" id="dashBoard" href="dash" >Dashboard</a>
                    </li>
                    <li>
                        <a id="serviceHistory" class="text-light" href="service-history">Service History</a>
                    </li>
                    <li>
                        <a id="serviceSchedule" class="text-light" href="service-schedule">Service Schedule</a>
                    </li>
                    <li>
                        <a id="favouritePros" class="text-light" href="fav-pros">Favourite Pros</a>
                    </li>
                    <li>
                        <a id="notification" class="text-light" href="notification">Notification</a>
                    </li>
                </ul>
            </div>
            <!-- ------------------- Tables ------------------- -->
            <div class="dash_content">
                <!-- ------- Dashboard -------- -->
                <div id="dashBoardTable">
                    <div class="tableHead d-flex justify-content-between align-items-center mb-2">
                        <h3>Current Service Requests</h3>
                        <a href="/helperland/service-booking" class="export_button rounded-pill text-decoration-none text-white">Add New Service Request</a>
                    </div>
                    <table class="table table_1 p-3">
                        <thead>
                            <tr>
                                <th scope="col" width="100">
                                    Service Id
                                </th>
                                <th scope="col" width="155">
                                    Service Date 
                                </th>
                                <th scope="col">
                                    Service Provider
                                </th>
                                <th scope="col" width="95" class="text-center">
                                    Payment
                                </th>
                                <th scope="col" class="text-center" width="220">
                                    Actions
                                </th>
                            </tr>
                        </thead>
                        <tbody>	
                            <c:forEach var="sr" items="${service_requests.pageList }" varStatus = "i">
                            	
                            	<tr>
	                                <td scope="row">${sr.service_req_id }</td>
	                                <td class="service_date cursorPointer" href="#serviceDetails" data-bs-toggle="modal" id="${sr.service_req_id }" onclick="myFunction($(this).attr('id'))">
	                                    <a class="d-flex text-decoration-none align-items-center">
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16">
	                                            <path fill-rule="evenodd" fill="#646464" d="M.365 16.9V1.715H3.32V.9h1.478v.815h2.463V.9h1.477v.815h2.463V.9h1.477v.815h2.955V16.9H.365zM14.156 5.165H1.843v9.365h12.313V5.165zM5.783 9.108H4.305V7.63h1.478v1.478zm0 3.542H4.305v-2.063h1.478v2.063zm2.955-3.542H7.261V7.63h1.477v1.478zm0 3.542H7.261v-2.063h1.477v2.063zm2.955-3.542h-1.477V7.63h1.477v1.478zm0 3.542h-1.477v-2.063h1.477v2.063z"/>
	                                        </svg>
	                                        <p class="mb-0 ms-1">
	                                        	<fmt:formatDate type = "date" value = "${sr.service_start_date}" pattern="dd/MM/yyyy"/>
	                                        </p>
	                                    </a>
	                                    <a class="d-flex text-decoration-none">
	                                        <p class="m-0">
	                                        	<fmt:formatDate type = "time" value = "${sr.service_start_date}" pattern="hh:mm"/>-<span id="endTime${i.index }"></span>
	                                        </p>
	                                    </a>
	                                </td>
	                                <c:if test="${sr.user_id != sr.service_provider_id }">
		                                <td>
		                                    <div class="d-flex">
		                                        <div class="sp_icon me-2 rounded-circle d-flex align-items-center justify-content-center">
		                                            <c:forEach var="u" items="${users }">
		                                        		<c:if test="${u.user_id == sr.service_provider_id}"> 
															<img src="<c:url value = "/resources/assets/custDash/${u.user_profile_picture }.png" />" alt="" height="48" width="48">
		                                        		</c:if>
		                                        	</c:forEach>
		                                            
		                                        </div>
		                                        
		                                        <div class="d-flex flex-column">
		                                            <p class="mb-0">
		                                            	<c:forEach var="u" items="${users }">
		                                        			<c:if test="${u.user_id == sr.service_provider_id}"> ${u.first_name } ${u.last_name }</c:if>
		                                        		</c:forEach>
		                                            </p>
		                                            <div class="d-flex align-items-center">
		                   								<c:forEach items="${spRating}" var="spRating">
													        <c:if test="${spRating.key == sr.service_provider_id }">
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
		                                        </div>
		                                    </div>
		                                </td>
	                                </c:if>
	                                <c:if test="${sr.user_id == sr.service_provider_id }">
	                                	<td></td>
	                                </c:if>
	                                <td>
	                                    <p class="m-0 text-center  table_payment fw-bold">$ ${sr.total_cost }</p>
	                                </td>
	                                <td class="button_main text-center">
	                                    <a href="#scheduleServiceRequest" data-bs-toggle="modal" role="button" class="reschedule_button rounded-pill text-light text-decoration-none" data-spID ="${sr.service_req_id }" onclick="$('#rescheduleServiceReqId').val($(this).attr('data-spID'))">Reschedule</a>
	                                    <a href="#cancelServiceRequest" data-bs-toggle="modal" role="button" class="cancel_button rounded-pill text-light text-decoration-none" data-spID ="${sr.service_req_id }" onclick="$('#cancelServiceReqId').val($(this).attr('data-spID'))">Cancel</a>
	                                </td>
	                            </tr>
                            
                            </c:forEach> 
                        </tbody>
                    </table>
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
	                    	<p class="mb-0"> &nbsp Entries total record: ${service_requests.nrOfElements }</p>
                    	</div>		
                    	<% 
				        	String c = request.getParameter("count");
                    	 	if(c == null){
                    	 		c = "10";
                    	 	}
							pageContext.setAttribute("c", c);					        
					    %>
                    
				        <ul>
					        <li class="rounded-circle"><a id="firstPrev" href="/helperland/customer/dash?page=1&count=${c}" class="rounded-circle"> « </a></li>
					        <li class="rounded-circle">
					        	<a id="prevIcon" href="/helperland/customer/dash?page=<c:if test="${service_requests.page == 1 or service_requests.page == 0 }">1</c:if><c:if test="${service_requests.page > 1 }">${service_requests.page }</c:if>&count=${c}" class="rounded-circle" <c:if test = "${service_requests.page ==  0}">style = "pointer-events: none"</c:if>>  ‹ </a>
					        </li>
					        <li class="rounded-circle">
						        <c:forEach begin="1" end="${service_requests.pageCount}" step="1"  varStatus="tagStatus">
									  <c:choose>
										    <c:when test="${(service_requests.page + 1) == tagStatus.index}">
										      	<span class="is-active rounded-circle">${tagStatus.index}</span>
										    </c:when>
										    <c:otherwise>                
										     	<a class="pageNoTag rounded-circle" href="/helperland/customer/dash?page=${tagStatus.index}&count=${c}">${tagStatus.index}</a>
										    </c:otherwise>
									  </c:choose>
								</c:forEach>
							</li>
					        <li class="rounded-circle"><a id="nextIcon" href="/helperland/customer/dash?page=${service_requests.page + 2 }&count=${c}" class="rounded-circle" <c:if test = "${service_requests.page + 1 ==  service_requests.pageCount}">style = "pointer-events: none"</c:if>> › </a></li>
					        <li class="rounded-circle"><a id="lastNext" href="/helperland/customer/dash?page=${service_requests.pageCount }&count=${c}" class="rounded-circle"> » </a></li>
				        </ul>
				    </div>
                </div>
            </div>
        </div>
        <div class="serviceDetailsPopUp">
            <div class="modal fade" id="serviceDetails" aria-hidden="true" aria-labelledby="serviceDetailsLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered vertical-align-center">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="serviceDetailsLabel">Service Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body d-flex serviceDetailsModal p-2">
                            <div class="serviceModalLeft">
                                <h4 id="sdDate"></h4>
                                <p><b>Duration:</b>&nbsp<span id="sdDuration"></span></p>
                                <hr>
                                <p><b>Service Id:</b>&nbsp<span id="sdId"></span></p>
                                <p><b>Extras:</b><span id="sdExtra"></span></p>
                                <p><b>Net Amount:</b> <span class="table_payment fw-bolder" id="sdAmount"></span> </p>
                                
                                <hr>
                                
                                <p><b>Service Address:</b><span id="sdAddress"></span></p>
                                <p><b>Billing Address:</b>&nbspSame as cleaning Address</p>
                                <p><b>Phone:</b> +91 <span id="sdPhone"></span></p>
                                <p><b>Email:</b><span id="sdEmail"></span></p>
                                
                                <hr>
                                
                                <p><b>Comments</b></p>
                                <div>
                                    <p id="sdComments"></p>
                                </div>
                                <p id="sdPets"></p>
                                
                                <hr>
                                
                            </div>
                            <div class="serviceModalRight">
                                <h4>Service Provider Details</h4>
                                <div class="sp_block justify-content-between align-items-center" id="spDetailsRight">
                                    <div style="height: 64px; width: 64px;" class="sp_icon p-0 d-flex align-items-center justify-content-center rounded-circle">
                                        <img id="serviceModalIcon" height="64" width="64">
                                    </div>
                                    <div>
                                        <p class="sp_name mb-0" id="sdServiceProvider"></p>
                                        <div id="ratingModelAvgStars">
	                                    	<span class="icon" id="icon1d">★</span>
	                                    	<span class="icon" id="icon2d">★</span>
	                                    	<span class="icon" id="icon3d">★</span>
	                                    	<span class="icon" id="icon4d">★</span>
	                                    	<span class="icon" id="icon5d">★</span>
	                                    </div>
                                    </div>
                                </div>
                                <p class="mb-0" id="sdTotalCleanings"></p>
                            </div>
                        </div>
                        <div class="modal-footer justify-content-start">
                            <button class="btn text-white rounded-pill reschedule_button" data-bs-target="#scheduleServiceRequest" data-bs-toggle="modal" data-bs-dismiss="modal" id="rescheduleBtnModel" onclick="$('#rescheduleServiceReqId').val($(this).attr('data-spID'))">Reschedule</button>
                            <button class="btn text-white cancel_button rounded-pill" data-bs-target="#cancelServiceRequest" data-bs-toggle="modal" data-bs-dismiss="modal" id="cancelBtnModel" onclick="$('#cancelServiceReqId').val($(this).attr('data-spID'))">Cancel</button>
                        </div>
                    </div>
                </div>
            </div> 

            <div class="modal fade" id="scheduleServiceRequest" aria-hidden="true" aria-labelledby="serviceDetailsLabel2" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered modal-md">
                    <div class="modal-content" style="max-width : 500px">
                        <div class="modal-header">
                            <h4 class="modal-title me-3" id="serviceDetailsLabel2">Reschedule Service Request</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body ">
                            <p class="m-1">Select New Date & Time</p>
                            <form method="post" action="/helperland/customer/service-reschedule" id="rescheduleReqForm">
                                <div class="d-flex">
                                	<input type="hidden" name="service_req_id" id="rescheduleServiceReqId"/>
                                    <input type="date" class="datePicker" name="servicedate" id="servicedate" >
                                    <select class="timeSelect" name="servicetime" id="servicetime">
                                        <option value="08:00:00">8:00</option>
                                        <option value="08:30:00">8:30</option>
                                        <option value="09:00:00">9:00</option>
                                        <option value="09:30:00">9:30</option>
                                        <option value="10:00:00">10:00</option>
                                        <option value="10:30:00">10:30</option>
                                    </select>
                                    <input type="hidden" id="service_start_date" name="service_start_date">
                                </div>
                                <div class="p-1 w-100">
                                	<small class="text-danger" id="conflictError"></small>
                                </div>
                                <button class="mt-3 updateServiceButtton text-light rounded-pill border-0" onclick="$('#rescheduleReqForm').submit()">Update </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="cancelServiceRequest" aria-hidden="true" aria-labelledby="cancelServiceRequestLabel2" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title me-3" id="cancelServiceRequestLabel2">Cancel Service Request</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body ">
                            <p class="mb-1">Why you want to cancel the service request?</p>
                            <form action="/helperland/customer/service-cancel" class="d-flex flex-column" id="cancelReqForm" method="post">
                            	<input type="hidden" name="service_req_id" id="cancelServiceReqId"/>
                                <textarea type="text" class="whyToCancel mb-2 p-2" name="cancel_comment" maxlength="500" rows="3"></textarea>
                                <button class="cancelServiceButton text-light rounded-pill border-0" onclick="$('#cancelReqForm').submit()">Cancel Now</button>
                            </form>
                        </div>
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
	    });
    </script>
 
 
 	<script>
    
    	$(document).ready(function() {
    		
    		<c:forEach var="sr" items="${service_requests.pageList }" varStatus="i">
    			
	    		var d = new Date("${sr.service_start_date}");
				var t1 = d.getHours()+"."+d.getMinutes();
				var a = parseFloat("${sr.service_hours}") ;  
				var b = parseFloat("${sr.extra_hours}");
				var totalTime = a+b ; 
				var dt1 = ((d.getHours() * 60) + d.getMinutes()) / 60;
				var dt2 = (dt1 + totalTime) * 60;
				var h1 = Math.floor(dt2 / 60);
				var m1 = dt2 % 60;
				if(m1==0){
					var time2 = h1 + ":00	";	
					$("#endTime${i.index}").html(time2);
				}
				else{
					var time2 = h1 + ":" + m1;
					$("#endTime${i.index}").html(time2);
				}
    			
    		</c:forEach>

   			let searchParams = new URLSearchParams(window.location.search);
   			let param = searchParams.get('count');
			$("#count_select option[value = '" + param + "']").attr("selected" , true);
    	})
    
    	$("#count_select").on("change" , function(){
    		$("#firstPrev").attr("href" , '/helperland/customer/dash?page=1&count=' + $("#count_select").val());
    		document.getElementById("firstPrev").click(); 	
    	})
    	
    </script>
    
    <script>
    	function myFunction(id){
    		console.log(id);
    		$.ajax({
				url : "/helperland/customer/service-details-data",
				type : "POST",
				data : id,
				contentType : "application/json",
				success : function(data) {
						var d = new Date(data[0].service_start_date);
						var date1 = d.getDate() + "/" + (d.getMonth() + 1 ) + "/" + d.getFullYear();
						if(d.getMinutes() == 0){
							var time1 = d.getHours() + ":00" ;
						}
						else{
							var time1 = d.getHours() + ":" + d.getMinutes();	
						}
						var t1 = d.getHours()+"."+d.getMinutes();
						var totalTime = data[0].service_hours + data[0].extra_hours;
						
						var dt1 = ((d.getHours() * 60) + d.getMinutes()) / 60;
						var dt2 = (dt1 + totalTime) * 60;
						
						var h1 = Math.floor(dt2 / 60);
						var m1 = dt2 % 60;
						
						if(m1==0){
							var time2 = h1 + ":00	";		
						}
						else{
							var time2 = h1 + ":" + m1;
						}
						$("#sdDate").html(date1 +" "+ time1 + "-" + time2); 
						$("#sdDuration").html(data[0].service_hours + data[0].extra_hours + " hours");
						$("#sdId").html(data[0].service_req_id);
						$("#sdAmount").html(data[0].total_cost + ",00 $");
						$("#sdComments").html(data[0].comments);
						
						if(data[0].has_pets == 0){
							$("#sdPets").html( "<img src='<c:url value = '/resources/assets/custDash/no-pets.png' />' height=25px width=25px> I don't have pets at home.");
						}
						else{
							$("#sdPets").html("<img src='<c:url value = '/resources/assets/custDash/have-pets.png' />' height=25px width=25px> I have pets at home.");	
						}
						
						var extraServices = " ";
						
						if(data[2].cabinet == 1){
							extraServices = extraServices + " Inside Cabinets, ";
						}
						if(data[2].windows == 1){
							extraServices = extraServices + " Interior Windows, ";
						}
						if(data[2].laundry == 1){
							extraServices = extraServices + " Inside Wash, ";
						}
						if(data[2].refrigerator == 1){
							extraServices = extraServices + " Inside Fridge, ";
						}
						if(data[2].oven == 1){
							extraServices = extraServices + " Inside Oven, ";
						}
						$("#sdExtra").html(extraServices);
						
						if(data[1].state != null){
							$("#sdAddress").html(" "+data[1].address_line1 + " " + data[1].address_line2 + ", "+data[1].postal_code +" "+data[1].city+" "+data[1].state);
						}
						if(data[1].state == null){
							$("#sdAddress").html(" "+data[1].address_line1 + " " + data[1].address_line2 + ", "+data[1].postal_code +" "+data[1].city);
						}
						if(data[1].mobile != null){
							$("#sdPhone").html(" "+data[1].mobile);
						}
						if(data[1].email != null){
							$("#sdEmail").html(" "+data[1].email);
						}
						
						if(data[0].user_id == data[0].service_provider_id){
							$("#spDetailsRight").hide();
							$("#sdTotalCleanings").hide();
						}
						else{
							$("#sdTotalCleanings").show();
							$("#spDetailsRight").show();
							$("#sdServiceProvider").html(data[3].first_name + " " + data[3].last_name);
							$("#serviceModalIcon").attr("src" , "/helperland/resources/assets/custDash/"  + data[3].user_profile_picture+ ".png "   );
						}
						
						if(data[4] == 0){
							$("#icon1d ,#icon2d , #icon3d , #icon4d , #icon5d").css("color" , "#e1e1e1");
						}
						if(data[4] == 1){
							$("#icon2d , #icon3d , #icon4d , #icon5d").css("color" , "#e1e1e1");
							$("#icon1d").css("color" , "#ECB91C");
							
						}
						if(data[4] == 2){
							$("#icon3d , #icon4d , #icon5d").css("color" , "#e1e1e1");
							$("#icon1d , #icon2d").css("color" , "#ECB91C");
						}
						if(data[4] == 3){
							$("#icon4d , #icon5d").css("color" , "#e1e1e1");
							$("#icon1d , #icon2d , #icon3d").css("color" , "#ECB91C");
						}
						if(data[4] == 4){
							$("#icon5d").css("color" , "#e1e1e1");
							$("#icon1d , #icon2d , #icon3d , #icon4d").css("color" , "#ECB91C");
						}
						
						$("#sdTotalCleanings").html(data[5] + " cleanings");
						$("#rescheduleBtnModel").attr('data-spID' , data[0].service_req_id);
						$("#cancelBtnModel").attr('data-spID' , data[0].service_req_id);
				},
				error : function(xhr, textStatus, xml) {
					alert("Some error occured");
				}
			})
    	}
    	
    	
    	$("#cancelReqForm").on("submit" , function(){
    		$.ajax({
				url : $(this).attr("action"),
				type : $(this).attr('method'),
				data : $(this).serialize(),
				success : function() {
					location.reload();
				},
				error : function(xhr, textStatus, xml) {
					alert("Some error occured");
				}
			})
    	})
    	
    	
    	$("#servicedate , #servicetime").on("change",function() {

			var serviceDate = $("#servicedate").val();
			var serviceTime = $("#servicetime").val();
			var date = moment(serviceDate + ' ' + serviceTime).format("YYYY-MM-DD HH:mm:ss.SSS");

			var sdate = new Date(date);
			$("#service_start_date").val(sdate);
		});
    	
    	$("#rescheduleReqForm").on("submit" , function(e){
    		
    		e.preventDefault();	
    		$.ajax({
				url : "service-reschedule",
				type : "POST",
				data : $(this).serialize(), 
				success : function(data , xhr) {
					location.reload();
				},
				error : function(data) {
					var date = new Date(data.responseJSON[1]);
					var date2 = new Date(data.responseJSON[2]);
					if(data.responseJSON[0] == "conflict"){
						$("#conflictError").html("Another service request has been assigned to the service provider on " + date.getDate()+"/"+(date.getMonth()+1)+"/"+date.getFullYear() + " from " + date.toLocaleTimeString('pt-BR')  +" to " + date2.toLocaleTimeString('pt-BR') + ". Either choose another date or pick up a different time slot.");
					}
				}
			})
    	})
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>