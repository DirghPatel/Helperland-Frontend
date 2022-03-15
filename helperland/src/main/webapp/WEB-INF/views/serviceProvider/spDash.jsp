<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:set var="users" value="${users }" />
	<c:set var="srAddress" value="${srAddress }" />
	<link href='<c:url value="/resources/css/spDash.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/navbar-2.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/pagination.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
</head>
<body>
    <div style="min-height: 100vh; padding-bottom: 80px;">
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
                                    <a class="nav-link" id="newServiceRequest1" href="dash">New Service Request</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="upcomingServices1" href="upcoming-services">Upcoming Services</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="serviceSchedule1" href="service-schedule">Service Schedule</a>
                                </div>
                                <div class="nav-item nav_select1" id="serviceHistory1">
                                    <a class="nav-link" id="serviceHistory1" href="service-history">Service History</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="myRating1" href="my-ratings">My Rating</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="blockCustomer1" href="block-customer">Block Customer</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" id="notification1" href="notification">Notification</a>
                                </div>
                                <div class="nav-item nav_select1">
                                    <a class="nav-link" href="mysettings">My Settings</a>
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
                            <li><a class="dropdown-item px-1" type="button" href="dash">My Dashboard</a></li>
                            <li><a class="dropdown-item px-1" type="button" href="mysettings" >My Settings</a></li>
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
        

        <div class="position-relative spDash_header d-flex align-items-center justify-content-center">
            <p class="m-0">Welcome, <span class="text-bold">${user.first_name }!</span></p>
        </div>

        <div class="spDash_main d-flex justify-content-center h-100 m-3">
            <div class="dash_sidebar position-relative d-none d-lg-block d-xl-block">
                <ul class="sidebar_inner">
                    <li style="background-color: #146371;">
                        <a id="newServiceRequest" class="text-light" href="dash">New Service Requests</a>
                    </li>
                    <li>
                        <a id="upcomingServices" class="text-light" href="upcoming-services">Upcoming Services</a>
                    </li>
                    <li>
                        <a id="serviceSchedule" class="text-light" href="service-schedule">Service Schedule</a>
                    </li>
                    <li>
                        <a id="serviceHistory" class="text-light" href="service-history">Service History</a>
                    </li>
                    <li>
                        <a id="myRating" class="text-light" href="my-ratings">My Rating</a>
                    </li>
                    <li>
                        <a id="blockCustomer" class="text-light" href="block-customer">Block Customer</a>
                    </li>
                    <li>
                        <a id="notification" class="text-light" href="notification">Notification</a>
                    </li>
                </ul>
            </div>
            <div class="dash_content">
                <!-- ----------- New Service Request Table ----------- -->
                <div id="newServiceRequestTable">
                    <form class="serviceReqHead d-flex" id="include_pets_form" method="get" action="dash">
                        <div class="d-flex align-items-center justify-content-center me-3">
                            <label for="distance" class="me-1">Service Area</label>
                            <select id="">
                                <option value="25km">25km</option>
                                <option value="25km">35km</option>
                                <option value="25km">50km</option>
                                <option value="25km">75km</option>
                            </select>
                        </div>
                        <div class="d-flex align-items-center justify-content-center">
                            <input type="checkbox" class="me-2" name="pets" id = "include_pets" <c:if test="${sr_type == 1}">checked</c:if> value="1">
                            <input type="checkbox" class="me-2 d-none" name="pets" id = "include_pets_hidden" value="0">
                            <label for="pets" style="font-size: 14px;">Include Pet at home</label>
                        </div>
                    </form>
                    <table class="table table_1">
                        <thead>
                            <tr>
                                <th scope="col">
                                    Service Id 
                                    <span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14">
                                            <path fill-rule="evenodd" fill="#9B9B9B" d="m13.829 9.159-4.67 4.67c.261.116-.233.571-.409.571-.116 0-.291-.455-.408-.571a.53.53 0 0 1-.175-.409V.579c0-.292.292-.179.583-.179h1.168c.292 0 .584-.113.584.179v7.88c0 .291.35.408.768.233l.924-1.167a.53.53 0 0 1 .409-.175c.117 0 .292.058.507.175l.719.817c.116.117.571.233.571.408 0 .176-.455.67-.571.409zM5.248 14.4H4.81c-1.021 0-1.313-.688-1.313-.98V5.54c0-.292-.35-.408-.525-.233L1.804 6.474a.527.527 0 0 1-.408.175.63.63 0 0 1-.409-.175L.17 5.657c.36-.117.23-.234.23-.409 0 .482.13-.292-.23-.408L4.84.17c.116.36.89.23.408.23.175 0 .292.13.409-.23a.53.53 0 0 1 .175.409V13.42c0 .292-.292.98-.584.98z"/>
                                        </svg>
                                    </span>
                                </th>
                                <th scope="col">
                                    Service Date
                                </th>
                                <th scope="col">
                                    Customer Details
                                </th>
                                <th scope="col" class="text-center">Payment</th>
                                <th scope="col" class="text-center">
                                    Time Conflict
                                </th>
                                <th scope="col" class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="serviceReq_all">
							<c:forEach var="sr" items="${service_requests.pageList }" varStatus = "i">
								
								<tr>
	                                <th scope="row" id="serviceRequestId">${sr.service_req_id }</th>
	                                <td class="service_date cursorPointer" href="#serviceDetails" data-bs-toggle="modal" id="${sr.service_req_id }" onclick="myFunction($(this).attr('id'))">
	                                    <a class="d-flex text-decoration-none ">
	                                        <img src="<c:url value = "/resources/assets/spDash/calender.png" />" alt="" height="19" width="16">
	                                        <p class="m-0"><fmt:formatDate type = "date" value = "${sr.service_start_date}" pattern="dd/MM/yyyy"/></p>
	                                    </a>
	                                    <a class="d-flex text-decoration-none">
	                                        <img src="<c:url value = "/resources/assets/spDash/clock.png" />" alt="" height="19" width="16">
	                                        <p class="m-0">
	                                        	<fmt:formatDate type = "time" value = "${sr.service_start_date}" pattern="hh:mm"/>-<span id="endTime${i.index }"></span>
	                                        </p>
	                                    </a>
	                                </td>
	                                <td>
	                                    <a class="text-decoration-none">
	                                        <p class="m-0">
	                                        	<c:forEach var="u" items="${users }">
	                                        		<c:if test="${u.user_id == sr.user_id}"> ${u.first_name } ${u.last_name }</c:if>
	                                        	</c:forEach>
	                                        </p>
	                                        <p class="m-0">
	                                            <img src="<c:url value = "/resources/assets/spDash/home.png" />" alt="" height="19" width="16">
	                                            <span>
	                                            
	                                            	<c:forEach var="srAddress" items="${srAddress }">
	                                            		<c:if test="${sr.service_req_id == srAddress.service_req_id }">
	                                            			${srAddress.address_line1 } ${srAddress.address_line2 } ${srAddress.postal_code } ${srAddress.city }
	                                            		</c:if>
	                                            	</c:forEach>
	                                            </span> 
	                                        </p>
	                                    </a>
	                                </td>
	                                <td>
	                                    <p class="m-0 text-center">${sr.total_cost } $</p>
	                                </td>
	                                <td>
	                                    <p class="m-0 text-center">${sr.distance }km</p>
	                                </td>
	                                <td class="text-center button_main">
	                                    <a class="accept_button rounded-pill text-light text-decoration-none" data-srID ="${sr.service_req_id }" onclick="acceptFunction($(this).attr('data-srID'))" style="cursor: pointer">Accept</a>
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
	                    	<p class="mb-0"> &nbsp Entries total record:${service_requests.nrOfElements }</p>
                    	</div>		
                    
                    	<% 
				        	String c = request.getParameter("count");
                    	 	if(c == null){
                    	 		c = "10";
                    	 	}
							pageContext.setAttribute("c", c);					        
					    %>
                    
				        <ul>
					        <li class="rounded-circle"><a id="firstPrev" href="/helperland/service-provider/dash?page=1&count=${c }&pets=${sr_type}" class="rounded-circle"> « </a></li>
					        
					        <li class="rounded-circle">
					        	<a id="prevIcon" href="/helperland/service-provider/dash?page=<c:if test="${service_requests.page == 1 or service_requests.page == 0 }">1</c:if><c:if test="${service_requests.page > 1 }">${service_requests.page }</c:if>&count=${c }&pets=${sr_type}" class="rounded-circle" <c:if test = "${service_requests.page ==  0}">style = "pointer-events: none"</c:if>>  ‹ </a>
					        </li>
					        <li class="rounded-circle">
						        <c:forEach begin="1" end="${service_requests.pageCount}" step="1"  varStatus="tagStatus">
									  <c:choose>
										    <c:when test="${(service_requests.page + 1) == tagStatus.index}">
										      	<span class="is-active rounded-circle">${tagStatus.index}</span>
										    </c:when>
										    <c:otherwise>                
										     	<a class="pageNoTag rounded-circle" href="/helperland/service-provider/dash?page=${tagStatus.index}&count=${c }&pets=${sr_type}">${tagStatus.index}</a>
										    </c:otherwise>
									  </c:choose>
								</c:forEach>
							</li>
					        <li class="rounded-circle"><a id="nextIcon" href="/helperland/service-provider/dash?page=${service_requests.page + 2 }&count=${c }&pets=${sr_type}" class="rounded-circle" <c:if test = "${service_requests.page + 1 ==  service_requests.pageCount}">style = "pointer-events: none"</c:if>> › </a></li>
					        <li class="rounded-circle"><a id="lastNext" href="/helperland/service-provider/dash?page=${service_requests.pageCount }&count=${c }&pets=${sr_type}" class="rounded-circle"> » </a></li>
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
                                <h4 id="sdDate"> </h4>
                                <p><b>Duration : </b>&nbsp<span id="sdDuration"></span></p>

                                <hr>

                                <p><b>Service Id:</b>&nbsp<span id="sdId"></span></p>
                                <p><b>Extras:</b><span id="sdExtra"></span></p>
                                <p><b>Net Amount:</b> <span class="table_payment fw-bolder" id="sdAmount"></span> </p>
                                
                                <hr>
                                
                                <p><b>Service Address:</b><span id="sdAddress"></span></p>
                                <p><b>Billing Address: </b>Same as cleaning Address</p>
                                <p><b>Phone:</b> +91 <span id="sdPhone"></span></p>
                                <p><b>Email:</b><span id="sdEmail"></span></p>
                                
                                <hr>
                                
                                <p><b>Comments</b></p>
                                <div>
                                    <p id="sdComments"></p>
                                </div>
                                <p id="sdPets"></p>
                                
                                <hr>
                                <a class="accept_button rounded-pill text-light text-decoration-none" id="sdAcceptBtn" onclick="acceptFunction($(this).attr('data-srID'))" style="cursor: pointer">Accept</a>
                                
                            </div>
                            <div class="serviceModalRight">
                                <iframe width="350px" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"
                                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3671.6979157244114!2d72.49824711445191!3d23.034861321650208!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e8352e403437b%3A0xdc9d4dae36889fb9!2sTatvaSoft!5e0!3m2!1sen!2sin!4v1640187081460!5m2!1sen!2sin">
                                </iframe>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="serviceAcceptPopUp">

            <div class="modal fade" id="serviceAccept" aria-hidden="true" aria-labelledby="serviceAcceptLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered vertical-align-center">
                    <div class="modal-content">
                        <!-- <div class="modal-body"> -->
                            <div class="modal-header px-4">
                                <h5 class="modal-title" id="serviceAcceptLabel">Service Accept</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                        <div class="modal-body serviceAcceptModal p-2 px-4">
							<p>Accepted the service!</p>
							<button type="button" data-bs-dismiss="modal" aria-label="Close" class="accept_button rounded-pill text-light text-decoration-none">Ok</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="conflictErrorPopUp">

            <div class="modal fade" id="conflictError" aria-hidden="true" aria-labelledby="conflictErrorLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered vertical-align-center">
                    <div class="modal-content">
                        <div class="modal-header px-4">
                            <h5 class="modal-title text-danger" id="conflictErrorLabel">Error!!</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body conflictErrorModal p-2 px-4">
							<p id="conflictErrorReqId"></p>
							<button type="button" data-bs-dismiss="modal" aria-label="Close" class="accept_button rounded-pill text-light text-decoration-none">Ok</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="footer" class="position-relative bottom-0 w-100">

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
    
    	$(document).ready(function() {
    		
    		$("#include_pets").val(1);

    		<c:if test="${sr_type == all} ">
	    		$("#include_pets").attr('checked' , true);	
    		</c:if>
    		<c:if test="${sr_type == filtered} ">
	    		$("#include_pets").attr('checked' , false);	
			</c:if>
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
    		let pets = ${sr_type};
    		$("#firstPrev").attr("href" , '/helperland/service-provider/dash?page=1&count=' + $("#count_select").val()+'&pets='+pets);
    		document.getElementById("firstPrev").click();
    })
    
    </script>
    
    <script>
    
    	function myFunction(id){
    		console.log(id);
    		$.ajax({
				url : "service-details-data",
				type : "POST",
				data : id,
				contentType : "application/json",
				success : function(data) {
						
						var d = new Date(data[0].service_start_date);
						
						var date1 = d.getDate() + "/" + (d.getMonth()+1) + "/" + d.getFullYear();
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
						$("#sdAcceptBtn").attr('data-srId' , data[0].service_req_id);
						
						if(data[0].has_pets == 0){
							$("#sdPets").html("I don't have pets at home.");
						}
						else{
							$("#sdPets").html("I have pets at home.");	
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
				},
				error : function(xhr, textStatus, xml) {
					alert("Some error occured");
				}
			})	
    	}
    	
    	function acceptFunction(id){
    		$.ajax({
				url : "service-accept",
				type : "POST",
				data : id,
				contentType : "application/json",
				success : function(data) {
					$("#serviceAccept").modal('show');
					location.reload(); 	
				},
				error : function(data) {
					var d = data.responseText;
					if(d.substring(0 , 8) == "conflict"){
						$("#conflictError").modal('show');
						$("#conflictErrorReqId").html("Another service request # <b>" + d.substring(8 , d.length) + " </b> has already been assigned which has time overlap with this service request. You can’t pick this one!");
					}
					if(d == "expired"){
						$("#conflictError").modal('show');
						$("#conflictErrorReqId").html("This service request is expired");
					}
					if(d == "already accepted"){
						$("#conflictError").modal('show');
						$("#conflictErrorReqId").html("Sorry, This ServiceRequest is already accepted by another Service Provicer.");	
					}
				}
			})
    		
    	}
    
    	$("#include_pets").on("change" , function(){
   			if (this.checked == true)
   				{
   	            	$(this).val("1");
   	            	$("#include_pets_hidden").attr('checked' , false);	
   				} 
   	        else{
   	        	$("#include_pets_hidden").attr('checked' , true);
   	        }
   			$("#include_pets_form").submit();     			
    	})
    	
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>