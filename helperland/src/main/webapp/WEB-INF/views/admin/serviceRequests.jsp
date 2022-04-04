<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<c:url value="/resources/css/serviceRequests.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
</head>
<body>
    
    <nav class="navbar navbar-expand-xl sticky-top navbar-light ">
        <div class="container-fluid">
            <div class="d-flex align-items-center logoContainer">
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>   
                <p class="navbar-brand helperlandLogo text-white fw-bold p-0 m-0">helperland</p>
            </div>
            <div class="d-flex align-items-center adminDetailContainer">
                <img src="<c:url value = "/resources/assets/adminScreen/user.png" />" alt="" height="36" width="36">
                <p class="mb-0 mx-3 text-white">${user.first_name } ${user.last_name }</p>
                <a href="/helperland/logout">
                    <img src="<c:url value = "/resources/assets/adminScreen/logout.png" />" alt="" height="29" width="26">
                </a>
            </div>
        </div>
    </nav>

    <div class="offcanvas offcanvas-start sidebarMain" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-body">
            <a href="user-management " class="text-decoration-none text-dark">
                <p class="mb-0 text-decoration-none">User Management</p>
            </a>
            <a href="service-requests" class="text-decoration-none">
                <p class="mb-0 blueColor text-decoration-none" href="">Service Request</p>
            </a>
        </div>
    </div>



    <section class="serviceDetails position-relative w-100" id="serviceDetails">
        <div class="serviceDetailsHeader d-flex justify-content-between mb-2">
            <h1 class="m-0">Service Requests</h1>
            <a href="#" role="button" class="text-white text-decoration-none">
                <img src="<c:url value = "/resources/assets/adminScreen/addNew.png" />" alt="" height="16" width="16">
                <span class="ms-1">Add New User</span>
            </a>
        </div>
        <div class="formWrapper position-relative">
            <form action="service-requests" method="post">
                <ul class="formMain">
                    <li class="h-100">
                        <input type="text" name="service_req_id" placeholder="Sevice Id" class="h-100 marginInput mb-3" style="width: 110px;">
                    </li>
                    <li class="h-100">
                        <select name="customer" id="customer" class="width215 marginInput h-100 mb-3" style="width: 135px;">
                            <option value="" disabled selected>Customer</option>
                            <!-- <option value="admin">Admin</option>
                            <option value="callcenter">Call Center</option>
                            <option value="customer">Customer</option>
                            <option value="serviceprovider">Service Provicer</option>-->
                            
                            <c:forEach var="u" items="${usersCust }">
                            	<option value="${u.user_id }">${u.first_name } ${u.last_name }</option>
                            </c:forEach>
                        </select>
                    </li>
                    <li class="h-100">
                        <select name="serviceprovider" id="serviceprovider" class="width215 marginInput h-100 mb-3" style="width: 160px;">
                            <option value="" disabled selected>Service Provider</option>
                            <c:forEach var="u" items="${usersSP }">
                            	<option value="${u.user_id }">${u.first_name } ${u.last_name }</option>
                            </c:forEach>
                        </select>
                    </li>
                    <li class="h-100">
                        <select name="status" id="status" class="width215 marginInput h-100 mb-3" style="width: 130px;">
                            <option value="" disabled selected>Status</option>
                            <option value="1">New</option>
                            <option value="2">Pending</option>
                            <option value="3">Completed</option>
                            <option value="0">Cancelled</option>
                            <option value="4">Rescheduled</option>
                        </select>
                    </li>
                    <li class="h-100">
                        <input type="text" name="fromdate" placeholder="From Date" onfocus="(this.type='date')" class="mb-3" id="fromDate">
                    </li>
                    <li class="h-100">
                       	<input type="text" name="todate" placeholder="To Date" onfocus="(this.type='date')" class="mb-3" id="toDate"> 
                    </li>
                    <li class="h-100">
                        <button type="submit" class="text-white marginInput searchButton h-100 mb-3"> Submit </button>
                    </li>
                    <li class="h-100">
                        <button type="reset" class="marginInput clearButton h-100 mb-3">Clear</button>
                    </li>        
                </ul>
            </form>
        </div>

        <div id="serviceDetailsTable" class="mt-5 serviceDetailsTable position-relative">
            <table class="table table_1 p-3 m-0">
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
                            Service date 
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14">
                                    <path fill-rule="evenodd" fill="#9B9B9B" d="m13.829 9.159-4.67 4.67c.261.116-.233.571-.409.571-.116 0-.291-.455-.408-.571a.53.53 0 0 1-.175-.409V.579c0-.292.292-.179.583-.179h1.168c.292 0 .584-.113.584.179v7.88c0 .291.35.408.768.233l.924-1.167a.53.53 0 0 1 .409-.175c.117 0 .292.058.507.175l.719.817c.116.117.571.233.571.408 0 .176-.455.67-.571.409zM5.248 14.4H4.81c-1.021 0-1.313-.688-1.313-.98V5.54c0-.292-.35-.408-.525-.233L1.804 6.474a.527.527 0 0 1-.408.175.63.63 0 0 1-.409-.175L.17 5.657c.36-.117.23-.234.23-.409 0 .482.13-.292-.23-.408L4.84.17c.116.36.89.23.408.23.175 0 .292.13.409-.23a.53.53 0 0 1 .175.409V13.42c0 .292-.292.98-.584.98z"/>
                                </svg>
                            </span>
                        </th>
                        <th scope="col">
                            Customer details
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14">
                                    <path fill-rule="evenodd" fill="#9B9B9B" d="m13.829 9.159-4.67 4.67c.261.116-.233.571-.409.571-.116 0-.291-.455-.408-.571a.53.53 0 0 1-.175-.409V.579c0-.292.292-.179.583-.179h1.168c.292 0 .584-.113.584.179v7.88c0 .291.35.408.768.233l.924-1.167a.53.53 0 0 1 .409-.175c.117 0 .292.058.507.175l.719.817c.116.117.571.233.571.408 0 .176-.455.67-.571.409zM5.248 14.4H4.81c-1.021 0-1.313-.688-1.313-.98V5.54c0-.292-.35-.408-.525-.233L1.804 6.474a.527.527 0 0 1-.408.175.63.63 0 0 1-.409-.175L.17 5.657c.36-.117.23-.234.23-.409 0 .482.13-.292-.23-.408L4.84.17c.116.36.89.23.408.23.175 0 .292.13.409-.23a.53.53 0 0 1 .175.409V13.42c0 .292-.292.98-.584.98z"/>
                                </svg>
                            </span>
                        </th>
                        <th scope="col">
                            Service provider
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14">
                                    <path fill-rule="evenodd" fill="#9B9B9B" d="m13.829 9.159-4.67 4.67c.261.116-.233.571-.409.571-.116 0-.291-.455-.408-.571a.53.53 0 0 1-.175-.409V.579c0-.292.292-.179.583-.179h1.168c.292 0 .584-.113.584.179v7.88c0 .291.35.408.768.233l.924-1.167a.53.53 0 0 1 .409-.175c.117 0 .292.058.507.175l.719.817c.116.117.571.233.571.408 0 .176-.455.67-.571.409zM5.248 14.4H4.81c-1.021 0-1.313-.688-1.313-.98V5.54c0-.292-.35-.408-.525-.233L1.804 6.474a.527.527 0 0 1-.408.175.63.63 0 0 1-.409-.175L.17 5.657c.36-.117.23-.234.23-.409 0 .482.13-.292-.23-.408L4.84.17c.116.36.89.23.408.23.175 0 .292.13.409-.23a.53.53 0 0 1 .175.409V13.42c0 .292-.292.98-.584.98z"/>
                                </svg>
                            </span>
                        </th>
                        <th scope="col" class="text-center">
                            Status
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14">
                                    <path fill-rule="evenodd" fill="#9B9B9B" d="m13.829 9.159-4.67 4.67c.261.116-.233.571-.409.571-.116 0-.291-.455-.408-.571a.53.53 0 0 1-.175-.409V.579c0-.292.292-.179.583-.179h1.168c.292 0 .584-.113.584.179v7.88c0 .291.35.408.768.233l.924-1.167a.53.53 0 0 1 .409-.175c.117 0 .292.058.507.175l.719.817c.116.117.571.233.571.408 0 .176-.455.67-.571.409zM5.248 14.4H4.81c-1.021 0-1.313-.688-1.313-.98V5.54c0-.292-.35-.408-.525-.233L1.804 6.474a.527.527 0 0 1-.408.175.63.63 0 0 1-.409-.175L.17 5.657c.36-.117.23-.234.23-.409 0 .482.13-.292-.23-.408L4.84.17c.116.36.89.23.408.23.175 0 .292.13.409-.23a.53.53 0 0 1 .175.409V13.42c0 .292-.292.98-.584.98z"/>
                                </svg>
                            </span>
                        </th>
                        
                        <th scope="col" class="text-center">
                            Actions
                        </th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach var="sr" items="${service_requests }" varStatus="i">
						<tr>
	                        <td scope="row">${sr.service_req_id }</td>
	                        <td class="service_date" href="#serviceDetailsPopup" data-bs-toggle="modal" data-srid="${sr.service_req_id }" onclick="myFunction($(this).attr('data-srid'))">
	                            <a href="#" class="d-flex text-decoration-none align-items-center">
	                                <img src="<c:url value = "/resources/assets/adminScreen/calculator.png" />" alt="" height="19" width="16">
	                                <p class="mb-0 ms-2">
	                                	<fmt:formatDate type = "date" value = "${sr.service_start_date}" pattern="dd/MM/yyyy"/>
	                                </p>
	                            </a>
	                            <a href="#" class="d-flex text-decoration-none">
	                                <img src="<c:url value = "/resources/assets/adminScreen/clock.png" />" alt="" height="17" width="17">
	                                <p class="mb-0 ms-2">
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
                                        <img src="<c:url value = "/resources/assets/adminScreen/home.png" />" alt="" height="22" width="22">
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
	                        <td scope="row" class="text-center">
	                        	<c:if test="${sr.status == 0 }">
	                        		<span class="statusCancelled">Cancelled</span>
	                        	</c:if>
	                        	<c:if test="${sr.status == 1 }">
	                        		<span class="statusNew">New</span>
	                        	</c:if>
	                        	<c:if test="${sr.status == 2 }">
	                        		<span class="statusPending">Pending</span>
	                        	</c:if>
	                        	<c:if test="${sr.status == 3 }">
	                        		<span class="statusCompleted">Completed</span>
	                        	</c:if>
	                        	<c:if test="${sr.status == 4 }">
	                        		<span class="statusRescheduled">Rescheduled</span>
	                        	</c:if>
	                        	
	                        	
	                            
	                        </td>
	                        <td class="text-center">
	                            <div class="btn-group">
	                                <button type="button" class="btn btn-secondary text-dark dropDownBtn" data-bs-toggle="dropdown" aria-expanded="false">
	                                    &#8942
	                                </button>
	                                <ul class="dropdown-menu dropdown-menu-end">
	                                  <li><button class="dropdown-item" type="button" <c:if test="${sr.status == 0 || sr.status == 3 }">disabled</c:if> href="#editReschedule" data-bs-toggle="modal" data-srid = "${sr.service_req_id }" onclick ="editDetailsFunction($(this).attr('data-srid'))">Edit & Reschedule</button></li>
	                                  <li><button class="dropdown-item" type="button" <c:if test="${sr.payment_due == 1 }">disabled</c:if>>Refund</button></li>
	                                </ul>
	                              </div>
	                        </td>
	                    </tr>
					</c:forEach>
					
                </tbody>
            </table>
        </div>



        <div class="editReschedulePopUp">

            <div class="modal fade" id="editReschedule" aria-hidden="true" aria-labelledby="editRescheduleLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered vertical-align-center">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editRescheduleLabel">Edit Service Request</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body d-flex editRescheduleModal p-4">
                            <form action="edit-service" method="POST" id="editServiceForm">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group d-flex flex-column">
                                            <label for="editDateModal" class="control-label fw-bold">Date</label>
                                            <input type="date" class="datePicker minheight46 borderlight" name="servicedate" id="servicedate" >
                                        </div>
                                    </div>
                                    <input type="hidden" id="service_start_date" name="service_start_date">
                                    <input type="hidden" id="rescheduleServiceReqId" name="service_req_id">
                                    <div class="col-sm-6">
                                        <div class="form-group d-flex flex-column">
                                            <label for="editDateTime" class="control-label fw-bold">Time</label>
                                            <select class="timeSelect minheight46 borderlight" name="servicetime" id="servicetime">
		                                        <option value="08:00:00">8:00</option>
		                                        <option value="08:30:00">8:30</option>
		                                        <option value="09:00:00">9:00</option>
		                                        <option value="09:30:00">9:30</option>
		                                        <option value="10:00:00">10:00</option>
		                                        <option value="10:30:00">10:30</option>
		                                    </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="p-1 w-100">
                                	<small class="text-danger" id="conflictError"></small>
                                </div>
                                <label for="" class="control-label fw-bold mb-2 mt-3">Service Address</label>
                                <div class="row mb-3">
                                    <div class="col-sm-6 my-2">
                                        <div class="form-group d-flex flex-column">
                                            <label for="streetNameModal" class="control-label">Street</label>
                                            <input type="text" name="address_line1" class="minheight46 borderlight" id="editAddress1">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 my-2">
                                        <div class="form-group d-flex flex-column">
                                            <label for="houseNumberEdit" class="control-label">House No.</label>
                                            <input type="text" name="address_line2" class="minheight46 borderlight" id="editAddress2">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 my-2">
                                        <div class="form-group d-flex flex-column">
                                            <label for="postalCodeEdit" class="control-label">Postal Code</label>
                                            <input type="text" name="postal_code" class="minheight46 borderlight" id="editPC">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 my-2">
                                        <div class="form-group d-flex flex-column">
                                            <label for="cityEdit" class="control-label">City</label>
                                            <input type="text" name="city" class="minheight46 borderlight" id="editCity">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group d-flex flex-column mb-3">
                                    <label for="reasonScheduleEdit" class="fw-bold">Why do you want to reschedule service request?</label>
                                    <textarea name="reasonReschedule" id="" rows="3" maxlength="500" placeholder="Why do you want to reschedule service request?" class="borderlight p-2"></textarea>
                                </div>
                                <button type="submit" class="btn blueBtn w-100" >Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="refundPopUp">
            <div class="modal fade" id="refundModal" aria-hidden="true" aria-labelledby="refundModalLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered vertical-align-center">
                    <div class="modal-content justify-content-center">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editRescheduleLabel">Refund Amount</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="d-flex px-4 justify-content-around">
                                <div class="d-flex flex-column">
                                    <p class="mb-1">Paid Amount</p>
                                    <p class="mb-1">81,00 $</p>
                                </div>
                                <div class="d-flex flex-column">
                                    <p class="mb-1">Refunded Amount</p>
                                    <p class="mb-1">0,00 $</p>
                                </div>
                                <div class="d-flex flex-column">
                                    <p class="mb-1">In Balance Amount</p>
                                    <p class="mb-1">81,00 $</p>
                                </div>
                        </div>
                        <div class="modal-body d-flex refundModalModal p-4 justify-content-center">
                            <form action="">
                                <div class="row mb-3">
                                    <div class="col-sm-6">
                                        <div class="form-group d-flex flex-column">
                                            <label for="amountRefundModal" class="control-label fw-bold">Amount</label>
                                            <div class="d-flex">
                                                <input type="text" value="123" name="amountRefundModal" class="minheight46 borderlight" style="max-width: 129px;">
                                                <select name="" id="" style="max-width: 129px;">
                                                    <option value="percentage">Percentage</option>
                                                    <option value="fixed">Fixed</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group d-flex flex-column">
                                            <label for="calculatedRefundModal" class="control-label fw-bold">Calculated</label>
                                            <div class="d-flex">
                                                <button class="border-none borderlight p-2" style="width: 129px;">Calculate</button>
                                                <input type="text" value="" disabled name="calculatedRefundModal" class="minheight46 borderlight" style="max-width: 129px;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group d-flex flex-column mb-3">
                                    <label for="reasonScheduleEdit" class="fw-bold">Why do you want to reschedule service request?</label>
                                    <textarea name="reasonScheduleEdit" id="" rows="3" maxlength="500" placeholder="Why do you want to reschedule service request?" class="borderlight p-2"></textarea>
                                </div>
                                <button type="submit" class="btn blueBtn w-100" >Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="serviceDetailsPopUp">

            <div class="modal fade" id="serviceDetailsPopup" aria-hidden="true" aria-labelledby="serviceDetailsPopupLabel" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered vertical-align-center">
                    <div class="modal-content">
                        <!-- <div class="modal-body"> -->
                            <div class="modal-header">
                                <h5 class="modal-title" id="serviceDetailsPopupLabel">Service Details</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                        <div class="modal-body d-flex serviceDetailsPopupModal p-2">
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
                    </div>
                </div>
            </div>
        </div>

    </section>

    <footer class="text-center" style="color: #646464; font-size: 14px;">
        ©2018 Helperland. All rights reserved.
    </footer>
    
    
    <script>
    
		$(document).ready(function() {
	
			<c:forEach var="sr" items="${service_requests }" varStatus="i">
				
	    		var d = new Date("${sr.service_start_date}");
	    		console.log(d);
				
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
			
			
		})
	
	</script>
	
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
	        
	        
        	if(window.history.replaceState) {
        		window.history.replaceState( null, null, window.location.href);
        	}
	    });
	    
	    $("#servicedate , #servicetime").on("change",function() {

			var serviceDate = $("#servicedate").val();
			var serviceTime = $("#servicetime").val();
			var date = moment(serviceDate + ' ' + serviceTime).format("YYYY-MM-DD HH:mm:ss.SSS");

			var sdate = new Date(date);
			console.log(date);
			$("#service_start_date").val(sdate);

		});
	    
	    
	    $("#fromDate , #toDate").on("change" , function(){
			console.log($("#fromDate").val());
			console.log($("#toDate").val());
			
			if($("#toDate").val() == "" && $("#fromDate").val != null){
				$("#toDate").attr("required" , true);
			}
			if($("#fromDate").val() == "" && $("#toDate").val != null){
				$("#fromDate").attr("required" , true);
			}
				
		})
	    
    </script>
	
	<script>
    
		function editDetailsFunction(id){
			
			$('#rescheduleServiceReqId').val(id);
			console.log($('#rescheduleServiceReqId').val());
			
			$.ajax({
				url : "edit-details-data",
				type : "POST",
				data : id,
				contentType : "application/json",
				success : function(data) {
					console.log(data);
					console.log("success");
					$("#editAddress1").val(data[1].address_line1);
					$("#editAddress2").val(data[1].address_line2);
					$("#editPC").val(data[1].postal_code);
					$("#editCity").val(data[1].city);
					
					var dtStartMoment = moment(data[0].service_start_date).format("YYYY-MM-DD HH:mm:ss.SSS");
					var dtStart = new Date(dtStartMoment);
					
					console.log(dtStart);
					
					$("#service_start_date").val(dtStart);
				},
				error : function(data) {
					console.log("error");
				}
			})
			
		}
		
		$("#editServiceForm").on("submit" , function(e){
			
			e.preventDefault();
    		$.ajax({
				url : "edit-service",
				type : "POST",
				data : $(this).serialize(), 
				success : function(data) {
					console.log("success");
					location.reload();
				},
				error : function(data) {
					console.log(data);
					var d = data.responseText; 	
					if(d == "conflict"){
						$("#conflictError").html("Another service request has already been assigned to this service provider which has time overlap with this service request. You can’t pick this one!");
					}
				}
			})
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
						console.log(data);
						
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
							$("#sdPets").html("I don't have pets at home.");
						}
						else{
							$("#sdPets").html("I have pets at home.");	
						}
						
						var extraServices = " ";
						
						console.log(data[2].cabinet);
						
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
						console.log(extraServices);
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
						
						console.log("fdsfd" + $("#rescheduleBtnModel").attr('data-spID'));
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