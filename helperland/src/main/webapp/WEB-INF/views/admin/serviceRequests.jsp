<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<c:url value="/resources/css/serviceRequests.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
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
                <a href="">
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
            <form action="">
                <ul class="formMain">
                    <li class="h-100">
                        <input type="text" name="serviceid" placeholder="Sevice Id" class="h-100 marginInput mb-3" style="width: 110px;">
                    </li>
                    <li class="h-100">
                        <select name="customer" id="customer" class="width215 marginInput h-100 mb-3" style="width: 135px;">
                            <option value="" disabled selected>Customer</option>
                            <option value="admin">Admin</option>
                            <option value="callcenter">Call Center</option>
                            <option value="customer">Customer</option>
                            <option value="serviceprovider">Service Provicer</option>
                        </select>
                    </li>
                    <li class="h-100">
                        <select name="serviceprovider" id="serviceprovider" class="width215 marginInput h-100 mb-3" style="width: 160px;">
                            <option value="" disabled selected>Service Provider</option>
                            <option value="admin">Admin</option>
                            <option value="callcenter">Call Center</option>
                            <option value="customer">Customer</option>
                            <option value="serviceprovider">Service Provicer</option>
                        </select>
                    </li>
                    <li class="h-100">
                        <select name="status" id="status" class="width215 marginInput h-100 mb-3" style="width: 130px;">
                            <option value="" disabled selected>Status</option>
                            <option value="new">New</option>
                            <option value="pending">Pending</option>
                            <option value="completed">Completed</option>
                            <option value="cancelled">Cancelled</option>
                            <option value="refunded">Refunded</option>
                            <option value="expired">Expired</option>
                            <option value="rescheduled">Rescheduled</option>
                        </select>
                    </li>
                    <li class="h-100">
                        <input type="text" placeholder="From Date" onfocus="(this.type='date')" class="mb-3">
                    </li>
                    <li class="h-100">
                        <input type="text" placeholder="To Date" onfocus="(this.type='date')" class="mb-3">
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

                    <!-- ---------- Status Completed ------------  -->
                    <tr>
                        <td scope="row">121324</td>
                        <td class="service_date" >
                            <a href="#serviceDetailsPopup" data-bs-toggle="modal" class="d-flex text-decoration-none align-items-center">
                                <img src="<c:url value = "/resources/assets/adminScreen/calculator.png" />" alt="" height="19" width="16">
                                <p class="mb-0 ms-2">09/04/2018</p>
                            </a>
                            <a href="#serviceDetailsPopup" data-bs-toggle="modal" class="d-flex text-decoration-none">
                                <img src="<c:url value = "/resources/assets/adminScreen/clock.png" />" alt="" height="17" width="17">
                                <p class="mb-0 ms-2">12:00 - 18:00</p>
                            </a>
                        </td>
                        <td>
                            <a href="#serviceDetailsPopup" data-bs-toggle="modal" class="text-decoration-none">
                                <p class="m-0">David Bough</p>
                                <p class="m-0">
                                    <img src="<c:url value = "/resources/assets/adminScreen/home.png" />" alt="" height="22" width="22">
                                    <span>
                                        Musterstrabe 5,12345 Bonn
                                    </span> 
                                </p>
                            </a>
                        </td>
                        <td>
                            <div class="d-flex">
                                <div class="sp_icon me-2 rounded-circle d-flex align-items-center justify-content-center">
                                    <img src="<c:url value = "/resources/assets/adminScreen/cap.png" />" alt="" height="20" width="30">
                                </div>
                                <div class="d-flex flex-column">
                                    <p class="mb-0">Lyum Watson</p>
                                    <div class="d-flex align-items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#d4d4d4" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <p class="mb-0">4</p>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td scope="row" class="text-center">
                            <span class="statusCompleted">Completed</span>
                        </td>
                        <td class="text-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary text-dark dropDownBtn" data-bs-toggle="dropdown" aria-expanded="false">
                                    &#8942
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end">
                                  <li><button class="dropdown-item" type="button" href="#editReschedule" data-bs-toggle="modal">Edit & Reschedule</button></li>
                                  <li><button class="dropdown-item" type="button" href="#refundModal" data-bs-toggle="modal">Refund</button></li>
                                  <li><button class="dropdown-item" type="button">Inquiry</button></li>
                                  <li><button class="dropdown-item" type="button">History Log</button></li>
                                  <li><button class="dropdown-item" type="button">Download Invoice</button></li>
                                  <li><button class="dropdown-item" type="button">Other Transactions</button></li>
                                </ul>
                              </div>
                        </td>
                    </tr>

                    <!-- ---------- Status New ------------  -->
                    <tr>
                        <td scope="row">121324</td>
                        <td class="service_date" href="#serviceDetails" data-bs-toggle="modal" >
                            <a href="#" class="d-flex text-decoration-none align-items-center">
                                <img src="<c:url value = "/resources/assets/adminScreen/calculator.png" />" alt="" height="19" width="16">
                                <p class="mb-0 ms-2">09/04/2018</p>
                            </a>
                            <a href="#" class="d-flex text-decoration-none">
                                <img src="<c:url value = "/resources/assets/adminScreen/clock.png" />" alt="" height="17" width="17">
                                <p class="mb-0 ms-2">12:00 - 18:00</p>
                            </a>
                        </td>
                        <td>
                            <a href="#" class="text-decoration-none">
                                <p class="m-0">David Bough</p>
                                <p class="m-0">
                                    <img src="<c:url value = "/resources/assets/adminScreen/home.png" />" alt="" height="22" width="22">
                                    <span>
                                        Musterstrabe 5,12345 Bonn
                                    </span> 
                                </p>
                            </a>
                        </td>
                        <td>
                            <div class="d-flex">
                                <div class="sp_icon me-2 rounded-circle d-flex align-items-center justify-content-center">
                                    <img src="<c:url value = "/resources/assets/adminScreen/cap.png" />" alt="" height="20" width="30">
                                </div>
                                <div class="d-flex flex-column">
                                    <p class="mb-0">Lyum Watson</p>
                                    <div class="d-flex align-items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#d4d4d4" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <p class="mb-0">4</p>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td scope="row" class="text-center">
                            <span class="statusNew">New</span>
                        </td>
                        <td class="text-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary text-dark dropDownBtn" data-bs-toggle="dropdown" aria-expanded="false">
                                    &#8942
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end">
                                  <li><button class="dropdown-item" type="button">Edit</button></li>
                                  <li><button class="dropdown-item" type="button">Deactivate</button></li>
                                </ul>
                              </div>
                        </td>
                    </tr>

                    <!-- ---------- Status Pending ------------  -->
                    <tr>
                        <td scope="row">121324</td>
                        <td class="service_date" href="#serviceDetails" data-bs-toggle="modal" >
                            <a href="#" class="d-flex text-decoration-none align-items-center">
                                <img src="<c:url value = "/resources/assets/adminScreen/calculator.png" />" alt="" height="19" width="16">
                                <p class="mb-0 ms-2">09/04/2018</p>
                            </a>
                            <a href="#" class="d-flex text-decoration-none">
                                <img src="<c:url value = "/resources/assets/adminScreen/clock.png" />" alt="" height="17" width="17">
                                <p class="mb-0 ms-2">12:00 - 18:00</p>
                            </a>
                        </td>
                        <td>
                            <a href="#" class="text-decoration-none">
                                <p class="m-0">David Bough</p>
                                <p class="m-0">
                                    <img src="<c:url value = "/resources/assets/adminScreen/home.png" />" alt="" height="22" width="22">
                                    <span>
                                        Musterstrabe 5,12345 Bonn
                                    </span> 
                                </p>
                            </a>
                        </td>
                        <td>
                            <div class="d-flex">
                                <div class="sp_icon me-2 rounded-circle d-flex align-items-center justify-content-center">
                                    <img src="<c:url value = "/resources/assets/adminScreen/cap.png" />" alt="" height="20" width="30">
                                </div>
                                <div class="d-flex flex-column">
                                    <p class="mb-0">Lyum Watson</p>
                                    <div class="d-flex align-items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#d4d4d4" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <p class="mb-0">4</p>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td scope="row" class="text-center">
                            <span class="statusPending">Pending</span>
                        </td>
                        <td class="text-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary text-dark dropDownBtn" data-bs-toggle="dropdown" aria-expanded="false">
                                    &#8942
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end">
                                  <li><button class="dropdown-item" type="button">Edit</button></li>
                                  <li><button class="dropdown-item" type="button">Deactivate</button></li>
                                </ul>
                              </div>
                        </td>
                    </tr>

                    <!-- ---------- Status Cancelled ------------  -->
                    <tr>
                        <td scope="row">121324</td>
                        <td class="service_date" href="#serviceDetails" data-bs-toggle="modal" >
                            <a href="#" class="d-flex text-decoration-none align-items-center">
                                <img src="<c:url value = "/resources/assets/adminScreen/calculator.png" />" alt="" height="19" width="16">
                                <p class="mb-0 ms-2">09/04/2018</p>
                            </a>
                            <a href="#" class="d-flex text-decoration-none">
                                <img src="<c:url value = "/resources/assets/adminScreen/clock.png" />" alt="" height="17" width="17">
                                <p class="mb-0 ms-2">12:00 - 18:00</p>
                            </a>
                        </td>
                        <td>
                            <a href="#" class="text-decoration-none">
                                <p class="m-0">David Bough</p>
                                <p class="m-0">
                                    <img src="<c:url value = "/resources/assets/adminScreen/home.png" />" alt="" height="22" width="22">
                                    <span>
                                        Musterstrabe 5,12345 Bonn
                                    </span> 
                                </p>
                            </a>
                        </td>
                        <td>
                            <div class="d-flex">
                                <div class="sp_icon me-2 rounded-circle d-flex align-items-center justify-content-center">
                                    <img src="<c:url value = "/resources/assets/adminScreen/cap.png" />" alt="" height="20" width="30">
                                </div>
                                <div class="d-flex flex-column">
                                    <p class="mb-0">Lyum Watson</p>
                                    <div class="d-flex align-items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                            <path fill-rule="evenodd" fill="#d4d4d4" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                        </svg>
                                        <p class="mb-0">4</p>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td scope="row" class="text-center">
                            <span class="statusCancelled">Cancelled</span>
                        </td>
                        <td class="text-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary text-dark dropDownBtn" data-bs-toggle="dropdown" aria-expanded="false">
                                    &#8942
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end">
                                  <li><button class="dropdown-item" type="button">Edit</button></li>
                                  <li><button class="dropdown-item" type="button">Deactivate</button></li>
                                </ul>
                              </div>
                        </td>
                    </tr>

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
                            <form action="">
                                <div class="row mb-3">
                                    <div class="col-sm-6">
                                        <div class="form-group d-flex flex-column">
                                            <label for="editDateModal" class="control-label fw-bold">Date</label>
                                            <input type="date" value="23/12/2021" name="editDateModal" class="minheight46 borderlight">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group d-flex flex-column">
                                            <label for="editDateTime" class="control-label fw-bold">Time</label>
                                            <select name="editDateTime" id="" class="minheight46 borderlight">
                                                <option value="8:00">8:00</option>
                                                <option value="8:30">8:30</option>
                                                <option value="9:00">9:00</option>
                                                <option value="9:30">9:30</option>
                                                <option value="10:00">10:00</option>
                                                <option value="10:30">10:30</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <label for="" class="control-label fw-bold mb-2">Service Address</label>
                                <div class="row mb-3">
                                    <div class="col-sm-6 my-2">
                                        <div class="form-group d-flex flex-column">
                                            <label for="streetNameModal" class="control-label">Street</label>
                                            <input type="text" name="streetNameModal" value="Street" class="minheight46 borderlight">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 my-2">
                                        <div class="form-group d-flex flex-column">
                                            <label for="houseNumberEdit" class="control-label">House No.</label>
                                            <input type="text" name="houseNumberEdit" value="54" class="minheight46 borderlight">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 my-2">
                                        <div class="form-group d-flex flex-column">
                                            <label for="postalCodeEdit" class="control-label">Postal Code</label>
                                            <input type="text" name="postalCodeEdit" value="534233" class="minheight46 borderlight">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 my-2">
                                        <div class="form-group d-flex flex-column">
                                            <label for="cityEdit" class="control-label">Time</label>
                                            <input type="text" name="cityEdit" value="Troisdorf" class="minheight46 borderlight">
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
                                <h4>22/12/2021 09:00 -14:30</h4>
                                <p><b>Duration:</b>5.5 Hrs</p>

                                <hr>

                                <p><b>Service Id:</b>8502</p>
                                <p><b>Extras:</b>Inside cabinets, Inside fridge, Inside oven, Laundry wash & dry, Interior windows</p>
                                <p><b>Net Amount:</b> <spna class="table_payment fw-bolder">99,00 €</spna> </p>
                                
                                <hr>
                                
                                <p><b>Service Address:</b>Test 65, 53225 Bonn</p>
                                <p><b>Billing Address:</b>Same as cleaning Address</p>
                                <p><b>Phone:</b>+49 9988556644</p>
                                <p><b>Email:</b>cust001@yopmail.com</p>
                                
                                <hr>
                                
                                <p><b>Comments</b></p>
                                <div>
                                    <p>Hello</p>
                                </div>
                                <p>I don't have pets at home</p>
                                
                                <hr>
                                
                            </div>
                            <div class="serviceModalRight">
                                <h4>Service Provider Details</h4>
                                <div class="sp_block d-flex justify-content-around align-items-center">
                                    <div style="height: 64px; width: 64px;" class="borderlight p-0 d-flex align-items-center justify-content-center rounded-circle">
                                        <img src="<c:url value = "/resources/assets/adminScreen/cap.png" />" class="" height="20" width="30">
                                    </div>
                                    <div>
                                        <p class="sp_name mb-0">Kavan Patel</p>
                                        <div>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                                <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                                <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                                <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                                <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="17" height="16">
                                                <path fill-rule="evenodd" fill="#ECB91C" d="m8.176 12.865 5.045 3.735-1.334-5.78 4.453-3.84-5.871-1.402L8.176.6 5.882 5.578.11 6.98l4.355 3.84L3.13 16.6l5.046-3.735z"/>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <p class="mb-0">1 cleaning</p>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>