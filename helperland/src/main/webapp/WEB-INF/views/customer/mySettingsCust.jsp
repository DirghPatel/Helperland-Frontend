<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<c:url value="/resources/css/navbar-2.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/custDash.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/mySettingsCust.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
</head>
<body>
    <div style="min-height: 100vh; padding-bottom: 170px;">
        
        <nav class="navbar navbar-expand-lg w-100" id="navbar">
            <div class="container-fluid navbar_main">
                <a class="navbar-brand py-0" href="/helperland/home">
                    <img src="<c:url value = "/resources/assets/nav-footer-assets/logo.png" />" alt="" height="54px" width="73px">
                </a>
                <div class="d-flex navbar_wrapper">
                    <div class="offcanvas offcanvas-end navbar_offcanvas sidebarMain" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
                        <div class="offcanvas-body justify-content-end sidebarInner">
                            <div class="navcol_first navcol m-0 p-0">
                                <p class="nav-link">Welcome,<br>First customer</p>
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
                                    <a class="nav-link" href="#">Logout</a>
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
                                <p class="mb-1 fw-bold">First Customer</p>
                            </li>
                            <li><a class="dropdown-item px-0" type="button" href="dash">My Dashboard</a></li>
                            <li><a class="dropdown-item px-0" type="button" href="mysettings" >My Settings</a></li>
                            <li><a class="dropdown-item px-0" type="button">Logout</a></li>
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
            <p class="m-0">Welcome, <span class="text-bold">Sandip!</span></p>
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
                    <li>
                        <a id="favouritePros" class="text-light" href="fav-pros">Favourite Pros</a>
                    </li>
                    <li>
                        <a id="notification" class="text-light" href="notification">Notification</a>
                    </li>
                </ul>
            </div>

            <!-- ------------------- Tables ------------------- -->
            <div class="dash_contents w-100">
                <ul class="nav nav-fill nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <a class="nav-link active" id="myDetailsTabController" data-bs-toggle="tab" data-bs-target="#myDetailsTab" type="button" aria-controls="myDetails" aria-selected="true">
                            <span class="d-none d-md-block">My Details</span>
                            <span class="d-block d-md-none"> 
                                <img src=" <c:url value = "/resources/assets/custDash/edit-icon.png" />" alt="">
                            </span>
                        </a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="myAddressesTabController" data-bs-toggle="tab" data-bs-target="#myAddressesTab" type="button" aria-controls="myAddresses" aria-selected="false">
                            <span class="d-none d-md-block">My Addresses</span>
                            <span class="d-block d-md-none"> 
                                <img src="<c:url value = "/resources/assets/custDash/edit-icon.png" />" alt="">
                            </span>
                        </a>
                    </li>
                    <li class="nav-item" role="presentation">
                        <a class="nav-link" id="changePasswordTabController" data-bs-toggle="tab" data-bs-target="#changePasswordTab" type="button" aria-controls="changePassword" aria-selected="false">
                            <span class="d-none d-md-block">Change Password</span>
                            <span class="d-block d-md-none"> 
                                <img src="<c:url value = "/resources/assets/custDash/edit-icon.png" />" alt="">
                            </span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content mt-3" id="myTabContent" >


                    <!-- ------- my details ---------  -->
                    <div class="tab-pane fade show active" id="myDetailsTab" role="tabpanel" aria-labelledby="myDetails">
                        <form class="row">
                            <div class="col-sm-4 mb-4">
                                <div class="form-group d-flex flex-column">
                                    <label for="firstname">First Name</label>
                                    <input type="text" name="firstname" placeholder="First name" id="firstname" value="First" class="minheight46 borderlight paddinginside form-control">
                                </div>
                            </div>
                            <div class="col-sm-4 mb-4">
                                <div class="form-group d-flex flex-column">
                                    <label for="lastname">Last Name</label>
                                    <input type="text" name="lastname" placeholder="Last name" id="lastname" value="Last" class="minheight46 borderlight paddinginside form-control">
                                </div>
                            </div>
                            <div class="col-sm-4 mb-4">
                                <div class="form-group d-flex flex-column">
                                    <label for="emailaddress">Email Address</label>
                                    <input type="email" name="address" placeholder="Email Address" id="emailaddress" value="cust@gmail.com" disabled class="minheight46 borderlight paddinginside form-control">
                                </div>
                            </div>
                            <div class="col-sm-4 mb-4">
                                <div class="form-group d-flex flex-column">
                                    <label for="mobilenumber">Mobile Number</label>
                                    <div class="d-flex">
                                        <input type="text" value="+49" disabled style="max-width: 52px;" class="minheight46 borderlight paddinginside form-control">
                                        <input type="text" name="mobilenumber" placeholder="Mobile number" id="mobilenumber" value="9848291932" class="minheight46 borderlight paddinginside form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 mb-4">
                                <div class="form-group">
                                    <div class="d-flex flex-column">
                                        <label>Date Of Birth</label>
                                        <div class="d-flex">
                                            <div class="d-inline-block">
                                                <select name="birthdate" id="" class="minheight46 borderlight paddinginside mx-2 ms-0">
                                                    <option value="" >Day</option>
                                                    <option value="01">01</option>
                                                    <option value="02">02</option>
                                                    <option value="03">03</option>
                                                    <option value="04">04</option>
                                                    <option value="05">05</option>
                                                    <option value="06">06</option>
                                                    <option value="07">07</option>
                                                    <option value="08">08</option>
                                                    <option value="09">09</option>
                                                    <option value="10">10</option>
                                                    <option value="11">11</option>
                                                    <option value="12">12</option>
                                                    <option value="13">13</option>
                                                    <option value="14">14</option>
                                                    <option value="15">15</option>
                                                    <option value="16">16</option>
                                                    <option value="17">17</option>
                                                    <option value="18">18</option>
                                                    <option value="19">19</option>
                                                    <option value="20">20</option>
                                                    <option value="21">21</option>
                                                    <option value="22">22</option>
                                                    <option value="23">23</option>
                                                    <option value="24">24</option>
                                                    <option value="25">25</option>
                                                    <option value="26">26</option>
                                                    <option value="27">27</option>
                                                    <option value="28">28</option>
                                                    <option value="29">29</option>
                                                    <option value="30">30</option>
                                                    <option value="31">31</option>

                                                </select>
                                            </div>
                                            <div class="d-inline-block">
                                                <select name="birthmonth" id="" class="minheight46 borderlight paddinginside mx-2" >
                                                    <option value="" >Month</option>
                                                    <option value="january">January</option>
                                                    <option value="february">February</option>
                                                    <option value="march">March</option>
                                                    <option value="april">April</option>
                                                    <option value="may">May</option>
                                                    <option value="june">June</option>
                                                    <option value="july">July</option>
                                                    <option value="august">August</option>
                                                    <option value="september">September</option>
                                                    <option value="october">October</option>
                                                    <option value="november">November</option>
                                                    <option value="december">December</option>
                                                </select>
                                            </div>
                                            <div class="d-inline-block">
                                                <select name="birthyear" id="" class="minheight46 borderlight paddinginside mx-2">
                                                    <option value="" >Year</option>
                                                    <option value="2012">2012</option>
                                                    <option value="2011">2011</option>
                                                    <option value="2010">2010</option>
                                                    <option value="2009">2009</option>
                                                    <option value="2008">2008</option>
                                                    <option value="2007">2007</option>
                                                    <option value="2006">2006</option>
                                                    <option value="2005">2005</option>
                                                    <option value="2004">2004</option>
                                                    <option value="2003">2003</option>
                                                    <option value="2002">2002</option>
                                                    <option value="2001">2001</option>
                                                    <option value="2000">2000</option>
                                                    <option value="1999">1999</option>
                                                    <option value="1998">1998</option>
                                                    <option value="1997">1997</option>
                                                    <option value="1996">1996</option>
                                                    <option value="1995">1995</option>
                                                    <option value="1994">1994</option>
                                                    <option value="1993">1993</option>
                                                    <option value="1992">1992</option>
                                                    <option value="1991">1991</option>
                                                    <option value="1990">1990</option>
                                                    <option value="1989">1989</option>
                                                    <option value="1988">1988</option>
                                                    <option value="1987">1987</option>
                                                    <option value="1986">1986</option>
                                                    <option value="1985">1985</option>
                                                    <option value="1984">1984</option>
                                                    <option value="1983">1983</option>
                                                    <option value="1982">1982</option>
                                                    <option value="1981">1981</option>
                                                    <option value="1980">1980</option>
                                                    <option value="1979">1979</option>
                                                    <option value="1978">1978</option>
                                                    <option value="1977">1977</option>
                                                    <option value="1976">1976</option>
                                                    <option value="1975">1975</option>
                                                    <option value="1974">1974</option>
                                                    <option value="1973">1973</option>
                                                    <option value="1972">1972</option>
                                                    <option value="1971">1971</option>
                                                    <option value="1970">1970</option>
                                                    <option value="1969">1969</option>
                                                    <option value="1968">1968</option>
                                                    <option value="1967">1967</option>
                                                    <option value="1966">1966</option>
                                                    <option value="1965">1965</option>
                                                    <option value="1964">1964</option>
                                                    <option value="1963">1963</option>
                                                    <option value="1962">1962</option>
                                                    <option value="1961">1961</option>
                                                    <option value="1960">1960</option>
                                                    <option value="1959">1959</option>
                                                    <option value="1958">1958</option>
                                                    <option value="1957">1957</option>
                                                    <option value="1956">1956</option>
                                                    <option value="1955">1955</option>
                                                    <option value="1954">1954</option>
                                                    <option value="1953">1953</option>
                                                    <option value="1952">1952</option>
                                                    <option value="1951">1951</option>
                                                    <option value="1950">1950</option>
                                                    <option value="1949">1949</option>
                                                    <option value="1948">1948</option>
                                                    <option value="1947">1947</option>
                                                    <option value="1946">1946</option>
                                                    <option value="1945">1945</option>
                                                    <option value="1944">1944</option>
                                                    <option value="1943">1943</option>
                                                    <option value="1942">1942</option>
                                                    <option value="1941">1941</option>
                                                    <option value="1940">1940</option>
                                                    <option value="1939">1939</option>
                                                    <option value="1938">1938</option>
                                                    <option value="1937">1937</option>
                                                    <option value="1936">1936</option>
                                                    <option value="1935">1935</option>
                                                    <option value="1934">1934</option>
                                                    <option value="1933">1933</option>
                                                    <option value="1932">1932</option>
                                                    <option value="1931">1931</option>
                                                    <option value="1930">1930</option>
                                                    <option value="1929">1929</option>
                                                    <option value="1928">1928</option>
                                                    <option value="1927">1927</option>
                                                    <option value="1926">1926</option>
                                                    <option value="1925">1925</option>
                                                    <option value="1924">1924</option>
                                                    <option value="1923">1923</option>
                                                    <option value="1922">1922</option>
                                                    <option value="1921">1921</option>
                                                    <option value="1920">1920</option>
                                                    <option value="1919">1919</option>
                                                    <option value="1918">1918</option>
                                                    <option value="1917">1917</option>
                                                    <option value="1916">1916</option>
                                                    <option value="1915">1915</option>
                                                    <option value="1914">1914</option>
                                                    <option value="1913">1913</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <hr>
                        <div class="d-flex flex-column">
                            <label for="preferedLanguage">My Prefered Language</label>
                            <select name="preferedLanguage" id="" class="minheight46 paddinginside borderlight" style="max-width: 120px;">
                                <option value="english"> English</option>
                                <option value="german"> German</option>
                            </select>
                        </div>
                        <button type="submit" class="btn reschedule_button text-light rounded-pill px-4 mt-3">
                            Save
                        </button>
                    </div>
                    <!-- ------------- my addresses ----------- -->
                    <div class="tab-pane fade" role="tabpanel" id="myAddressesTab" aria-labelledby="myAddresses">
                        <div id="myAddressesTable">
                            <table class="table table_1">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            Addresses
                                        </th>
                                        <th scope="col" width="100">
                                            Actions
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <p class="mb-1"><b>Address:</b> Street 54, 53844 Troisdorf </p>
                                            <p class="mb-1"><b>Phone Number:</b>9988556644</p>
                                        </td>
                                        <td>
                                            <a href="#editAddressModal" data-bs-toggle="modal" role="button">
                                                <img src="<c:url value = "/resources/assets/custDash/edit-icon.png" />" alt="" height="22" width="22">
                                            </a>
                                            <a href="#deleteAdressModal" data-bs-toggle="modal" role="button">
                                                <img src="<c:url value = "/resources/assets/custDash/delete-icon.png" />" alt="" height="22" width="22">
                                            </a>                                            
                                            
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <a href="#addNewAddressModal" data-bs-toggle="modal" role="button" class="btn reschedule_button text-light rounded-pill">Add New address </a>
                            <!-- <a href="#cancelServiceRequest" data-bs-toggle="modal" role="button" class="cancel_button rounded-pill text-light text-decoration-none">Cancel</a> -->
                        </div>

                        <div class="modal fade" id="addNewAddressModal" aria-hidden="true" aria-labelledby="addNewAddressModalLabel2" tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title me-3 color646464" id="addNewAddressModalLabel2">Add New Address</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body ">
                                        <form action="" onsubmit="">
                                            <div class="row newAddress_form">
                                                <div class="col-sm-6 mb-4">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="streetname">Street Name</label>
                                                        <input type="text" placeholder="Street Name" name="streetname" class="borderlight minheight46 paddinginside w-100">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-4">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="housenumber">House number</label>
                                                        <input type="text" placeholder="House Number" name="housenumber" class="borderlight minheight46 paddinginside w-100">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-4">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="postalcode">Postal Code</label>
                                                        <input type="text" placeholder="Postal Code" name="postalcode" class="borderlight minheight46 paddinginside w-100">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="city">City</label>
                                                        <div class="d-inline-block">
                                                            <input name="city" id="" placeholder="City" class="minheight46 borderlight paddinginside w-100" />
                                                                <!-- <option value="troisdorf" >Troisdorf</option> -->
                                                            <!-- </select> -->
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="phonenumber">Phone Number</label>
                                                        <div class="d-flex">
                                                            <input type="text" name="phonecode" class="borderlight minheight46 paddinginside" value="+49" disabled style="max-width: 55px;">
                                                            <input type="text" placeholder="Phone Number" name="phonenumber" class="borderlight minheight46 paddinginside">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="greenButton rounded-pill borderlight text-light px-3 paddinginside">
                                                Add
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="editAddressModal" aria-hidden="true" aria-labelledby="editAddressModalLabel2" tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title me-3 color646464" id="editAddressModalLabel2">Edit Address</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body ">
                                        <form action="" onsubmit="">
                                            <div class="row newAddress_form">
                                                <div class="col-sm-6 mb-4">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="streetname">Street Name</label>
                                                        <input type="text" value="" placeholder="Street Name" name="streetname" class="borderlight minheight46 paddinginside w-100">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-4">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="housenumber">House number</label>
                                                        <input type="text" value="" placeholder="House Number" name="housenumber" class="borderlight minheight46 paddinginside w-100">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-4">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="postalcode">Postal Code</label>
                                                        <input type="text" value="" placeholder="Postal Code" name="postalcode" class="borderlight minheight46 paddinginside w-100">
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="city">City</label>
                                                        <div class="d-inline-block">
                                                            <input name="city" value="" id="" placeholder="City" class="minheight46 borderlight paddinginside w-100" />
                                                                <!-- <option value="troisdorf" >Troisdorf</option> -->
                                                            <!-- </select> -->
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-group d-flex flex-column">
                                                        <label for="phonenumber">Phone Number</label>
                                                        <div class="d-flex">
                                                            <input type="text" name="phonecode" class="borderlight minheight46 paddinginside" value="+49" disabled style="max-width: 55px;">
                                                            <input type="text" placeholder="Phone Number" name="phonenumber" class="borderlight minheight46 paddinginside" value="3423423423">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="greenButton rounded-pill borderlight text-light px-3 paddinginside">
                                                Add
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="deleteAdressModal" aria-hidden="true" aria-labelledby="deleteAdressModalLabel2" tabindex="-1">
                            <div class="modal-dialog modal-dialog-centered modal-md">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title me-3 color646464" id="deleteAdressModalLabel2">Delete Address</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body ">
                                        <form action="" onsubmit="">
                                            <p class="mb-3 color646464">Are You sure you want to delete this address?</p>
                                            <button type="submit" class="mt-2 greenButton rounded-pill borderlight text-light px-3 paddinginside">
                                                Delete
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- ----------- change password ----------- -->
                    <div class="tab-pane fade" role="tabpanel" id="changePasswordTab" aria-labelledby="changePassword">
                        <form action="">
                            <div class="form-group mb-2 col-sm-4">
                                <label for="oldPassword">Old Password</label>
                                <input type="password" name="oldPassword" placeholder="Current Password" class="form-control minheight46" maxlength="20" required>
                            </div>
                            <div class="form-group mb-2 col-sm-4">
                                <label for="newPassword">New Password</label>
                                <input type="password" name="newPassword" class="form-control minheight46" placeholder="Password" maxlength="20" required>
                            </div>
                            <div class="form-group mb-2 col-sm-4">
                                <label for="confirmPassword">Confirm Password</label>
                                <input type="password" name="confirmPassword" class="form-control minheight46 " placeholder="New Password" maxlength="20" required>
                            </div>
                            <button type="submit" class="btn reschedule_button px-4 mt-3 text-light rounded-pill">
                                Save
                            </button>
                        </form>
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

<!--     <script src="./custDash.js"></script> -->
    <!-- <script>
        $(function () {
            $("#footer").load("../footer.html");
        });
    </script> -->
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


</body>
</html>