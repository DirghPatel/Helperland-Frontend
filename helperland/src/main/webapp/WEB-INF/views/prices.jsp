<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href='<c:url value="/resources/css/navbar.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/prices.css" />' rel="stylesheet" />
	<link href='<c:url value="/resources/css/footer.css" />' rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>

</head>
<body>

	<nav class="navbar navbar-expand-xl sticky-top" id="navbar">
		<div class="container-fluid navbar_main">
			<a class="navbar-brand py-0" href="home"> 
				<img src= ' <c:url value = "/resources/assets/nav-footer-assets/logo.png" />' alt="" height="54px" width="73px">
			</a>
			<button class="navbar-toggler text-white" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#navbarText"
				aria-controls="navbarText" aria-expanded="false"
				aria-label="Toggle navigation">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="#fff" class="bi bi-list" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
						d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
            </svg>
			</button>
			<div class="offcanvas offcanvas-end" id="navbarText"
				aria-labelledby="offcanvasExampleLabel" tabindex="-1">
				<div class="offcanvas-body navbar_list">
					<div class="nav-item navbar_book rounded-pill">
						<a class="nav-link text-light" href="service-booking" id="bookNow">Book
							now</a>
					</div>
					<div class="nav-item rounded-pill nav_select1">
						<a class="nav-link text-light" href="prices" id="pricesServices">Prices
							& services</a>
					</div>
					<div class="nav-item rounded-pill nav_select2">
						<a class="nav-link text-light" href="" id="warranty">Warranty</a>
					</div>
					<div class="nav-item rounded-pill nav_select3">
						<a class="nav-link text-light" href="" id="blog">Blog</a>
					</div>
					<div class="nav-item rounded-pill nav_select4">
						<a class="nav-link text-light" href="contact" id="contact">Contact</a>
					</div>
					<div class="nav-item navbar_login rounded-pill">
						<a href="#logInModal"
							class="text-decoration-none text-light nav-link"
							data-bs-target="#logInModal" data-bs-toggle="modal"
							data-bs-dismiss="modal" id="logInButton">Login</a>
					</div>
					<div class="nav-item navbar_helper rounded-pill">
						<a href="become-a-pro"
							class="text-decoration-none text-light nav-link">Become a
							Helper</a>
					</div>
				</div>
			</div>
		</div>
	</nav>


	<div class="container-fluid p-0">
		<!-- <div id="navbar"></div> -->
		<div class="main_image">
			<img src="<c:url value = "/resources/assets/prices/first/faq-top.jpg" />" alt="" height="370px" width="auto">
		</div>
	</div>
	<div class="container-fluid prices p-0">
		<div class="prices_heading position-relative">
			<h1>Prices</h1>
			<div class="prices_box">
				<div class="left_line"></div>
				<img src="<c:url value = "/resources/assets/prices/first/separator.png" />" alt="" />
				<div class="right_line"></div>
			</div>
		</div>

		<div class="card mb-3 mx-auto mt-5 prices_card">
			<div class="card-header w-100 text-white text-center">One Time</div>
			<div class="card-body">
				<h2 class="card-title text-center">
					<span class="card_euro fw-bold">$ 18</span>/hr
				</h2>
				<ul class="price_card_list mt-4">
					<li><svg xmlns="http://www.w3.org/2000/svg" width="25"
							height="24">
              <path fill-rule="evenodd" fill="#1D7A8C"
								d="M20.335 22.153H1.86V3.691h13.627l1.153-1.846H1.86c-1.019 0-1.74.827-1.74 1.846v18.462c0 1.018.721 1.846 1.74 1.846h18.475c1.02 0 1.848-.828 1.848-1.846V9.963l-1.848 2.959v9.231zM23.446.21c-.22.46-.466-.21-.707-.21-.421 0-.834.205-1.083.584L11.613 15.62l-3.886-4.989a1.294 1.294 0 0 0-1.828.07c-.486.524-.453 1.729.072 1.826l4.67 5.326.113.13.118.135.048.029.26.097.091.115.058.028.396.068.018-.004c1.197.002.701-.128.957.009l.104-.584.006-.007L23.821 1.998c.39-.596.609-1.397-.375-1.788z" />
            </svg>
						<p>Lower prices</p></li>
					<li><svg xmlns="http://www.w3.org/2000/svg" width="25"
							height="24">
              <path fill-rule="evenodd" fill="#1D7A8C"
								d="M20.335 22.153H1.86V3.691h13.627l1.153-1.846H1.86c-1.019 0-1.74.827-1.74 1.846v18.462c0 1.018.721 1.846 1.74 1.846h18.475c1.02 0 1.848-.828 1.848-1.846V9.963l-1.848 2.959v9.231zM23.446.21c-.22.46-.466-.21-.707-.21-.421 0-.834.205-1.083.584L11.613 15.62l-3.886-4.989a1.294 1.294 0 0 0-1.828.07c-.486.524-.453 1.729.072 1.826l4.67 5.326.113.13.118.135.048.029.26.097.091.115.058.028.396.068.018-.004c1.197.002.701-.128.957.009l.104-.584.006-.007L23.821 1.998c.39-.596.609-1.397-.375-1.788z" />
            </svg>
						<p>Easy online & secure payment</p></li>
					<li><svg xmlns="http://www.w3.org/2000/svg" width="25"
							height="24">
              <path fill-rule="evenodd" fill="#1D7A8C"
								d="M20.335 22.153H1.86V3.691h13.627l1.153-1.846H1.86c-1.019 0-1.74.827-1.74 1.846v18.462c0 1.018.721 1.846 1.74 1.846h18.475c1.02 0 1.848-.828 1.848-1.846V9.963l-1.848 2.959v9.231zM23.446.21c-.22.46-.466-.21-.707-.21-.421 0-.834.205-1.083.584L11.613 15.62l-3.886-4.989a1.294 1.294 0 0 0-1.828.07c-.486.524-.453 1.729.072 1.826l4.67 5.326.113.13.118.135.048.029.26.097.091.115.058.028.396.068.018-.004c1.197.002.701-.128.957.009l.104-.584.006-.007L23.821 1.998c.39-.596.609-1.397-.375-1.788z" />
            </svg>
						<p>Easy amendment</p></li>
				</ul>
			</div>
		</div>

		<hr />

		<div class="prices_heading position-relative">
			<h1>Extra services</h1>
			<div class="prices_box">
				<div class="left_line"></div>
				<img src="<c:url value = "/resources/assets/prices/first/separator.png" />" alt="" />
				<div class="right_line"></div>
			</div>
		</div>
		<div
			class="
          services_cover
          align-items-center
          justify-content-center
          w-100
        ">
			<div
				class="
            services_inner
            d-flex
            flex-column
            align-items-center
            justify-content-center
          ">
				<div
					class="
              services_icon
              rounded-circle
              d-flex
              align-items-center
              justify-content-center
            ">
					<svg xmlns="http://www.w3.org/2000/svg" width="37" height="48">
            <path fill-rule="evenodd" fill="#646464"
							d="M34.744 0H2.254C1.11 0 0 1.16 0 2.264v45.735h36.999V2.264C36.999 1.16 35.987 0 34.744 0zm-9.078 21.995a2.8 2.8 0 0 1-2.791 2.804h-8.751a2.8 2.8 0 0 1-2.791-2.804v-1.196a.797.797 0 1 1 1.592 0v1.196c0 .664.538 1.204 1.199 1.204h8.751c.661 0 1.855-.54 1.855-1.204v-1.196c0-.443-.301-.8.14-.8.44 0 .796.357.796.8v1.196z" />
          </svg>
				</div>
				<div
					class="
              services_content
              d-flex
              flex-column
              align-items-center
              justify-content-center
            ">
					<p class="m-0 text-center">Inside cabinets</p>
					<h5>30 minutes</h5>
				</div>
			</div>
			<div
				class="
            services_inner
            d-flex
            flex-column
            align-items-center
            justify-content-center
          ">
				<div
					class="
              services_icon
              rounded-circle
              d-flex
              align-items-center
              justify-content-center
            ">
					<svg xmlns="http://www.w3.org/2000/svg" width="28" height="56">
            <path fill-rule="evenodd" fill="#646464"
							d="M25.406 52.934v3.065h-5.302v-3.065H7.883v3.065H2.581v-3.065H0V20.313h27.999v32.621h-2.593zM5.749 25.7c0-1.293-.54-1.784-1.159-1.784-.666 0-1.16.537-1.16 1.784v6.748c0 .664.54 1.156 1.16 1.156.665 0 1.159.056 1.159-1.156V25.7zM0 18.2V0h27.999v18.2H0zm3.43-4.201c0 .663.54 1.155 1.16 1.155.665 0 1.158-.538 1.158-1.155V6.621c0-.663-.539-1.155-1.158-1.155-.666 0-1.16.934-1.16 1.155v7.378z" />
          </svg>
				</div>
				<div
					class="
              services_content
              d-flex
              flex-column
              align-items-center
              justify-content-center
            ">
					<p class="m-0 text-center">Inside fridge</p>
					<h5>30 minutes</h5>
				</div>
			</div>
			<div
				class="
            services_inner
            d-flex
            flex-column
            align-items-center
            justify-content-center
          ">
				<div
					class="
              services_icon
              rounded-circle
              d-flex
              align-items-center
              justify-content-center
            ">
					<svg xmlns="http://www.w3.org/2000/svg" width="52" height="33">
            <path fill-rule="evenodd" fill="#646464"
							d="M50.119.981H1.879A1.881 1.881 0 0 0 0 2.863v28.246c0 1.037.842 1.881 1.879 1.881h48.24c1.039 0 1.88-.844 1.88-1.881V2.863a1.88 1.88 0 0 0-1.88-1.882zM41.814 8.68h2.936v3.22h-2.936V8.68zm0 3.045h2.936v2.941h-2.936v-2.941zm0 3.654h2.936v2.941h-2.936v-2.941zM38.6 8.68h2.399v3.22H38.6V8.68zm0 3.045h2.399v2.941H38.6v-2.941zm-3.829 17.5H31.52c.83-.292.876-.974.876-1.77h-6.111c3.125-1.913 5.172-5.054 5.172-8.611H7.21c0 3.557 2.46 6.7 4.981 8.611H6.82c0 .796-.377 1.478.134 1.77H3.758V4.746h31.013v24.479zM38.6 15.379h2.399v2.941H38.6v-2.941zm4.604 12.878c-1.774 0-3.212-1.44-3.212-2.837 0-2.155 1.438-3.595 3.212-3.595 1.772 0 3.209 1.44 3.209 3.595 0 1.397-1.437 2.837-3.209 2.837zm5.297-9.937h-2.936v-2.941h2.936v2.941zm0-3.654h-2.936v-2.941h2.936v2.941zm0-2.766h-2.936V8.68h2.936v3.22z" />
          </svg>
				</div>
				<div
					class="
              services_content
              d-flex
              flex-column
              align-items-center
              justify-content-center
            ">
					<p class="m-0 text-center">Inside oven</p>
					<h5>30 minutes</h5>
				</div>
			</div>
			<div
				class="
            services_inner
            d-flex
            flex-column
            align-items-center
            justify-content-center
          ">
				<div
					class="
              services_icon
              rounded-circle
              d-flex
              align-items-center
              justify-content-center
            ">
					<svg xmlns="http://www.w3.org/2000/svg" width="39" height="46">
            <path fill-rule="evenodd" fill="#646464"
							d="M0 45.999V8.987h38.999v37.012H0zm19.499-30.76c-6.798 0-12.329 5.497-12.329 12.254s5.531 12.255 12.329 12.255c6.798 0 12.329-5.498 12.329-12.255 0-6.757-5.53-12.254-12.329-12.254zm0 22.233c-5.535 0-10.039-4.477-10.039-9.979 0-5.502 4.504-9.978 10.039-9.978 5.851 0 10.04 4.476 10.04 9.978s-4.189 9.979-10.04 9.979zm7.985-9.979c0-4.383-3.575-7.936-7.985-7.936-3.609 0-7.984 3.553-7.984 7.936l.002.09c.379.326.796.637 2.283.637.115 0 .537-.368.944-.724.405-.354.788-.689 1.57-.689 1.636 0 1.164.335 1.569.689.408.356.829.724 1.664.724s1.256-.368 1.663-.724c.406-.354.789-.689 1.57-.689.782 0 1.165.335 1.57.689.408.356.829.724 1.79.724.576 0 .985-.26 1.34-.554.001-.058.004-.115.004-.173zm8.961-20.764c0 .624-.508 1.13-1.136 1.13a1.133 1.133 0 0 1-1.136-1.13c0-.623.509-1.129 1.136-1.129.628 0 1.136.506 1.136 1.129zm-3.645 0c0 .624-.509 1.13-1.137 1.13-.303 0-1.136-.506-1.136-1.13 0-.623.833-1.129 1.136-1.129.628 0 1.137.506 1.137 1.129zm-3.646 0c0 .624-.509 1.13-.974 1.13-.79 0-1.298-.506-1.298-1.13 0-.623.508-1.129 1.298-1.129.465 0 .974.506.974 1.129zm-20.683 0c0 .624-.508 1.13-1.136 1.13a1.133 1.133 0 0 1-1.136-1.13c0-.623.509-1.129 1.136-1.129.628 0 1.136.506 1.136 1.129zm-3.645 0c0 .624-.509 1.13-1.136 1.13-.07 0-1.137-.506-1.137-1.13C2.553 6.106 3.62 5.6 3.69 5.6c.627 0 1.136.506 1.136 1.129zM0 0h38.999v3.982H0V0z" />
          </svg>
				</div>
				<div
					class="
              services_content
              d-flex
              flex-column
              align-items-center
              justify-content-center
            ">
					<p class="m-0 text-center">Laundry wash & dry</p>
					<h5>30 minutes</h5>
				</div>
			</div>
			<div
				class="
            services_inner
            d-flex
            flex-column
            align-items-center
            justify-content-center
          ">
				<div
					class="
              services_icon
              rounded-circle
              d-flex
              align-items-center
              justify-content-center
            ">
					<svg xmlns="http://www.w3.org/2000/svg" width="47" height="47">
            <path fill-rule="evenodd" fill="#646464"
							d="M45.699 46.999H1.3a1.3 1.3 0 0 1-1.3-1.3v-44.4A1.3 1.3 0 0 1 1.3 0h44.399c.719 0 1.3.581 1.3 1.299v44.4a1.3 1.3 0 0 1-1.3 1.3zM42.996 4.1H4.3v38.896h38.696V4.1zM21.68 21.68H7.642V7.641H21.68V21.68zm0 17.676H7.642V25.319H21.68v14.037zM39.358 21.68H25.319V7.641h14.039V21.68zm0 17.676H25.319V25.319h14.039v14.037z" />
          </svg>
				</div>
				<div
					class="
              services_content
              d-flex
              flex-column
              align-items-center
              justify-content-center
            ">
					<p class="m-0 text-center">Interior windows</p>
					<h5>30 minutes</h5>
				</div>
			</div>
		</div>
		<div
			class="
          prices_areas
          d-flex
          flex-column
          align-items-center
          justify-content-center
        ">
			<div class="prices_heading position-relative mb-4">
				<h1 class="text-center">What we include in cleaning</h1>
				<div class="prices_box">
					<div class="left_line"></div>
					<img src="<c:url value = "/resources/assets/prices/first/separator.png" />" alt="" />
					<div class="right_line"></div>
				</div>
			</div>
			<div class="card-group d-flex justify-content-center mt-3">
				<div class="card border-0 services_card mx-3">
					<img class="card-img-top" src="<c:url value = "/resources/assets/prices/areas/1.jpg" /> "
						alt="Card image cap" height="210" width="360" />
					<h5 class="mt-4">Bedroom and Living Room</h5>
					<ul class="w-100 p-0 services_card_list">
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Dust all accessible surfaces</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Wipe down all mirrors and glass fixtures
							</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Clean all floor surfaces</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Take out garbage and recycling</p></li>
					</ul>
				</div>
				<div class="card border-0 services_card mx-3">
					<img class="card-img-top" src="<c:url value = "/resources/assets/prices/areas/2.jpg" />"
						alt="Card image cap" height="210" width="360" />
					<h5 class="mt-4">Bathrooms</h5>
					<ul class="w-100 p-0 services_card_list">
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Wash and sanitize the toilet, shower,
								tub, sink</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Dust all accessible surfaces</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Wipe down all mirrors and glass fixtures
							</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Clean all floor surfaces</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Take out garbage and recycling</p></li>
					</ul>
				</div>
				<div class="card border-0 services_card mx-3">
					<img class="card-img-top" src="<c:url value = "/resources/assets/prices/areas/3.jpg" />"
						alt="Card image cap" height="210" width="360" />
					<h5 class="mt-4">Kitchen</h5>
					<ul class="w-100 p-0 services_card_list">
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Dust all accessible surfaces</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Empty sink and load up dishwasher</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Wipe down exterior of stove, oven and
								fridge</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Clean all floor surfaces</p></li>
						<li class="d-flex align-items-center"><img
							src="<c:url value = "/resources/assets/prices/areas/arr.png" />" alt="" height="22"
							width="22" />
							<p class="mb-0 ms-2">Take out garbage and recycling</p></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid whyhelperland mb-5">
		<div class="prices_heading position-relative">
			<h1>Why Helperland</h1>
			<div class="prices_box">
				<div class="left_line"></div>
				<img src="<c:url value = "/resources/assets/prices/first/separator.png" />" alt="" />
				<div class="right_line"></div>
			</div>
		</div>
		<div
			class="why_cover d-flex align-items-center justify-content-center w-100 position-relative">
			<div
				class="why_left text-end d-flex flex-column justify-content-between position-relative h-100">
				<div class="left_up">
					<h5 class="m-0">Experienced and vetted professionals</h5>
					<p class="m-0">
						dominate the industry in scale and scope with <br> an
						adaptable, extensive network that <br> consistently delivers
						exceptional results.
					</p>
				</div>
				<div class="left_down">
					<h5 class="m-0">Dedicated customer service</h5>
					<p class="m-0">
						to our customers and are guided in all we do <br> by their
						needs. The team is always happy to <br> support you and offer
						all the information. you need.
					</p>
				</div>
			</div>
			<div class="why_mid">
				<img src="<c:url value = "/resources/assets/prices/why/thebest.png" />" alt="" width="329"
					height="236" />
			</div>
			<div class="why_right d-flex flex-column justify-content-between">
				<div class="right_up">
					<h5 class="m-0">Every cleaning is insured</h5>
					<p class="m-0">
						and seek to provide exceptional service and <br> engage in
						proactive behavior. We‘d be happy <br> to clean your homes.
					</p>
				</div>
				<div class="right_down">
					<h5 class="m-0">Secure online payment</h5>
					<p class="m-0">
						Payment is processed securely online.<br> Customers pay
						safely online and manage<br> the booking.
					</p>
				</div>
			</div>
		</div>
	</div>




	<div class="footer_section w-100">
		<div
			class="footer_main d-flex justify-content-center align-items-center position-relative">
			<div
				class="d-flex justify-content-between h-100 align-items-center footer_inner position-relative">
				<div class="footer_left">
					<a href="home"> <img src="<c:url value = "/resources/assets/nav-footer-assets/logo.png" />"
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


	<!-- ------------- login modals --------------  -->
	<div class="logInPopUp">

		<div class="modal fade" id="logInModal" aria-hidden="true"
			aria-labelledby="logInModalLabel" tabindex="-1">
			<div
				class="modal-dialog modal-dialog-centered vertical-align-center modal-md">
				<div class="modal-content">
					<!-- <div class="modal-body"> -->
					<div class="modal-header">
						<h3 class="modal-title" id="logInModalLabel">Login to your
							account</h3>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body logInModal p-2">
						<form action="loggedin" method="post">
							<div class="form-group position-relative my-3">
								<input type="email" placeholder="Email Address" name="email"
									class="modalInputEmail inputHeightBorder"> <img
									src="<c:url value = "/resources/assets/homepage/first/user.png" />" alt="" height="21"
									width="20">
							</div>

							<div class="form-group position-relative my-3">
								<input type="password" placeholder="Password" name="password"
									class="modalInputEmail inputHeightBorder"> <img
									src="<c:url value = "/resources/assets/homepage/first/user.png" />" alt="" height="21"
									width="20">
							</div>

							<div class="form-group">
								<input type="checkbox" value="rememberme" id="rememberme">
								<label for="rememberme" class="control-label">Remember
									me</label>
							</div>
							<button type="submit"
								class="my-3 btn submitButton text-light w-100 rounded-pill">
								Login</button>
						</form>
						<div class="text-center mt-2">
							<a href="forgotPasswordModal" class="forgotPasswordRedirect"
								data-bs-target="#forgotPasswordModal" data-bs-toggle="modal"
								data-bs-dismiss="modal">Forgot Password?</a>
						</div>
						<div class="text-center">
							Don't have account? <span> <a
								class="forgotPasswordRedirect" href="user-register">Create
									an account? </a></span>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="forgotPasswordModal" aria-hidden="true"
			aria-labelledby="forgotPasswordModalLabel2" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title me-3" id="forgotPasswordModalLabel2">Forgot
							Password</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body ">
						<form action="">
							<div class="d-flex mb-3">
								<input type="email" placeholder="Email Address" name="email"
									class="modalInputEmail inputHeightBorder">
							</div>
							<button type="submit"
								class="my-3 btn submitButton text-light w-100 rounded-pill">
								Send</button>
						</form>
						<div class="text-center mt-2">
							<a href="logInModal" class="forgotPasswordRedirect"
								data-bs-target="#logInModal" data-bs-toggle="modal"
								data-bs-dismiss="modal">Login now</a>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- <div id="footer"></div> -->
	<!-- <script>
    $(function () {
      $("#navbar").load("../navbar.html");
      $("#footer").load("../footer.html");
    });
  </script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>