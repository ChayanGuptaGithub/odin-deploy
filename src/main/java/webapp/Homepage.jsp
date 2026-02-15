<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome to odin</title>
<link rel="icon" type="image/png" href="shield-halved-solid-full.jpg">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="navbarStyle.css">
<style>
body {
	background: #000;
	color: white;
}

.odin-title {
	font-size: 60px;
	letter-spacing: 6px;
	font-weight: bold;
	background: linear-gradient(90deg, #00c6ff, #0072ff, #00c6ff);
	background-size: 300%;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	animation: slideColors 4s linear infinite;
}

@
keyframes slideColors { 0% {
	background-position: 0%;
}

100
%
{
background-position
:
300%;
}
}
.btn {
	width: 160px;
}

.card:hover {
	transform: translateY(-5px);
	transition: 0.3s;
}
</style>
</head>
<body>

	<%
	String username = (String) session.getAttribute("username");
	%>
<nav>
  <ul>
    <li>
      <a href="#">Home</a>
    </li>
    <li>
      <a href="#">About</a>
    </li>
    <li>
      <a href="#">Services</a>
    </li>
    <li>
      <a href="logout">Logout</a>
    </li>
  </ul>
</nav>
	<div class="container py-5">
		<div class="row align-items-center">

			<!-- LEFT SIDE -->
			<div class="col-12 col-lg-4 text-center text-lg-start mb-5 mb-lg-0">
				<h1 class="odin-title">
					<i class="fa-solid fa-shield-halved"></i> Welcome to ODIN
				</h1>

				<h3 class="mt-3">
					<%=username%>, what do you want to learn today?
				</h3>
			</div>

			<!-- RIGHT SIDE -->
			<div class="col-12 col-lg-8">
				<div class="row g-4">

					<div class="col-12 col-sm-6 col-xl-4">
						<a href="java.jsp" class="text-decoration-none">
							<div class="card p-4 text-center shadow h-100">Java</div>
						</a>
					</div>

					<div class="col-12 col-sm-6 col-xl-4">
						<a href="javascript" class="text-decoration-none">
							<div class="card p-4 text-center shadow h-100">Javascript</div>
						</a>
					</div>

					<div class="col-12 col-sm-6 col-xl-4">
						<a href="mysql.jsp" class="text-decoration-none">
							<div class="card p-4 text-center shadow h-100">MySQL</div>
						</a>
					</div>
					<div class="col-12 col-sm-6 col-xl-4">
						<a href="java.jsp" class="text-decoration-none">
							<div class="card p-4 text-center shadow h-100">Advance Java</div>
						</a>
					</div>

					<div class="col-12 col-sm-6 col-xl-4">
						<a href="spring.jsp" class="text-decoration-none">
							<div class="card p-4 text-center shadow h-100">Hadoop</div>
						</a>
					</div>

					<div class="col-12 col-sm-6 col-xl-4">
						<a href="mysql.jsp" class="text-decoration-none">
							<div class="card p-4 text-center shadow h-100">Related
								Project</div>
						</a>
					</div>
				</div>
			</div>

		</div>
	</div>
	
	
</body>
</html>