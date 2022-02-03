<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<c:url value="/resources/css/userManagement.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
</head>

<body>
    
    <nav class="navbar navbar-expand-xl sticky-top navbar-light">
        <div class="container-fluid">
            <div class="d-flex align-items-center logoContainer">
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <p class="navbar-brand helperlandLogo text-white fw-bold p-0 m-0" href="#">helperland</p>
            </div>
            <div class="d-flex align-items-center adminDetailContainer">
                <img src="<c:url value = "/resources/assets/adminScreen/user.png" />" alt="" height="36" width="36">
                <p class="mb-0 mx-3 text-white">${user.first_name } ${user.last_name }</p>
                <img src="<c:url value = "/resources/assets/adminScreen/logout.png" />" alt="" height="29" width="26">
            </div>
        </div>
    </nav>

    <div class="offcanvas offcanvas-start sidebarMain" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-body">
            <a href="user-management" class="text-decoration-none">
                <p class="mb-0 blueColor text-decoration-none">User Management</p>
            </a>
            <a href="service-requests" class="text-decoration-none text-dark">
                <p class="mb-0 text-decoration-none" href="">Service Request</p>
            </a>
        </div>
    </div>



    <section class="userManagement position-relative w-100" id="userManagement">
        <div class="userManagementHeader d-flex justify-content-between mb-2">
            <h1 class="m-0">User Management</h1>
            <a href="#" role="button" class="text-white text-decoration-none">
                <img src="<c:url value = "/resources/assets/adminScreen/addNew.png" />" alt="" height="16" width="16">
                <span class="ms-1">Add New User</span>
            </a>
        </div>
        <div class="formWrapper position-relative">
            <form action="">
                <ul class="formMain">
                    <li class="h-100">
                        <input type="text" name="username" placeholder="User name" class="width215 h-100 marginInput mb-3">
                    </li>
                    <li class="h-100">
                        <select name="userrole" id="userrole" class="width215 marginInput h-100 mb-3">
                            <option value="" disabled selected>User Role</option>
                            <option value="admin">Admin</option>
                            <option value="callcenter">Call Center</option>
                            <option value="customer">Customer</option>
                            <option value="serviceprovider">Service Provicer</option>
                        </select>
                    </li>
                    <li class="h-100">
                        <div class="marginInput d-flex h-100 mb-3">
                            <input type="text" name="phonecode" class="phonecodeForm" placeholder="+49" value="+49" disabled>
                            <input type="text" name="phonenumber" placeholder="Phone Number">
                        </div>
                    </li>
                    <li class="h-100">
                        <input type="text" name="zipcode" placeholder="Zip Code" class="mb-3 h-100 marginInput">
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

        <div id="userManageTable" class="mt-5 userManageTable position-relative">
            <table class="table table_1 p-3">
                <thead>
                    <tr>
                        <th scope="col">
                            User name
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14">
                                    <path fill-rule="evenodd" fill="#9B9B9B" d="m13.829 9.159-4.67 4.67c.261.116-.233.571-.409.571-.116 0-.291-.455-.408-.571a.53.53 0 0 1-.175-.409V.579c0-.292.292-.179.583-.179h1.168c.292 0 .584-.113.584.179v7.88c0 .291.35.408.768.233l.924-1.167a.53.53 0 0 1 .409-.175c.117 0 .292.058.507.175l.719.817c.116.117.571.233.571.408 0 .176-.455.67-.571.409zM5.248 14.4H4.81c-1.021 0-1.313-.688-1.313-.98V5.54c0-.292-.35-.408-.525-.233L1.804 6.474a.527.527 0 0 1-.408.175.63.63 0 0 1-.409-.175L.17 5.657c.36-.117.23-.234.23-.409 0 .482.13-.292-.23-.408L4.84.17c.116.36.89.23.408.23.175 0 .292.13.409-.23a.53.53 0 0 1 .175.409V13.42c0 .292-.292.98-.584.98z"/>
                                </svg>
                            </span>
                        </th>
                        <th scope="col">
                            User Type 
                        </th>
                        <th scope="col">
                            Role
                        </th>
                        <th scope="col">
                            Postal Code
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14">
                                    <path fill-rule="evenodd" fill="#9B9B9B" d="m13.829 9.159-4.67 4.67c.261.116-.233.571-.409.571-.116 0-.291-.455-.408-.571a.53.53 0 0 1-.175-.409V.579c0-.292.292-.179.583-.179h1.168c.292 0 .584-.113.584.179v7.88c0 .291.35.408.768.233l.924-1.167a.53.53 0 0 1 .409-.175c.117 0 .292.058.507.175l.719.817c.116.117.571.233.571.408 0 .176-.455.67-.571.409zM5.248 14.4H4.81c-1.021 0-1.313-.688-1.313-.98V5.54c0-.292-.35-.408-.525-.233L1.804 6.474a.527.527 0 0 1-.408.175.63.63 0 0 1-.409-.175L.17 5.657c.36-.117.23-.234.23-.409 0 .482.13-.292-.23-.408L4.84.17c.116.36.89.23.408.23.175 0 .292.13.409-.23a.53.53 0 0 1 .175.409V13.42c0 .292-.292.98-.584.98z"/>
                                </svg>
                            </span>
                        </th>
                        <th scope="col">
                            City
                        </th>
                        <th scope="col" class="text-center">
                            Radius
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14">
                                    <path fill-rule="evenodd" fill="#9B9B9B" d="m13.829 9.159-4.67 4.67c.261.116-.233.571-.409.571-.116 0-.291-.455-.408-.571a.53.53 0 0 1-.175-.409V.579c0-.292.292-.179.583-.179h1.168c.292 0 .584-.113.584.179v7.88c0 .291.35.408.768.233l.924-1.167a.53.53 0 0 1 .409-.175c.117 0 .292.058.507.175l.719.817c.116.117.571.233.571.408 0 .176-.455.67-.571.409zM5.248 14.4H4.81c-1.021 0-1.313-.688-1.313-.98V5.54c0-.292-.35-.408-.525-.233L1.804 6.474a.527.527 0 0 1-.408.175.63.63 0 0 1-.409-.175L.17 5.657c.36-.117.23-.234.23-.409 0 .482.13-.292-.23-.408L4.84.17c.116.36.89.23.408.23.175 0 .292.13.409-.23a.53.53 0 0 1 .175.409V13.42c0 .292-.292.98-.584.98z"/>
                                </svg>
                            </span>
                        </th>
                        <th scope="col" class="text-center">
                            User Status
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

                    <!-- ---------- call center ------------  -->
                    <tr>
                        <td scope="row">Lyum Watson</td>
                        <td scope="row">Call Center</td>
                        <td scope="row">Inquiry Manager</td>
                        <td scope="row">113143</td>
                        <td scope="row" >Berlin</td>
                        <td scope="row" class="text-center">10 km</td>
                        <td scope="row" class="text-center">
                            <span class="statusActive">Active</span>
                        </td>
                        <td class="text-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary text-dark dropDownBtn" data-bs-toggle="dropdown" aria-expanded="false">
                                    &#8942
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end">
                                  <li><button class="dropdown-item" type="button" href="#editReschedule" data-bs-toggle="modal">Edit</button></li>
                                  <li><button class="dropdown-item" type="button">Deactivate</button></li>
                                </ul>
                              </div>
                        </td>
                    </tr>

                    <!-- ------------ customer & Service Provider ------------  -->
                    <tr>
                        <td scope="row">Lyum Watson</td>
                        <td scope="row">Customer</td>
                        <td scope="row">Inquiry Manager</td>
                        <td scope="row">113143</td>
                        <td scope="row" >Berlin</td>
                        <td scope="row" class="text-center">10 km</td>
                        <td scope="row" class="text-center">
                            <span class="statusInActive">Inactive</span>
                        </td>
                        <td class="text-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-secondary text-dark dropDownBtn" data-bs-toggle="dropdown" aria-expanded="false">
                                    &#8942
                                </button>
                                <ul class="dropdown-menu dropdown-menu-end">
                                  <li><button class="dropdown-item" type="button" href="#editReschedule" data-bs-toggle="modal">Edit</button></li>
                                  <li><button class="dropdown-item" type="button">Deactivate</button></li>
                                  <li><button class="dropdown-item" type="button">Service History</button></li>
                                </ul>
                              </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    	<!-- <div class="editReschedulePopUp">

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
        </div> -->
    
    </section>
    <footer class="text-center" style="color: #646464; font-size: 14px;">
        ©2018 Helperland. All rights reserved.
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>